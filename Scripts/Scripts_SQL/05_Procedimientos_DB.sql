USE globalsuperstore;

/* Al igual que en los apartados anteriores, voy con la misma dinámica. Explicaré el objetivo de los procedimientos, el desarrollo
del script y los datos utilizados. Igualmente, si veo conveniente, colocaré comentarios dntro del script para explicar algo en 
particular que se salga del contexto inicial del procedimiento descrito. */





/* El primer procedimiento mostrado entrega los productos que se encuentren con un stock menor a un valor determinado por el 
usuario. De esta forma, se ingresa el parametro P_STOCK del tipo INT que servirá de nivel para saber que productos se encuentran por
debajo de ese nivel de stock. El uso de un procedimiento en este caso, a diferencia de una función, es porque quiero entregar el listado
de productos que se encuentren en esa condición de bajo stock y que el usuario pueda definir dicho nivel. 

El script es bastante simple, se realiza una consulta SELECT y se realiza un INNER JOIN entre las tablas Productos e Inventario para 
obtener el nombre del producto y su cantidad de stock. En el inventario coloco una suma de las cantidades registradas, en caso de que
existiera un doble registro con el producto en el inventario (SE debería realizar un UPDATE para actualizar el valor de inventario de
dicho producto o en dado caso insertar el valor actualizado pero eliminar el regitro antiguo). Para efectos del ejercicio y así 
utilizar la clausula HAVING, dejé la sumatoria de las cantidades. La sentencia HAVING compara el valor obtenido con el parametro de stock
ingresado y si es menor a el, lo muestra en el listado. Para terminar se ordena la sentencia de forma DESC. */

DROP PROCEDURE IF EXISTS SP_STOCK_PRODUCTOS;

DELIMITER %%
CREATE PROCEDURE SP_STOCK_PRODUCTOS(IN P_STOCK INT)	-- Prefijo SP como buena practica de la creación de parámetros				

BEGIN

SELECT P.Nombre AS Producto,SUM(I.Cantidad) AS Stock FROM Inventario I 
INNER JOIN Productos P
ON I.Id_Producto = P.Id_Producto
GROUP BY P.Nombre
HAVING SUM(I.Cantidad) < P_STOCK -- Parametros de entrada con el prefijo P
ORDER BY SUM(I.Cantidad) DESC;

END%%
DELIMITER ;

-- Prueba de ejecución del procedimiento
-- CALL SP_STOCK_PRODUCTOS(50);





/* El siguiente procedimiento es el solicitado por el profesor y realiza el ordenamiento de manera ASC o DESC del campo que 
escoja el usuario a partir de los parámetros de entrada. Esto referente a la tabla Empleados. Se definen entonces dos parámetros
de entrada P_Campo y P_Orden. El primero corresponde al nombre de la columna por la cual queremos organizar la tabla y el segundo
al tipo de ordenamiento que queremos realizar, en este caso puede ser ASC o DESC (Como son las dos unicas opciones, definí los campos
del tipo ENUM. 

Lo primero que debo explicar es que se definen dos variable auxiliares llamadas @P_Auxiliar y @P_Resultado. Estas ayudan a resolver
la sentencia que debe realizarse a través de SQL dinámico. La primera variable @P_Auxiliar se setea a partir de una previa 
verificación del parámetro de entrada P_Campo. Esta se realiza a través del IF y si el usuario ingresa un valor vacío en el campo
en el que quiere ordenar la tabla, va a devolver por defecto el ordenamiento por la columna "Nombre". Si en caso contrario, ingresa el
valor de una columna, la variable se seteará concatenando 'ORDER BY' y el nombre del campo ingresado en el parámetro. 

La segunda parte seteará a la variable @P_Resultado haciendo CONCAT se la sentencia que muestra todos los campos de la tabla Empleados
, nuestra variable auxiliar @P_Auxiliar y el parámetro P_Orden. Seguido a esto, se realizan los comandos del SQL dinámico 
y se cierra el procedimiento */

DROP PROCEDURE IF EXISTS SP_ORDEN_EMPLEADOS;

DELIMITER $$ 
CREATE PROCEDURE SP_ORDEN_EMPLEADOS(IN P_Campo VARCHAR(20),
									IN P_Orden ENUM('DESC','ASC'))

BEGIN

IF P_Campo <> '' THEN
	SET @P_Auxiliar = CONCAT(' ORDER BY ',P_Campo);
ELSE 
	SET @P_Auxiliar = CONCAT(' ORDER BY ','Nombre');
END IF;


SET @P_Resultado = CONCAT('SELECT * FROM Empleados', @P_Auxiliar,' ',P_Orden);

PREPARE RUNSQL from @P_Resultado;
EXECUTE RUNSQL;
DEALLOCATE PREPARE RUNSQL;

END$$
DELIMITER ;

-- Prueba de ejecución del procedimiento
-- CALL SP_ORDEN_EMPLEADOS('','ASC');





/* El último procedimiento se encarga de realizar actualizaciones (UPDATES) a la tabla de clientes. Para esto se defininen todos los
parámetros de entrada que corresponden a los campos de la tabla clientes que se requieren actualizar. Igualmente se definen sus tipos
de datos acorde a lo que corresponde el campo a registrar. 

Lo primero que realizo es la verificación de existencia del cliente que se quiere actualizar. El cliente debe estar previamente creado
para poder realizar modificaciones. Para esto se define una variable auxiliar llamada @P_Existencia que nos ayudará a revisar esto. 
Se ingresa en la variable auxiliar el conteo de clientes que cumplen con el ID de cliente ingresado por parámetros. Después se 
verifica con una sentencia IF si el conteo en la variable @P_Existencia = 0. En caso de ser igual a 0, significa que el cliente no
se encuentra creado en la tabla Clientes y por lo tanto no se debe actualizar. En internet encontré la forma de colocar un error 
pre-determinado con las líneas de código (SIGNAL SQLSTATE '45000 / SET MESSAGE_TEXT = 'Cliente no existe'). 

Si existe el cliente, entonces se realizará el UPDATE con los parámetros de entrada que el usuario registra en el procedimiento.
Para finalizar se cierra el procedimiento. 
 */

DROP PROCEDURE IF EXISTS SP_UPDATE_CLIENTES; 
 
DELIMITER $$
CREATE PROCEDURE SP_UPDATE_CLIENTES(IN P_IdCliente INT,
									IN P_Nombre VARCHAR(50),
									IN P_Apellido VARCHAR (50),
                                    IN P_Direccion VARCHAR (100),
                                    IN P_Telefono VARCHAR (25),
                                    IN P_Email VARCHAR (100),
                                    IN P_IdSegmento INT)

BEGIN

SELECT COUNT(*) INTO @P_Existencia FROM Clientes
WHERE Id_Cliente = P_IdCliente;

IF @P_Existencia = 0 THEN 
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Cliente no existe';
ELSE 
	UPDATE Clientes SET Nombre = P_Nombre,
						Apellido = P_Apellido,
                        Direccion = P_Direccion,
                        Telefono = P_Telefono,
                        Email = P_Email,
                        Id_Segmento = P_IdSegmento
	WHERE Id_Cliente = P_IdCliente;
END IF;

END$$
DELIMITER ;

-- Prueba de ejecución del procedimiento.
-- CALL SP_UPDATE_CLIENTES(19,'Maria','Lopez','Augusto Villanueva 67','','maria.lopez@example.com',1);
-- SELECT * FROM Clientes;