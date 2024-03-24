-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bank_db
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `account_has_card`
--

DROP TABLE IF EXISTS `account_has_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_has_card` (
  `bank_account_idAccount` int NOT NULL,
  `bank_account_ClientID` int NOT NULL,
  `card_idCard` int NOT NULL,
  KEY `fk_bank_account_has_card_card1_idx` (`card_idCard`),
  KEY `fk_bank_account_has_card_bank_account1_idx` (`bank_account_idAccount`,`bank_account_ClientID`),
  CONSTRAINT `fk_bank_account_has_card_bank_account1` FOREIGN KEY (`bank_account_idAccount`, `bank_account_ClientID`) REFERENCES `bank_account` (`idAccount`, `ClientID`),
  CONSTRAINT `fk_bank_account_has_card_card1` FOREIGN KEY (`card_idCard`) REFERENCES `card` (`idCard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_has_card`
--

LOCK TABLES `account_has_card` WRITE;
/*!40000 ALTER TABLE `account_has_card` DISABLE KEYS */;
INSERT INTO `account_has_card` VALUES (1,1,1),(2,2,2),(3,2,2),(4,3,3),(5,3,3);
/*!40000 ALTER TABLE `account_has_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_history`
--

DROP TABLE IF EXISTS `account_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_history` (
  `idAccount_History` int NOT NULL AUTO_INCREMENT,
  `Date` datetime(6) DEFAULT NULL,
  `Transfer` varchar(45) NOT NULL,
  `AccountID` int NOT NULL,
  PRIMARY KEY (`idAccount_History`,`AccountID`),
  KEY `fk_Account_History_Bank_Account1_idx` (`AccountID`),
  CONSTRAINT `fk_Account_History_Bank_Account1` FOREIGN KEY (`AccountID`) REFERENCES `bank_account` (`idAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_history`
--

LOCK TABLES `account_history` WRITE;
/*!40000 ALTER TABLE `account_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_account`
--

DROP TABLE IF EXISTS `bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_account` (
  `idAccount` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(20) DEFAULT NULL,
  `Balance` decimal(10,2) DEFAULT NULL,
  `Credit` decimal(10,2) DEFAULT NULL,
  `ClientID` int NOT NULL,
  PRIMARY KEY (`idAccount`,`ClientID`),
  KEY `fk_Bank_Account_Client1_idx` (`ClientID`),
  CONSTRAINT `fk_Bank_Account_Client1` FOREIGN KEY (`ClientID`) REFERENCES `client` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_account`
--

LOCK TABLES `bank_account` WRITE;
/*!40000 ALTER TABLE `bank_account` DISABLE KEYS */;
INSERT INTO `bank_account` VALUES (1,'Debit',42.00,0.00,1),(2,'Debit',4000.00,0.00,2),(3,'Credit',0.00,2000.00,2),(4,'Debit',10000.00,0.00,3),(5,'Credit',0.00,50000.00,3);
/*!40000 ALTER TABLE `bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `idCard` int NOT NULL AUTO_INCREMENT,
  `Pin` varchar(45) NOT NULL,
  `PinSave` varchar(20) NOT NULL,
  `ClientID` int NOT NULL,
  PRIMARY KEY (`idCard`),
  UNIQUE KEY `Debit_Pin_UNIQUE` (`Pin`),
  KEY `fk_Card_Client_idx` (`ClientID`),
  CONSTRAINT `fk_Card_Client` FOREIGN KEY (`ClientID`) REFERENCES `client` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,'8008','8008',1),(2,'1337','1337',2),(3,'0715','0715',3);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `lName` varchar(45) NOT NULL,
  `fName` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `PhoneNum` varchar(45) NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Pennainen','Pertti','Ahotie 5','0401234567'),(2,'Talola','Kirsti','Teeritie 105','0447762983'),(3,'Manner','Paavo','Paasikatu 80','0409959955');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'test_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-20 14:28:50
