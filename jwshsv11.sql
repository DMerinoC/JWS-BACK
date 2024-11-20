-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: jwshsv7
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacen` (
  `idalmacen` int NOT NULL AUTO_INCREMENT,
  `idordentrabajo` int DEFAULT NULL,
  `estado_producto_almacen` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`idalmacen`),
  KEY `idordentrabajo` (`idordentrabajo`),
  CONSTRAINT `almacen_ibfk_1` FOREIGN KEY (`idordentrabajo`) REFERENCES `ordentrabajo` (`idordentrabajo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(15) DEFAULT NULL,
  `numerodocumento` varchar(15) DEFAULT NULL,
  `nombre_cliente` varchar(45) DEFAULT NULL,
  `email_cliente` varchar(30) DEFAULT NULL,
  `celular_cliente` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juridico','20512341234','Corp SAC','corp@empresa.com','984123322'),(2,'RUC','20512344321','Company2025','corp4@empresa.com','984124444'),(4,'RUC','20512346666','Company2027','corp7@empresa.com','984127777');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobranza`
--

DROP TABLE IF EXISTS `cobranza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cobranza` (
  `idcobranza` int NOT NULL AUTO_INCREMENT,
  `idcotizacion` int DEFAULT NULL,
  `fecha_emision` timestamp NULL DEFAULT NULL,
  `fecha_vencimiento` timestamp NULL DEFAULT NULL,
  `delivery` decimal(10,2) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `moneda` varchar(10) DEFAULT NULL,
  `documento` varchar(45) DEFAULT NULL,
  `estado_cobranza` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idcobranza`),
  KEY `cobranza_ibfk_1_idx` (`idcotizacion`),
  CONSTRAINT `cobranza_ibfk_1` FOREIGN KEY (`idcotizacion`) REFERENCES `cotizacion` (`idcotizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobranza`
--

LOCK TABLES `cobranza` WRITE;
/*!40000 ALTER TABLE `cobranza` DISABLE KEYS */;
INSERT INTO `cobranza` VALUES (2,2,'2024-10-02 05:00:00','2024-10-22 05:00:00',0.00,30.00,'Soles','Listo','Pagado'),(3,2,'2024-10-02 05:00:00','2024-10-22 05:00:00',1.00,3000.00,'Soles','Oficial','Pagado'),(4,2,'2024-10-02 05:00:00','2024-10-22 05:00:00',1.00,3000.00,'Soles','Oficial','Pagado'),(5,2,'2024-10-02 05:00:00','2024-10-22 05:00:00',1.00,3000.00,'Soles','Oficial','Pagado');
/*!40000 ALTER TABLE `cobranza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizacion` (
  `idcotizacion` int NOT NULL AUTO_INCREMENT,
  `idcliente` int DEFAULT NULL,
  `fecha_emision` timestamp NULL DEFAULT NULL,
  `estado` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`idcotizacion`),
  KEY `idcliente` (`idcliente`),
  CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacion`
--

LOCK TABLES `cotizacion` WRITE;
/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
INSERT INTO `cotizacion` VALUES (1,1,'2024-10-02 05:00:00','Activado'),(2,2,'2024-11-02 05:00:00','Desactivado'),(4,1,'2024-10-12 05:00:00','Aprobado'),(13,4,'2024-11-03 22:24:54','Activo'),(14,4,'2024-11-05 03:14:27','Activo'),(15,4,'2024-11-05 03:15:05','Activo'),(16,4,'2024-11-05 03:29:13','Activo'),(17,4,'2024-11-05 03:29:48','Activo'),(18,4,'2024-11-05 03:29:50','desocupado'),(19,4,'2024-11-05 03:41:56','Activo'),(20,4,'2024-11-05 03:42:22','Activo'),(21,4,'2024-11-05 03:42:52','Activo'),(22,4,'2024-11-05 03:43:47','Activo'),(23,4,'2024-11-05 03:44:01','Activo'),(24,4,'2024-11-05 03:44:19','Activo');
/*!40000 ALTER TABLE `cotizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallecotizacion`
--

DROP TABLE IF EXISTS `detallecotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallecotizacion` (
  `iddetallecotizacion` int NOT NULL AUTO_INCREMENT,
  `idcotizacion` int DEFAULT NULL,
  `idproducto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `observacion` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`iddetallecotizacion`),
  KEY `idcotizacion` (`idcotizacion`),
  KEY `idproducto` (`idproducto`),
  CONSTRAINT `detallecotizacion_ibfk_1` FOREIGN KEY (`idcotizacion`) REFERENCES `cotizacion` (`idcotizacion`),
  CONSTRAINT `detallecotizacion_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallecotizacion`
--

LOCK TABLES `detallecotizacion` WRITE;
/*!40000 ALTER TABLE `detallecotizacion` DISABLE KEYS */;
INSERT INTO `detallecotizacion` VALUES (1,1,2,3,224.00,'Sin problemas'),(2,1,1,2,222.00,'Sin problemas'),(4,13,5,2,222.00,'Sin problemas'),(5,13,1,2,222.00,'Sin problemas'),(6,13,2,2,222.00,'Sin problemas');
/*!40000 ALTER TABLE `detallecotizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guia_remision`
--

DROP TABLE IF EXISTS `guia_remision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guia_remision` (
  `idguiaremision` int NOT NULL AUTO_INCREMENT,
  `idcotizacion` int DEFAULT NULL,
  `garantia` timestamp NULL DEFAULT NULL,
  `fecha_emision` timestamp NULL DEFAULT NULL,
  `estado_guia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idguiaremision`),
  KEY `idcotizacion` (`idcotizacion`),
  CONSTRAINT `guia_remision_ibfk_1` FOREIGN KEY (`idcotizacion`) REFERENCES `cotizacion` (`idcotizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guia_remision`
--

LOCK TABLES `guia_remision` WRITE;
/*!40000 ALTER TABLE `guia_remision` DISABLE KEYS */;
INSERT INTO `guia_remision` VALUES (1,2,'2024-09-03 05:00:00','2024-07-03 05:00:00','Se encontró el producto'),(3,2,'2025-02-03 05:00:00','2024-12-03 05:00:00','Se encontró el producto');
/*!40000 ALTER TABLE `guia_remision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiaprima`
--

DROP TABLE IF EXISTS `materiaprima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiaprima` (
  `idmateriaprima` int NOT NULL AUTO_INCREMENT,
  `idproveedor` int DEFAULT NULL,
  `nombre_materia` varchar(45) DEFAULT NULL,
  `precio_materia` decimal(10,2) DEFAULT NULL,
  `cantidad_materia` int DEFAULT NULL,
  `unidadmedida` varchar(45) DEFAULT NULL,
  `descripcion` varchar(225) DEFAULT NULL,
  `tipo_materia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmateriaprima`),
  KEY `idproveedor` (`idproveedor`),
  CONSTRAINT `materiaprima_ibfk_1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiaprima`
--

LOCK TABLES `materiaprima` WRITE;
/*!40000 ALTER TABLE `materiaprima` DISABLE KEYS */;
INSERT INTO `materiaprima` VALUES (1,1,'Materia Prima 1',150.00,538,'kg','Materia de origen nacional','Para camas'),(3,4,'Materia Prima 2',1000.00,88,'Und.','Materia de origen Internacional','Para todo uso'),(4,5,'Materia Prima 4',150.00,153,'Und.','Materia de origen Internacional','Para todo uso'),(5,5,'Materia Prima 5',100.00,153,'Und.','Materia de origen Nacional','Para todo uso');
/*!40000 ALTER TABLE `materiaprima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordentrabajo`
--

DROP TABLE IF EXISTS `ordentrabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordentrabajo` (
  `idordentrabajo` int NOT NULL AUTO_INCREMENT,
  `idcotizacion` int DEFAULT NULL,
  `idtrabajador` int DEFAULT NULL,
  `fecha_emision` timestamp NULL DEFAULT NULL,
  `fecha_maxima_entrega` timestamp NULL DEFAULT NULL,
  `estado_orden` varchar(225) DEFAULT NULL,
  `estado_produccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idordentrabajo`),
  KEY `idcotizacion` (`idcotizacion`),
  KEY `idtrabajador` (`idtrabajador`),
  CONSTRAINT `ordentrabajo_ibfk_1` FOREIGN KEY (`idcotizacion`) REFERENCES `cotizacion` (`idcotizacion`),
  CONSTRAINT `ordentrabajo_ibfk_2` FOREIGN KEY (`idtrabajador`) REFERENCES `trabajador` (`idtrabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordentrabajo`
--

LOCK TABLES `ordentrabajo` WRITE;
/*!40000 ALTER TABLE `ordentrabajo` DISABLE KEYS */;
INSERT INTO `ordentrabajo` VALUES (2,2,2,'2024-02-02 05:00:00','2024-05-12 05:00:00','En pausa',NULL),(4,4,3,'2024-11-03 21:42:02','2025-01-03 21:42:02','Inicial',NULL),(5,2,3,'2024-02-02 05:00:00','2024-05-12 05:00:00','Terminado','Activado');
/*!40000 ALTER TABLE `ordentrabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(45) DEFAULT NULL,
  `precio_producto` decimal(10,2) DEFAULT NULL,
  `observacion_producto` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Producto01',20.00,'Producto establecido'),(2,'Producto02',20.00,'Producto establecido'),(5,'Producto03',20.00,'Producto establecido'),(6,'Producto04',11.00,'Producto probando'),(7,'Producto05',314.00,'Producto resistente');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idproveedor` int NOT NULL AUTO_INCREMENT,
  `rucproveedor` varchar(15) DEFAULT NULL,
  `nombre_proveedor` varchar(45) DEFAULT NULL,
  `contacto_proveedor` varchar(45) DEFAULT NULL,
  `direccion_proveedor` varchar(45) DEFAULT NULL,
  `email_proveedor` varchar(30) DEFAULT NULL,
  `celular_proveedor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'20123456123','Ingresador S.A.','Emiliano Maximiliano','Av. Secundaria 123','ingresador@gmail.com','999888777'),(3,'20123456444','Sacador S.A.','Falcon Juminis','Av. Primaria 123','sacador@gmail.com','999666333'),(4,'20123456999','Orientador S.A.','Liliana Perez','Av. Hinostroza 123','lili45@gmail.com','999111555'),(5,'20123453216','Factory S.A.','Max Sanvelty','Av. Imperial 123','max33@gmail.com','999777321');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta` (
  `idproducto` int DEFAULT NULL,
  `idmateriaprima` int DEFAULT NULL,
  `cantidadmateria` int DEFAULT NULL,
  `preciomateriacantidad` decimal(10,2) DEFAULT NULL,
  `idreceta` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idreceta`),
  KEY `idproducto` (`idproducto`),
  KEY `idmateriaprima` (`idmateriaprima`),
  CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`),
  CONSTRAINT `receta_ibfk_2` FOREIGN KEY (`idmateriaprima`) REFERENCES `materiaprima` (`idmateriaprima`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
INSERT INTO `receta` VALUES (1,3,20,20.00,8),(1,1,20,20.00,9),(2,1,2,300.00,18),(2,4,2,200.00,19),(2,3,2,2000.00,20),(5,5,2,200.00,21),(5,4,1,100.00,22);
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idrol` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Vendedor'),(3,'Trabajador');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajador` (
  `idtrabajador` int NOT NULL AUTO_INCREMENT,
  `idrol` int DEFAULT NULL,
  `nombre_trabajador` varchar(45) DEFAULT NULL,
  `correo_trabajador` varchar(45) DEFAULT NULL,
  `usuario_trabajador` varchar(45) DEFAULT NULL,
  `clave_trabajador` varchar(255) DEFAULT NULL,
  `sueldo_trabajador` decimal(10,2) DEFAULT NULL,
  `sueldo_extra` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idtrabajador`),
  KEY `idrol` (`idrol`),
  CONSTRAINT `trabajador_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajador`
--

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` VALUES (1,1,'Ricardo Palma','ricardo@gmail.com','dmerino','$2y$10$fxGY6ORRm3Z7sqCnSMGwl.NbRbOUECCCx89VStsZzfxS3JE2Vp1jS',2500.00,500.00),(2,2,'Ricardo Palmeño','ricardo1@gmail.com','ricardo23','$2y$10$Bkmpo5eYnFl2oFlewI.bc.hJIsMvhh8Fwp0xUY4qxAyYviKape5Oy',2500.00,500.00),(3,3,'Ricardo Palmaten','ricardo13@gmail.com','ricardo22','$2y$10$Una1gEWvCp9S6QyBKBGSL.kZtf8DSIltrxMhItcy1mqImFfl/aR.G',3000.00,500.00);
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'jwshsv7'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizarAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarAlmacen`(
	_idalmacen INT,
	_idordentrabajo INT,
    _estado_producto_almacen VARCHAR(225)
	)
BEGIN
    START TRANSACTION;
        BEGIN
			UPDATE almacen 
			SET idordentrabajo = _idordentrabajo, estado_producto_almacen = _estado_producto_almacen
			WHERE idalmacen = _idalmacen;
			SELECT 'Almacen actualizado correctamente' AS mensaje;
		END;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarCliente`(
    _idcliente INT,
    _tipo VARCHAR(15),
    _numerodocumento VARCHAR(15),
    _nombre_cliente VARCHAR(45),
    _email_cliente VARCHAR(30),
    _celular_cliente VARCHAR(20)
    )
BEGIN
	declare clienteExistente boolean;
    SELECT EXISTS(SELECT 1 FROM cliente WHERE numerodocumento = _numerodocumento and idcliente != _idcliente) INTO clienteExistente;
    if clienteExistente then
    SELECT 'El cliente ya existe' AS mensaje;
    else
    START TRANSACTION;
        BEGIN
			UPDATE cliente 
			SET tipo = _tipo, numerodocumento = _numerodocumento, nombre_cliente = _nombre_cliente, email_cliente = _email_cliente, celular_cliente=_celular_cliente
			WHERE idcliente = _idcliente;
			SELECT 'Cliente actualizado correctamente' AS mensaje;
		END;
    COMMIT;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarCobranza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarCobranza`(
	_idcobranza INT,
    _idcotizacion INT,
    _fecha_emision TIMESTAMP,
    _fecha_vencimiento TIMESTAMP,
    _delivery DECIMAL(10,2),
    _monto DECIMAL(10,2),
    _moneda VARCHAR(10),
    _documento VARCHAR(45),
    _estado_cobranza VARCHAR(25)
	)
BEGIN
    START TRANSACTION;
        BEGIN
            UPDATE cobranza 
            SET 
                idcotizacion=_idcotizacion,
                fecha_emision=_fecha_emision,
                fecha_vencimiento=_fecha_vencimiento,
                delivery=_delivery,
                monto=_monto,
                moneda=_moneda,
                documento=_documento,
                estado_cobranza=_estado_cobranza
            WHERE idcobranza = _idcobranza;
            SELECT 'Cobranza actualizada correctamente' AS mensaje;
        END;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarCotizacion`(
    _idcotizacion INT,
    _idcliente INT,
    _fecha_emision timestamp,
    _estado VARCHAR(225)
    )
BEGIN
    START TRANSACTION;
        BEGIN
			UPDATE materiaprima AS MP
			INNER JOIN receta AS R ON MP.idmateriaprima = R.idmateriaprima
			INNER JOIN producto AS P ON R.idproducto = P.idproducto
			INNER JOIN detallecotizacion AS DC ON P.idproducto = DC.idproducto
			INNER JOIN cotizacion AS C ON DC.idcotizacion = C.idcotizacion
			LEFT JOIN (
				SELECT 
					MP2.idmateriaprima, 
					SUM(MP2.cantidad_materia) AS suma_cantidad_materia,
					SUM(R2.cantidadmateria) AS suma_cantidadmateria
				FROM
					materiaprima AS MP2
				INNER JOIN receta AS R2 ON MP2.idmateriaprima = R2.idmateriaprima
				INNER JOIN producto AS P2 ON R2.idproducto = P2.idproducto
				INNER JOIN detallecotizacion AS DC2 ON P2.idproducto = DC2.idproducto
				INNER JOIN cotizacion AS C2 ON DC2.idcotizacion = C2.idcotizacion
				WHERE
					C2.estado = 'Aprobado'
					AND C2.idcotizacion = _idcotizacion
				GROUP BY 
					MP2.idmateriaprima
			) AS sumas ON MP.idmateriaprima = sumas.idmateriaprima
			SET 
				MP.cantidad_materia = MP.cantidad_materia - sumas.suma_cantidadmateria
			WHERE
				C.estado = 'Aprobado'
				AND C.idcotizacion = _idcotizacion;

			UPDATE cotizacion 
			SET
            idcliente = _idcliente,
            fecha_emision = _fecha_emision,
            estado = _estado
            where idcotizacion=_idcotizacion;
			SELECT 'Cotizacion actualizada correctamente' AS mensaje;
		END;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarDetalleCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarDetalleCotizacion`(
    _iddetallecotizacion int,
    _idcotizacion INT,
    _idproducto INT,
    _cantidad INT,
    _precio DECIMAL(10,2),
    _observacion VARCHAR(225)
    )
BEGIN
    START TRANSACTION;
        BEGIN
            UPDATE detallecotizacion 
            SET
                idcotizacion=_idcotizacion,
                idproducto=_idproducto,
                cantidad=_cantidad,
                precio = _precio,
                observacion=_observacion
            WHERE iddetallecotizacion = _iddetallecotizacion;
            SELECT 'Detalle cotizacion actualizado correctamente' AS mensaje;
        END;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarGuiaRemision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarGuiaRemision`(
    _idguiaremision INT,
    _idcotizacion INT,
    _garantia TIMESTAMP,
    _fecha_emision TIMESTAMP,
    _estado_guia VARCHAR(255)
    )
BEGIN
    START TRANSACTION;
        BEGIN
            UPDATE guia_remision 
            SET 
                idcotizacion=_idcotizacion,
                garantia=_garantia,
                fecha_emision=_fecha_emision,
                estado_guia=_estado_guia
            WHERE idguiaremision = _idguiaremision;
            SELECT 'Guia remision actualizada correctamente' AS mensaje;
        END;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarMateriaPrima` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarMateriaPrima`(
    _idmateriaprima int,
    _idproveedor int,
    _nombre_materia VARCHAR(45),
    _precio_materia decimal(10,2),
    _cantidad_materia int,
    _unidadmedida VARCHAR(45),
    _descripcion varchar(225),
    _tipo_materia varchar(45)
    )
BEGIN
	declare materiaPrimaExiste boolean;
    
    SELECT EXISTS(SELECT 1 FROM materiaprima WHERE nombre_materia = _nombre_materia and idmateriaprima != _idmateriaprima) INTO materiaPrimaExiste;
	
    if materiaPrimaExiste then
    SELECT 'La materia prima ya existe' AS mensaje;
    
    else 
		START TRANSACTION;
        BEGIN
			UPDATE materiaprima 
			SET
				idproveedor = _idproveedor,
				nombre_materia = _nombre_materia,
				precio_materia = _precio_materia,
				cantidad_materia = _cantidad_materia,
				unidadmedida = _unidadmedida,
				descripcion = _descripcion,
				tipo_materia = _tipo_materia

			WHERE idmateriaprima = _idmateriaprima;
			SELECT 'Materia prima actualizada correctamente' AS mensaje;
        END;
        COMMIT;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarOrdenTrabajo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarOrdenTrabajo`(
	_idordentrabajo INT,
	_idcotizacion INT,
	_idtrabajador INT,
	_fecha_emision TIMESTAMP,
	_fecha_maxima_entrega TIMESTAMP,
	_estado_orden VARCHAR(225),
    _estado_produccion VARCHAR(45)
	)
BEGIN
		START TRANSACTION;
        BEGIN
			UPDATE ordentrabajo 
			SET
				idcotizacion = _idcotizacion,
				idtrabajador = _idtrabajador,
				fecha_emision = _fecha_emision,
				fecha_maxima_entrega = _fecha_maxima_entrega,
				estado_orden = _estado_orden,
                estado_produccion = _estado_produccion
			WHERE idordentrabajo = _idordentrabajo;
			SELECT 'Orden de Trabajo actualizada correctamente' AS mensaje;
        END;
        COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarProducto`(
    _idproducto INT,
    _nombre_producto VARCHAR(45),
    _precio_producto decimal(10,2),
    _observacion_producto VARCHAR(225)
    )
BEGIN
	declare productoExiste boolean;
    
    SELECT EXISTS(SELECT 1 FROM producto WHERE nombre_producto = _nombre_producto and idproducto != _idproducto) INTO productoExiste;
	
    if productoExiste then
    SELECT 'El Producto ya existe' AS mensaje;
    
	else
    START TRANSACTION;
        BEGIN
			UPDATE producto 
			SET
            nombre_producto = _nombre_producto,
            precio_producto = _precio_producto,
            observacion_producto = _observacion_producto
			WHERE idproducto = _idproducto;
			SELECT 'Producto actualizado correctamente' AS mensaje;
		END;
    COMMIT;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarProveedor`(
    _idproveedor INT,
    _rucproveedor VARCHAR(15),
    _nombre_proveedor varchar(45),
    _contacto_proveedor varchar(45),
    _direccion_proveedor varchar(45),
    _email_proveedor varchar(30),
    _celular_proveedor varchar(20)
    )
BEGIN
	declare proveedorExiste boolean;
    
    SELECT EXISTS(SELECT 1 FROM proveedor WHERE rucproveedor = _rucproveedor and idproveedor != _idproveedor) INTO proveedorExiste;
	
    if proveedorExiste then
    SELECT 'El Proveedor ya existe' AS mensaje;
    
	else
    START TRANSACTION;
        BEGIN
			UPDATE proveedor 
			SET
            rucproveedor = _rucproveedor,
            nombre_proveedor = _nombre_proveedor, 
            contacto_proveedor = _contacto_proveedor,
            direccion_proveedor=_direccion_proveedor,
            email_proveedor = _email_proveedor,
            celular_proveedor=_celular_proveedor
			WHERE idproveedor = _idproveedor;
			SELECT 'Proveedor actualizado correctamente' AS mensaje;
		END;
    COMMIT;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarReceta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarReceta`(
	_idreceta INT,
	_idproducto INT, 
	_idmateriaprima INT, 
	_cantidadmateria INT, 
	_preciomateriacantidad DECIMAL(10,2)
	)
BEGIN
    START TRANSACTION;
        BEGIN
			UPDATE receta 
			SET idproducto=_idproducto, idmateriaprima = _idmateriaprima, cantidadmateria = _cantidadmateria, preciomateriacantidad = _preciomateriacantidad
			WHERE idreceta = _idreceta;
			SELECT 'Receta actualizada correctamente' AS mensaje;
		END;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarTrabajador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarTrabajador`(
    _idtrabajador INT,
    _idrol INT,
    _nombre VARCHAR(45),
    _correo VARCHAR(45),
    _usuario VARCHAR(45),
    _clave VARCHAR(255),
    _sueldo DECIMAL(10,2),
    _sueldo_extra DECIMAL(10,2)
    )
BEGIN
	declare trabajadorExistente boolean;
    SELECT EXISTS(SELECT 1 FROM trabajador WHERE usuario_trabajador = _usuario and idtrabajador != _idtrabajador) INTO trabajadorExistente;
    if trabajadorExistente then
    SELECT 'El trabajador ya existe' AS mensaje;
    else
    START TRANSACTION;
        BEGIN
			UPDATE Trabajador 
			SET
            idrol = _idrol,
            nombre_trabajador = _nombre,
            correo_trabajador = _correo,
            usuario_trabajador = _usuario,
            clave_trabajador = _clave,
            sueldo_trabajador=_sueldo,
            sueldo_extra=_sueldo_extra
			WHERE idtrabajador = _idtrabajador;
			SELECT 'Trabajador actualizado correctamente' AS mensaje;
		END;
    COMMIT;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearAlmacen`(
	_idordentrabajo INT,
    _estado_producto_almacen VARCHAR(225)
	)
BEGIN
		START TRANSACTION;
        BEGIN
                INSERT INTO almacen (idordentrabajo,estado_producto_almacen) 
                VALUES (_idordentrabajo, _estado_producto_almacen);
                SELECT 'Almacen insertado correctamente' AS mensaje;
        END;
        COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearCliente`(
    _tipo VARCHAR(15),
    _numerodocumento VARCHAR(15),
    _nombre_cliente VARCHAR(45),
    _email_cliente VARCHAR(30),
    _celular_cliente VARCHAR(20)
    )
BEGIN
	declare rucexistente boolean;
    SELECT EXISTS(SELECT 1 FROM cliente WHERE numerodocumento = _numerodocumento) INTO rucexistente;
	if rucexistente then
    SELECT 'El cliente ya existe' AS mensaje;
    
    else 
		START TRANSACTION;
        BEGIN
                INSERT INTO cliente (tipo,numerodocumento,nombre_cliente,email_cliente,celular_cliente) 
                VALUES (_tipo, _numerodocumento,_nombre_cliente,_email_cliente,_celular_cliente);
                SELECT 'Cliente insertado correctamente' AS mensaje;
        END;
        COMMIT;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearCobranza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearCobranza`(
    _idcotizacion INT,
    _fecha_emision TIMESTAMP,
    _fecha_vencimiento TIMESTAMP,
    _delivery DECIMAL(10,2),
    _monto DECIMAL(10,2),
    _moneda VARCHAR(10),
    _documento VARCHAR(45),
    _estado_cobranza VARCHAR(25)
	)
BEGIN
		START TRANSACTION;
        BEGIN
                INSERT INTO cobranza (idcotizacion,fecha_emision,fecha_vencimiento ,delivery,monto ,moneda,documento,estado_cobranza) 
                VALUES (_idcotizacion,_fecha_emision,_fecha_vencimiento ,_delivery,_monto ,_moneda,_documento,_estado_cobranza);
                SELECT 'Cobranza insertada correctamente' AS mensaje;
        END;
        COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearcotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearcotizacion`(
    _idcliente INT,
    _fecha_emision timestamp,
    _estado VARCHAR(225)
    )
BEGIN
	INSERT INTO cotizacion (idcliente, fecha_emision, estado) 
	VALUES (_idcliente, _fecha_emision, _estado);
    select idcotizacion from cotizacion where idcliente=_idcliente and fecha_emision=_fecha_emision;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearDetalleCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearDetalleCotizacion`(
    _idcotizacion INT,
    _idproducto INT,
    _cantidad INT,
    _precio DECIMAL(10,2),
    _observacion VARCHAR(225)
)
BEGIN
    START TRANSACTION;
    BEGIN
        INSERT INTO detallecotizacion (idcotizacion, idproducto, cantidad, precio, observacion) 
        VALUES (_idcotizacion, _idproducto, _cantidad, _precio, _observacion);
        SELECT 'Detalle cotizacion insertado correctamente' AS mensaje;
    END;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearGuiaRemision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearGuiaRemision`(
    _idcotizacion INT,
    _garantia TIMESTAMP,
    _fecha_emision TIMESTAMP,
    _estado_guia VARCHAR(255)
)
BEGIN
    START TRANSACTION;
    BEGIN
        INSERT INTO guia_remision (idcotizacion,garantia,fecha_emision,estado_guia) 
        VALUES (_idcotizacion,_garantia,_fecha_emision,_estado_guia);
        SELECT 'Guia remision insertada correctamente' AS mensaje;
    END;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearMateriaPrima` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearMateriaPrima`(
    _idproveedor int,
    _nombre_materia VARCHAR(45),
    _precio_materia decimal(10,2),
    _cantidad_materia int,
    _unidadmedida VARCHAR(45),
    _descripcion varchar(225),
    _tipo_materia varchar(45)
)
BEGIN
	declare materiaPrimaExiste boolean;
    
    SELECT EXISTS(SELECT 1 FROM materiaprima WHERE nombre_materia = _nombre_materia) INTO materiaPrimaExiste;
	
    if materiaPrimaExiste then
    SELECT 'La materia prima ya existe' AS mensaje;
    
    else 
		START TRANSACTION;
        BEGIN
                INSERT INTO materiaprima (idproveedor,nombre_materia,precio_materia ,cantidad_materia ,unidadmedida,descripcion,tipo_materia) 
                VALUES (_idproveedor,_nombre_materia,_precio_materia ,_cantidad_materia ,_unidadmedida,_descripcion,_tipo_materia);
                SELECT 'Materia Prima insertado correctamente' AS mensaje;
        END;
        COMMIT;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearOrdenTrabajo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearOrdenTrabajo`(
	_idcotizacion INT,
	_idtrabajador INT,
	_fecha_emision TIMESTAMP,
	_fecha_maxima_entrega TIMESTAMP,
	_estado_orden VARCHAR(225),
    _estado_produccion VARCHAR(225)
	)
BEGIN
	INSERT INTO ordentrabajo (idcotizacion, idtrabajador, fecha_emision, fecha_maxima_entrega, estado_orden, estado_produccion)
	VALUES (_idcotizacion, _idtrabajador, _fecha_emision, _fecha_maxima_entrega, _estado_orden, _estado_produccion);
	SELECT 'Orden de trabajo insertada correctamente' AS mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearProducto`(
    _nombre_producto VARCHAR(45),
    _precio_producto decimal(10,2),
    _observacion_producto VARCHAR(225)
)
BEGIN
	declare productoExiste boolean;
    SELECT EXISTS(SELECT 1 FROM producto WHERE nombre_producto = _nombre_producto) INTO productoExiste;
	if productoExiste then
    SELECT 'El Producto ya existe' AS mensaje;
    ELSE 
		START TRANSACTION;
        BEGIN
                INSERT INTO producto (nombre_producto, precio_producto,  observacion_producto) 
                VALUES (_nombre_producto,_precio_producto,_observacion_producto);
                SELECT 'Producto insertado correctamente' AS mensaje;
        END;
        COMMIT;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearProveedor`(
    _rucproveedor VARCHAR(15),
    _nombre_proveedor varchar(45),
    _contacto_proveedor varchar(45),
    _direccion_proveedor varchar(45),
    _email_proveedor varchar(30),
    _celular_proveedor varchar(20)
)
BEGIN
	declare proveedorExiste boolean;
    
    SELECT EXISTS(SELECT 1 FROM proveedor WHERE rucproveedor = _rucproveedor) INTO proveedorExiste;
	
    if proveedorExiste then
    SELECT 'El Proveedor ya existe' AS mensaje;
    
    else 
		START TRANSACTION;
        BEGIN
                INSERT INTO proveedor (rucproveedor,nombre_proveedor,contacto_proveedor,direccion_proveedor,email_proveedor,celular_proveedor) 
                VALUES (_rucproveedor,_nombre_proveedor,_contacto_proveedor,_direccion_proveedor,_email_proveedor,_celular_proveedor);
                SELECT 'Proveedor insertado correctamente' AS mensaje;
        END;
        COMMIT;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearReceta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearReceta`(
	_idproducto INT, 
	_idmateriaprima INT, 
	_cantidadmateria INT, 
	_preciomateriacantidad DECIMAL(10,2)
    )
BEGIN
    START TRANSACTION;
    BEGIN
        INSERT INTO receta (idproducto,idmateriaprima,cantidadmateria,preciomateriacantidad) 
        VALUES (_idproducto,_idmateriaprima,_cantidadmateria,_preciomateriacantidad);
        SELECT 'Receta insertada correctamente' AS mensaje;
    END;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearTrabajador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearTrabajador`(
    _idrol INT,
    _nombre VARCHAR(45),
    _correo VARCHAR(45),
    _usuario VARCHAR(45),
    _clave VARCHAR(255),
    _sueldo DECIMAL(10,2),
    _sueldo_extra DECIMAL(10,2)
    )
BEGIN
    DECLARE trabajadorExistente BOOLEAN;
    DECLARE usuarioExistente BOOLEAN;

    SELECT EXISTS(SELECT 1 FROM trabajador WHERE nombre_trabajador = _nombre) INTO trabajadorExistente;
    SELECT EXISTS(SELECT 1 FROM trabajador WHERE usuario_trabajador = _usuario) INTO usuarioExistente;

    IF trabajadorExistente AND usuarioExistente THEN
        SELECT 'El nombre del trabajador y el usuario ya existen' AS mensaje;
    ELSEIF trabajadorExistente THEN
        SELECT 'El trabajador ya existe' AS mensaje;
    ELSEIF usuarioExistente THEN
        SELECT 'El usuario ya existe' AS mensaje;
    ELSE
        START TRANSACTION;
        BEGIN
                INSERT INTO Trabajador (idrol, nombre_trabajador, correo_trabajador, usuario_trabajador, clave_trabajador, sueldo_trabajador,sueldo_extra) 
                VALUES (_idrol, _nombre, _correo, _usuario, _clave, _sueldo,_sueldo_extra);
                SELECT 'Trabajador insertado correctamente' AS mensaje;
        END;
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarAlmacen`(
	_idalmacen INT
    )
BEGIN
        START TRANSACTION;
        BEGIN
            DELETE FROM almacen WHERE idalmacen = _idalmacen;
            SELECT 'Almacen eliminado correctamente' AS mensaje;
        END;
        COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarCliente`(_idcliente INT)
BEGIN
    DECLARE clienteExistente BOOLEAN;
    SELECT EXISTS(SELECT 1 FROM cliente WHERE idcliente = _idcliente) INTO clienteExistente;
    IF NOT clienteExistente THEN
        SELECT 'El cliente no existe' AS mensaje;
    ELSE
        START TRANSACTION;
        BEGIN
            DELETE FROM cliente WHERE idcliente = _idcliente;
            SELECT 'Cliente eliminado correctamente' AS mensaje;
        END;
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarCobranza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarCobranza`(_idcobranza INT)
BEGIN
    DECLARE cobranzaExiste BOOLEAN;
    SELECT EXISTS(SELECT 1 FROM cobranza WHERE idcobranza = _idcobranza) INTO cobranzaExiste;
    IF NOT cobranzaExiste THEN
        SELECT 'La cobranza no existe' AS mensaje;
    ELSE
        START TRANSACTION;
        BEGIN
            DELETE FROM cobranza WHERE idcobranza = _idcobranza;
            SELECT 'Cobranza eliminada correctamente' AS mensaje;
        END;
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarCotizacion`(_idcotizacion INT)
BEGIN
    DECLARE cotizacionExistente BOOLEAN;
    SELECT EXISTS(SELECT 1 FROM cotizacion WHERE idcotizacion = _idcotizacion) INTO cotizacionExistente;
    IF NOT cotizacionExistente THEN
        SELECT 'La cotizacion no existe' AS mensaje;
    ELSE
        START TRANSACTION;
        BEGIN
            DELETE FROM cotizacion WHERE idcotizacion = _idcotizacion;
            SELECT 'Cotizacion eliminada correctamente' AS mensaje;
        END;
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarDetalleCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarDetalleCotizacion`(_iddetallecotizacion INT)
BEGIN
    DECLARE detalleCotizacionExistente BOOLEAN;
    SELECT EXISTS(SELECT 1 FROM detallecotizacion WHERE iddetallecotizacion = _iddetallecotizacion) INTO detalleCotizacionExistente;
    IF NOT detalleCotizacionExistente THEN
        SELECT 'El detalle cotizacion no existe' AS mensaje;
    ELSE
        START TRANSACTION;
        BEGIN
            DELETE FROM detallecotizacion WHERE iddetallecotizacion = _iddetallecotizacion;
            SELECT 'Detalle Cotizacion eliminada correctamente' AS mensaje;
        END;
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarGuiaRemision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarGuiaRemision`(_idguiaremision INT)
BEGIN
    DECLARE guiaremisionExiste BOOLEAN;
    SELECT EXISTS(SELECT 1 FROM guia_remision WHERE idguiaremision = _idguiaremision) INTO guiaremisionExiste;
    IF NOT guiaremisionExiste THEN
        SELECT 'La guia remision no existe' AS mensaje;
    ELSE
        START TRANSACTION;
        BEGIN
            DELETE FROM guia_remision WHERE idguiaremision = _idguiaremision;
            SELECT 'Guia remision eliminada correctamente' AS mensaje;
        END;
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarMateriaPrima` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarMateriaPrima`(_idmateriaprima INT)
BEGIN
    DECLARE materiaPrimaExiste BOOLEAN;
    SELECT EXISTS(SELECT 1 FROM materiaprima WHERE idmateriaprima = _idmateriaprima) INTO materiaPrimaExiste;
    IF NOT materiaPrimaExiste THEN
        SELECT 'La materia prima no existe' AS mensaje;
    ELSE
        START TRANSACTION;
        BEGIN
            DELETE FROM materiaprima WHERE idmateriaprima = _idmateriaprima;
            SELECT 'Materia prima eliminada correctamente' AS mensaje;
        END;
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarOrdenTrabajo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarOrdenTrabajo`(
	_idordentrabajo INT
	)
BEGIN
    DECLARE OrdenExistente BOOLEAN;
    SELECT EXISTS(SELECT 1 FROM ordentrabajo WHERE idordentrabajo = _idordentrabajo) INTO OrdenExistente;
    IF NOT OrdenExistente THEN
        SELECT 'La orden de trabajo no existe' AS mensaje;
    ELSE
        START TRANSACTION;
        BEGIN
            DELETE FROM ordentrabajo WHERE idordentrabajo = _idordentrabajo;
            SELECT 'Orden de Trabajo eliminada correctamente' AS mensaje;
        END;
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarProducto`(_idproducto INT)
BEGIN
    DECLARE productoExiste BOOLEAN;
    SELECT EXISTS(SELECT 1 FROM producto WHERE idproducto = _idproducto) INTO productoExiste;
    IF NOT productoExiste THEN
        SELECT 'El producto no existe' AS mensaje;
    ELSE
        START TRANSACTION;
        BEGIN
            DELETE FROM producto WHERE idproducto = _idproducto;
            SELECT 'Producto eliminado correctamente' AS mensaje;
        END;
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarProveedor`(_idproveedor INT)
BEGIN
    DECLARE proveedorexistente BOOLEAN;
    SELECT EXISTS(SELECT 1 FROM proveedor WHERE idproveedor = _idproveedor) INTO proveedorexistente;
    IF NOT proveedorexistente THEN
        SELECT 'El proveedor no existe' AS mensaje;
    ELSE
        BEGIN
            START TRANSACTION;
            DELETE FROM proveedor WHERE idproveedor = _idproveedor;
            COMMIT;
            SELECT 'Proveedor eliminado correctamente' AS mensaje;
        END;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarReceta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarReceta`(
	_idreceta INT
	)
BEGIN
        START TRANSACTION;
        BEGIN
            DELETE FROM receta WHERE idreceta = _idreceta;
            SELECT 'Receta eliminada correctamente' AS mensaje;
        END;
        COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarTrabajador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarTrabajador`(_idtrabajador INT)
BEGIN
    DECLARE trabajadorExistente BOOLEAN;
    SELECT EXISTS(SELECT 1 FROM trabajador WHERE idtrabajador = _idtrabajador) INTO trabajadorExistente;
    IF NOT trabajadorExistente THEN
        SELECT 'El trabajador no existe' AS mensaje;
    ELSE
        START TRANSACTION;
        BEGIN
            DELETE FROM trabajador WHERE idtrabajador = _idtrabajador;
            SELECT 'Trabajador eliminado correctamente' AS mensaje;
        END;
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarAlmacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarAlmacen`()
BEGIN
SELECT 
    idalmacen, idordentrabajo, estado_producto_almacen
FROM
    almacen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarCliente`()
BEGIN
SELECT 
    idcliente,
    tipo,
    numerodocumento,
    nombre_cliente,
	email_cliente,
    celular_cliente
FROM
    cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarcobranza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarcobranza`()
BEGIN
SELECT
    idcobranza,
    CO.idcotizacion,
    C.idcliente,
    CL.nombre_cliente,
    CO.fecha_emision,
    fecha_vencimiento,
    delivery,
    monto,
    moneda,
    documento,
    estado_cobranza
FROM
    cobranza AS CO
        INNER JOIN
    cotizacion AS C ON CO.idcotizacion = C.idcotizacion
        INNER JOIN
    cliente AS CL ON C.idcliente = CL.idcliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarCotizacion`()
BEGIN
SELECT 
    idcotizacion,
    CO.idcliente,
    fecha_emision,
    estado,
    nombre_cliente,
    celular_cliente,
    email_cliente
FROM
    cotizacion AS CO
        INNER JOIN
    cliente AS C ON C.idcliente = CO.idcliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarDetalleCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarDetalleCotizacion`(_idcotizacion INT)
BEGIN
SELECT 
	iddetallecotizacion,
    C.idcotizacion,
    P.nombre_producto,
    P.precio_producto,
    D.cantidad,
    D.precio,
    C.fecha_emision,
    D.observacion
FROM
    detallecotizacion AS D
        INNER JOIN
    producto AS P ON P.idproducto = D.idproducto
        INNER JOIN
    cotizacion AS C ON C.idcotizacion= D.idcotizacion
    where C.idcotizacion=_idcotizacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarGuiaRemision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarGuiaRemision`()
BEGIN
SELECT 
    GM.idguiaremision,
    C.idcotizacion,
    Cl.nombre_cliente,
    GM.garantia,
    GM.fecha_emision,
    GM.estado_guia
FROM
    guia_remision AS GM
        INNER JOIN
    cotizacion AS C ON GM.idcotizacion = C.idcotizacion
        INNER JOIN
    cliente AS Cl ON C.idcliente = Cl.idcliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarHistorialCotizacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarHistorialCotizacion`(_idcliente INT)
BEGIN
select cot.idcliente, cot.idcotizacion, cot.fecha_emision, count(iddetallecotizacion) as 'cantidad'
from cotizacion cot inner join detallecotizacion det 
on cot.idcotizacion = det.idcotizacion
where cot.idcliente = _idcliente
group by cot.idcotizacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarMateriaPrima` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarMateriaPrima`()
BEGIN
SELECT 
    M.idmateriaprima,
    M.nombre_materia,
    M.precio_materia,
    M.cantidad_materia,
    M.unidadmedida,
    P.nombre_proveedor,
    M.descripcion,
    M.tipo_materia
FROM
    materiaprima AS M
        INNER JOIN
    proveedor AS P ON M.idproveedor = P.idproveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarOrdenTrabajo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarOrdenTrabajo`()
BEGIN
SELECT 
    idordentrabajo,
    idcotizacion,
    OT.idtrabajador,
    T.nombre_trabajador,
    T.sueldo_trabajador,
    OT.fecha_emision,
    OT.fecha_maxima_entrega,
    OT.estado_orden,
    OT.estado_produccion
FROM
    ordentrabajo AS OT
        INNER JOIN
    trabajador AS T ON OT.idtrabajador = T.idtrabajador;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProducto`()
BEGIN
SELECT 
    idproducto,
    nombre_producto,
    precio_producto,
    observacion_producto
FROM
    producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProveedor`()
BEGIN
SELECT 
    idproveedor,
    rucproveedor,
    nombre_proveedor,
    contacto_proveedor,
    direccion_proveedor,
    email_proveedor,
    celular_proveedor
FROM
    proveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarReceta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarReceta`(_idproducto INT)
BEGIN
SELECT 
	idreceta,
    R.idproducto,
    nombre_producto,
    R.idmateriaprima,
    nombre_materia,
    cantidadmateria,
    preciomateriacantidad
FROM
    receta AS R
        INNER JOIN
    producto AS P ON R.idproducto = P.idproducto
        INNER JOIN
    materiaprima AS MP ON MP.idmateriaprima = R.idmateriaprima
WHERE
    R.idproducto = _idproducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarRol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarRol`()
BEGIN
SELECT * FROM rol;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarTrabajador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarTrabajador`()
BEGIN
SELECT 
    T.idtrabajador,
    T.nombre_trabajador,
    R.rol,
    T.correo_trabajador,
    T.usuario_trabajador,
    T.clave_trabajador,
    T.sueldo_trabajador,
    sueldo_extra
FROM
    trabajador AS T
        INNER JOIN
    rol AS R ON T.idrol = R.idrol;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ValidarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarUsuario`(_usuario_trabajador VARCHAR(45))
BEGIN
SELECT
T.idtrabajador,
T.usuario_trabajador,
T.clave_trabajador,
T.nombre_trabajador,
T.correo_trabajador,
R.rol
FROM trabajador AS T
inner join rol AS R on T.idrol=R.idrol where T.usuario_trabajador=_usuario_trabajador
and lower(T.usuario_trabajador)=lower(_usuario_trabajador);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-20  0:10:42
