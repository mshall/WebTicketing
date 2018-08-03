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
  `status` int(11) default NULL,
  `technician_id` int(11) default NULL,
  `complaint_note` varchar(244) default NULL,
  `complaint_solution` varchar(244) default NULL,
  PRIMARY KEY  (`complaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `MCC` int(5) default NULL,
  `status` bit(1) default NULL,
  `city` varchar(45) default NULL,
  `street` varchar(45) default NULL,
  `phone1` varchar(11) NOT NULL,
  `phone2` varchar(11) default NULL,
  `currancy` varchar(45) NOT NULL,
  `vendor` varchar(45) default NULL,
  `contact_person` varchar(45) default NULL,
  `amex_merchant_id` int(11) default NULL,
  `premium_id` int(11) default NULL,
  PRIMARY KEY  (`merchant_id`),
  UNIQUE KEY `mearchent_email_UNIQUE` (`email`),
  UNIQUE KEY `phone1_UNIQUE` (`phone1`),
  UNIQUE KEY `merchant_name_UNIQUE` (`merchant_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY  (`sim_serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `terminal`
--

DROP TABLE IF EXISTS `terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terminal` (
  `terminal_id` int(11) NOT NULL auto_increment,
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
  `amex_merchant_id` int(11) default NULL,
  `MCC` int(11) default NULL,
  `premium_merchant_d` int(11) default NULL,
  `merchant_address` varchar(45) default NULL,
  `merchant_city` varchar(45) default NULL,
  `contact_number` varchar(45) default NULL,
  `branch` varchar(45) default NULL,
  PRIMARY KEY  (`terminal_id`),
  UNIQUE KEY `terminal_id_UNIQUE` (`terminal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-03 19:44:23
