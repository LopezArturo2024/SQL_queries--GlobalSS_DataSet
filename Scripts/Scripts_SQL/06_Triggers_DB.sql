USE globalsuperstore;

/* En este apartado se encuentran los script relacionados a la creación de TRIGGERS sobre las tablas del proyecto. Siguiendo
la misma dinámica, entregaré inicialmente una descripción del objetivo del TRIGGER, su funcionamiento y los paso a seguir para
la creacióny operación del mismo. 
*/




/* El primer Trigger creado se encarga de llevar una tabla de auditoría sobre los INSERT en la tabla de Ventas. Lo primero que realicé 
fue la creación de la tabla sobre la cual el TRIGGER insertará los registros. La tabla se llama Ventas_AUDIT y lleva la siguiente
información: Un Id como llave primaria de la tabla, la acción que se realizó sobre la tabla (en este caso siempre va a ser INSERT),
la tabla sobre la cual se realizó la acción (En este caso igual siempre será Ventas), el usuario que realizó la acción y la fecha en 
que se hizo. 

Una vez creada la tabla, vamos a la creación del TRIGGER. Se define con el prefijo TRG como buena práctica y se ejecutará después
(AFTER) de un INSERT sobre la tabla Ventas. Los datos a insertar son los siguientes: 'INSERT' como valor fijo, 'VENTAS' como valor
fijo, la función CURRENT_USER() para saber el usuario que está ejecutando la acción y la fecha definida con la funcion CURDATE()  */ 

DROP TABLE IF EXISTS Ventas_AUDIT;
CREATE TABLE Ventas_AUDIT (
Id_VAudit INT AUTO_INCREMENT PRIMARY KEY,
Accion CHAR (8), 
Tabla CHAR (8),
Usuario VARCHAR (100),
Fecha_INSERT DATE
);

DROP TRIGGER IF EXISTS TRG_AUDIT_VENTAS;

DELIMITER $$ 
CREATE TRIGGER TRG_AUDIT_VENTAS AFTER INSERT ON Ventas
FOR EACH ROW
BEGIN

INSERT INTO Ventas_AUDIT (Accion, Tabla,Usuario,Fecha_INSERT)
VALUES ('INSERT','VENTAS',CURRENT_USER(),CURDATE());

END$$
DELIMITER ;

/* Inserción de registros para pruebas de ejecución del TRIGGER
INSERT INTO Ventas (Id_Venta,Fecha_venta,Id_Cliente,Id_Empleado,Valor_total)
VALUES (35,'2023-08-12',11,3,200),
		(36,'2021-11-24',5,9,350),
        (37,'2020-07-25',5,2,400),
        (38,'2022-09-19',1,18,50),
        (39,'2023-12-23',2,15,350),
        (40,'2021-05-18',20,13,1100);
        
Verificación de inserción del TRIGGER
SELECT * FROM Ventas_AUDIT; */






/* El siguiente TRIGGER creado se encarga de llevar un LOG sobre las actualizaciones (UPDATE) sobre la tabla de clientes. Como en el
caso anterior, lo primero que debemos hacer es la creaciónd de la tabla sobre la cual va a insertar nuestro trigger la inofmación. 
Se crea la tabla Clientes_LOG con los siguientes campos: Un ID como llave primaria de la tabla, el nuevo nombre que se ingresa, el
nombre antiguo antes del UPDATE, el Id de cliente nuevo y el Id de cliente antiguo, el nuevo EMAIL ingresado y la fecha en que se 
realizó el UPDATE sobre la tabla. 

Pasamos a la creación del TRIGGER con el prefijo TRG como buena práctica y su ejecución a realizarse antes (BEFORE) de hacer la
actualización de registros sobre la tabla clientes. En este caso los registros a ingresar en la tabla creada Clientes_LOG son los
siguientes: El nombre completo (por eso se concatena el nombre y apellido en el primer y segundo campo) utilizando las sentencias
NEW y OLD para obtener el valor nuevo que se está ingresando y el valor reemplazado respectivamente. Se hace lo mismo con los ID de 
cliente para obtener ambos datos y el campo fecha que para variar la función utilicé NOW(). */

DROP TABLE IF EXISTS Clientes_LOG;

CREATE TABLE Clientes_LOG (
Id_LClientes INT AUTO_INCREMENT PRIMARY KEY,
Nombre_NEW VARCHAR(100),
Nombre_OLD VARCHAR (100),
NEW_Id INT,
OLD_Id INT,
EMAIL_NEW VARCHAR (100),
Fecha_UPDATE DATE
);

DROP TRIGGER IF EXISTS TRG_LOG_CLIENTES;

DELIMITER $$ 
CREATE TRIGGER TRG_LOG_CLIENTES BEFORE UPDATE ON Clientes
FOR EACH ROW
BEGIN

INSERT INTO Clientes_LOG (Nombre_NEW,Nombre_OLD,NEW_Id,OLD_Id,EMAIL_NEW,Fecha_UPDATE)
VALUES (CONCAT(NEW.Nombre,' ',NEW.Apellido),CONCAT(OLD.Nombre,' ',OLD.Apellido),NEW.Id_Cliente,OLD.Id_Cliente,NEW.Email,NOW());

END$$
DELIMITER ;

/* Pruebas de ejecución del TRIGGER
UPDATE Clientes SET Nombre = 'Juan',
					Apellido = 'Gomez' 
WHERE Id_Cliente = 19;

UPDATE CLientes SET Email = 'juan.gomez@example.com'					
WHERE Id_Cliente = 19;

Verificación de actualizacion en la tabla Clientes_LOG
SELECT * FROM Clientes_LOG; */




/* Por último, el TRIGGER a continuación se encarga de hacer un LOG al eliminar registros de la tabla Detalle_Ventas. Los pasos
a seguir son similares a los casos anteriores y lo primero que debemos hacer es la creación de la tabla donde se insertaran
los registros del LOG. Se crea la tabla DetalleVentas_LOG con los mismos campos que contiene la tabla Detalle_ventas, pero se agrega 
uno más que sería la fecha cuando se hace la acción DELETE. Por esta razón los nombres de los campos definidos en la tabla, vienen
con el sufijo OLD. 

Una vez creada la tabla pasamos a la creación del TRIGGER. En este caso se ejecutará antes del DELETE sobre la tabla indicada y
va a insertar en la tabla DetalleVentas_LOG, los valores antiguos (OLD) que se van a eliminar de la tabla. Para el campo fecha,
utlicé la función del sistema CURDATE(). 
*/

CREATE TABLE DetalleVentas_LOG(
Id_LDETALLEV INT AUTO_INCREMENT PRIMARY KEY,
IDDetalle_OLD INT,
IDVentas_OLD INT,
IDProducto_OLD INT,
Cantidad_OLD INT,
Precio_OLD FLOAT,
Fecha_DELETE DATE 
);

DROP TRIGGER IF EXISTS TRG_DELETE_DETALLEV;

DELIMITER $$
CREATE TRIGGER TRG_DELETE_DETALLEV BEFORE DELETE ON Detalle_Ventas
FOR EACH ROW

BEGIN
INSERT INTO DetalleVentas_LOG(IDDetalle_OLD,IDVentas_OLD,IDProducto_OLD,Cantidad_OLD,Precio_OLD,Fecha_DELETE)
VALUES(OLD.Id_DetalleVentas,OLD.Id_Venta,OLD.Id_Producto,OLD.Cantidad,OLD.Precio_Unitario,CURDATE());

END$$
DELIMITER ;

/* Prueba de ejcución del TRIGGER
DELETE FROM Detalle_Ventas WHERE Id_DetalleVentas = 45;

Verificación de tabla "DetalleVentas_LOG"
SELECT * FROM DetalleVentas_LOG; 

Inserción de datos elminados
INSERT INTO Detalle_Ventas 
VALUES (45, 30, 2, 3, 900);

*/
