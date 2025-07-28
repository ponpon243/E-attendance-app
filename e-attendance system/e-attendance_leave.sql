CREATE DATABASE  IF NOT EXISTS `e-attendance` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `e-attendance`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: e-attendance
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `leave`
--

DROP TABLE IF EXISTS `leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave` (
  `leave_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `leave_start` date NOT NULL,
  `leave_end` date NOT NULL,
  `leave_type` enum('Sick','Vacation','Emergency','Other') NOT NULL,
  `status` enum('Approved','Pending','Denied') DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`leave_id`),
  KEY `leave-emp_idx` (`employee_id`),
  KEY `leave-approve_idx` (`approved_by`),
  CONSTRAINT `leave-approve` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `leave-emp` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave`
--

LOCK TABLES `leave` WRITE;
/*!40000 ALTER TABLE `leave` DISABLE KEYS */;
INSERT INTO `leave` VALUES (1,5,'2025-06-20','2025-06-22','Vacation','Approved',101,'Trip'),(2,6,'2025-06-25','2025-06-26','Sick','Approved',101,'Fever, needs rest'),(3,7,'2025-07-01','2025-07-02','Emergency','Denied',104,'Family emergency'),(4,9,'2025-07-05','2025-07-06','Vacation','Approved',103,'Beach weekend'),(5,4,'2025-07-06','2025-07-06','Other','Pending',104,'Personal errand'),(6,5,'2025-07-08','2025-07-10','Sick','Approved',104,'Hospital checkup'),(7,8,'2025-07-11','2025-07-12','Emergency','Approved',103,'House fire response'),(8,10,'2025-07-07','2025-07-07','Sick','Denied',104,'Flu—but no doc note'),(9,2,'2025-07-09','2025-07-11','Vacation','Approved',102,'Out-of-town leave'),(10,1,'2025-07-05','2025-07-05','Sick','Pending',102,'Migraine, staying home');
/*!40000 ALTER TABLE `leave` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-04 23:27:38
