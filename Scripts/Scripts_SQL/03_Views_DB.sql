USE globalsuperstore;

-- En esta sección del Script se encuentran todas las views realizadas que pueden ser aplicables a la tienda
-- GlobalSuperStore. En cada una de las vistas haré una explicación sobre el objetivo de la VIEW, los parámetros
-- utilizados y la forma en que se encuentra escrita.





/* Vista que entrega información sobre la cantidad de producto disponible segun el inventario existente. 
La resolución de la consulta se realiza a partir de un LEFT JOIN entre la tabla inventario y productos. La tabla de la
izquierda sería productos para poder retornar el valor de cero o NULL en caso de la no existencia de un producto. 
La información que se entrega es el nombre del producto, la cantidad existente y la última fecha de actualización.
Al final de ordena de forma DESC para saber cuales son los productos con mayor existencia de primero. */

CREATE OR REPLACE VIEW VW_CANT_PRODUCTOS_DISP AS ( -- La creación de la vista con el prefijo VW como buena práctica
	SELECT P.Nombre,I.Cantidad AS Disponibles, I.Fecha_Actualizacion AS Registro FROM Productos P
	LEFT JOIN Inventario I
	ON P.Id_Producto = I.Id_Producto
	ORDER BY I.Cantidad Desc
);
-- Prueba de funcionamiento de la vista. 
-- SELECT * FROM VW_CANT_PRODUCTOS_DISP;




/* Vista que entrega información de las ventas más recientes de la empresa. Para la resolución de la consulta, se debe realizar un
INNER JOIN entre las tablas VENTAS, EMPLEADOS y CLIENTES. La información que muestra la view son el Id_Venta, el nombre y apellido 
concatenados del Cliente, el nombre y apellido concatenados del Empleado, el monto total de la venta y la fecha en que se realizó.
Se renombran varios de los campos para que sea entendible el campo y amigable a la vista. Se realiza un ordenamiento por fecha 
de forma DESC y así ver las últimas ventas realizadas. Al final se limita la consulta a 10 registros para ver las últimas 10 ventas. */

CREATE OR REPLACE VIEW VW_VENTAS_RECIENTES AS (
	SELECT V.Id_Venta AS Num_Orden,V.Fecha_venta AS Fecha,CONCAT(C.Nombre,' ',C.Apellido) AS Cliente, V.Valor_total AS Total, CONCAT(E.Nombre,' ',E.Apellido) AS Vendedor FROM Ventas V
	INNER JOIN Empleados E
	ON V.Id_Empleado = E.Id_Empleado
	INNER JOIN Clientes C
	ON V.Id_Cliente = C.Id_Cliente
	ORDER BY V.Fecha_venta DESC
	LIMIT 10
);
-- Prueba de funcionamiento de la vista. 
-- SELECT * FROM VW_VENTAS_RECIENTES;




/* En este caso el objetivo de la vista es mostrar el top 5 de los productos más vendidos. Para esto debemos solucionar la consulta
realizando un INNER JOIN entre las tablas Detalle_Ventas y Productos. La VIEW va a entregar el nombre del producto y la cantidad
total que se ha vendido, que se hace con la funcion SUM de los valores de cantidad de la tabla de Detalle_Ventas. Al hacer uso de la
función de suma se agrupa con GROUP BY por el nombre del producto. Luego ordenamos de forma DESC la cantidad de productos y limitamos
a 5 los registros para tener nuestro Top. */

CREATE OR REPLACE VIEW VW_TOP_PRODUCTOS_VENDIDOS AS (
	SELECT P.Nombre AS Producto, SUM(DV.Cantidad) AS Cant_Vendidos FROM Detalle_Ventas DV
	INNER JOIN Productos P
	ON DV.Id_Producto = P.Id_Producto
	GROUP BY P.Nombre
	ORDER BY SUM(DV.Cantidad) DESC
	LIMIT 5
);
-- Prueba de funcionamiento de la vista. 
-- SELECT * FROM VW_TOP_PRODUCTOS_VENDIDOS;




/* El objetivo de esta vista es presentar el cliente que ha generado la mayor cantidad de ventas. Para esto se realiza 
un INNER JOIN entre las tablas Ventas y Clientes. De esta forma podemos obtener: el Id de cliente, el nombre y 
apellido concatenado del cliente y el total gastado con la función SUM.

Se agrupa por el id y el nombre del cliente. Igualmente como queremos ver el listado de los clientes con mayores ventas
se hace un ordenamiento de forma DESC de dicho valor.  */

CREATE OR REPLACE VIEW VW_CLIENTE_MAYORGASTO AS(
	SELECT C.Id_Cliente,CONCAT(C.Nombre,' ',C.Apellido) AS Cliente, SUM(V.Valor_total) AS Gasto_Total FROM Ventas V
	INNER JOIN Clientes C 
	ON V.Id_Cliente = C.Id_Cliente
	GROUP BY C.Id_Cliente,CONCAT(C.Nombre,' ',C.Apellido)
	ORDER BY SUM(V.Valor_total) DESC
);
-- Prueba de funcionamiento de la vista. 
-- SELECT * FROM VW_CLIENTE_MAYORGASTO;




/* El objetivo de esta VIEW es obener un listado de los productos con sus respectivos proveedores. Para la resolución de la consulta
debemos unir la tabla de productos y proveedores a través de la tabla puente Productos_Proveedores. Se realiza un INNER JOIN entre
las tablas a través de las claves y para finalizar se ordena de forma ASC por el nombre del Proveedor */

CREATE OR REPLACE VIEW VW_PRODUCTOS_PROVEEDORES AS (
	SELECT P.Nombre AS Proveedor,PR.Nombre AS Producto FROM Productos PR
	INNER JOIN Productos_Proveedores PP 
	ON PR.Id_Producto = PP.ID_Producto
	INNER JOIN Proveedores P
	ON PP.Id_Proveedor = P.Id_Proveedor
	ORDER BY P.Nombre ASC
);
-- Prueba de funcionamiento de la vista. 
-- SELECT * FROM VW_PRODUCTOS_PROVEEDORES;




/* El objetivo de esta vista es entregar un listado de las ventas organizadas por mes y año. De esta forma observar la tendencia,
si existe, de las ventas. Para esto Se realiza una consulta sencilla dentro de la misma tabla de ventas, se solicitan: El ID de la
venta, el año de la fecha de venta con la funcion YEAR, el mes de la fecha usando la funcion MONTH y el total de 
venta usando la funcion suma del valor total de las ventas. Se debe agrupar por el Id de venta, el año y el mes solicitados y se 
ordenan primero por año de forma DESC y depsués por mes de forma ASC.  */

CREATE OR REPLACE VIEW VW_VENTAS_MENSUALES AS (
	SELECT YEAR(Fecha_Venta) AS AÑO, MONTH(Fecha_Venta) AS MES, SUM(Valor_Total) AS TOTAL_FACTURADO FROM Ventas
	GROUP BY YEAR(Fecha_Venta),MONTH(Fecha_Venta)
	ORDER BY YEAR(Fecha_Venta) DESC,MONTH(Fecha_Venta) ASC
);
-- Prueba de funcionamiento de la vista. 
-- SELECT * FROM VW_VENTAS_MENSUALES;





/* El objetivo de esta vista es entregar un listado del total de ventas generadas por los empleados de la empresa. Para esto se 
debe realizar la unión entre las tablas Empleados y Ventas. Se hace a través de una LEFT JOIN desde la tabla empleados para poder
saber si existen empleados que no han tenido ventas. La consulta entrega: El nombre y apellido concatenados del empleado y la suma
total de ventas realizadas. Se renombran los campos como se ha hecho en otras vistas para que se comprenda de mejor forma la tabla 
entregada. Al final se agrupa por el nombre y apellido concatenado del empleado y se ordena de forma DESC el total de las ventas. */

CREATE OR REPLACE VIEW VW_VENTAS_EMPLEADOS AS (
	SELECT CONCAT(E.Nombre,' ',E.Apellido) AS Vendedor, SUM(V.Valor_Total) AS Total_Vendido FROM Empleados E
	LEFT JOIN Ventas V
	ON E.Id_Empleado = V.Id_Empleado
	GROUP BY CONCAT(E.Nombre,' ',E.Apellido)
	ORDER BY SUM(V.Valor_Total) DESC
);
-- Prueba de funcionamiento de la vista. 
-- SELECT * FROM VW_VENTAS_EMPLEADOS;




/* La última vista generada se utiliza para entregar un listado de los productos y la categoría correspondiente del mismo. Para eso
debemos unir las tablas producto y categorías a través de un INNER JOIN. La consulta entrega el nombre del producto y el nombre
de su categoria. Al final se ordenan de forma ASC por el nombre de la categoría para poder diferenciar los bloques de productos. */

CREATE OR REPLACE VIEW VW_PRODUCTOS_CATEGORIAS AS (
	SELECT P.Nombre AS Producto, C.Nombre AS Categoria FROM Productos P
	INNER JOIN Categorias C
	ON P.Id_Categoria = C.Id_Categoria
	ORDER BY C.Nombre ASC
);
-- Prueba de funcionamiento de la vista. 
-- SELECT * FROM VW_PRODUCTOS_CATEGORIAS;