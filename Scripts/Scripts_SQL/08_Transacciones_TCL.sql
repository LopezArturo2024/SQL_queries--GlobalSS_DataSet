USE globalsuperstore;

-- Lo primero que debemos conocer es el estado de la variable de sistema "AUTOCOMMIT". Por defecto debería estar en 1. 
SELECT @@AUTOCOMMIT;

-- Para las transacciones debe estar "Apagada" la variable de sistema y lo hacemos con la siguiente línea de comando.
SET AUTOCOMMIT = 0;




/* La primera transacción serán varias sentencias de eliminación sobre la tabla Detalle_Ventas (Al ser una tabla hija es 
más sencillo realizar las pruebas). */

-- Inicio de la transacción 
START TRANSACTION;

-- Eliminamos un registro de la tabla mencionada filtrando a partir del campo Id_Venta
DELETE FROM Detalle_Ventas 
WHERE Id_Venta = 1;

-- Revisamos si efectivamente se eliminó el registro. Debemos revisar que el registro con el Id_Venta = 1
-- se haya eliminado. En este caso deberían ser 3 registros correspondientes a los Id_DetalleVentas = 1 - 2 y 15
SELECT * FROM Detalle_Ventas;

-- Hacemos ROLLBACK asumiendo un error en el número de Id_Ventas que debíamos eliminar. Al realizar el ROLLBACK debemos 
-- nuevamente revisar que los registros efectivamente volvieron a la tabla.
ROLLBACK;

-- Al confirmar efectivo el ROLLBACK, podemos continuar con la transaccion. En este caso corregimos el error y nos dimos cuenta
-- que el registro a eliminar correspondía al Id_Venta = 22. 
DELETE FROM Detalle_Ventas 
WHERE Id_Venta = 22;

-- Revisamos si efectivamente se eliminó el registro. Debemos revisar que el registro con el Id_Venta = 22
-- se haya eliminado. En este caso deberían ser 3 registros correspondientes a los Id_DetalleVentas = 32 - 33 y 34
SELECT * FROM Detalle_Ventas;

-- Una vez confirmada la información procedemos a realizar un COMMIT. Para confirmar la acción. 
COMMIT;

/* Insercion de datos eliminados y confirmados con cláusula COMMIT 
INSERT INTO Detalle_Ventas (Id_DetalleVentas,Id_Venta,Id_Producto,Cantidad,Precio_Unitario)
VALUES (32, 22, 8, 2, 40),
		(33, 22, 2, 1, 300),
		(34, 22, 1, 1, 95); 
        
Cabe destacar que los valores que se acaban de insertar van a quedar fijos en la base de datos al iniciar el próximo START TRANSACTION
*/




/* La segunda transacción a realizar es la inserción de registros en la tabla "Clientes". La idea es insertar por 
"Lotes" de datos y crear Savepoints para identificar rápidamente un error de código o en los datos a insertar. */

-- Inicio de la transaccion
START TRANSACTION;

-- Primer lote de registros a ingresar en la tabla mencionada
INSERT INTO Clientes (Nombre,Apellido,Direccion,Telefono,Email,Id_Segmento)
VALUES ('Diana','Peña','Pasaje Los Cedros 6364, San Felipe',990127890,'Diana.Peña@example.com',2),
        ('Emilio','Aguirre','Avenida Recoleta 6566, Santiago',923450123,'Emilio.Aguirre@example.com',1),
        ('Florencia','Vega','Calle Lastarria 6768, Providencia',945672345,'Florencia.Vega@example.com',3),
        ('Gonzalo','Soto','Pasaje Las Magnolias 6970, Puerto Varas',967894567,'Gonzalo.Soto@example.com',3),
        ('Hugo','Castro','Avenida Irarrázaval 7172, Ñuñoa',989016789,'Hugo.Castro@example.com',2),
        ('Isabel','Vasquez','Calle Arturo Prat 7374, Talcahuano',901238901,'Isabel.Vasquez@example.com',1);

-- Se genera primer Savepoint con el nombre "SP_LOTE1". Se utiliza el prefijo "SP" como buena práctica.
SAVEPOINT SP_LOTE1;

-- Segundo lote de registros a ingresar en la tabla "Clientes" 
INSERT INTO Clientes (Nombre,Apellido,Direccion,Telefono,Email,Id_Segmento)
VALUES  ('Javier','Soto','Pasaje Los Laureles 7576, Quillota',934562345,'Javier.Soto@example.com',2),
        ('Karina','Espinoza','Avenida Las Torres 7778, Peñalolén',956784567,'Karina.Espinoza@example.com',1),
        ('Luis','Salazar','Calle Pedro de Valdivia 7980, Temuco',978906789,'Luis.Salazar@example.com',3),
        ('Mariana','Cordero','Pasaje Los Sauces 8182, Valdivia',990128901,'Mariana.Cordero@example.com',3),
        ('Nicolas','Paredes','Avenida Santa María 8384, Vitacura',923451234,'Nicolas.Paredes@example.com',2),
        ('Arturo','Lopez','Avenida Independencia 1022, Santiago',923457882,'Arturo.Lopez@example.com',1);
 
-- Verificamos la correcta inserción de los registros en la tabla. Asumiendo un error en el "Lote 2" podemos hacer 
-- ROLLBACK al primer SAVEPOINT. 
SELECT * FROM Clientes;
ROLLBACK TO SP_LOTE1; 

-- Realizamos las modificaciones a los datos y corregimos los errores. Después volvemos a correr el script de inserción
-- del LOTE 2. En caso de que se encuentre sin errores y que hicimos la comprobación de los registros insertados, "liberamos"
-- el SAVEPOINT y confirmamos la acción con COMMIT. 
SELECT * FROM Clientes;

RELEASE SAVEPOINT SP_LOTE1;
COMMIT;