**Implementación de la base de datos**

Para el correcto funcionamiento e instalación exitosa de la base de datos “globalsuperstore” se deben seguir los siguientes pasos mencionados a continuación:

1.	En MySQL Workbench debemos abrir el archivo “01_Creacion_DDL” y correr el script. 
2.	Abrir el archivo “02_Insercion_Datos” en MySQL Workbench y correr el script.
3.	Realizar inserción de registros por importación de archivos CSV. Se debe realizar en el siguiente orden: 
a.	En primer lugar, importar el archivo “Empleados.csv” de la carpeta “ArchivosCSV_Importacion” que se encuentra dentro de la carpeta de scripts del proyecto. Se debe importar a la tabla “Empleados” del schema “globalsuperstore”. 
b.	Realizar la importación del archivo “Ventas.csv” ubicada en la carpeta “ArchivosCSV_Importacion”. En este caso debemos importar a la tabla “Ventas” del schema. 
c.	Por último, realizar la importación del archivo “Detalle_Ventas.csv” ubicada en la carpeta “ArchivosCSV_Importacion”. En este caso debemos importar a la tabla “Detalle_Ventas” del schema. 
4.	Abrir el archivo”03_Vistas_DB” en MySQL Workbench y correr el script.
5.	Abrir el archivo ”04_Funciones_DB” en MySQL Workbench y correr el script.
6.	Abrir el archivo “05_Procedimientos_DB” en en MySQL Workbench y correr el script.
7.	Abrir el archivo “06_Triggers_DB” en MySQL Workbench y correr el script.
8.	Abrir el archivo “07_Usuarios_DCL” en MySQL Workbench y correr el script.
9.	Abrir el archivo “08_Transacciones_TCL” en MySQL Workbench y correr el script. En este caso se deben seguir los pasos indicados en los comentarios del script para poder ejecutar y hacer las pruebas de forma correcta.
10.	Abrir el archivo “09_Backup_DB” en MySQL Workbench y, en caso de ser necesario por pérdida de la información,  correr el script.

En el archivo PDF se encuentra toda la documentación sobre el proyecto, sus tablas, queries, functions, stored procedures, triggers y backups realizados. 
