/* Este es el archivo generado por el backup creado de la base de datos del proyecto final. El backup se realizó únicamente sobre
los datos y seleccionando la opción de incluir la creación del schema.

Las tablas elegidas para el backup fueron 8 y son las siguientes: 
Categorias
Clientes
Detalle_Ventas
Empleados
Inventario
Productos
Proveedores
Ventas  */


CREATE DATABASE  IF NOT EXISTS `globalsuperstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `globalsuperstore`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: localhost    Database: globalsuperstore
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES (1,'Articulos de oficina','Elementos  para el trabajo en la oficina'),(2,'Tecnologia','Productos electronicos  y de tecnologia'),(3,'Mobiliario','Muebles y mobiliario en general');
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'Alejandro','Garcia','Avenida Libertador 1234, Santiago','934567890','alejandro.garcia@example.com',2),(2,'Beatriz','Martinez','Calle La Paz 5678, Valparaíso','923456789','beatriz.martinez@example.com',3),(3,'Carlos','Rodriguez','Pasaje Los Aromos 910, Concepción','912345678','carlos.rodriguez@example.com',1),(4,'Daniela','Lopez','Avenida Providencia 1112, Santiago','987654321','daniela.lopez@example.com',3),(5,'Eduardo','Hernandez','Calle Colón 1314, Viña del Mar','945678901','eduardo.hernandez@example.com',3),(6,'Fernanda','Gonzalez','Pasaje El Bosque 1516, Antofagasta','967890123','fernanda.gonzalez@example.com',1),(7,'Gabriel','Perez','Avenida Alameda 1718, Santiago','989012345','gabriel.perez@example.com',1),(8,'Helena','Sanchez','Calle OHiggins 1920, Rancagua','901234567','helena.sanchez@example.com',2),(9,'Ignacio','Ramirez','Pasaje Las Flores 2122, La Serena','934561234','ignacio.ramirez@example.com',1),(10,'Julia','Torres','Avenida Apoquindo 2324, Las Condes','956789012','julia.torres@example.com',3),(11,'Kevin','Flores','Calle San Martín 2526, Temuco','978903456','kevin.flores@example.com',3),(12,'Laura','Rivera','Pasaje Los Pinos 2728, Iquique','990126789','laura.rivera@example.com',2),(13,'Martin','Gomez','Avenida Independencia 2930, Santiago','923457890','martin.gomez@example.com',1),(14,'Natalia','Diaz','Calle Coquimbo 3132, Valdivia','945670123','natalia.diaz@example.com',3),(15,'Oscar','Cruz','Pasaje Los Cipreses 3334, Punta Arenas','967893456','oscar.cruz@example.com',2),(16,'Patricia','Morales','Avenida Vicuña Mackenna 3536, Ñuñoa','989015678','patricia.morales@example.com',1),(17,'Quetzal','Reyes','Calle Balmaceda 3738, Chillán','901237890','quetzal.reyes@example.com',2),(18,'Ricardo','Ortiz','Pasaje Los Lirios 3940, Talca','934560123','ricardo.ortiz@example.com',2),(19,'Juan','Gomez','Augusto Villanueva 67','','juan.gomez@example.com',1),(20,'Tomas','Castillo','Calle Los Carrera 4344, Puerto Montt','978904567','tomas.castillo@example.com',3),(21,'Diana','Peña','Pasaje Los Cedros 6364, San Felipe','990127890','Diana.Peña@example.com',2),(22,'Emilio','Aguirre','Avenida Recoleta 6566, Santiago','923450123','Emilio.Aguirre@example.com',1),(23,'Florencia','Vega','Calle Lastarria 6768, Providencia','945672345','Florencia.Vega@example.com',3),(24,'Gonzalo','Soto','Pasaje Las Magnolias 6970, Puerto Varas','967894567','Gonzalo.Soto@example.com',3),(25,'Hugo','Castro','Avenida Irarrázaval 7172, Ñuñoa','989016789','Hugo.Castro@example.com',2),(26,'Isabel','Vasquez','Calle Arturo Prat 7374, Talcahuano','901238901','Isabel.Vasquez@example.com',1),(33,'Javier','Soto','Pasaje Los Laureles 7576, Quillota','934562345','Javier.Soto@example.com',2),(34,'Karina','Espinoza','Avenida Las Torres 7778, Peñalolén','956784567','Karina.Espinoza@example.com',1),(35,'Luis','Salazar','Calle Pedro de Valdivia 7980, Temuco','978906789','Luis.Salazar@example.com',3),(36,'Mariana','Cordero','Pasaje Los Sauces 8182, Valdivia','990128901','Mariana.Cordero@example.com',3),(37,'Nicolas','Paredes','Avenida Santa María 8384, Vitacura','923451234','Nicolas.Paredes@example.com',2),(38,'Arturo','Lopez','Avenida Independencia 1022, Santiago','923457882','Arturo.Lopez@example.com',1);
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Detalle_Ventas`
--

LOCK TABLES `Detalle_Ventas` WRITE;
/*!40000 ALTER TABLE `Detalle_Ventas` DISABLE KEYS */;
INSERT INTO `Detalle_Ventas` VALUES (1,1,4,1,350),(2,1,2,2,600),(3,2,8,4,80),(4,3,11,2,500),(5,3,12,5,2000),(6,3,13,1,550),(7,4,20,1,1200),(8,5,20,1,1200),(9,6,19,1,60),(10,7,11,2,500),(11,8,9,4,260),(12,9,7,2,1000),(13,10,6,1,45),(14,11,5,1,200),(15,1,4,1,350),(16,12,2,2,600),(17,12,1,1,95),(18,13,7,3,1500),(19,14,13,2,1100),(20,14,18,1,40),(21,15,10,1,70),(22,15,2,1,300),(23,15,18,1,40),(24,15,1,1,95),(25,16,3,3,240),(26,17,4,4,1400),(27,18,5,1,200),(28,18,6,2,90),(29,19,10,1,70),(30,20,16,1,300),(31,21,10,1,70),(32,22,8,2,40),(33,22,2,1,300),(34,22,1,1,95),(35,23,8,2,40),(36,24,9,1,65),(37,24,18,1,40),(38,25,17,3,75),(39,26,11,2,500),(40,27,14,1,15),(41,28,15,2,20),(42,28,12,1,400),(43,29,13,2,1100),(44,29,7,2,1000),(45,30,2,3,900),(46,30,20,1,1200),(47,30,10,5,350),(48,31,19,4,240),(49,31,13,8,4400),(50,32,13,2,1100),(51,33,4,6,2100),(52,34,5,3,600),(53,34,6,2,90),(54,34,7,4,2000),(55,34,8,5,100);
/*!40000 ALTER TABLE `Detalle_Ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Empleados`
--

LOCK TABLES `Empleados` WRITE;
/*!40000 ALTER TABLE `Empleados` DISABLE KEYS */;
INSERT INTO `Empleados` VALUES (1,'Ursula','Jimenez','Ejecutivo de Ventas','2013-03-03','990126789','ursula.jimenez@example.com'),(2,'Victor','Mendoza','Ejecutivo de Ventas','2018-02-25','923459012','victor.mendoza@example.com'),(3,'Wendy','Silva','Supervisor de Ventas','2017-01-19','945671234','wendy.silva@example.com'),(4,'Ximena','Romero','Promotor de Ventas','2011-12-28','967893456','ximena.romero@example.com'),(5,'Yahir','Rubio','Ejecutivo de Ventas','2018-09-29','989015678','yahir.rubio@example.com'),(6,'Zoe','Rojas','Supervisor de Ventas','2010-03-15','901237890','zoe.rojas@example.com'),(7,'Adrian','Serrano','Ejecutivo de Ventas','2010-04-27','934561234','adrian.serrano@example.com'),(8,'Brenda','Navarro','Asistente de Ventas','2010-09-09','956783456','brenda.navarro@example.com'),(9,'Cristobal','Delgado','Ejecutivo de Ventas','2017-12-31','978905678','cristobal.delgado@example.com'),(10,'Diana','Peña','Promotor de Ventas','2018-12-07','990127890','diana.pena@example.com'),(11,'Emilio','Aguirre','Supervisor de Ventas','2011-05-18','923450123','emilio.aguirre@example.com'),(12,'Florencia','Vega','Promotor de Ventas','2015-10-12','945672345','florencia.vega@example.com'),(13,'Gonzalo','Soto','Ejecutivo de Ventas','2012-11-11','967894567','gonzalo.soto@example.com'),(14,'Hugo','Castro','Ejecutivo de Ventas','2011-07-30','989016789','hugo.castro@example.com'),(15,'Isabel','Vasquez','Ejecutivo de Ventas','2013-09-25','901238901','isabel.vasquez@example.com'),(16,'Javier','Soto','Supervisor de Ventas','2014-02-14','934562345','javier.soto@example.com'),(17,'Karina','Espinoza','Asistente de Ventas','2010-06-12','956784567','karina.espinoza@example.com'),(18,'Luis','Salazar','Ejecutivo de Ventas','2016-05-20','978906789','luis.salazar@example.com'),(19,'Mariana','Cordero','Ejecutivo de Ventas','2017-04-05','990128901','mariana.cordero@example.com'),(20,'Nicolas','Paredes','Ejecutivo de Ventas','2014-08-08','923451234','nicolas.paredes@example.com'),(21,'Adrian','Hernandez','Supervisor de Ventas','2011-11-21','967893457','adrian.hernandez@example.com'),(22,'Brenda','Gonzalez','Ejecutivo de Ventas','2015-11-27','989015676','brenda.gonzalez@example.com'),(23,'Cristobal','Perez','Promotor de Ventas','2012-11-22','901237891','cristobal.perez@example.com'),(24,'Diana','Sanchez','Ejecutivo de Ventas','2011-06-17','934560122','diana.sanchez@example.com'),(25,'Emilio','Ramirez','Ejecutivo de Ventas','2015-08-23','956782346','emilio.ramirez@example.com'),(26,'Florencia','Torres','Asistente de Ventas','2010-10-09','978904561','florencia.torres@example.com'),(27,'Gonzalo','Flores','Supervisor de Ventas','2012-10-15','990126788','gonzalo.flores@example.com'),(28,'Hugo','Rivera','Promotor de Ventas','2016-01-01','923459013','hugo.rivera@example.com'),(29,'Isabel','Gomez','Asistente de Ventas','2014-03-16','945671235','isabel.gomez@example.com'),(30,'Javier','Diaz','Ejecutivo de Ventas','2015-12-02','967893457','javier.diaz@example.com'),(31,'Karina','Cruz','Asistente de Ventas','2016-07-23','989015679','karina.cruz@example.com'),(32,'Luis','Morales','Ejecutivo de Ventas','2011-05-29','901237892','luis.morales@example.com'),(33,'Ignacio','Reyes','Ejecutivo de Ventas','2018-02-06','934561235','ignacio.reyes@example.com'),(34,'Julia','Ortiz','Supervisor de Ventas','2015-02-05','956783455','julia.ortiz@example.com'),(35,'Kevin','Gutierrez','Promotor de Ventas','2015-04-19','978905679','kevin.gutierrez@example.com');
/*!40000 ALTER TABLE `Empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Inventario`
--

LOCK TABLES `Inventario` WRITE;
/*!40000 ALTER TABLE `Inventario` DISABLE KEYS */;
INSERT INTO `Inventario` VALUES (1,1,'2022-08-06 00:00:00',10),(2,2,'2023-04-29 00:00:00',50),(3,3,'2024-12-17 00:00:00',80),(4,4,'2023-07-30 00:00:00',110),(5,5,'2024-02-25 00:00:00',1000),(6,6,'2022-05-01 00:00:00',250),(7,7,'2022-10-27 00:00:00',100),(8,8,'2023-03-22 00:00:00',40),(9,9,'2024-09-08 00:00:00',35),(10,10,'2024-06-19 00:00:00',100),(11,11,'2023-11-14 00:00:00',90),(12,12,'2023-01-05 00:00:00',32),(13,13,'2022-07-09 00:00:00',40),(14,14,'2023-09-16 00:00:00',50),(15,15,'2024-12-03 00:00:00',20),(16,16,'2023-03-22 00:00:00',25),(17,17,'2024-09-08 00:00:00',30),(18,18,'2024-06-19 00:00:00',80),(19,19,'2023-11-14 00:00:00',100),(20,20,'2024-12-17 00:00:00',5);
/*!40000 ALTER TABLE `Inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES (1,'Purificador de aire de oficina 3M','',95,1),(2,'Refrigerador Avanti','Refrigerador',300,1),(3,'Moledor de café Breville','',80,1),(4,'Mezclador Cuisinart','',350,1),(5,'Aspirador turbo Euro - Schark','',200,1),(6,'Microondas Hamilton','Microondas',45,1),(7,'Kitchenaid 2.0','Ayudante de cocina',500,1),(8,'Sacapuntas Berol','',20,1),(9,'Armario de libros de 2 estantes Atlantic','Estante de libros',65,3),(10,'Gabinete de 3 estantes Mobile','',70,3),(11,'Librero con puertas Ikea','',250,3),(12,'Armario apilable de libros Safco','',400,3),(13,'Gabinete de 4 estantes Dania','',550,3),(14,'Pendrive Belkin 10gb','',15,2),(15,'Mouse ergonómico Belkin','',10,2),(16,'Tarjeta de memoria Enermax','',300,2),(17,'Teclado bluethooth Logitech','',25,2),(18,'Teclado numérico Kinsgton','',40,2),(19,'Router inalámbrico Logitech','',60,2),(20,'Copiadora Brother','Copiadora y fax',1200,2);
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
INSERT INTO `Proveedores` VALUES (1,'3M','Pedro','Rodriguez','934567890','pedro.rodriguez@expample.com'),(2,'Avanti','Fabian','Guitierrez','923456789','fabian.guitierrez@expample.com'),(3,'Breville','Hector','Lopez','912345678','hector.lopez@expample.com'),(4,'Cuisinart','Daniel','Gonzalez','987654321','daniel.gonzalez@expample.com'),(5,'Euro Shark','Gabriel','Pieters','945678901','gabriel.pieters@expample.com'),(6,'Hamilton','Maria','Carreño','967890123','maría.carreño@expample.com'),(7,'Berol','Lorena','Rioseco','901234567','lorena.rioseco@expample.com'),(8,'Kitchenaid','Juliana','Ramirez','989012345','juliana.ramirez@expample.com'),(9,'Atlantic','Patricio','Monsalve','934561234','patricio.monsalve@expample.com'),(10,'Mobile','Arturo','Balmaceda','956789012','arturo.balmaceda@expample.com'),(11,'Ikea','Cristina','Flores','978903456','cristina.flores@expample.com'),(12,'Safco','Samuel','Nogales','990126789','samuel.nogales@expample.com'),(13,'Dania','Paola','Tordesilla','923457890','paola.tordesilla@expample.com'),(14,'Belkin','Teobaldo','Vega','945670123','teobaldo.vega@expample.com'),(15,'Enermax','Marcelo','Soto','967893456','marcelo.soto @expample.com'),(16,'Logitech','Giovanni','Castro','989015678','giovanni.castro@expample.com'),(17,'Kingston','Roberto','Rojas','901237890','roberto.rojas@expample.com'),(18,'Kingston','Roberto','Rojas','901237890','roberto.rojas@expample.com'),(19,'Sony','Gabriela','Delgado','956782345','gabriela.delgado @expample.com'),(20,'Verbatim','Teresa','Aguirre','978904567','teresa.aguirre@expample.com');
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Ventas`
--

LOCK TABLES `Ventas` WRITE;
/*!40000 ALTER TABLE `Ventas` DISABLE KEYS */;
INSERT INTO `Ventas` VALUES (1,'2022-08-22',10,2,1300),(2,'2022-11-14',4,10,80),(3,'2024-07-05',15,12,3050),(4,'2023-09-19',7,11,1200),(5,'2023-12-03',3,5,1200),(6,'2024-05-28',18,3,60),(7,'2023-03-10',12,1,500),(8,'2024-01-16',2,1,260),(9,'2023-06-08',17,6,1000),(10,'2023-10-20',6,3,45),(11,'2024-04-12',9,18,200),(12,'2022-08-31',5,17,695),(13,'2023-11-24',14,11,1500),(14,'2024-02-09',16,15,1140),(15,'2023-09-07',8,20,505),(16,'2022-07-18',11,20,240),(17,'2023-05-26',1,9,1400),(18,'2022-12-11',19,13,290),(19,'2024-03-23',13,7,70),(20,'2024-10-15',20,7,300),(21,'2024-12-17',7,22,70),(22,'2023-07-30',6,21,435),(23,'2024-02-25',9,24,40),(24,'2022-05-01',10,23,105),(25,'2022-10-27',12,26,75),(26,'2023-03-22',14,25,500),(27,'2024-09-08',11,28,15),(28,'2024-06-19',1,27,420),(29,'2023-11-14',2,30,2100),(30,'2023-01-05',20,29,2450),(31,'2022-07-09',3,32,4640),(32,'2023-09-16',5,31,1100),(33,'2024-12-03',9,34,2100),(34,'2024-04-28',18,33,2790),(35,'2023-08-12',11,3,200),(36,'2021-11-24',5,9,350),(37,'2020-07-25',5,2,400),(38,'2022-09-19',1,18,50),(39,'2023-12-23',2,15,350),(40,'2021-05-18',20,13,1100);
/*!40000 ALTER TABLE `Ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-10 16:43:25
