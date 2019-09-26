-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sdsfw
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `t_audit_login`
--

DROP TABLE IF EXISTS `t_audit_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_audit_login` (
  `auditlogin_id` varchar(20) NOT NULL,
  `loginaction` char(1) NOT NULL DEFAULT '',
  `logintype` char(3) NOT NULL DEFAULT '',
  `loginstatus` char(1) NOT NULL DEFAULT 'Y',
  `loginip` varchar(30) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  `loginid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`auditlogin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_audit_login`
--

LOCK TABLES `t_audit_login` WRITE;
/*!40000 ALTER TABLE `t_audit_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_audit_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_audit_report`
--

DROP TABLE IF EXISTS `t_audit_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_audit_report` (
  `auditreport_id` varchar(20) NOT NULL,
  `reportname` varchar(255) DEFAULT NULL,
  `starttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `queryby` varchar(100) DEFAULT NULL,
  `criteria` varchar(255) DEFAULT NULL,
  `reporttype` varchar(100) DEFAULT NULL,
  `success_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`auditreport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_audit_report`
--

LOCK TABLES `t_audit_report` WRITE;
/*!40000 ALTER TABLE `t_audit_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_audit_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_setup_app_right`
--

DROP TABLE IF EXISTS `t_setup_app_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_setup_app_right` (
  `APP_RIGHTS_ID` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `APP_RIGHTS_CODE` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `APP_RIGHTS_DESCRIPTION` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `APP_RIGHTS_METHODS` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `APPLICATION_ID` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `CREATED_BY` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  KEY `FKnsxac4r5ly14ku1n97t2aawdu` (`APPLICATION_ID`),
  CONSTRAINT `FKnsxac4r5ly14ku1n97t2aawdu` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `t_setup_application` (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_setup_app_right`
--

LOCK TABLES `t_setup_app_right` WRITE;
/*!40000 ALTER TABLE `t_setup_app_right` DISABLE KEYS */;
INSERT INTO `t_setup_app_right` VALUES ('2','AddApplication','Allow to add Add Internal Application.','addApplication, addApplicationEdit, loadAddApplicationPage, processSearchApplication','4','admin','2010-12-29 17:18:03','admin','2013-10-31 16:53:40'),('3','AddUser','Allow to add Add Internal User.','addUser, addUserEdit, loadAddUserPage, processSearchUser','4','admin','2010-12-29 17:18:03','admin','2013-10-31 16:53:40'),('Br46QZuWXpYvaZmS','AddNewRight','Add new access right','processAddRights','2','admin','2010-12-29 17:18:03','admin','2013-10-31 14:39:18'),('NZZNUZ9vzsGftu3S','DeleteExistingRight','Delete the existing right','processDeleteRights','2','admin','2010-12-29 17:18:03','admin','2013-10-31 14:39:18'),('qUdcJTRB7EjmzeJ5','processDeleteParam','right to delete parameter','processDeleteParam','zPy822Vs69eRHeKJ','admin','2010-12-29 17:18:03','admin','2013-10-30 14:48:01'),('SLqdjPc3TcEdUAup','processAddParam','right to add new parameter','processAddParam','zPy822Vs69eRHeKJ','admin','2010-12-29 17:18:03','admin','2013-10-30 14:48:01'),('YPUJruUdLJWsBWyv','ADDDELWFGROUP','Add and Delete Workflow User Group','loadAddWfGroup, processDeleteWfGroup, processSearchWfGroup, addWfGroup, addWfGroupCancel','ZbtRZNRtWtNNtDqz','admin','2010-12-29 17:18:03','admin','2013-10-30 16:40:38'),('yrHLcFhcLYNvXTJU','ADDDELGROUP','Add and Delete User Group','loadAddGroup, processDeleteGroup, processSearchGroup, addGroup, addGroupCancel','ZbtRZNRtWtNNtDqz','admin','2010-12-29 17:18:03','admin','2013-10-30 16:40:38'),('1550987727449tnneWL0','right1','Right1',NULL,'1550987727402d3CN2F0','admin','2019-02-24 05:55:27','admin','2019-03-19 10:32:22'),('1552285502882HMhXaj0','childMgmt','Childred Mgmt',NULL,'15522855028515wnCBD0','admin','2019-03-11 06:25:03','admin','2019-03-18 16:04:21'),('1552878185295e8brPh0','viewInfor','View Parent Information',NULL,'15522855028515wnCBD0','admin','2019-03-18 11:03:05','admin','2019-03-18 16:04:21'),('1552878185295ZrE6rP0','viewFullInfor','Vew All Parent Information',NULL,'15522855028515wnCBD0','admin','2019-03-18 11:03:05','admin','2019-03-18 16:04:21'),('1552962742215Ec3b2K0','right2','Right2',NULL,'1550987727402d3CN2F0','admin','2019-03-19 10:32:22','admin','2019-03-19 10:32:22');
/*!40000 ALTER TABLE `t_setup_app_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_setup_app_right_method`
--

DROP TABLE IF EXISTS `t_setup_app_right_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_setup_app_right_method` (
  `right_method_id` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `app_rights_id` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `method_str` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `created_by` varchar(65) COLLATE latin1_general_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(65) COLLATE latin1_general_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`right_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_setup_app_right_method`
--

LOCK TABLES `t_setup_app_right_method` WRITE;
/*!40000 ALTER TABLE `t_setup_app_right_method` DISABLE KEYS */;
INSERT INTO `t_setup_app_right_method` VALUES ('13831224387888hKRBz0','YPUJruUdLJWsBWyv','addWfGroup','admin','2013-10-30 16:40:38','admin','2013-10-30 16:40:38'),('1383122438788d5y52V0','YPUJruUdLJWsBWyv','addWfGroupCancel','admin','2013-10-30 16:40:38','admin','2013-10-30 16:40:38'),('1383122438789aPXH4y0','YPUJruUdLJWsBWyv','processSearchWfGroup','admin','2013-10-30 16:40:38','admin','2013-10-30 16:40:38'),('1383122438789ST4JYH0','YPUJruUdLJWsBWyv','loadAddWfGroup','admin','2013-10-30 16:40:38','admin','2013-10-30 16:40:38'),('1383122438789t5MhVv0','YPUJruUdLJWsBWyv','processDeleteWfGroup','admin','2013-10-30 16:40:38','admin','2013-10-30 16:40:38'),('1383122438890eFnVGP0','yrHLcFhcLYNvXTJU','addGroup','admin','2013-10-30 16:40:38','admin','2013-10-30 16:40:38'),('13831224388914B7b9z0','yrHLcFhcLYNvXTJU','addGroupCancel','admin','2013-10-30 16:40:38','admin','2013-10-30 16:40:38'),('1383122438892D8fqqq0','yrHLcFhcLYNvXTJU','loadAddGroup','admin','2013-10-30 16:40:38','admin','2013-10-30 16:40:38'),('138312243889638pmWV0','yrHLcFhcLYNvXTJU','processDeleteGroup','admin','2013-10-30 16:40:38','admin','2013-10-30 16:40:38'),('1383122438896nMv9am0','yrHLcFhcLYNvXTJU','processSearchGroup','admin','2013-10-30 16:40:38','admin','2013-10-30 16:40:38'),('138320962027854QQju0','2','addApplication','admin','2013-10-31 16:53:40','admin','2013-10-31 16:53:40'),('1383209620279HtFpKn0','2','processSearchApplication','admin','2013-10-31 16:53:40','admin','2013-10-31 16:53:40'),('1383209620279KW8fex0','2','loadAddApplicationPage','admin','2013-10-31 16:53:40','admin','2013-10-31 16:53:40'),('1383209620279Q6tpzd0','2','addApplicationEdit','admin','2013-10-31 16:53:40','admin','2013-10-31 16:53:40'),('1383209620316aB6dxc0','3','processSearchUser','admin','2013-10-31 16:53:40','admin','2013-10-31 16:53:40'),('1383209620316ec5eBb0','3','addUserEdit','admin','2013-10-31 16:53:40','admin','2013-10-31 16:53:40'),('1383209620316LVZt3f0','3','loadAddUserPage','admin','2013-10-31 16:53:40','admin','2013-10-31 16:53:40'),('1383209620316Vw3p290','3','addUser','admin','2013-10-31 16:53:40','admin','2013-10-31 16:53:40'),('1441165431374G4aRtn0','qUdcJTRB7EjmzeJ5','processDeleteParam','admin','2015-09-02 11:43:51','admin','2015-09-02 11:43:51'),('1441165431383LQuzKZ0','SLqdjPc3TcEdUAup','processAddParam','admin','2015-09-02 11:43:51','admin','2015-09-02 11:43:51'),('1441171653129UzG6SK0','Br46QZuWXpYvaZmS','processAddRights','admin','2015-09-02 13:27:33','admin','2015-09-02 13:27:33'),('1441171653131zejQ7d0','NZZNUZ9vzsGftu3S','processDeleteRights','admin','2015-09-02 13:27:33','admin','2015-09-02 13:27:33'),('1552896260532N5fDn30','1552878185295e8brPh0','loadInfor','admin','2019-03-18 16:04:21','admin','2019-03-18 16:04:21'),('1552896260532SadHtN0','1552285502882HMhXaj0','processDeleteChild','admin','2019-03-18 16:04:21','admin','2019-03-18 16:04:21'),('1552896260532sGKP8c0','1552285502882HMhXaj0','processAddGrandChild','admin','2019-03-18 16:04:21','admin','2019-03-18 16:04:21'),('1552896260532u8LbeL0','1552285502882HMhXaj0','processAddChild','admin','2019-03-18 16:04:21','admin','2019-03-18 16:04:21'),('1552896260532xuKavm0','1552878185295ZrE6rP0','loadFullInfor','admin','2019-03-18 16:04:21','admin','2019-03-18 16:04:21'),('1552962742215uFNyR40','1550987727449tnneWL0','right1','admin','2019-03-19 10:32:22','admin','2019-03-19 10:32:22'),('1552962742215ve7Xh70','1552962742215Ec3b2K0','right2','admin','2019-03-19 10:32:22','admin','2019-03-19 10:32:22');
/*!40000 ALTER TABLE `t_setup_app_right_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_setup_application`
--

DROP TABLE IF EXISTS `t_setup_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_setup_application` (
  `APPLICATION_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `APPLICATION_CODE` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `APPLICATION_NAME` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `APPLICATION_TYPE` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `ACTION_NAME` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `RETRIEVE_RIGHT` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATE_RIGHT` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `DELETE_RIGHT` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATE_RIGHT` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `PRINT_RIGHT` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `EXTRA_RIGHT1` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `EXTRA_RIGHT2` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `ATTACHED_MODULE_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `CREATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  `SYSTEM_APP` char(1) COLLATE latin1_general_ci DEFAULT 'N',
  `ACTION_CLASS` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `APPLICATION_ORDER` int(11) DEFAULT NULL,
  `HIDDEN` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `SYSTEM_TYPE` varchar(3) COLLATE latin1_general_ci DEFAULT 'DEF',
  `show_in_main_order` int(3) DEFAULT '1',
  `show_in_main` char(1) COLLATE latin1_general_ci DEFAULT 'N',
  `remark` varchar(150) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`APPLICATION_ID`),
  KEY `FKc2o2xmpxa9ywm4pwb9ystw74i` (`ATTACHED_MODULE_ID`),
  CONSTRAINT `FKc2o2xmpxa9ywm4pwb9ystw74i` FOREIGN KEY (`ATTACHED_MODULE_ID`) REFERENCES `t_setup_module` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_setup_application`
--

LOCK TABLES `t_setup_application` WRITE;
/*!40000 ALTER TABLE `t_setup_application` DISABLE KEYS */;
INSERT INTO `t_setup_application` VALUES ('14543870315963XwRG30','Parameter','System Parameter','A','dynamicAction?action=Parameter&retrieve=n','Y','Y','N','Y','N','N','N','1','admin','2016-02-02 12:23:51','admin','2017-05-18 12:11:14','Y','ParameterAction',0,'N','DEF',1,'N',NULL),('1550987727402d3CN2F0','Sample','Sample Form','A','loadSample','N','N','N','Y','N','N','N','15522771081666GyN2x0',NULL,'2019-02-24 05:55:27','admin','2019-03-19 10:32:22','N','SampleAction',0,'N','DEF',2,'N','remark1'),('15522855028515wnCBD0','Parent','1 to Many Relation Sample','A','dynamicAction?action=Parent&retrieve=n','Y','Y','Y','Y','Y','N','N','15522771081666GyN2x0',NULL,'2019-03-11 06:25:03','admin','2019-03-18 16:04:21','N','ParentAction',0,'N','DEF',1,'N',''),('2','Application','Application Setup','A','dynamicAction?action=Application&retrieve=n','Y','Y','Y','Y','N','N','N','1','thoth','2010-12-29 17:21:39','admin','2015-09-02 13:27:33','Y','ApplicationAction',20,'N','DEF',1,'N',NULL),('3','Module','Module Setup','A','dynamicAction?action=Module&retrieve=n','Y','Y','Y','Y','Y','N','N','1','thoth','2010-12-29 17:21:39','thoth','2010-12-29 17:21:39','Y','ModuleAction',10,'N','DEF',1,'N',NULL),('4','UserGroup','User Group Setup','A','dynamicAction?action=UserGroup&retrieve=n','Y','Y','Y','Y','N','N','N','1','thoth','2010-12-29 17:21:39','admin','2013-10-31 16:53:40','Y','UserGroupAction',110,'N','DEF',1,'N',NULL),('tNbNdt56Drs4mzb8','SetupNotification','Notification Setup','A','dynamicAction?action=SetupNotification&retrieve=n','Y','Y','Y','Y','Y','N','N','1','thoth','2010-12-29 17:21:39','thoth','2010-12-29 17:21:39','N','SetupNotificationAction',495,'N','DEF',1,'N',NULL),('ZbtRZNRtWtNNtDqz','User','User Setup','A','dynamicAction?action=User&retrieve=n','Y','Y','Y','Y','Y','N','N','1','thoth','2010-12-29 17:21:39','admin','2013-10-30 16:40:38','Y','UserAction',100,'N','DEF',1,'N',NULL),('zPy822Vs69eRHeKJ','AutoEmail','Email/SMS Setup','A','dynamicAction?action=AutoEmail&retrieve=n','Y','Y','Y','Y','Y','N','N','1','thoth','2010-12-29 17:21:39','admin','2013-10-30 14:48:01','N','AutoEmailAction',490,'N','DEF',1,'N',NULL);
/*!40000 ALTER TABLE `t_setup_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_setup_autoemail`
--

DROP TABLE IF EXISTS `t_setup_autoemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_setup_autoemail` (
  `AUTO_EMAIL_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `CODE` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `DESCS` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `ACTION_NAME` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `METHOD_NAME` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `ACTION_STATUS` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `CREATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `NO_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `MAIL_TO` varchar(150) COLLATE latin1_general_ci DEFAULT NULL,
  `MAIL_CCTO` varchar(150) COLLATE latin1_general_ci DEFAULT NULL,
  `MAIL_BCCTO` varchar(150) COLLATE latin1_general_ci DEFAULT NULL,
  `AUTO_TYPE` varchar(3) COLLATE latin1_general_ci DEFAULT NULL,
  `ENABLE` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`AUTO_EMAIL_ID`),
  KEY `FKess4a53n5der53yloyr2ab9qi` (`NO_ID`),
  CONSTRAINT `FKess4a53n5der53yloyr2ab9qi` FOREIGN KEY (`NO_ID`) REFERENCES `t_setup_notification` (`no_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_setup_autoemail`
--

LOCK TABLES `t_setup_autoemail` WRITE;
/*!40000 ALTER TABLE `t_setup_autoemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_setup_autoemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_setup_autoemail_param`
--

DROP TABLE IF EXISTS `t_setup_autoemail_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_setup_autoemail_param` (
  `PARAM_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `PARAM_NAME` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `RETRIEVE_FROM` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `CREATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `AUTO_EMAIL_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`PARAM_ID`),
  KEY `FK6fkh6utmnjstklhni5kgc0vk4` (`AUTO_EMAIL_ID`),
  CONSTRAINT `FK6fkh6utmnjstklhni5kgc0vk4` FOREIGN KEY (`AUTO_EMAIL_ID`) REFERENCES `t_setup_autoemail` (`AUTO_EMAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_setup_autoemail_param`
--

LOCK TABLES `t_setup_autoemail_param` WRITE;
/*!40000 ALTER TABLE `t_setup_autoemail_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_setup_autoemail_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_setup_group`
--

DROP TABLE IF EXISTS `t_setup_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_setup_group` (
  `UG_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `GROUP_CODE` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `GROUP_NAME` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `GROUP_TYPE` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`UG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_setup_group`
--

LOCK TABLES `t_setup_group` WRITE;
/*!40000 ALTER TABLE `t_setup_group` DISABLE KEYS */;
INSERT INTO `t_setup_group` VALUES ('6','AdminGroup','Administrator Group',NULL,'admin','2010-12-29 17:26:24','admin','2019-09-05 10:28:07');
/*!40000 ALTER TABLE `t_setup_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_setup_group_app`
--

DROP TABLE IF EXISTS `t_setup_group_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_setup_group_app` (
  `UG_APP_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `UG_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `APPLICATION_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `RETRIEVE_RIGHT` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATE_RIGHT` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `DELETE_RIGHT` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATE_RIGHT` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `PRINT_RIGHT` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `EXTRA_RIGHT1` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `EXTRA_RIGHT2` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`UG_APP_ID`),
  KEY `FKg5vj0tv03swof2tix1j9qskav` (`APPLICATION_ID`),
  KEY `FK4t4kmvdlye3oo2g3at3to2dih` (`UG_ID`),
  CONSTRAINT `FK4t4kmvdlye3oo2g3at3to2dih` FOREIGN KEY (`UG_ID`) REFERENCES `t_setup_group` (`UG_ID`),
  CONSTRAINT `FKg5vj0tv03swof2tix1j9qskav` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `t_setup_application` (`APPLICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_setup_group_app`
--

LOCK TABLES `t_setup_group_app` WRITE;
/*!40000 ALTER TABLE `t_setup_group_app` DISABLE KEYS */;
INSERT INTO `t_setup_group_app` VALUES ('1552286295023P8DCjb0','6','15522855028515wnCBD0','Y','Y','Y','Y','Y','N','N','admin','2019-03-11 06:38:15','admin','2019-09-05 10:28:07'),('1552545321324wdP9Fb0','6','14543870315963XwRG30','Y','Y','N','Y','N','N','N','admin','2019-03-14 14:35:21','admin','2019-09-05 10:28:07'),('1552896510193EaPB7Q0','6','1550987727402d3CN2F0','N','N','N','Y','N','N','N','admin','2019-03-18 16:08:30','admin','2019-09-05 10:28:07'),('35','6','2','Y','Y','Y','Y','N','N','N','admin','2010-12-29 17:27:54','admin','2019-09-05 10:28:07'),('36','6','3','Y','Y','Y','Y','Y','N','N','admin','2010-12-29 17:27:54','admin','2019-09-05 10:28:07'),('37','6','4','Y','Y','Y','Y','N','N','N','admin','2010-12-29 17:27:54','admin','2019-09-05 10:28:07'),('cvan5sHQ2MQ9u3wu','6','tNbNdt56Drs4mzb8','Y','Y','Y','Y','Y','N','N','admin','2010-12-29 17:27:54','admin','2019-09-05 10:28:07'),('qCE2973tDGbhdXsb','6','zPy822Vs69eRHeKJ','Y','Y','Y','Y','Y','N','N','admin','2010-12-29 17:27:54','admin','2019-09-05 10:28:07'),('Vs3WZfNQLQz4vXr7','6','ZbtRZNRtWtNNtDqz','Y','Y','Y','Y','Y','N','N','admin','2010-12-29 17:27:54','admin','2019-09-05 10:28:07');
/*!40000 ALTER TABLE `t_setup_group_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_setup_group_app_right`
--

DROP TABLE IF EXISTS `t_setup_group_app_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_setup_group_app_right` (
  `UG_APP_RIGHT_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `UG_APP_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `APP_RIGHTS_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `HASRIGHT` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`UG_APP_RIGHT_ID`),
  KEY `FK_t_setup_group_app_right` (`UG_APP_ID`),
  CONSTRAINT `FK_t_setup_group_app_right` FOREIGN KEY (`UG_APP_ID`) REFERENCES `t_setup_group_app` (`UG_APP_ID`),
  CONSTRAINT `FKj42k2fnl0xgrr20ciq77me48x` FOREIGN KEY (`UG_APP_ID`) REFERENCES `t_setup_group_app` (`UG_APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_setup_group_app_right`
--

LOCK TABLES `t_setup_group_app_right` WRITE;
/*!40000 ALTER TABLE `t_setup_group_app_right` DISABLE KEYS */;
INSERT INTO `t_setup_group_app_right` VALUES ('1383182715943CYY8Cd0','35','Br46QZuWXpYvaZmS','N','admin','2013-10-31 09:25:15','admin','2013-10-31 09:25:15'),('1383182715953B3GPKh0','35','NZZNUZ9vzsGftu3S','N','admin','2013-10-31 09:25:15','admin','2013-10-31 09:25:15'),('1383182715960XLsuCc0','37','2','N','admin','2013-10-31 09:25:15','admin','2013-10-31 09:25:15'),('1383182715960xmz7mG0','37','3','N','admin','2013-10-31 09:25:15','admin','2013-10-31 09:25:15'),('1383182715992MQhrt60','qCE2973tDGbhdXsb','qUdcJTRB7EjmzeJ5','N','admin','2013-10-31 09:25:15','admin','2013-10-31 09:25:15'),('1383182715992ULRSAj0','qCE2973tDGbhdXsb','SLqdjPc3TcEdUAup','N','admin','2013-10-31 09:25:15','admin','2013-10-31 09:25:15'),('1383182716084Tn7FwT0','Vs3WZfNQLQz4vXr7','yrHLcFhcLYNvXTJU','N','admin','2013-10-31 09:25:16','admin','2013-10-31 09:25:16'),('1383182716084UK6vnJ0','Vs3WZfNQLQz4vXr7','YPUJruUdLJWsBWyv','N','admin','2013-10-31 09:25:16','admin','2013-10-31 09:25:16'),('1388481409933eMV4Cs0','35','NZZNUZ9vzsGftu3S','N','admin','2013-12-31 17:16:49','admin','2013-12-31 17:16:49'),('1388481409933Tu59Pm0','35','Br46QZuWXpYvaZmS','N','admin','2013-12-31 17:16:49','admin','2013-12-31 17:16:49'),('1388481409938a6Ldah0','37','2','N','admin','2013-12-31 17:16:49','admin','2013-12-31 17:16:49'),('1388481409938vCTcCL0','37','3','N','admin','2013-12-31 17:16:49','admin','2013-12-31 17:16:49'),('1388481409979HmYFCY0','qCE2973tDGbhdXsb','qUdcJTRB7EjmzeJ5','N','admin','2013-12-31 17:16:49','admin','2013-12-31 17:16:49'),('1388481409979XwccLr0','qCE2973tDGbhdXsb','SLqdjPc3TcEdUAup','N','admin','2013-12-31 17:16:49','admin','2013-12-31 17:16:49'),('1388481410073UMbqBr0','Vs3WZfNQLQz4vXr7','YPUJruUdLJWsBWyv','N','admin','2013-12-31 17:16:50','admin','2013-12-31 17:16:50'),('1388481410074Q9jtpu0','Vs3WZfNQLQz4vXr7','yrHLcFhcLYNvXTJU','N','admin','2013-12-31 17:16:50','admin','2013-12-31 17:16:50'),('1552286295039AB7Kzn0','1552286295023P8DCjb0','1552285502882HMhXaj0','Y','admin','2019-03-11 06:38:15','admin','2019-09-05 10:28:07'),('15528965101614dnwJm0','1552286295023P8DCjb0','1552878185295ZrE6rP0','N','admin','2019-03-18 16:08:30','admin','2019-09-05 10:28:07'),('15528965101616NHjWb0','1552286295023P8DCjb0','1552878185295e8brPh0','N','admin','2019-03-18 16:08:30','admin','2019-09-05 10:28:07'),('1552896510193jnEdwS0','1552896510193EaPB7Q0','1550987727449tnneWL0','N','admin','2019-03-18 16:08:30','admin','2019-09-05 10:28:07'),('1552965908623XWTFtW0','1552896510193EaPB7Q0','1552962742215Ec3b2K0','N','admin','2019-03-19 11:25:09','admin','2019-09-05 10:28:07'),('4','37','2','N','admin','2010-12-29 17:28:53','admin','2019-09-05 10:28:07'),('4jM5MvPqrZDSEEap','35','NZZNUZ9vzsGftu3S','Y','admin','2010-12-29 17:28:53','admin','2019-09-05 10:28:07'),('7','37','3','N','admin','2010-12-29 17:28:53','admin','2019-09-05 10:28:07'),('apmGNcHQ6CQZhZNp','Vs3WZfNQLQz4vXr7','yrHLcFhcLYNvXTJU','N','admin','2010-12-29 17:28:53','admin','2019-09-05 10:28:07'),('EV8JbdtzYwezcGcF','qCE2973tDGbhdXsb','SLqdjPc3TcEdUAup','N','admin','2010-12-29 17:28:53','admin','2019-09-05 10:28:07'),('JGTFzNVr4qnuhSXu','35','Br46QZuWXpYvaZmS','Y','admin','2010-12-29 17:28:53','admin','2019-09-05 10:28:07'),('UtqCBZKLb8yEybxA','Vs3WZfNQLQz4vXr7','YPUJruUdLJWsBWyv','N','admin','2010-12-29 17:28:53','admin','2019-09-05 10:28:07'),('ZF6qHejwbYxKYp5v','qCE2973tDGbhdXsb','qUdcJTRB7EjmzeJ5','N','admin','2010-12-29 17:28:53','admin','2019-09-05 10:28:07');
/*!40000 ALTER TABLE `t_setup_group_app_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_setup_group_user`
--

DROP TABLE IF EXISTS `t_setup_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_setup_group_user` (
  `UG_USER_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `UG_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `US_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `CREATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`UG_USER_ID`),
  KEY `FKqsg2ohygqcq1r53oq49q66g4j` (`US_ID`),
  KEY `FK41542gykxw50cldbpo0bnpct1` (`UG_ID`),
  CONSTRAINT `FK41542gykxw50cldbpo0bnpct1` FOREIGN KEY (`UG_ID`) REFERENCES `t_setup_group` (`UG_ID`),
  CONSTRAINT `FKqsg2ohygqcq1r53oq49q66g4j` FOREIGN KEY (`US_ID`) REFERENCES `t_setup_user` (`us_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_setup_group_user`
--

LOCK TABLES `t_setup_group_user` WRITE;
/*!40000 ALTER TABLE `t_setup_group_user` DISABLE KEYS */;
INSERT INTO `t_setup_group_user` VALUES ('19','6','10','admin','2010-12-29 17:30:00','admin','2010-12-29 17:30:00');
/*!40000 ALTER TABLE `t_setup_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_setup_module`
--

DROP TABLE IF EXISTS `t_setup_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_setup_module` (
  `MODULE_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `MODULE_CODE` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `MODULE_NAME` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `MODULE_TYPE` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `PARENT_MODULE_ID` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  `MODULE_ORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`MODULE_ID`),
  KEY `FK9pugn6niisq18q4anwgsf2j6c` (`PARENT_MODULE_ID`),
  CONSTRAINT `FK9pugn6niisq18q4anwgsf2j6c` FOREIGN KEY (`PARENT_MODULE_ID`) REFERENCES `t_setup_module` (`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_setup_module`
--

LOCK TABLES `t_setup_module` WRITE;
/*!40000 ALTER TABLE `t_setup_module` DISABLE KEYS */;
INSERT INTO `t_setup_module` VALUES ('1','SAM','System Administration','M',NULL,'admin','2010-12-29 17:31:04','admin','2010-12-30 17:20:50',0),('15522771081666GyN2x0','Sample','Sample','M',NULL,'admin','2019-03-11 04:05:08','admin','2019-03-11 04:05:08',1);
/*!40000 ALTER TABLE `t_setup_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_setup_notification`
--

DROP TABLE IF EXISTS `t_setup_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_setup_notification` (
  `NO_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `NO_TYPE` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `NO_DESC` varchar(1000) COLLATE latin1_general_ci DEFAULT NULL,
  `NO_SMS` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `NO_EMAIL` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `NO_DEFAULT_SENDER` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `NO_TEMPLATE_SUBJECT` varchar(1000) COLLATE latin1_general_ci DEFAULT NULL,
  `NO_TEMPLATE_BODY` varchar(4000) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `CREATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`NO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_setup_notification`
--

LOCK TABLES `t_setup_notification` WRITE;
/*!40000 ALTER TABLE `t_setup_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_setup_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_setup_seq`
--

DROP TABLE IF EXISTS `t_setup_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_setup_seq` (
  `seq_id` varchar(255) NOT NULL,
  `seq_last_no` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_setup_seq`
--

LOCK TABLES `t_setup_seq` WRITE;
/*!40000 ALTER TABLE `t_setup_seq` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_setup_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_setup_user`
--

DROP TABLE IF EXISTS `t_setup_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_setup_user` (
  `US_ID` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `US_USER_ID` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `US_USER_NAME` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `US_PASSWORD` varchar(150) COLLATE latin1_general_ci DEFAULT NULL,
  `US_EMAIL` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `US_STATUS` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `US_ADMIN` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `US_LAST_LOGIN_DATE` datetime DEFAULT NULL,
  `CREATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  `US_DIVISION` varchar(3) COLLATE latin1_general_ci DEFAULT NULL,
  `US_LDAP` char(1) COLLATE latin1_general_ci DEFAULT 'N',
  `resetPassCode` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `us_nationality` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `us_fail_attempt_count` int(1) DEFAULT '3',
  `us_fail_login_date` datetime DEFAULT NULL,
  `us_pass_last_change_date` datetime DEFAULT NULL,
  `us_activation_code` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  `us_id_number` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`US_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_setup_user`
--

LOCK TABLES `t_setup_user` WRITE;
/*!40000 ALTER TABLE `t_setup_user` DISABLE KEYS */;
INSERT INTO `t_setup_user` VALUES ('10','admin','Administrator','5f 4d cc 3b 5a a7 65 d6 1d 83 27 de b8 82 cf 99 ','user@user.com.my','Y','Y','2019-09-05 10:36:01','admin','2010-12-29 17:04:04','admin','2010-12-29 17:04:04','01','N',NULL,NULL,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_setup_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_system_parameter`
--

DROP TABLE IF EXISTS `t_system_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_system_parameter` (
  `parameter_id` varchar(20) NOT NULL,
  `system_code` varchar(50) NOT NULL DEFAULT '',
  `system_descs` varchar(50) DEFAULT NULL,
  `parameter_code` varchar(50) NOT NULL DEFAULT '',
  `parameter_descs` varchar(200) NOT NULL DEFAULT '',
  `parameter_value` varchar(100) NOT NULL DEFAULT '',
  `value_explaination` varchar(200) DEFAULT NULL,
  `parameter_setup` varchar(100) DEFAULT NULL,
  `group_code` varchar(30) DEFAULT NULL COMMENT 'group and order of the group',
  `group_item_order` int(5) DEFAULT NULL,
  `field_indicator` varchar(10) DEFAULT NULL COMMENT 'input, spacer, label, header',
  `field_input_label` varchar(50) DEFAULT NULL COMMENT 'only put here if indicator is label and this text will be shown at input area',
  `descs_width` varchar(5) DEFAULT NULL COMMENT 'width of the description field, null/empty for default',
  `numericJavascript` varchar(200) DEFAULT NULL COMMENT 'javascript for numeric field control',
  `req_field` char(1) DEFAULT 'N',
  `created_by` varchar(65) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(65) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `wf_system` varchar(10) NOT NULL,
  PRIMARY KEY (`parameter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_system_parameter`
--

LOCK TABLES `t_system_parameter` WRITE;
/*!40000 ALTER TABLE `t_system_parameter` DISABLE KEYS */;
INSERT INTO `t_system_parameter` VALUES ('1495093525962netVLa0','sample','**Sample Parameter Setup','GetInfoMethod','Use URL or DB to get User Information','URL','Use URL or DB to get User Information','radio;CL;getUserDetailOption','eqp',10,'input',NULL,NULL,NULL,'N','admin','2017-05-18 15:45:25','admin','2017-05-18 15:45:25','4'),('1495093525972EsBavK0','sample','**Sample Parameter Setup','URL_Header','If get User Information using URL, Please supply:','','If get User Information using URL, Please supply:',NULL,'eqp',20,'header',NULL,NULL,NULL,'N','admin','2017-05-18 15:45:25','admin','2017-05-18 15:45:25','4'),('1495093525973NtTGbv0','sample','**Sample Parameter Setup','UserInfo','URL to get the user information by userId','http://localhost:8084/eSPA/getUserInfoLogin?wfUserId=','URL to get the user information by userId','textfield;100','eqp',40,'input',NULL,NULL,NULL,'N','admin','2017-05-18 15:45:25','admin','2017-05-18 15:45:25','4'),('1495093525973QwLynF0','sample','**Sample Parameter Setup','GetInfo','URL to get the information/data','http://localhost:8084/eSPA/getInfoLogin?dataName=','URL to get the information/data','textfield;100','eqp',45,'input',NULL,NULL,NULL,'N','admin','2017-05-18 15:45:25','admin','2017-05-18 15:45:25','4'),('1495093525973UUUmUh0','sample','**Sample Parameter Setup','DB_Header','If get User Information using Direct DB Connection, Please supply:','','If get User Information using Direct DB Connection, Please supply:',NULL,'eqp',50,'header',NULL,NULL,NULL,'N','admin','2017-05-18 15:45:25','admin','2017-05-18 15:45:25','4'),('1495093525973wPxvE60','sample','**Sample Parameter Setup','GroupInfo','URL to get the emails of group/role','http://localhost:8084/eSPA/getGroupInfoLogin?wfGroupId=','URL to get the emails of group/role','textfield;100','eqp',30,'input',NULL,NULL,NULL,'N','admin','2017-05-18 15:45:25','admin','2017-05-18 15:45:25','4'),('14950935259742AmnY80','sample','**Sample Parameter Setup','SenderHeader','Default Name and Email of Sender','','Default Name and Email of Sender',NULL,'eqp',80,'header',NULL,NULL,NULL,'N','admin','2017-05-18 15:45:25','admin','2017-05-18 15:45:25','4'),('1495093525974CRGLc30','sample','**Sample Parameter Setup','DbURL','Database Connection URL','1','Database Connection URL','select;m;1__Item 1|2__Item 2|3__Item 3|4__Item 4|5__Item 5','eqp',70,'input',NULL,NULL,NULL,'N','admin','2017-05-18 15:45:25','admin','2017-05-18 15:45:25','4'),('1495093525974tq9chz0','sample','**Sample Parameter Setup','DbType','Type of DBMS','MySQL','Type of DBMS','radio;CL;getDbTypeOption','eqp',60,'input',NULL,NULL,NULL,'N','admin','2017-05-18 15:45:25','admin','2017-05-18 15:45:25','4'),('1495093525974YzJHet0','sample','**Sample Parameter Setup','EmailSender','The Sender Name and Email for email triggered from Workflow ','Workflow Engine <DoNotReply@spa.gov.my>',NULL,'textfield;100','eqp',90,'input',NULL,NULL,NULL,'N','admin','2017-05-18 15:45:25','admin','2017-05-18 15:45:25','4'),('DEFAULT_001','DEF','System Parameter','spHeader','User Group :','','User Group :',NULL,'DEF',10,'header',NULL,NULL,NULL,'N','admin','2019-03-14 15:31:57','admin','2019-03-14 15:31:57','4'),('DEFAULT_002','DEF','System Parameter','USER_GROUP_HIDE','Hide the user group from the list.','*JobDoer*','User Group to hide from List','testfield;100','DEF',20,'input',NULL,NULL,NULL,'N','admin','2019-02-18 10:44:31','admin','2019-02-18 10:44:31','4'),('eqp_url','sample','**Sample Parameter Setup','systemUrl','The main URL of the system','http://localhost:8084/appName','The main URL of the system','textfield;100','eqp',0,'input',NULL,NULL,NULL,'N','admin','2012-02-23 15:06:33','admin','2013-08-05 16:14:39','4'),('up_001','userPref','User Preference','msb','Default Screen Size','S','The Default (Data) Screen Size after login','radio;m;S__Default|H__Wide','userPref',10,'input',NULL,NULL,NULL,'N','admin','2019-03-15 11:49:05','admin','2019-03-15 11:49:05','4');
/*!40000 ALTER TABLE `t_system_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_preference`
--

DROP TABLE IF EXISTS `t_user_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_preference` (
  `user_pref_id` varchar(20) NOT NULL,
  `us_id` varchar(20) NOT NULL,
  `pref_code` varchar(20) NOT NULL,
  `pref_value` varchar(100) DEFAULT NULL,
  `created_by` varchar(65) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(65) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_pref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_preference`
--

LOCK TABLES `t_user_preference` WRITE;
/*!40000 ALTER TABLE `t_user_preference` DISABLE KEYS */;
INSERT INTO `t_user_preference` VALUES ('1552633489366FmKvU40','10','msb','S','admin','2019-03-15 15:04:49','admin','2019-03-20 11:59:19');
/*!40000 ALTER TABLE `t_user_preference` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-05 10:51:44
