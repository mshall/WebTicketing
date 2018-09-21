CREATE DATABASE  IF NOT EXISTS `webticketing` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webticketing`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webticketing
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint` (
  `complaint_id` int(11) NOT NULL auto_increment,
  `comments` varchar(255) default NULL,
  `customer_email` varchar(255) default NULL,
  `terminal_id` int(11) default NULL,
  `merchant_id` int(11) default NULL,
  `phone_number` varchar(15) default NULL,
  `complaint_opening_time` datetime default NULL,
  `complaint_closing_time` datetime default NULL,
  `status` varchar(45) default NULL,
  `technician_id` int(11) default NULL,
  `complaint_note` varchar(244) default NULL,
  `complaint_solution` varchar(244) default NULL,
  `merchant_name` varchar(244) default NULL,
  `merchant_city` varchar(244) default NULL,
  `merchant_address` varchar(244) default NULL,
  `terminal_serial` varchar(244) default NULL,
  PRIMARY KEY  (`complaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
INSERT INTO `complaint` VALUES (1,'Hitrd initial comment','mohamed.s.elshall@gmail.com',1,1,'+971505338183','2018-07-27 19:12:06','2018-07-27 19:12:06','open',4,'just notessss','No action takensss','Shall','Dubai','Dubai','1234'),(2,'second complaint','mohamed.s.elshall2011@gmail.com',1,1,'+971505338183','2018-07-27 23:00:00','2018-07-27 23:50:00','Closed',1,'Side note','No action taken','Shall','Cairo','Cairo','456'),(3,'first complaint','shall@gmail.com',1,1,'+201015595938','2018-08-07 01:17:10',NULL,'Open',4,'','','Shall','KFS','KFS','sdf234');
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant`
--

DROP TABLE IF EXISTS `merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant` (
  `merchant_id` int(11) NOT NULL,
  `merchant_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `MCC` varchar(45) default NULL,
  `status` bit(1) default NULL,
  `city` varchar(45) default NULL,
  `street` varchar(45) default NULL,
  `phone1` varchar(11) NOT NULL,
  `phone2` varchar(11) default NULL,
  `vendor` varchar(45) default NULL,
  `contact_person` varchar(45) default NULL,
  `amex_merchant_id` varchar(45) default NULL,
  `premium_id` varchar(45) default NULL,
  `class` varchar(45) default NULL,
  `currency` varchar(45) default NULL,
  PRIMARY KEY  (`merchant_id`),
  UNIQUE KEY `mearchent_email_UNIQUE` (`email`),
  UNIQUE KEY `phone1_UNIQUE` (`phone1`),
  UNIQUE KEY `merchant_name_UNIQUE` (`merchant_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant`
--

LOCK TABLES `merchant` WRITE;
/*!40000 ALTER TABLE `merchant` DISABLE KEYS */;
INSERT INTO `merchant` VALUES (1,'Mr. Merchant','merchant@gmail.com','2222','','Dubai','Dubai st','505338183','2010155959','Spectra','Mohamed S. El-Shall','5589','438888','A','USD'),(2,'Mr. Merchant 2','merchant2@gmail.com','2222','','Dubai','Dubai st','505338184','2010155958','Spectra','Mohamed S. El-Shall','5588','438889','A','USD');
/*!40000 ALTER TABLE `merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_rollpaper`
--

DROP TABLE IF EXISTS `merchant_rollpaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_rollpaper` (
  `id` int(11) NOT NULL auto_increment,
  `merchant_id` int(11) default NULL,
  `roll_paper_id` int(11) default NULL,
  `roll_paper_out_number` int(11) default NULL,
  `meet_sla` varchar(255) default NULL,
  `note` varchar(255) default NULL,
  `merchant_name` varchar(45) default NULL,
  `action_date` datetime default NULL,
  `rollpaper_size` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_rollpaper`
--

LOCK TABLES `merchant_rollpaper` WRITE;
/*!40000 ALTER TABLE `merchant_rollpaper` DISABLE KEYS */;
INSERT INTO `merchant_rollpaper` VALUES (1,2,3,10,'yes meet ofc',NULL,'Mr. Merchant 2','2018-09-21 17:37:30','Large');
/*!40000 ALTER TABLE `merchant_rollpaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rollpaper`
--

DROP TABLE IF EXISTS `rollpaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rollpaper` (
  `roll_paper_id` int(11) NOT NULL auto_increment,
  `roll_paper_size` varchar(45) default NULL,
  `total_in` int(11) default NULL,
  `store_id` int(11) default NULL,
  `store_name` varchar(244) default NULL,
  `out` int(11) default NULL,
  `remaining` int(11) default NULL,
  `action_date` datetime default NULL,
  PRIMARY KEY  (`roll_paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rollpaper`
--

LOCK TABLES `rollpaper` WRITE;
/*!40000 ALTER TABLE `rollpaper` DISABLE KEYS */;
INSERT INTO `rollpaper` VALUES (1,'Small',1000,1,'Shall store',100,900,'2018-07-27 23:00:00'),(2,'Medium',1000,1,'Shall store',5,995,'2018-09-21 17:33:09'),(3,'Large',1000,1,'Shall store',10,990,'2018-09-21 17:37:30');
/*!40000 ALTER TABLE `rollpaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sim`
--

DROP TABLE IF EXISTS `sim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sim` (
  `sim_serial` int(11) NOT NULL,
  `operator` varchar(45) NOT NULL,
  `status` bit(1) default '\0',
  `sim_condition` bit(1) default '\0',
  `store_id` int(11) default NULL,
  `merchant_id` int(11) default NULL,
  `terminal_id` int(11) default NULL,
  `store_name` varchar(245) default NULL,
  `merchant_name` varchar(45) default NULL,
  `terminal_serial` varchar(45) default NULL,
  PRIMARY KEY  (`sim_serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sim`
--

LOCK TABLES `sim` WRITE;
/*!40000 ALTER TABLE `sim` DISABLE KEYS */;
INSERT INTO `sim` VALUES (123456,'Vodafone','','',1,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `store_id` int(11) NOT NULL auto_increment,
  `store_name` varchar(244) default NULL,
  `store_address` varchar(244) default NULL,
  `store_details` varchar(244) default NULL,
  PRIMARY KEY  (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Shall store 2 from postman update','Dubai, UAE','No more details');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal`
--

DROP TABLE IF EXISTS `terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terminal` (
  `terminal_id` int(11) NOT NULL auto_increment,
  `terminal_serial_number` varchar(45) default NULL,
  `merchant_id` int(11) default NULL,
  `store_id` int(11) default NULL,
  `first_sim_serial` int(11) default NULL,
  `second_sim_serial` int(11) default NULL,
  `currency` varchar(45) default NULL,
  `class` varchar(45) default NULL,
  `status` varchar(11) default NULL,
  `deployment_date` datetime default NULL,
  `model` varchar(45) NOT NULL,
  `condition` varchar(45) default NULL,
  `sale` bit(1) default NULL,
  `online_refund` bit(1) default NULL,
  `offline_refund` bit(1) default NULL,
  `offline_sale` bit(1) default NULL,
  `online_void` bit(1) default NULL,
  `offline_void` bit(1) default NULL,
  `preauth` bit(1) default NULL,
  `amex` bit(1) default NULL,
  `installments` bit(1) default NULL,
  `prepaid_services` bit(1) default NULL,
  `diners` bit(1) default NULL,
  `premuim` bit(1) default NULL,
  `manual_entry` bit(1) default NULL,
  `branch` varchar(45) default NULL,
  `created_date` datetime default NULL,
  `store_name` varchar(244) default NULL,
  `tender` varchar(244) default NULL,
  PRIMARY KEY  (`terminal_id`),
  UNIQUE KEY `terminal_id_UNIQUE` (`terminal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal`
--

LOCK TABLES `terminal` WRITE;
/*!40000 ALTER TABLE `terminal` DISABLE KEYS */;
INSERT INTO `terminal` VALUES (1,'22334',1,1,123456,12341,'USD','A','Stocked','2018-07-27 19:12:06','Castles AGVB 666','New','','','','','','','','','','','','','','H branch','2018-08-08 05:46:35','Shall store','المناقصة العامة الاولي'),(2,'66666',2,2,666666,66666,'AED','B','Defected','2018-07-29 19:12:06','BBBBBBB','Used','','','','','','','','','','','','','','H branch','2018-08-08 05:46:35','Shall store','المناقصة العامة الاولي'),(3,'66666',2,2,666666,66666,'AED','B','Deployed','2018-07-29 19:12:06','BBBBBBB','Used','','','','','','','','','','','','','','H branch','2018-08-08 05:46:35','Shall store','المناقصة العامة الاولي');
/*!40000 ALTER TABLE `terminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL auto_increment,
  `username` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `user_type` int(11) default NULL,
  `password` varchar(244) NOT NULL,
  `status` int(11) default NULL,
  `name` varchar(45) default NULL,
  `phone1` varchar(45) default NULL,
  `phone2` varchar(45) default NULL,
  `city` varchar(45) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'shall','mohamed.s.elshall2011@gmail.com',1,'shall',0,NULL,NULL,NULL,NULL),(2,'mohamed','mohamed.s.elshall@gmail.com',2,'mohamed',1,NULL,NULL,NULL,NULL),(3,'mostafa','mostafa.rady@gmail.com',0,'mostafa',0,NULL,NULL,NULL,NULL),(4,'emad','emad@gmail.com',2,'emad',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-21 17:42:37
