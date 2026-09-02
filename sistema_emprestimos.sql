-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: banco
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'00000000000','João Pereira','Ficticio@email.comm'),(2,'00000000001','Maria Clara','Ficticio@email.comm'),(3,'00000000002','Eduardo Silvestre','Ficticio@email.comm'),(4,'00000000003','Eduarda Silva','Ficticio@email.comm'),(5,'00000000004','Carlos Silva','Ficticio@email.comm'),(6,'00000000005','Ana Souza','Ficticio@email.comm'),(7,'00000000006','Lucas Oliveira','Ficticio@email.comm'),(8,'00000000007','Beatriz Santos','Ficticio@email.comm'),(9,'00000000008','Ricardo Lima','Ficticio@email.comm'),(10,'00000000009','Juliana Costa','Ficticio@email.comm');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimo` (
  `id_emprestimo` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `valor_emprestimo` int DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `qtd_parcelas` int DEFAULT NULL,
  PRIMARY KEY (`id_emprestimo`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES (1,1,5000,'2026-01-10',12),(2,2,12000,'2026-01-15',24),(3,3,2500,'2026-01-20',6),(4,4,30000,'2026-02-02',48),(5,5,1500,'2026-02-10',4),(6,6,7500,'2026-02-18',18),(7,7,4500,'2026-03-01',12),(8,8,20000,'2026-03-05',36),(9,9,3500,'2026-03-12',8),(10,10,6000,'2026-03-22',12);
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacoes`
--

DROP TABLE IF EXISTS `notificacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacoes` (
  `id_notificacao` int NOT NULL AUTO_INCREMENT,
  `id_parcela` int NOT NULL,
  `email_destinatario` varchar(255) NOT NULL,
  `data_envio` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id_notificacao`),
  KEY `id_parcela` (`id_parcela`),
  CONSTRAINT `notificacoes_ibfk_1` FOREIGN KEY (`id_parcela`) REFERENCES `parcelas` (`id_parcela`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacoes`
--

LOCK TABLES `notificacoes` WRITE;
/*!40000 ALTER TABLE `notificacoes` DISABLE KEYS */;
INSERT INTO `notificacoes` VALUES (1,2,'Ficticio@email.comm','2026-09-01 22:57:37','ENVIADO');
/*!40000 ALTER TABLE `notificacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcelas`
--

DROP TABLE IF EXISTS `parcelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parcelas` (
  `id_parcela` int NOT NULL AUTO_INCREMENT,
  `id_emprestimo` int DEFAULT NULL,
  `vencimento_parcela` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `status_pagamento` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_parcela`),
  KEY `id_emprestimo` (`id_emprestimo`),
  CONSTRAINT `parcelas_ibfk_1` FOREIGN KEY (`id_emprestimo`) REFERENCES `emprestimo` (`id_emprestimo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcelas`
--

LOCK TABLES `parcelas` WRITE;
/*!40000 ALTER TABLE `parcelas` DISABLE KEYS */;
INSERT INTO `parcelas` VALUES (1,1,'2026-02-10','2026-02-10',1),(2,2,'2026-02-15',NULL,0),(3,3,'2026-02-20','2026-02-19',1),(4,4,'2026-03-02',NULL,0),(5,5,'2026-03-10','2026-03-12',1),(6,6,'2026-03-18',NULL,0),(7,7,'2026-04-01','2026-03-30',1),(8,8,'2026-04-05',NULL,0),(9,9,'2026-04-12','2026-04-12',1),(10,10,'2026-04-22',NULL,0);
/*!40000 ALTER TABLE `parcelas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-01 23:16:50
