CREATE DATABASE  IF NOT EXISTS `inventario_equipos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inventario_equipos`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: inventario_equipos
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
-- Table structure for table `acta`
--

DROP TABLE IF EXISTS `acta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acta` (
  `num_acta` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT NULL,
  `ser_equipo` int DEFAULT NULL,
  `doc_analista` int DEFAULT NULL,
  PRIMARY KEY (`num_acta`),
  KEY `ser_equipo` (`ser_equipo`),
  KEY `doc_analista` (`doc_analista`),
  CONSTRAINT `acta_ibfk_1` FOREIGN KEY (`ser_equipo`) REFERENCES `equipo` (`serial_equipo`),
  CONSTRAINT `acta_ibfk_2` FOREIGN KEY (`doc_analista`) REFERENCES `analista` (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analista`
--

DROP TABLE IF EXISTS `analista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analista` (
  `documento` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `contacto` varchar(50) DEFAULT NULL,
  `cod_sede` int DEFAULT NULL,
  PRIMARY KEY (`documento`),
  KEY `cod_sede` (`cod_sede`),
  CONSTRAINT `analista_ibfk_1` FOREIGN KEY (`cod_sede`) REFERENCES `sede` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `serial_equipo` int NOT NULL,
  `contrato` int NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `orden_interna` int DEFAULT NULL,
  `cuenta` int DEFAULT NULL,
  `linea_marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `procesador` varchar(50) DEFAULT NULL,
  `disco` varchar(50) DEFAULT NULL,
  `memoria` varchar(50) DEFAULT NULL,
  `software_ad` varchar(50) DEFAULT NULL,
  `n_maquina` varchar(50) DEFAULT NULL,
  `f_activacion` date DEFAULT NULL,
  `f_finalizacion` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `propiedad` varchar(50) DEFAULT NULL,
  `tipo_equipo` varchar(50) DEFAULT NULL,
  `cod_sede` int DEFAULT NULL,
  PRIMARY KEY (`serial_equipo`),
  KEY `cod_sede` (`cod_sede`),
  CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`cod_sede`) REFERENCES `sede` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periferico`
--

DROP TABLE IF EXISTS `periferico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periferico` (
  `serial_periferico` int NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `ser_equipo` int DEFAULT NULL,
  PRIMARY KEY (`serial_periferico`),
  KEY `ser_equipo` (`ser_equipo`),
  CONSTRAINT `periferico_ibfk_1` FOREIGN KEY (`ser_equipo`) REFERENCES `equipo` (`serial_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `resp_sede` varchar(100) DEFAULT NULL,
  `contacto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `documento` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `area` varchar(50) DEFAULT NULL,
  `ser_equipo` int DEFAULT NULL,
  PRIMARY KEY (`documento`),
  KEY `ser_equipo` (`ser_equipo`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ser_equipo`) REFERENCES `equipo` (`serial_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-13 14:25:43
