USE globalsuperstore;
-- En esta sección se encuentra el script de inserción de los datos a las tablas. 
-- No voy a entregar mucho detalle pero corresponde a la infromación que llevará cada una de las tablas de la base de datos


-- La tabla segmentos solamente lleva 3 categorías de cliente como se establece en el tipo de dato ENUM 
-- al crear la tabla. No se menciona el campo Id_Segmento en la inserción para aprovechar su definición de dato como
-- AUTO_INCREMENT. 
INSERT INTO Segmentos (Nombre,Desripcion) 
VALUES ('Corporativo','Clientes de grandes empresas'),
		('Consumidor','Clientes particulares'),
        ('Home office','Clientes enfocados al trabajo en casa')
;


-- Tabla de clientes con información completa de los clintes, cumpliendo las exigencias NOT NULL de la creación de la tabla.
-- No se menciona el campo Id_Cliente en la inserción para aprovechar su definición de dato como AUTO_INCREMENT. 
INSERT INTO Clientes (Nombre,Apellido,Direccion,Telefono,Email,Id_Segmento)
VALUES ('Alejandro','Garcia','Avenida Libertador 1234, Santiago',934567890,'alejandro.garcia@example.com',2),
		('Beatriz','Martinez','Calle La Paz 5678, Valparaíso',923456789,'beatriz.martinez@example.com',3),
        ('Carlos','Rodriguez','Pasaje Los Aromos 910, Concepción',912345678,'carlos.rodriguez@example.com',1),
        ('Daniela','Lopez','Avenida Providencia 1112, Santiago',987654321,'daniela.lopez@example.com',3),
        ('Eduardo','Hernandez','Calle Colón 1314, Viña del Mar',945678901,'eduardo.hernandez@example.com',3),
        ('Fernanda','Gonzalez','Pasaje El Bosque 1516, Antofagasta',967890123,'fernanda.gonzalez@example.com',1),
        ('Gabriel','Perez','Avenida Alameda 1718, Santiago',989012345,'gabriel.perez@example.com',1),
        ('Helena','Sanchez','Calle OHiggins 1920, Rancagua',901234567,'helena.sanchez@example.com',2),
        ('Ignacio','Ramirez','Pasaje Las Flores 2122, La Serena',934561234,'ignacio.ramirez@example.com',1),
        ('Julia','Torres','Avenida Apoquindo 2324, Las Condes',956789012,'julia.torres@example.com',3),
        ('Kevin','Flores','Calle San Martín 2526, Temuco',978903456,'kevin.flores@example.com',3),
        ('Laura','Rivera','Pasaje Los Pinos 2728, Iquique',990126789,'laura.rivera@example.com',2),
        ('Martin','Gomez','Avenida Independencia 2930, Santiago',923457890,'martin.gomez@example.com',1),
        ('Natalia','Diaz','Calle Coquimbo 3132, Valdivia',945670123,'natalia.diaz@example.com',3),
        ('Oscar','Cruz','Pasaje Los Cipreses 3334, Punta Arenas',967893456,'oscar.cruz@example.com',2),
        ('Patricia','Morales','Avenida Vicuña Mackenna 3536, Ñuñoa',989015678,'patricia.morales@example.com',1),
        ('Quetzal','Reyes','Calle Balmaceda 3738, Chillán',901237890,'quetzal.reyes@example.com',2),
        ('Ricardo','Ortiz','Pasaje Los Lirios 3940, Talca',934560123,'ricardo.ortiz@example.com',2),
        ('Sandra','Gutierrez','Avenida Matta 4142, Providencia',956782345,'sandra.gutierrez@example.com',3),
        ('Tomas','Castillo','Calle Los Carrera 4344, Puerto Montt',978904567,'tomas.castillo@example.com',3)
;


-- Igualmente para el caso de empleados, información completa sobre los empleados segun definiciones de tabla.
-- No se menciona el campo Id_Empleado en la inserción para aprovechar su definición de dato como AUTO_INCREMENT. 
INSERT INTO Empleados (Nombre,Apellido,Cargo,Fecha_Contratacion,Telefono,Email)
VALUES ('Ursula','Jimenez','Ejecutivo de Ventas','2013-03-03','990126789','ursula.jimenez@example.com'),
		('Victor','Mendoza','Ejecutivo de Ventas','2018-02-25','923459012','victor.mendoza@example.com'),
        ('Wendy','Silva','Supervisor de Ventas','2017-01-19','945671234','wendy.silva@example.com'),
        ('Ximena','Romero','Promotor de Ventas','2011-12-28','967893456','ximena.romero@example.com'),
        ('Yahir','Rubio','Ejecutivo de Ventas','2018-09-29','989015678','yahir.rubio@example.com'),
        ('Zoe','Rojas','Supervisor de Ventas','2010-03-15','901237890','zoe.rojas@example.com'),
        ('Adrian','Serrano','Ejecutivo de Ventas','2010-04-27','934561234','adrian.serrano@example.com'),
        ('Brenda','Navarro','Asistente de Ventas','2010-09-09','956783456','brenda.navarro@example.com'),
        ('Cristobal','Delgado','Ejecutivo de Ventas','2017-12-31','978905678','cristobal.delgado@example.com'),
        ('Diana','Peña','Promotor de Ventas','2018-12-07','990127890','diana.pena@example.com'),
        ('Emilio','Aguirre','Supervisor de Ventas','2011-05-18','923450123','emilio.aguirre@example.com'),
        ('Florencia','Vega','Promotor de Ventas','2015-10-12','945672345','florencia.vega@example.com'),
        ('Gonzalo','Soto','Ejecutivo de Ventas','2012-11-11','967894567','gonzalo.soto@example.com'),
        ('Hugo','Castro','Ejecutivo de Ventas','2011-07-30','989016789','hugo.castro@example.com'),
        ('Isabel','Vasquez','Ejecutivo de Ventas','2013-09-25','901238901','isabel.vasquez@example.com'),
        ('Javier','Soto','Supervisor de Ventas','2014-02-14','934562345','javier.soto@example.com'),
        ('Karina','Espinoza','Asistente de Ventas','2010-06-12','956784567','karina.espinoza@example.com'),
        ('Luis','Salazar','Ejecutivo de Ventas','2016-05-20','978906789','luis.salazar@example.com'),
        ('Mariana','Cordero','Ejecutivo de Ventas','2017-04-05','990128901','mariana.cordero@example.com'),
        ('Nicolas','Paredes','Ejecutivo de Ventas','2014-08-08','923451234','nicolas.paredes@example.com')
;
        
-- Tabla de información sobre las ventas realizas con información del cliente y el empleado que la efectua.
-- No se menciona el campo Id_Venta en la inserción para aprovechar su definición de dato como AUTO_INCREMENT. 
INSERT INTO Ventas (Fecha_venta,Id_Cliente,Id_Empleado,Valor_total)
VALUES ('2022-08-22',10,2,1300),
		('2022-11-14',4,10,80),
        ('2024-07-05',15,12,3050),
        ('2023-09-19',7,11,1200),
        ('2023-12-03',3,5,1200),
        ('2024-05-28',18,3,60),
        ('2023-03-10',12,1,500),
        ('2024-01-16',2,1,260),
        ('2023-06-08',17,6,1000),
        ('2023-10-20',6,3,45),
        ('2024-04-12',9,18,200),
        ('2022-08-31',5,17,695),
        ('2023-11-24',14,11,1500),
        ('2024-02-09',16,15,1140),
        ('2023-09-07',8,20,505),
        ('2022-07-18',11,20,240),
        ('2023-05-26',1,9,1400),
        ('2022-12-11',19,13,290),
        ('2024-03-23',13,7,70),
        ('2024-10-15',20,7,300)
;


-- Tabla de categorías de productos, por los momentos sólo se encuentran 3 tipos, pero se podría modificar para
-- incrementar la cantidad de categorías de venta de la empresa. 
-- No se menciona el campo Id_Categoria en la inserción para aprovechar su definición de dato como AUTO_INCREMENT.
INSERT INTO Categorias (Nombre,Descripcion)
VALUES ('Articulos de oficina','Elementos  para el trabajo en la oficina'),
		('Tecnologia','Productos electronicos  y de tecnologia'),
        ('Mobiliario','Muebles y mobiliario en general')
;


-- Tabla de información sobre los productos.
-- No se menciona el campo Id_Producto en la inserción para aprovechar su definición de dato como AUTO_INCREMENT.
INSERT INTO Productos (Nombre,Descripcion,Precio,Id_Categoria)
VALUES ('Purificador de aire de oficina 3M','',95,1),
		('Refrigerador Avanti','Refrigerador',300,1),
        ('Moledor de café Breville','',80,1),
        ('Mezclador Cuisinart','',350,1),
        ('Aspirador turbo Euro - Schark','',200,1),
        ('Microondas Hamilton','Microondas',45,1),
        ('Kitchenaid 2.0','Ayudante de cocina',500,1),
        ('Sacapuntas Berol','',20,1),
        ('Armario de libros de 2 estantes Atlantic','Estante de libros',65,3),
        ('Gabinete de 3 estantes Mobile','',70,3),
        ('Librero con puertas Ikea','',250,3),
        ('Armario apilable de libros Safco','',400,3),
        ('Gabinete de 4 estantes Dania','',550,3),
        ('Pendrive Belkin 10gb','',15,2),
        ('Mouse ergonómico Belkin','',10,2),
        ('Tarjeta de memoria Enermax','',300,2),
        ('Teclado bluethooth Logitech','',25,2),
        ('Teclado numérico Kinsgton','',40,2),
        ('Router inalámbrico Logitech','',60,2),
        ('Copiadora Brother','Copiadora y fax',1200,2)
;

-- Tabla de detalle de ventas, donde se relacionan las órdenes de venta y se especifican los productos que la componen.
-- No se menciona el campo Id_DetalleVentas en la inserción para aprovechar su definición de dato como AUTO_INCREMENT.
INSERT INTO Detalle_Ventas (Id_Venta,Id_Producto,Cantidad,Precio_Unitario)
VALUES (1,4,1,350),
		(1,2,2,600),
        (2,8,4,80),
        (3,11,2,500),
        (3,12,5,2000),
        (3,13,1,550),
        (4,20,1,1200),
        (5,20,1,1200),
        (6,19,1,60),
        (7,11,2,500),
        (8,9,4,260),
        (9,7,2,1000),
        (10,6,1,45),
        (11,5,1,200),
        (1,4,1,350),
        (12,2,2,600),
        (12,1,1,95),
        (13,7,3,1500),
        (14,13,2,1100),
        (14,18,1,40),
        (15,10,1,70),
        (15,2,1,300),
        (15,18,1,40),
        (15,1,1,95),
        (16,3,3,240),
        (17,4,4,1400),
        (18,5,1,200),
        (18,6,2,90),
        (19,10,1,70),
        (20,16,1,300)
;
        
-- Tabla con información sobre los proveedores de los productos, igualmente cumpliendo las especificaciones
-- a la hora de la creación de las tablas
-- No se menciona el campo Id_Proveedor en la inserción para aprovechar su definición de dato como AUTO_INCREMENT.
INSERT INTO Proveedores (Nombre,Nombre_Contacto,Apellido_Contacto,Telefono,Email)
VALUES ('3M','Pedro','Rodriguez',934567890,'pedro.rodriguez@expample.com'),
		('Avanti','Fabian','Guitierrez',923456789,'fabian.guitierrez@expample.com'),
        ('Breville','Hector','Lopez',912345678,'hector.lopez@expample.com'),
        ('Cuisinart','Daniel','Gonzalez',987654321,'daniel.gonzalez@expample.com'),
        ('Euro Shark','Gabriel','Pieters',945678901,'gabriel.pieters@expample.com'),
        ('Hamilton','Maria','Carreño',967890123,'maría.carreño@expample.com'),
        ('Berol','Lorena','Rioseco',901234567,'lorena.rioseco@expample.com'),
        ('Kitchenaid','Juliana','Ramirez',989012345,'juliana.ramirez@expample.com'),
        ('Atlantic','Patricio','Monsalve',934561234,'patricio.monsalve@expample.com'),
        ('Mobile','Arturo','Balmaceda',956789012,'arturo.balmaceda@expample.com'),
        ('Ikea','Cristina','Flores',978903456,'cristina.flores@expample.com'),
        ('Safco','Samuel','Nogales',990126789,'samuel.nogales@expample.com'),
        ('Dania','Paola','Tordesilla',923457890,'paola.tordesilla@expample.com'),
        ('Belkin','Teobaldo','Vega',945670123,'teobaldo.vega@expample.com'),
        ('Enermax','Marcelo','Soto',967893456,'marcelo.soto @expample.com'),
        ('Logitech','Giovanni','Castro',989015678,'giovanni.castro@expample.com'),
        ('Kingston','Roberto','Rojas',901237890,'roberto.rojas@expample.com'),
        ('Kingston','Roberto','Rojas',901237890,'roberto.rojas@expample.com'),
        ('Sony','Gabriela','Delgado',956782345,'gabriela.delgado @expample.com'),
        ('Verbatim','Teresa','Aguirre',978904567,'teresa.aguirre@expample.com')
;



-- Tabla de inventario, para cumplir con los productos y su inventario, agregué un registro de stock para 
-- cada producto. 
-- No se menciona el campo Id_Inventario en la inserción para aprovechar su definición de dato como AUTO_INCREMENT.
INSERT INTO Inventario (Id_Producto,Fecha_Actualizacion,Cantidad)
VALUES (1,'2022-08-06',10),
		(2,'2023-04-29',50),
        (3,'2024-12-17',80),
        (4,'2023-07-30',110),
        (5,'2024-02-25',1000),
        (6,'2022-05-01',250),
        (7,'2022-10-27',100),
        (8,'2023-03-22',40),
        (9,'2024-09-08',35),
        (10,'2024-06-19',100),
        (11,'2023-11-14',90),
        (12,'2023-01-05',32),
        (13,'2022-07-09',40),
        (14,'2023-09-16',50),
        (15,'2024-12-03',20),
        (16,'2023-03-22',25),
        (17,'2024-09-08',30),
        (18,'2024-06-19',80),
        (19,'2023-11-14',100),
        (20,'2024-12-17',5)
;


-- Tabla puente entre productos y proveedores. Sirve para eliminar la cardinalidad de M:N que existía entre
-- ambas entidades. 
INSERT INTO Productos_Proveedores (Id_Producto,Id_Proveedor)
VALUES (1,1),
		(1,2),
        (2,1),
        (3,3),
        (3,4),
        (4,4),
        (4,5),
        (5,5),
        (6,6),
        (6,7),
        (7,7),
        (7,8),
        (8,9),
        (9,9),
        (10,10),
        (11,11),
        (12,12),
        (12,13),
        (12,14),
        (13,13),
        (13,14),
        (14,14),
        (15,15),
        (16,16),
        (16,17),
        (17,18),
        (18,18),
        (19,19),
        (20,18),
        (20,19),
        (20,20)
;
