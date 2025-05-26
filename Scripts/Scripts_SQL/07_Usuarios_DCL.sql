USE globalsuperstore;



-- Creacion de 1er usuario llamado "USER_LVL1" en un dominio local "Localhost" e identificado por la contraseña "Usuariolvl1"
DROP USER IF EXISTS USER_LVL1@Localhost;
CREATE USER USER_LVL1@Localhost IDENTIFIED BY "Usuariolvl1";

/* El primer usuario lo pensé como una especie de arquitecto de la base de datos. Tiene acceso a todos los objetos de la 
base de datos del proyecto "GlobalSuperstore" y sus permisos son asociados al lenguaje DDL, en los cuales se permite realizar
creación, modificación y eliminación de los objetos de la base de datos. Igualmente se accede el permiso a la sentencia SELECT para
que pueda ver los objetos creados.  */
GRANT CREATE,ALTER,DROP,SELECT ON GlobalSuperstore.* TO USER_LVL1@Localhost; 

/* El siguiente comando es para verificar la correcta creación del usuario "USER_LVL1"
SELECT * FROM MYSQL.USER;

La siguiente línea de código es para conocer los permisos asociados al usuario "USER_LVL1"
SHOW GRANTS FOR USER_LVL1@Localhost; */





-- Creacion de usuario llamado "USER_LVL2" en un dominio local "Localhost" e identificado por la contraseña "Usuariolvl2"
DROP USER IF EXISTS USER_LVL2@Localhost;
CREATE USER USER_LVL2@Localhost IDENTIFIED BY "Usuariolvl2";

/* El segundo usuario lo pensé como un analista encargado del área de "RRHH". Tiene acceso exclusivamente a las tablas 
"Clientes", "Empleados" y "Segmentos" de la base de datos del proyecto "GlobalSuperstore". Dentro se esas tablas tiene permisos
asociados al lenguaje DML, puede realizar inserciones, actualizaciones y eliminaciones de registros de dichas tablas. 

Igualmente asigné el permiso a la sentencia "CREATE" porque como buena práctica, al realizar modificaciones a los registros,
debemos crear tablas de backup en caso de cualquier problema encontrado. También asigné permisos de visualización a algunas vistas 
creadas dentro del proyecto que puedan ser de utilidad para el analista */
GRANT INSERT,UPDATE,DELETE,SELECT,CREATE ON GlobalSuperstore.Clientes TO USER_LVL2@Localhost; 
GRANT INSERT,UPDATE,DELETE,SELECT,CREATE ON GlobalSuperstore.Empleados TO USER_LVL2@Localhost; 
GRANT INSERT,UPDATE,DELETE,SELECT,CREATE ON GlobalSuperstore.Segmentos TO USER_LVL2@Localhost; 
GRANT SELECT ON GlobalSuperstore.VW_ClIENTE_MAYORGASTO TO USER_LVL2@Localhost; 
GRANT SELECT ON GlobalSuperstore.VW_VENTAS_EMPLEADOS TO USER_LVL2@Localhost; 
GRANT SELECT ON GlobalSuperstore.VW_VENTAS_MENSUALES TO USER_LVL2@Localhost; 

/* El siguiente comando es para verificar la correcta creación del usuario "USER_LVL2"
SELECT * FROM MYSQL.USER;

La siguiente línea de código es para conocer los permisos asociados al usuario "USER_LVL2"
SHOW GRANTS FOR USER_LVL2@Localhost; */





-- Creacion de usuario llamado "USER_LVL3" en un dominio local "Localhost" e identificado por la contraseña "Usuariolvl3"
DROP USER IF EXISTS USER_LVL3@Localhost;
CREATE USER USER_LVL3@Localhost IDENTIFIED BY "Usuariolvl3";

/* El tercer usuario lo pensé como un analista encargado de almacen. Tiene acceso exclusivamente a las tablas 
"Productos", "Inventario", "Proveedores", "Categorias" y "Productos_Proveedores" de la base de datos del proyecto 
"GlobalSuperstore". Dentro se esas tablas tiene permisos asociados al lenguaje DML, puede realizar inserciones, actualizaciones y 
eliminaciones de registros de dichas tablas. 

Igualmente asigné el permiso a la sentencia "CREATE" porque como buena práctica, al realizar modificaciones a los registros,
debemos crear tablas de backup en caso de cualquier problema encontrado. También asigné permisos de visualización a algunas vistas 
creadas dentro del proyecto que puedan ser de utilidad para el analista */
GRANT INSERT,UPDATE,DELETE,SELECT,CREATE ON GlobalSuperstore.Productos TO USER_LVL3@Localhost; 
GRANT INSERT,UPDATE,DELETE,SELECT,CREATE ON GlobalSuperstore.Inventario TO USER_LVL3@Localhost; 
GRANT INSERT,UPDATE,DELETE,SELECT,CREATE ON GlobalSuperstore.Proveedores TO USER_LVL3@Localhost;
GRANT INSERT,UPDATE,DELETE,SELECT,CREATE ON GlobalSuperstore.Categorias TO USER_LVL3@Localhost;
GRANT INSERT,UPDATE,DELETE,SELECT,CREATE ON GlobalSuperstore.Productos_Proveedores TO USER_LVL3@Localhost;
GRANT SELECT ON GlobalSuperstore.VW_PRODUCTOS_PROVEEDORES TO USER_LVL3@Localhost; 
GRANT SELECT ON GlobalSuperstore.VW_PRODUCTOS_CATEGORIAS TO USER_LVL3@Localhost; 
GRANT SELECT ON GlobalSuperstore.VW_TOP_PRODUCTOS_VENDIDOS TO USER_LVL3@Localhost; 
GRANT SELECT ON GlobalSuperstore.VW_CANT_PRODUCTOS_DISP TO USER_LVL3@Localhost; 

/* El siguiente comando es para verificar la correcta creación del usuario "USER_LVL3"
SELECT * FROM MYSQL.USER;

La siguiente línea de código es para conocer los permisos asociados al usuario "USER_LVL3"
SHOW GRANTS FOR USER_LVL3@Localhost; */





-- Creacion de usuario llamado "USER_LVL4" en un dominio local "Localhost" e identificado por la contraseña "Usuariolvl4"
DROP USER IF EXISTS USER_LVL4@Localhost;
CREATE USER USER_LVL4@Localhost IDENTIFIED BY "Usuariolvl4";

/* El último usuario lo pensé como un analista encargado de las ventas. Tiene acceso a las tablas "Ventas" y "Detalle_Ventas" 
de la base de datos del proyecto. Dentro se esas tablas tiene permisos asociados al lenguaje DML, puede realizar inserciones, 
actualizaciones y eliminaciones de registros de dichas tablas. De igual forma, tiene permisos de visualización a las columnas
"Id", "Nombre" y "Apellido" de las tablas "clientes" y "empleados" para poder visualizar los datos principales de las personas 
ascoiadas a las ventas. Para la tabla "Productos" también se asigna permiso de visualización a los campos "Id_Producto" y "Nombre"
para conocer el detalle de los productos vendidos. 

Igualmente asigné el permiso a la sentencia "CREATE" porque como buena práctica, al realizar modificaciones a los registros,
debemos crear tablas de backup en caso de cualquier problema encontrado. 

Para finalizar, asigné permisos de visualización a algunas vistas creadas dentro del proyecto que puedan ser de utilidad 
para el analista */
GRANT INSERT,UPDATE,DELETE,SELECT,CREATE ON GlobalSuperstore.Ventas TO USER_LVL4@Localhost; 
GRANT INSERT,UPDATE,DELETE,SELECT,CREATE ON GlobalSuperstore.Detalle_Ventas TO USER_LVL4@Localhost; 
GRANT SELECT(Id_Cliente,Nombre,Apellido) ON GlobalSuperstore.Clientes TO USER_LVL4@Localhost; 
GRANT SELECT(Id_Empleado,Nombre,Apellido) ON GlobalSuperstore.Empleados TO USER_LVL4@Localhost; 
GRANT SELECT(Id_Producto,Nombre) ON GlobalSuperstore.Productos TO USER_LVL4@Localhost; 
GRANT SELECT ON GlobalSuperstore.VW_ClIENTE_MAYORGASTO TO USER_LVL4@Localhost; 
GRANT SELECT ON GlobalSuperstore.VW_VENTAS_EMPLEADOS TO USER_LVL4@Localhost; 
GRANT SELECT ON GlobalSuperstore.VW_VENTAS_MENSUALES TO USER_LVL4@Localhost; 
GRANT SELECT ON GlobalSuperstore.VW_VENTAS_RECIENTES TO USER_LVL4@Localhost; 

/* El siguiente comando es para verificar la correcta creación del usuario "USER_LVL4"
SELECT * FROM MYSQL.USER;

La siguiente línea de código es para conocer los permisos asociados al usuario "USER_LVL4"
SHOW GRANTS FOR USER_LVL4@Localhost; */