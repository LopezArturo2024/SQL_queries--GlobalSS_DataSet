USE globalsuperstore;

/* Al igual que en el apartado de las vistas, voy a enfocarme en explicar el objetivo de las funciones, la lógica de la programación
y los parámetros utilizados. Todos con comentarios en las líneas de código que considero importantes. 

Consideraciones: 
1.Se usa siempre el prefijo FN para nombrar las funciones como buena práctica. Igualmente los parámetros inician con el prefijo P 
y las variables con el prefijo V. 
2.El tipo de funcion utilizado siempre va a ser Deterministic como se indicó en clase por el profeso así que es el único que aparecerá
en el script */





/* La primera función corresponde a retornar el valor total de ventas para un mes y un año específicos. Me parece muy interesante 
para poder saber cuanto se ha vendido en un mes y año específicos. Para esto se declaran dos parámetros de entrada que son el mes 
y el año, ambos de tipo INT. La variable de retorno se declara como FLOAT porque puede ser un valor decimal en los totales de venta. 
La consulta es sencilla, es ingresar un SELECT dentro de la variable definida y las condiciones se asignan a los parámetros de entrada
de mes y año. */

DROP FUNCTION IF EXISTS FN_VENTAS_TOTAL_MES_YEAR;

DELIMITER %% 
CREATE FUNCTION FN_VENTAS_TOTAL_MES_YEAR(P_MES INT, P_ANO INT) 
RETURNS FLOAT
DETERMINISTIC 

BEGIN

DECLARE V_VENTA_TOTAL FLOAT; 

SELECT SUM(Valor_Total) INTO V_VENTA_TOTAL FROM Ventas
WHERE YEAR(Fecha_Venta) = P_ANO  AND MONTH(Fecha_Venta) = P_MES;        

RETURN V_VENTA_TOTAL;

END%%
DELIMITER ;

-- Prueba de funcionameinto de la función
-- SELECT FN_VENTAS_TOTAL_MES_YEAR(07,2023) AS Venta_Total;




/* La siguiente función devuelve el nombre y apellido del cliente a partir de su número de ID. Me parece que es una función básica 
pero muy importante para solicitudes del cliente. El parámetro de entrada se define INT y corresponde al ID del cliente. La variable
de salida se define del tipo VARCHAR con una longitud de 100 caracteres (Sería lo definido en Nombre + Apellido en la creación de las
tablas). La consulta ingresa dentro de la variable definida el valor concatenado del nombre y apellido que podemos encontrar en la tabla
de clientes. */

DROP FUNCTION IF EXISTS FN_NOMBRE_CLIENTEID;

DELIMITER %%  
CREATE FUNCTION FN_NOMBRE_CLIENTEID(P_ID_CLIENTE INT) 
RETURNS VARCHAR (100)
DETERMINISTIC

BEGIN

DECLARE V_NOMBRE_CLIENTE VARCHAR (100);

SELECT CONCAT(Nombre,' ',Apellido) INTO V_NOMBRE_CLIENTE FROM CLientes
WHERE Id_Cliente = P_ID_CLIENTE;

RETURN V_NOMBRE_CLIENTE;

END%%
DELIMITER ;

-- Prueba de funcionameinto de la función
-- SELECT FN_NOMBRE_CLIENTEID(16) AS NOMBRE_CLIENTE;




/* En este caso quise hacer una función un poco más "complicada" y así usar otras herramientas que me permiten las funciones.
Esta función se encarga de entregar el nombre y apellido concatenados del empleado, junto al valor total de ventas que ha realizado.
El parámetro de entrada sería a partir del Id del empleado y por eso se define INT. La variable que retorna se define del tipo VARCHAR
de 200 caracteres (Por lo que debo concatenar). Se declaran 3 variables, 1 la variable de salida y otras 2 auxiliares para los cálculos
previos. En la variable llamada V_Nombre_Empleado se realiza una consulta SELECT concatenando el nombre y apellido del empleado de la
tabla Empleados. La variable V_Total almacena a través de un SELECT, el valor total a partir de la función SUM que se extrae de la
tabla de Ventas. El filtro usado en ambas consultas para ingresar los datos en las variables definidas es a través del parámetro 
de entrada P_Id_Empleado (ID del empleado). Por último se hace un SET a la variable de retorno que contiene la concatenación de los
resultados almacenados en las otras variables. */

DROP FUNCTION IF EXISTS FN_TOTAL_VENDEDOR;

DELIMITER %%
CREATE FUNCTION FN_TOTAL_VENDEDOR(P_Id_Empleado INT)
RETURNS VARCHAR (200)
DETERMINISTIC

BEGIN

DECLARE V_VentaEMP_Total VARCHAR (200);
DECLARE V_Nombre_Empleado VARCHAR (100);
DECLARE V_Total FLOAT;

SELECT CONCAT(Nombre,' ',Apellido) INTO V_Nombre_Empleado FROM Empleados 
WHERE Id_Empleado = P_Id_Empleado;

SELECT SUM(Valor_total) INTO V_Total FROM Ventas
WHERE Id_Empleado = P_Id_Empleado;

SET V_VentaEMP_Total = CONCAT(V_Nombre_Empleado,'      ',V_Total);

 
RETURN V_VentaEMP_Total;

END%%
DELIMITER ;

-- Prueba de funcionameinto de la función
-- SELECT FN_TOTAL_VENDEDOR (1) AS TOTAL_VENTA_EMPLEADO;




/* Por último, realicé una función que te devuelve el valor total de un producto inventariado. Es decir, el valor total del inventario
para un producto determinado. El cálculo en la consulta, no es más que la cantidad que se extrae de la tabla Inventario, multiplicado por
el precio que se extrae de la tabla Producto. El parámetro de entrada se define INT y corresponde al ID del producto. La variale de
retorno se define del tipo FLOAT. Como en el caso anterior, declare 2 variables auxiliares V_Cantidad (INT) y V_Precio(FLOAT) que sirven para
almacenar la cantidad total de producto y el precio del producto respectivamente. Por último se hace un SET a la variable de salida
V_Total_Inventario y se hace el cálculo antes mencionado. */

DROP FUNCTION IF EXISTS FN_VALOR_INVENTARIO_PRODUCTO;

DELIMITER %%
CREATE FUNCTION FN_VALOR_INVENTARIO_PRODUCTO(P_ID_Producto INT)
RETURNS FLOAT
DETERMINISTIC

BEGIN

DECLARE V_Total_Inventario FLOAT;
DECLARE V_Cantidad INT;
DECLARE V_Precio FLOAT;

SELECT SUM(Cantidad) INTO V_Cantidad FROM Inventario
WHERE Id_Producto = P_ID_Producto;

SELECT Precio INTO V_Precio FROM Productos
WHERE Id_Producto = P_ID_Producto;

SET V_Total_Inventario = V_Cantidad * V_Precio;
 
RETURN V_Total_Inventario;

END%%
DELIMITER ;

-- Prueba de funcionameinto de la función
-- SELECT FN_VALOR_INVENTARIO_PRODUCTO (10) AS Total_Producto_Inventario;