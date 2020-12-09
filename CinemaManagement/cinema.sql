-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `m_user`
--

DROP TABLE IF EXISTS `m_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_user` (
  `User_ID` char(10) NOT NULL,
  `Password` char(20) DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_user`
--

LOCK TABLES `m_user` WRITE;
/*!40000 ALTER TABLE `m_user` DISABLE KEYS */;
INSERT INTO `m_user` VALUES ('chang','058918'),('James','123456'),('root','111111'),('wxh','123123');
/*!40000 ALTER TABLE `m_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `Movie_ID` char(20) NOT NULL,
  `Release_Time` datetime DEFAULT NULL,
  `Stop_Time` datetime DEFAULT NULL,
  `Diertor` char(20) DEFAULT NULL,
  `num` tinyint DEFAULT NULL,
  PRIMARY KEY (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES ('batman','2020-12-10 12:00:00','2020-12-25 14:00:00','Jon',1),('the bin','2020-12-23 20:00:00','2020-12-23 21:30:00','wxh',1),('当幸福来敲门',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_hall`
--

DROP TABLE IF EXISTS `movie_hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_hall` (
  `MH_Name` char(10) NOT NULL,
  `Cinema_Address` char(50) DEFAULT NULL,
  `Seat_Row` int DEFAULT NULL,
  `Seat_Column` int DEFAULT NULL,
  PRIMARY KEY (`MH_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_hall`
--

LOCK TABLES `movie_hall` WRITE;
/*!40000 ALTER TABLE `movie_hall` DISABLE KEYS */;
INSERT INTO `movie_hall` VALUES ('imax','China',10,9),('no.1','China',10,8);
/*!40000 ALTER TABLE `movie_hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `Seat_ID` varchar(10) NOT NULL,
  `Row_NO` varchar(10) DEFAULT NULL,
  `Column_NO` varchar(10) DEFAULT NULL,
  `MH_ID` char(10) DEFAULT NULL,
  `SP_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Seat_ID`),
  KEY `MH_ID` (`MH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES ('01','1','1','imax','1'),('02','3','1','no.1','1'),('03','3','2','no.1','1'),('134','3','4','no.1','1'),('135','3','5','no.1','1'),('136','3','6','no.1','1'),('137','3','7','no.1','1');
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `select_view`
--

DROP TABLE IF EXISTS `select_view`;
/*!50001 DROP VIEW IF EXISTS `select_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `select_view` AS SELECT 
 1 AS `Ticket_ID`,
 1 AS `Row_NO`,
 1 AS `Column_NO`,
 1 AS `MH_ID`,
 1 AS `Show_Time`,
 1 AS `End_Time`,
 1 AS `Movie_ID`,
 1 AS `User_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `Ticket_ID` char(20) NOT NULL,
  `User_ID` char(10) NOT NULL,
  `SP_ID` varchar(10) NOT NULL,
  `Seat_ID` char(10) NOT NULL,
  PRIMARY KEY (`Ticket_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `ticket_ibfk_2_idx` (`SP_ID`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `m_user` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`SP_ID`) REFERENCES `time_table` (`SP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES ('001','wxh','1','01'),('1342020-12-05','chang','1','134'),('1352020-12-05','chang','1','135'),('1362020-12-05','chang','1','136'),('1372020-12-05','chang','1','137');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_table`
--

DROP TABLE IF EXISTS `time_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_table` (
  `SP_ID` varchar(10) NOT NULL,
  `Price` double DEFAULT NULL,
  `Show_Time` datetime DEFAULT NULL,
  `End_Time` datetime DEFAULT NULL,
  `Movie_ID` char(20) DEFAULT NULL,
  `MH_ID` char(10) DEFAULT NULL,
  PRIMARY KEY (`SP_ID`),
  KEY `Movie_ID` (`Movie_ID`),
  KEY `MH_ID` (`MH_ID`),
  CONSTRAINT `time_table_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`Movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `time_table_ibfk_2` FOREIGN KEY (`MH_ID`) REFERENCES `movie_hall` (`MH_Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_table`
--

LOCK TABLES `time_table` WRITE;
/*!40000 ALTER TABLE `time_table` DISABLE KEYS */;
INSERT INTO `time_table` VALUES ('1',35,'2020-12-25 12:00:00','2020-12-25 14:00:00','batman','no.1'),('2',9,'2020-12-23 20:00:00','2020-12-23 21:30:00','the bin','no.1');
/*!40000 ALTER TABLE `time_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_trigger` AFTER INSERT ON `time_table` FOR EACH ROW begin
	update movie
    set num=num+1
    where new.Movie_ID=movie.Movie_ID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_trigger` AFTER INSERT ON `time_table` FOR EACH ROW begin
	update movie
    set num=num-1
    where new.Movie_ID=movie.Movie_ID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'cinema'
--

--
-- Final view structure for view `select_view`
--

/*!50001 DROP VIEW IF EXISTS `select_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `select_view` (`Ticket_ID`,`Row_NO`,`Column_NO`,`MH_ID`,`Show_Time`,`End_Time`,`Movie_ID`,`User_ID`) AS select `ticket`.`Ticket_ID` AS `Ticket_ID`,`seat`.`Row_NO` AS `Row_NO`,`seat`.`Column_NO` AS `Column_NO`,`seat`.`MH_ID` AS `MH_ID`,`time_table`.`Show_Time` AS `Show_Time`,`time_table`.`End_Time` AS `End_Time`,`time_table`.`Movie_ID` AS `Movie_ID`,`ticket`.`User_ID` AS `User_ID` from (((`ticket` join `seat`) join `m_user`) join `time_table`) where ((`ticket`.`User_ID` = `m_user`.`User_ID`) and (`ticket`.`SP_ID` = `time_table`.`SP_ID`) and (`ticket`.`Seat_ID` = `seat`.`Seat_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-09 23:28:02
