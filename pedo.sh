-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: equiposClinica
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `equiposCli`
--

DROP TABLE IF EXISTS `equiposCli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equiposCli` (
  `idEquip` int(11) NOT NULL AUTO_INCREMENT,
  `EquiposClinicaMacAddress` varchar(50) DEFAULT NULL,
  `EquiposClinicaIp` varchar(50) DEFAULT NULL,
  `EquiposClinicaDescripcion` varchar(50) DEFAULT NULL,
  `EquiposClinicaFechaActualizaci` datetime DEFAULT NULL,
  `EquiposClinicaEstado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEquip`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equiposCli`
--

LOCK TABLES `equiposCli` WRITE;
/*!40000 ALTER TABLE `equiposCli` DISABLE KEYS */;
INSERT INTO `equiposCli` VALUES
(309,'e4:5f:01:1a:3a:d8','192.168.11.62','raspberrypi','2024-10-23 04:36:48','conectado'),
(310,NULL,NULL,NULL,NULL,'conectado'),
(311,NULL,NULL,NULL,NULL,'conectado'),
(312,'e4:5f:01:1a:3a:d9','192.168.41.120','raspberrypi','2024-10-22 09:53:30','conectado'),
(313,'dc:a6:32:a7:59:bd','192.168.11.175','raspberrypi','2024-09-23 11:50:42','conectado'),
(314,NULL,NULL,NULL,NULL,'conectado'),
(315,NULL,NULL,NULL,NULL,'conectado'),
(316,NULL,NULL,NULL,NULL,'conectado'),
(317,NULL,NULL,NULL,NULL,'conectado'),
(318,NULL,NULL,NULL,NULL,'conectado'),
(319,NULL,NULL,NULL,NULL,'conectado'),
(320,NULL,NULL,NULL,NULL,'conectado'),
(321,NULL,NULL,NULL,NULL,'conectado'),
(322,NULL,NULL,NULL,NULL,'conectado'),
(323,NULL,NULL,NULL,NULL,'conectado'),
(324,NULL,NULL,NULL,NULL,'conectado'),
(325,NULL,NULL,NULL,NULL,'conectado'),
(326,NULL,NULL,NULL,NULL,'conectado'),
(327,NULL,NULL,NULL,NULL,'conectado');
/*!40000 ALTER TABLE `equiposCli` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-23  4:40:04
