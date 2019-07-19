-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: books
-- ------------------------------------------------------
-- Server version	5.5.62-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authorisbn`
--

DROP TABLE IF EXISTS `authorisbn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorisbn` (
  `authorID` int(11) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  PRIMARY KEY (`authorID`,`isbn`),
  KEY `fk_authorISBN_2` (`isbn`),
  CONSTRAINT `authorisbn_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `titles` (`isbn`),
  CONSTRAINT `authorisbn_ibfk_1` FOREIGN KEY (`authorID`) REFERENCES `authors` (`authorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorisbn`
--

LOCK TABLES `authorisbn` WRITE;
/*!40000 ALTER TABLE `authorisbn` DISABLE KEYS */;
INSERT INTO `authorisbn` VALUES (1,'0130125075'),(2,'0130125075'),(1,'0130161438'),(2,'0130161438'),(3,'0130161438'),(1,'0130284173'),(2,'0130284173'),(3,'0130284173'),(1,'0130284181'),(2,'0130284181'),(3,'0130284181'),(1,'013028419x'),(2,'013028419x'),(3,'013028419x'),(1,'0130829277'),(2,'0130829277'),(1,'0130829293'),(2,'0130829293'),(3,'0130829293'),(1,'0130852473'),(2,'0130852473'),(1,'0130856118'),(2,'0130856118'),(3,'0130856118'),(1,'0130895601'),(2,'0130895601'),(4,'0130895601'),(1,'0130895717'),(2,'0130895717'),(1,'0130895725'),(2,'0130895725'),(1,'0132261197'),(2,'0132261197'),(1,'0134569555'),(2,'0134569555'),(3,'0134569555'),(1,'0135289106'),(2,'0135289106'),(1,'0138993947'),(2,'0138993947'),(1,'0139163050'),(2,'0139163050');
/*!40000 ALTER TABLE `authorisbn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `authorID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  PRIMARY KEY (`authorID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Harvey','Deitel'),(2,'Paul','Deitel'),(3,'Tem','Nieto'),(4,'Sean','Santry');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `idProducto` FOREIGN KEY (`id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario` FOREIGN KEY (`id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishers` (
  `publisherID` int(11) NOT NULL AUTO_INCREMENT,
  `publisherName` varchar(30) NOT NULL,
  PRIMARY KEY (`publisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Prentice Hall'),(2,'Prentice Hall PTG');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titles` (
  `isbn` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `editionNumber` int(11) NOT NULL,
  `copyright` varchar(4) NOT NULL,
  `publisherID` int(11) NOT NULL,
  `imageFile` varchar(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  PRIMARY KEY (`isbn`),
  KEY `fk_titles` (`publisherID`),
  CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`publisherID`) REFERENCES `publishers` (`publisherID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES ('0130125075','Java How to Program (Java 2)',3,'2000',1,'jhtp3.jpg',70),('0130161438','Internet and World Wide Web How to Program',1,'2000',1,'iw3htp1.jpg',70),('0130284173','XML How to Program',1,'2001',1,'xmlhtp1.jpg',70),('0130284181','Perl How to Program',1,'2001',1,'perlhtp1.jpg',70),('013028419x','e-Business and e-Commerce How to Program',1,'2001',1,'ebechtp1.jpg',70),('0130829277','The Complete Java Training Course (Java 1.1)',2,'1998',2,'javactc2.jpg',100),('0130829293','The Complete Visual Basic 6 Training Course',1,'1999',2,'vbctc1.jpg',110),('0130852473','The Complete Java 2 Training Course',3,'2000',2,'javactc3.jpg',110),('0130856118','The Complete Internet and World Wide Web Programming Training Course',1,'2000',2,'iw3ctc1.jpg',110),('0130895601','Advanced Java 2 Platform How to Program',1,'2002',1,'advjhtp1.jpg',70),('0130895717','C++ How to Program',3,'2001',1,'cpphtp3.jpg',70),('0130895725','C How to Program',3,'2001',1,'chtp3.jpg',70),('0132261197','C How to Program',2,'1994',1,'chtp2.jpg',50),('0134569555','Visual Basic 6 How to Program',1,'1999',1,'vbhtp1.jpg',70),('0135289106','C++ How to Program',2,'1998',1,'cpphtp2.jpg',50),('0138993947','Java How to Program (Java 1.1)',2,'1998',1,'jhtp2.jpg',50),('0139163050','The Complete C++ Training Course',3,'2001',2,'cppctc3.jpg',110);
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-18 23:58:20
