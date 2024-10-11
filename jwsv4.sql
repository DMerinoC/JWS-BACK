-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: jws
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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `ruccliente` varchar(15) DEFAULT NULL,
  `tiporuc` varchar(15) DEFAULT NULL,
  `nombre_cliente` varchar(45) DEFAULT NULL,
  `nivel_interes` varchar(15) DEFAULT NULL,
  `observacion_compras` varchar(255) DEFAULT NULL,
  `email_cliente` varchar(30) DEFAULT NULL,
  `telefono_cliente` varchar(20) DEFAULT NULL,
  `celular_cliente` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'20512345678','Natural','Cliente SAC','Bajo','Comprador usual','clientefrec@empresa.com','999949487','984123657'),(2,'20587654321','Natural','Individuo SRL','Medio','Compras ocasionales','individuo@correo.com','987654324','912345679'),(5,'20512341234','Juridico','Corp SAC','Medio','Comprador','corp@empresa.com','999949123','984123333');
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
  `idcliente` int DEFAULT NULL,
  `fecha_emision` timestamp NULL DEFAULT NULL,
  `fecha_vencimiento` timestamp NULL DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `moneda` varchar(45) DEFAULT NULL,
  `documento` varchar(45) DEFAULT NULL,
  `observacion` varchar(225) DEFAULT NULL,
  `recurrente` varchar(45) DEFAULT NULL,
  `estadocobranza` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idcobranza`),
  KEY `idcliente` (`idcliente`),
  CONSTRAINT `cobranza_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobranza`
--

LOCK TABLES `cobranza` WRITE;
/*!40000 ALTER TABLE `cobranza` DISABLE KEYS */;
INSERT INTO `cobranza` VALUES (2,1,'2024-10-03 05:45:33','2024-11-02 05:45:33',1500.00,'USD','Factura 123','Cobranza mensual','Sí','NC');
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
  `observacion` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`idcotizacion`),
  KEY `idcliente` (`idcliente`),
  CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacion`
--

LOCK TABLES `cotizacion` WRITE;
/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
INSERT INTO `cotizacion` VALUES (1,1,'2024-10-10 05:00:00','observacion'),(2,1,'2024-10-10 05:00:00','observacion'),(3,1,'2024-10-10 05:00:00','observacion');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallecotizacion`
--

LOCK TABLES `detallecotizacion` WRITE;
/*!40000 ALTER TABLE `detallecotizacion` DISABLE KEYS */;
INSERT INTO `detallecotizacion` VALUES (6,2,3,2,200.00,'todo mal'),(7,3,4,3,30.00,'Sin problemas'),(8,2,2,3,225.00,'Sin problemas'),(9,2,5,2,20.00,'todo mal'),(10,3,1,3,451.50,'Sin problemas'),(11,3,4,6,60.00,'todo mal'),(12,1,2,10,750.00,'Sin problemas');
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
  `fecha_emision` timestamp NULL DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idguiaremision`),
  KEY `idcotizacion` (`idcotizacion`),
  CONSTRAINT `guia_remision_ibfk_1` FOREIGN KEY (`idcotizacion`) REFERENCES `cotizacion` (`idcotizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guia_remision`
--

LOCK TABLES `guia_remision` WRITE;
/*!40000 ALTER TABLE `guia_remision` DISABLE KEYS */;
INSERT INTO `guia_remision` VALUES (1,3,'2024-10-09 05:00:00','Se envió el producto al cliente sin ningún inconveniente'),(2,1,'2024-10-01 05:00:00','Se envió el producto al cliente sin ningún inconveniente'),(3,2,'2024-05-01 05:00:00','Se envió el producto al cliente sin ningún inconveniente'),(5,1,'2024-05-03 05:00:00','Se encontró el producto'),(6,1,'2024-05-03 05:00:00','Se encontró el producto'),(7,2,'2024-05-03 05:00:00','Se encontró el producto');
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
  `lista_predeterminado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmateriaprima`),
  KEY `idproveedor` (`idproveedor`),
  CONSTRAINT `materiaprima_ibfk_1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiaprima`
--

LOCK TABLES `materiaprima` WRITE;
/*!40000 ALTER TABLE `materiaprima` DISABLE KEYS */;
INSERT INTO `materiaprima` VALUES (1,1,'Materia Prima 1',50.00,300,'kg','Materia de origen nacional','Sí'),(2,2,'Materia Prima 2',30.00,500,'kg','Materia de importación','No');
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
  `observacion` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`idordentrabajo`),
  KEY `idcotizacion` (`idcotizacion`),
  KEY `idtrabajador` (`idtrabajador`),
  CONSTRAINT `ordentrabajo_ibfk_1` FOREIGN KEY (`idcotizacion`) REFERENCES `cotizacion` (`idcotizacion`),
  CONSTRAINT `ordentrabajo_ibfk_2` FOREIGN KEY (`idtrabajador`) REFERENCES `trabajador` (`idtrabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordentrabajo`
--

LOCK TABLES `ordentrabajo` WRITE;
/*!40000 ALTER TABLE `ordentrabajo` DISABLE KEYS */;
INSERT INTO `ordentrabajo` VALUES (1,1,2,'2024-10-03 04:22:55','2024-10-10 04:22:55','Esta no es prueba');
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
  `cantidad_producto` int DEFAULT NULL,
  `observacion_producto` varchar(225) DEFAULT NULL,
  `lista_predeterminado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Producto A',150.50,100,'Producto de alta calidad','Sí'),(2,'Producto B',75.00,200,'Producto de calidad media','No'),(3,'Producto c',100.00,100,'Producto de baja calidad','Sí'),(4,'Producto D',10.00,100,'Producto de baja calidad','Sí'),(5,'Producto E',10.00,100,'Producto de baja calidad','Sí'),(6,'Producto F',300.00,100,'Producto de baja calidad','Sí'),(7,'Producto G',100.00,100,'Producto de baja calidad','Sí');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_materiaprima`
--

DROP TABLE IF EXISTS `producto_materiaprima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_materiaprima` (
  `idproducto` int NOT NULL,
  `idmateriaprima` int NOT NULL,
  PRIMARY KEY (`idproducto`,`idmateriaprima`),
  KEY `idmateriaprima` (`idmateriaprima`),
  CONSTRAINT `producto_materiaprima_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`),
  CONSTRAINT `producto_materiaprima_ibfk_2` FOREIGN KEY (`idmateriaprima`) REFERENCES `materiaprima` (`idmateriaprima`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_materiaprima`
--

LOCK TABLES `producto_materiaprima` WRITE;
/*!40000 ALTER TABLE `producto_materiaprima` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_materiaprima` ENABLE KEYS */;
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
  `tiporuc` varchar(15) DEFAULT NULL,
  `nombre_proveedor` varchar(45) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `cargo_compras` varchar(45) DEFAULT NULL,
  `direccion_proveedor` varchar(45) DEFAULT NULL,
  `contacto_proveedor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'20123456789','Juridico','Proveedor S.A.','www.proveedor.com','Gerente','Av. Principal 123','987654321'),(2,NULL,'20456789012','Servicios Integrales EIRL','www.servicios.com','Director','Calle Secundaria 456','987654322'),(4,'20456789012','Jurídico','Servicios Integrales EIRL','www.servicios.com','Director','Calle Secundaria 456','987654322');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Vendedor'),(3,'Trabajador'),(4,'Desarrollador');
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
  PRIMARY KEY (`idtrabajador`),
  KEY `idrol` (`idrol`),
  CONSTRAINT `trabajador_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajador`
--

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` VALUES (2,1,'Diego Merino','inge@gmail.com','dmerino','$2y$10$6pOvQP68X8uiZzqWOZrwveDdOCFBUEPPgQyPPheu/Cobt72Lt63bO',3000.00),(4,2,'Cecilion','cecilion@gmail.com','cecilion24','123456',3000.00),(6,2,'Lemilion','cecilion@gmail.com','Lemilion24','123456',3000.00),(11,3,'Ingeniero primero','ingernieroprimero@gmail.com','inge12','123456',3000.00),(12,4,'Pedro','cecilion@gmail.com','Pedro2000','123456',3000.00),(13,4,'Natalia','natalia@gmail.com','natalia24','123456',2500.00),(14,4,'baxia','baxia@gmail.com','baxia33','$2y$10$B.R5Ff7fQMo6C50dTsdMeeNThGxEMLQyRBkEGN2FtgN5KERtio3A.',2500.00),(15,4,'layla Kanz','baxia@gmail.com','layla22','$2y$10$HxXB4C.fUP.aUxc3UwkVee2C7Qn0XBaNQiLv/HbZLEE3TrkhNFahO',2500.00);
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'jws'
--
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
    _ruccliente VARCHAR(15),
    _tiporuc VARCHAR(15),
    _nombre_cliente VARCHAR(45),
    _nivel_interes VARCHAR(15),
    _observacion_compras VARCHAR(255),
    _email_cliente VARCHAR(30),
    _telefono_cliente VARCHAR(20),
    _celular_cliente VARCHAR(20)
    )
BEGIN
	declare clienteExistente boolean;
    SELECT EXISTS(SELECT 1 FROM cliente WHERE _ruccliente = ruccliente and idcliente != _idcliente) INTO clienteExistente;
    if clienteExistente then
    SELECT 'El cliente ya existe' AS mensaje;
    else
    START TRANSACTION;
        BEGIN
			UPDATE cliente 
			SET ruccliente = _ruccliente, tiporuc = _tiporuc, nombre_cliente = _nombre_cliente, nivel_interes = _nivel_interes, observacion_compras = _observacion_compras, email_cliente=_email_cliente, telefono_cliente=_telefono_cliente,celular_cliente=_celular_cliente
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
    _idcliente INT,
    _fecha_emision TIMESTAMP,
    _fecha_vencimiento TIMESTAMP,
    _monto DECIMAL(10,2),
    _moneda VARCHAR(45),
    _documento VARCHAR(45),
    _observacion VARCHAR(225),
    _recurrente VARCHAR(45),
    _estadocobranza VARCHAR(10)
	)
BEGIN
    START TRANSACTION;
        BEGIN
            UPDATE cobranza 
            SET 
                idcliente=_idcliente,
                fecha_emision=_fecha_emision,
                fecha_vencimiento=_fecha_vencimiento,
                monto=_monto,
                moneda=_moneda,
                documento=_documento,
                observacion=_observacion,
                recurrente=_recurrente,
                estadocobranza=_estadocobranza
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
    _observacion VARCHAR(225)
    )
BEGIN
	declare cotizacionExistente boolean;
    SELECT EXISTS(SELECT 1 FROM cotizacion WHERE idcotizacion != _idcotizacion) INTO cotizacionExistente;
    if not cotizacionExistente then
    SELECT 'La cotizacion no existe' AS mensaje;
	else
    START TRANSACTION;
        BEGIN
			UPDATE cotizacion 
			SET idcliente = _idcliente, fecha_emision = _fecha_emision,
            observacion = _observacion;
			SELECT 'Cotizacion actualizada correctamente' AS mensaje;
		END;
    COMMIT;
    end if;
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
    _observacion VARCHAR(225)
    )
BEGIN
    DECLARE precio_calculado DECIMAL(10,2);

    -- Obtener el precio del producto
    SELECT P.precio_producto INTO precio_calculado
    FROM producto AS P
    WHERE P.idproducto = _idproducto;

    -- Verificar que el precio no es nulo
    IF precio_calculado IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Producto no encontrado';
    END IF;

    -- Calcular el precio total
    SET precio_calculado = precio_calculado * _cantidad;

    START TRANSACTION;
        BEGIN
            UPDATE detallecotizacion 
            SET
                idcotizacion=_idcotizacion ,
                idproducto=_idproducto ,
                cantidad=_cantidad ,
                precio = precio_calculado,
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
    _idguiaremision int,
    _idcotizacion int,
    _fecha_emision timestamp,
    _observacion VARCHAR(225)
    )
BEGIN
    START TRANSACTION;
        BEGIN
            UPDATE guia_remision 
            SET 
                idcotizacion=_idcotizacion,
                fecha_emision=_fecha_emision,
                observacion=_observacion
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
    _lista_predeterminado varchar(45)
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
				lista_predeterminado = _lista_predeterminado

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
	_observacion VARCHAR(225)
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
				observacion = _observacion
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
    _cantidad_producto int,
    _observacion_producto VARCHAR(225),
    _lista_predeterminado VARCHAR(45)
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
			SET nombre_producto = _nombre_producto, precio_producto = _precio_producto,
            cantidad_producto = _cantidad_producto, observacion_producto = _observacion_producto,
            observacion_producto = _observacion_producto, lista_predeterminado=_lista_predeterminado
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
    _tiporuc VARCHAR(15),
    _nombre_proveedor varchar(45),
    _url VARCHAR(150),
    _cargo_compras VARCHAR(45),
    _direccion_proveedor varchar(45),
    _contacto_proveedor varchar(45)
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
            idproveedor = _idproveedor,
            rucproveedor = _rucproveedor,
            tiporuc = _tiporuc,
            nombre_proveedor = _nombre_proveedor, 
            url = _url,
            cargo_compras = _cargo_compras, 
            direccion_proveedor=_direccion_proveedor,
            contacto_proveedor = _contacto_proveedor
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
    _contraseña VARCHAR(255),
    _sueldo DECIMAL(10,2)
    )
BEGIN
	declare trabajadorExistente boolean;
    
    SELECT EXISTS(SELECT 1 FROM trabajador WHERE nombre_trabajador = _nombre and idtrabajador != _idtrabajador) INTO trabajadorExistente;
	
    if trabajadorExistente then
    SELECT 'El trabajador ya existe' AS mensaje;
    else
    START TRANSACTION;
        BEGIN
			UPDATE Trabajador 
			SET idrol = _idrol, nombre_trabajador = _nombre, correo_trabajador = _correo, usuario_trabajador = _usuario, clave_trabajador = _contraseña, sueldo_trabajador=_sueldo
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
    _ruccliente VARCHAR(15),
    _tiporuc VARCHAR(15),
    _nombre_cliente VARCHAR(45),
    _nivel_interes VARCHAR(15),
    _observacion_compras VARCHAR(255),
    _email_cliente VARCHAR(30),
    _telefono_cliente VARCHAR(20),
    _celular_cliente VARCHAR(20)
    )
BEGIN
	declare rucexistente boolean;
    SELECT EXISTS(SELECT 1 FROM cliente WHERE ruccliente = _ruccliente) INTO rucexistente;
	if rucexistente then
    SELECT 'El cliente ya existe' AS mensaje;
    
    else 
		START TRANSACTION;
        BEGIN
                INSERT INTO cliente (ruccliente,tiporuc,nombre_cliente,nivel_interes,observacion_compras,email_cliente,telefono_cliente,celular_cliente) 
                VALUES (_ruccliente,_tiporuc,_nombre_cliente,_nivel_interes,_observacion_compras,_email_cliente,_telefono_cliente,_celular_cliente);
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
	_idcliente INT,
    _fecha_emision TIMESTAMP,
    _fecha_vencimiento TIMESTAMP,
    _monto DECIMAL(10,2),
    _moneda VARCHAR(45),
    _documento VARCHAR(45),
    _observacion VARCHAR(225),
    _recurrente VARCHAR(45),
    _estadocobranza VARCHAR(10)
	)
BEGIN
		START TRANSACTION;
        BEGIN
                INSERT INTO cobranza (idcliente,fecha_emision,fecha_vencimiento ,monto ,moneda,documento,observacion,recurrente,estadocobranza) 
                VALUES (_idcliente,_fecha_emision,_fecha_vencimiento ,_monto ,_moneda,_documento,_observacion,_recurrente,_estadocobranza);
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
    _observacion VARCHAR(225)   
    )
BEGIN
	INSERT INTO cotizacion (idcliente, fecha_emision, observacion) 
	VALUES (_idcliente, _fecha_emision, _observacion);
	SELECT 'Cotizacion insertado correctamente' AS mensaje;
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
    _observacion VARCHAR(225)
)
BEGIN
    DECLARE precio_calculado DECIMAL(10,2);
    
    -- Obtener el precio del producto
    SELECT P.precio_producto INTO precio_calculado
    FROM producto AS P
    WHERE P.idproducto = _idproducto;

    -- Verificar que el precio no es nulo
    IF precio_calculado IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Producto no encontrado';
    END IF;

    -- Calcular el precio total
    SET precio_calculado = precio_calculado * _cantidad;

    -- Iniciar transacción
    START TRANSACTION;
    BEGIN
        INSERT INTO detallecotizacion (idcotizacion, idproducto, cantidad, precio, observacion) 
        VALUES (_idcotizacion, _idproducto, _cantidad, precio_calculado, _observacion);
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
    _idcotizacion int,
    _fecha_emision timestamp,
    _observacion VARCHAR(225)
)
BEGIN
    START TRANSACTION;
    BEGIN
        INSERT INTO guia_remision (idcotizacion,fecha_emision,observacion) 
        VALUES (_idcotizacion,_fecha_emision,_observacion);
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
    _lista_predeterminado varchar(45)
)
BEGIN
	declare materiaPrimaExiste boolean;
    
    SELECT EXISTS(SELECT 1 FROM materiaprima WHERE nombre_materia = _nombre_materia) INTO materiaPrimaExiste;
	
    if materiaPrimaExiste then
    SELECT 'La materia prima ya existe' AS mensaje;
    
    else 
		START TRANSACTION;
        BEGIN
                INSERT INTO materiaprima (idproveedor,nombre_materia,precio_materia ,cantidad_materia ,unidadmedida,descripcion,lista_predeterminado) 
                VALUES (_idproveedor,_nombre_materia,_precio_materia ,_cantidad_materia ,_unidadmedida,_descripcion,_lista_predeterminado);
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
	_id_trabajador INT,
	_fecha_emision TIMESTAMP,
	_fecha_maxima_entrega TIMESTAMP,
	_observacion VARCHAR(225)
	)
BEGIN
	INSERT INTO ordentrabajo (idcotizacion, idtrabajador, fecha_emision, fecha_maxima_entrega, observacion) 
	VALUES (_idcotizacion, _id_trabajador, _fecha_emision, _fecha_maxima_entrega, _observacion);
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
    _cantidad_producto int,
    _observacion_producto VARCHAR(225),
    _lista_predeterminado VARCHAR(45)
)
BEGIN
	declare productoExiste boolean;
    SELECT EXISTS(SELECT 1 FROM producto WHERE nombre_producto = _nombre_producto) INTO productoExiste;
	if productoExiste then
    SELECT 'El Producto ya existe' AS mensaje;
    ELSE 
		START TRANSACTION;
        BEGIN
                INSERT INTO producto (nombre_producto, precio_producto, cantidad_producto, observacion_producto, lista_predeterminado) 
                VALUES (_nombre_producto,_precio_producto,_cantidad_producto,_observacion_producto,_lista_predeterminado);
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
    _tiporuc VARCHAR(15),
    _nombre_proveedor varchar(45),
    _url VARCHAR(150),
    _cargo_compras VARCHAR(45),
    _direccion_proveedor varchar(45),
    _contacto_proveedor varchar(45)
)
BEGIN
	declare proveedorExiste boolean;
    
    SELECT EXISTS(SELECT 1 FROM proveedor WHERE rucproveedor = _rucproveedor) INTO proveedorExiste;
	
    if proveedorExiste then
    SELECT 'El Proveedor ya existe' AS mensaje;
    
    else 
		START TRANSACTION;
        BEGIN
                INSERT INTO proveedor (rucproveedor,tiporuc,nombre_proveedor,url,cargo_compras,direccion_proveedor,contacto_proveedor) 
                VALUES (_rucproveedor,_tiporuc,_nombre_proveedor,_url,_cargo_compras,_direccion_proveedor,_contacto_proveedor);
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
    _contraseña VARCHAR(255),
    _sueldo DECIMAL(10,2)
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
                INSERT INTO Trabajador (idrol, nombre_trabajador, correo_trabajador, usuario_trabajador, clave_trabajador, sueldo_trabajador) 
                VALUES (_idrol, _nombre, _correo, _usuario, _contraseña, _sueldo);
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
    DECLARE mensajeSalida VARCHAR(255) DEFAULT '';

    -- Comprobar si el proveedor existe
    SELECT EXISTS(SELECT 1 FROM proveedor WHERE idproveedor = _idproveedor) INTO proveedorexistente;

    IF NOT proveedorexistente THEN
        SET mensajeSalida = 'El proveedor no existe';
    ELSE
        -- Intentar eliminar el proveedor
        BEGIN
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK; -- Deshacer cualquier cambio en caso de error
                SET mensajeSalida = 'Existe algún proveedor actuando en otro servicio.';
            END;

            START TRANSACTION;
            DELETE FROM proveedor WHERE idproveedor = _idproveedor;
            COMMIT;
            SET mensajeSalida = 'Proveedor eliminado correctamente';
        END;
    END IF;

    -- Devolver el mensaje final
    SELECT mensajeSalida AS mensaje;
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
select idcliente, nombre_cliente, ruccliente, tiporuc, nivel_interes, observacion_compras, email_cliente, telefono_cliente, celular_cliente from cliente;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarCobranza`()
BEGIN
    SELECT 
        CO.idcobranza,
        CO.idcliente,
        CL.nombre_cliente,
        CO.fecha_emision,
        CO.fecha_vencimiento,
        CO.monto,
        CO.moneda,
        CO.documento,
        CO.observacion,
        CO.recurrente,
        CO.estadocobranza
    FROM
        cobranza AS CO
        INNER JOIN cliente AS CL ON CO.idcliente = CL.idcliente;
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
    nombre_cliente,
    celular_cliente,
    fecha_emision,observacion
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarDetalleCotizacion`(_idcotizacion INT, _fecha_emision TIMESTAMP)
BEGIN
SELECT 
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
    where C.idcotizacion=_idcotizacion AND C.fecha_emision=_fecha_emision;
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
    C.idcliente,
    Cl.nombre_cliente,
    GM.fecha_emision,
    GM.observacion
FROM
    guia_remision as GM INNER JOIN cotizacion as C
    on GM.idcotizacion = C.idcotizacion INNER JOIN cliente as Cl
    on C.idcliente = Cl.idcliente;
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
    M.idmateriaprima, M.nombre_materia,
    M.precio_materia,M.cantidad_materia,M.unidadmedida, P.nombre_proveedor,
    M.descripcion, M.lista_predeterminado
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
    OT.observacion
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
    idproducto, nombre_producto, precio_producto, cantidad_producto, observacion_producto, lista_predeterminado
FROM producto;
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
select idproveedor, nombre_proveedor, rucproveedor, tiporuc, direccion_proveedor, contacto_proveedor, url, cargo_compras from proveedor;
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
    T.idtrabajador, T.nombre_trabajador, R.rol, T.sueldo_trabajador, T.correo_trabajador, T.usuario_trabajador, T.clave_trabajador
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

-- Dump completed on 2024-10-09 13:50:37
