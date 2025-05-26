/* La temática escogida para el modelado de la base de datos es una tienda del tipo retail ficticia llamada Global Super Store. 
Es un dataset que utilicé para realizar la visualización de datos en PowerBI en un curso anterior, pero modelado desde cero. 
Incluye diversas áreas del negocio como lo son Clientes, Productos,Categorías de productos Ventas, Proveedores, Empleados, 
Detalles de Ventas, Segmentos e Inventario. 

Voy a estar realizando comentarios y descripción de las tablas a medida que vayan apareciendo en el script */

DROP SCHEMA IF EXISTS globalsuperstore; -- Se realiza un DROP previo como buena práctica
CREATE SCHEMA globalsuperstore; 
USE globalsuperstore; 


/* La tabla segmentos define el tipo de cliente y únicamente puede ser de 3 modalidades: Cliente Coporativo, Consumidor o Home Office
Por esa razón, se define el tipo de dato ENUM en el campo "Nombre" para solamente incluir en ese campo, estos 3 tipos de dato. 
El campo "Id_Segmento" se define como tipo INT Auto incremental como llave primaria.
El campo "Descripción" se define como VARCHAR y en caso que no se llene la información, para que el registro no quede vacío,
se dejó un valor DEFAULT  */

DROP TABLE IF EXISTS Segmentos; 
CREATE TABLE Segmentos (
	Id_Segmento INT AUTO_INCREMENT PRIMARY KEY, 
	Nombre ENUM('Corporativo', 'Consumidor', 'Home office'), 
	Desripcion VARCHAR (100) DEFAULT 'No informado'
    );

/* La tabla clientes contiene toda la información relacionada con el cliente que realiza la Venta. Incluye campos definidos como 
VARCHAR como lo son Nombre, Apellido, Dirección, Teléfono e Email. El largo de ese tipo de datos se define según lo estimado para cada tipo 
de columna. Los campos "Direccion" y "Telefono" no se definen como "NOT NULL" porque son campos que no se requieren de forma obligatoria y se deja 
un valor DEFAULT en caso de que no se realice el registro. 

Igualmente se define el campo "Id_Cliente" como llave primaria del tipo INT y auto incremental. También se define el campo "Id_Segmento" como INT
y se define como llave foránea estableciendo la relación entre la entidad "Clientes" y "Segmentos"  */

DROP TABLE IF EXISTS Clientes;
CREATE TABLE Clientes (
    Id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100) DEFAULT 'No informado',
    Telefono VARCHAR(25) DEFAULT 'No informado',
    Email VARCHAR(100) NOT NULL,
    Id_Segmento INT NOT NULL,
    FOREIGN KEY (Id_Segmento) REFERENCES Segmentos(Id_Segmento)
    );

/* La tabla empleados contiene toda la información relacionada con los empleados que generan la venta junto al cliente. La descripción de
las columnas contiene tipos de datos VARCHAR como lo son: "Nombre", "Apellido", "Cargo", "Telefono" e "Email". Se crea un campo llamado
"Fecha_Contratación" definido como tipo DATE para conocer la fecha de ingreso del empleado y así usar otro tipo de dato. Los campos "Cargo" y 
"Telefono" como no son obligatorios, en caso de que no exista el registro, queda un valor como DEFAULT. 

Se crea el campo "Id_Empleado" del tipo INT y se define como llave primaria de la tabla.   */

DROP TABLE IF EXISTS Empleados;
CREATE TABLE Empleados (
	Id_Empleado INT AUTO_INCREMENT PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Cargo VARCHAR(25) DEFAULT 'No informado',
    Fecha_Contratacion DATE NOT NULL,
    Telefono VARCHAR(25) DEFAULT 'No informado',
    Email VARCHAR(100) NOT NULL
	);
    
    
/* La tabla Ventas incluye toda la descripción referente a la venta realizada. Incluye campos que deben ser obligatorios que incluyen: 
"Fecha_Venta" se define como tipo DATE, "Id_Cliente" se define como INT al igual que el campo "Id_Empleado", por último un campo "Valor_total" 
que indicaría el precio de la venta completo, se define como tipo DOUBLE.

Se define como llave primaria el campo "Id_Venta" auto incremental y como llave foránea los campos "Id_Cliente" y "Id_Empleado", estableciendo 
la relación entre las tablas "Clientes" y "Empleados" con la tabla "Cliente"    */

DROP TABLE IF EXISTS Ventas;
CREATE TABLE Ventas (
	Id_Venta INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_venta DATE NOT NULL,
    Id_Cliente INT NOT NULL,
    Id_Empleado INT NOT NULL,
    Valor_total DOUBLE NOT NULL,
    FOREIGN KEY (Id_Cliente) REFERENCES Clientes (Id_Cliente),
    FOREIGN KEY (Id_Empleado) REFERENCES Empleados (Id_Empleado)
    );
 
 
/* La tabla "Categorias" hace referencia a la categoría que pertenecen los productos. Se crea un campo llamado "Nombre" del tipo VARCHAR que 
debe obligatoriamente tener un registro y un campo llamado "Descripcion" del tipo VARCHAR que no necesariamente debe tener un registro
por lo que se deja un valor DEFAULT

Se crea un campo llamado "Id_Categoria" y se define como INT y llave primaria de la tabla  */
 
DROP TABLE IF EXISTS Categorias;    
CREATE TABLE Categorias (
    Id_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(100) DEFAULT 'No informado'
	);

/*   La tabla "Productos" contiene toda la información referente a la descripción de los productos. Incluye campos obligatorios NOT NULL como:
"Nombre" definido como VARCHAR y "Precio" definido como DOUBLE. El campo "Descripcion" se define del tipo VARCHAR pero no es obligatorio
por lo que se deja un valor DEFAULT en caso de no existir registros. 

Se define como llave primaria el campo "Id_Producto" auto incremental y como llave foránea el campo "Id_Categoría" definido como INT que establece
la relación entre las tablas "Categorias" y la tabla "Productos"     */    

DROP TABLE IF EXISTS Productos;
CREATE TABLE Productos (
	Id_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(100) DEFAULT 'No informado',
    Precio DOUBLE NOT NULL,
    Id_Categoria INT NOT NULL,
    FOREIGN KEY (Id_Categoria) REFERENCES Categorias(Id_Categoria)
	);
    
/*  La tabla "Detalle_Ventas" se crea para especificar todo lo relacionado con la venta porque puede ocurrir que una venta incluya más
de un producto y de esta forma se permite definir ese nivel de detalle. Se crean campos obligatorios NOT NULL como lo son: "Cantidad" definido
del tipo INT y la columna "Precio_Unitario" definida del tipo DOUBLE. Estas dos columnas muestran la cantidad de productos comprados y 
el costo asociado a es 


Se define como llave primaria el campo "Id_DetalleVentas" auto incremental y como llave foránea los campos "Id_Venta" definido como INT y 
"Id_Producto" definido como INT que establece la relación entre las tablas "Ventas" y "Productos" con la tabla "Detalle_Ventas"  */   
 
DROP TABLE IF EXISTS Detalle_Ventas;
CREATE TABLE Detalle_Ventas (
	Id_DetalleVentas INT AUTO_INCREMENT PRIMARY KEY,
    Id_Venta INT NOT NULL,
    Id_Producto INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_Unitario DOUBLE NOT NULL,
    FOREIGN KEY (Id_Venta) REFERENCES Ventas(Id_Venta),
    FOREIGN KEY (Id_Producto) REFERENCES Productos(Id_Producto)
    );


/* La tabla proveedores contiene toda la información de las empresas que suministran los productos. Contiene columnas onligatorias NOT NULL
como: "Nombre" del tipo VARCHAR, "Nombre_Contacto" del tipo VARCHAR, "Apellido_Contacto" del tipo VARCHAR y "Email" del tipo VARCHAR. 
La columna "Telefono" puede contener registros vacíos por lo que se deja un valor DEFAULT. 

En este caso se define la llave primaria "Id_Proveedor" del tipo INT y auto incremental.  */
 
DROP TABLE IF EXISTS Proveedores;
CREATE TABLE Proveedores (
	Id_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR (50) NOT NULL,
    Nombre_Contacto VARCHAR (50) NOT NULL,
    Apellido_Contacto VARCHAR (50) NOT NULL,
	Telefono VARCHAR(25) DEFAULT 'No informado',
    Email VARCHAR(100) NOT NULL
    );

/* La tabla inventario contiene la información del registro de la actualización del inventario de los productos. Contiene datos de caracter 
obligatorio NOT NULL como lo son: "Fecha_Actualizacion" del tipo DATETIME (Para usar otro tipo de datos diferente a DATE) y la columna 
"Cantidad" del tipo INT

Se define como llave primaria el campo "Id_Inventario" auto incremental y como llave foránea el campo "Id_Producto" definido como INT que 
establece la relación entre la tabla "Inventario" con la tabla "Productos" */
    
DROP TABLE IF EXISTS Inventario;
CREATE TABLE Inventario (
	Id_Inventario INT AUTO_INCREMENT PRIMARY KEY,
    Id_Producto INT NOT NULL,
    Fecha_Actualizacion DATETIME NOT NULL,
    Cantidad INT NOT NULL,
    FOREIGN KEY (Id_Producto) REFERENCES Productos (Id_Producto)
    );
    
/* La tabla Productos_Proveedores surge de solventar el problema de la cardinalidad de N:M entre las tablas "Productos" y "Proveedores". 
De esta forma se definen ambas columnas "Id_Producto" del tipo INT y "Id_Proveedor" del tipo INT y se define una llave primaria compuesta
conformada por estos dos valores. A su vez, se definen como llave foránea los campos "Id_Producto" y "Id_Proveedor" que establece la
relación entre las tablas "Proveedores" y "Productos" */
    
DROP TABLE IF EXISTS Productos_Proveedores;
CREATE TABLE Productos_Proveedores (
	Id_Producto INT NOT NULL,
    Id_Proveedor INT NOT NULL,
    PRIMARY KEY (Id_Producto, Id_Proveedor),
    FOREIGN KEY (Id_Producto) REFERENCES Productos (Id_Producto),
    FOREIGN KEY (Id_Proveedor) REFERENCES Proveedores (Id_Proveedor)
    );
    