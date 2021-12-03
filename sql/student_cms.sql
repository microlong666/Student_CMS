-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: student_cms
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','TASK_CLASS_NAME1','DEFAULT',NULL,1638499150000,-1,5,'PAUSED','CRON',1638499144000,0,NULL,2,''),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','TASK_CLASS_NAME2','DEFAULT',NULL,1638499155000,-1,5,'PAUSED','CRON',1638499144000,0,NULL,2,''),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','TASK_CLASS_NAME3','DEFAULT',NULL,1638499160000,-1,5,'PAUSED','CRON',1638499144000,0,NULL,2,'');
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT',NULL,'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution','0','1','0','0',0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D092A224078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT',NULL,'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution','0','1','0','0',0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D092A224078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT',NULL,'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution','0','1','0','0',0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D092A224078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2021-11-10 17:24:56','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2021-11-10 17:24:56','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2021-11-10 17:24:56','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'学生管理系统上线通知','1',0x3C703EE696B0E78988E69CACE58685E5AEB93C2F703E,'0','admin','2021-11-10 17:24:57','ry','2021-12-01 16:48:04','管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (3,'scms_class','班级',NULL,NULL,'ScmsClass','crud','com.ruoyi.system','system','class','班级管理','microloong','0','/','{\"parentMenuId\":1}','admin','2021-11-16 15:25:32','','2021-11-16 16:15:27',NULL),(4,'scms_student','学生',NULL,NULL,'ScmsStudent','crud','com.ruoyi.system','system','student','个人信息管理','microloong','0','/','{\"parentMenuId\":\"2014\"}','admin','2021-11-17 19:59:57','','2021-11-18 23:53:52',NULL),(5,'scms_teacher','教师',NULL,NULL,'ScmsTeacher','crud','com.ruoyi.system','system','teacher','个人信息管理','microloong','0','/','{\"parentMenuId\":\"2007\"}','admin','2021-11-23 22:25:19','','2021-11-23 22:31:15',NULL),(6,'scms_lesson','课程',NULL,NULL,'ScmsLesson','crud','com.ruoyi.system','system','lesson','课程','microloong','0','/','{}','admin','2021-11-25 13:50:28','','2021-11-25 14:03:16',NULL),(7,'scms_class_lesson','班级课程','','','ScmsClassLesson','crud','com.ruoyi.system','system','lesson','班级课程','microloong','0','/','{}','admin','2021-11-28 15:53:28','','2021-11-28 16:09:39',NULL),(8,'scms_student_lesson','学生成绩',NULL,NULL,'ScmsStudentLesson','crud','com.ruoyi.system','system','lesson','学生成绩','microloong','0','/','{}','admin','2021-11-28 15:53:28','','2021-12-01 16:38:20',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2021-11-10 17:24:56','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2021-11-10 17:24:56','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2021-11-10 17:24:56','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2021-11-10 17:24:56','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2021-11-10 17:24:56','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2021-11-10 17:24:56','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2021-11-10 17:24:56','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2021-11-10 17:24:56','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2021-11-10 17:24:56','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2021-11-10 17:24:56','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2021-11-10 17:24:56','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2021-11-10 17:24:56','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2021-11-10 17:24:56','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2021-11-10 17:24:56','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2021-11-10 17:24:56','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2021-11-10 17:24:56','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2021-11-10 17:24:56','',NULL,'关闭状态'),(18,1,'新增','1','sys_oper_type','','info','N','0','admin','2021-11-10 17:24:56','',NULL,'新增操作'),(19,2,'修改','2','sys_oper_type','','info','N','0','admin','2021-11-10 17:24:56','',NULL,'修改操作'),(20,3,'删除','3','sys_oper_type','','danger','N','0','admin','2021-11-10 17:24:56','',NULL,'删除操作'),(21,4,'授权','4','sys_oper_type','','primary','N','0','admin','2021-11-10 17:24:56','',NULL,'授权操作'),(22,5,'导出','5','sys_oper_type','','warning','N','0','admin','2021-11-10 17:24:56','',NULL,'导出操作'),(23,6,'导入','6','sys_oper_type','','warning','N','0','admin','2021-11-10 17:24:56','',NULL,'导入操作'),(24,7,'强退','7','sys_oper_type','','danger','N','0','admin','2021-11-10 17:24:56','',NULL,'强退操作'),(25,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2021-11-10 17:24:56','',NULL,'生成操作'),(26,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2021-11-10 17:24:56','',NULL,'清空操作'),(27,1,'成功','0','sys_common_status','','primary','N','0','admin','2021-11-10 17:24:56','',NULL,'正常状态'),(28,2,'失败','1','sys_common_status','','danger','N','0','admin','2021-11-10 17:24:56','',NULL,'停用状态'),(100,0,'江湾校区','0','scms_campus',NULL,'default','N','0','admin','2021-11-16 13:45:55','admin','2021-11-18 22:56:07',NULL),(101,1,'仙溪校区','1','scms_campus',NULL,'default','N','0','admin','2021-11-16 13:46:42','admin','2021-11-18 22:56:10',NULL),(102,2,'河滨校区','2','scms_campus',NULL,'default','N','0','admin','2021-11-16 13:46:56','admin','2021-11-18 22:56:14',NULL),(103,0,'家庭户口','0','household_type',NULL,'default','N','0','admin','2021-11-18 22:44:37','',NULL,NULL),(104,1,'集体户口','1','household_type',NULL,'default','N','0','admin','2021-11-18 22:44:53','',NULL,NULL),(105,0,'居民身份证/社保卡','0','identity_type',NULL,'default','N','0','admin','2021-11-18 22:46:01','',NULL,NULL),(106,1,'军官证/士兵证','1','identity_type',NULL,'default','N','0','admin','2021-11-18 22:46:16','',NULL,NULL),(107,2,'护照','2','identity_type',NULL,'default','N','0','admin','2021-11-18 22:46:36','',NULL,NULL),(108,3,'外国人永久居留证','3','identity_type',NULL,'default','N','0','admin','2021-11-18 22:46:45','',NULL,NULL),(109,4,'境外永久居留证','4','identity_type',NULL,'default','N','0','admin','2021-11-18 22:46:54','',NULL,NULL),(110,5,'香港居民身份证明','5','identity_type',NULL,'default','N','0','admin','2021-11-18 22:47:04','',NULL,NULL),(111,6,'澳门居民身份证明','6','identity_type',NULL,'default','N','0','admin','2021-11-18 22:47:13','',NULL,NULL),(112,7,'台湾居民身份证明','7','identity_type',NULL,'default','N','0','admin','2021-11-18 22:47:21','',NULL,NULL),(113,0,'中共党员','0','political_status',NULL,'default','N','0','admin','2021-11-18 22:48:00','',NULL,NULL),(114,1,'中共预备党员','1','political_status',NULL,'default','N','0','admin','2021-11-18 22:48:07','',NULL,NULL),(115,2,'共青团员','2','political_status',NULL,'default','N','0','admin','2021-11-18 22:48:13','',NULL,NULL),(116,3,'民革党员','3','political_status',NULL,'default','N','0','admin','2021-11-18 22:48:24','',NULL,NULL),(117,4,'民盟盟员','4','political_status',NULL,'default','N','0','admin','2021-11-18 22:48:33','',NULL,NULL),(118,5,'民建会员','5','political_status',NULL,'default','N','0','admin','2021-11-18 22:48:43','',NULL,NULL),(119,6,'民进会员','6','political_status',NULL,'default','N','0','admin','2021-11-18 22:48:51','',NULL,NULL),(120,7,'农工党党员','7','political_status',NULL,'default','N','0','admin','2021-11-18 22:48:59','',NULL,NULL),(121,8,'致公党党员','8','political_status',NULL,'default','N','0','admin','2021-11-18 22:49:08','',NULL,NULL),(122,9,'九三学社社员','9','political_status',NULL,'default','N','0','admin','2021-11-18 22:49:15','',NULL,NULL),(123,10,'台盟盟员','10','political_status',NULL,'default','N','0','admin','2021-11-18 22:49:24','',NULL,NULL),(124,11,'无党派人士','11','political_status',NULL,'default','N','0','admin','2021-11-18 22:49:36','',NULL,NULL),(125,12,'群众','12','political_status',NULL,'default','N','0','admin','2021-11-18 22:49:43','',NULL,NULL),(126,0,'注册学籍','0','student_status',NULL,'default','N','0','admin','2021-11-18 22:53:13','',NULL,NULL),(127,1,'休学','1','student_status',NULL,'default','N','0','admin','2021-11-18 22:53:19','',NULL,NULL),(128,2,'退学','2','student_status',NULL,'default','N','0','admin','2021-11-18 22:53:26','',NULL,NULL),(129,3,'保留学籍','3','student_status',NULL,'default','N','0','admin','2021-11-18 22:53:35','',NULL,NULL),(130,0,'定向','0','train',NULL,'default','N','0','admin','2021-11-18 22:54:15','',NULL,NULL),(131,1,'非定向','1','train',NULL,'default','N','0','admin','2021-11-18 22:54:21','',NULL,NULL),(132,2,'委培','2','train',NULL,'default','N','0','admin','2021-11-18 22:54:29','',NULL,NULL),(133,3,'自筹','3','train',NULL,'default','N','0','admin','2021-11-18 22:54:35','',NULL,NULL),(134,0,'本科生','0','student_type',NULL,'default','N','0','admin','2021-11-23 10:28:46','',NULL,NULL),(135,1,'研究生','1','student_type',NULL,'default','N','0','admin','2021-11-23 10:29:52','',NULL,NULL),(136,2,'博士','2','student_type',NULL,'default','N','1','admin','2021-11-23 10:30:09','',NULL,NULL),(137,0,'必修','0','lesson_type',NULL,'default','N','0','admin','2021-11-25 13:55:59','',NULL,NULL),(138,1,'选修','1','lesson_type',NULL,'default','N','0','admin','2021-11-25 13:56:17','',NULL,NULL),(139,100,'2021-2022学年第二学期','202202','term',NULL,'default','N','0','admin','2021-11-28 16:01:04','admin','2021-11-28 16:04:34',NULL),(140,101,'2021-2022学年第一学期','202201','term',NULL,'default','N','0','admin','2021-11-28 16:01:26','admin','2021-11-28 16:04:26',NULL),(141,102,'2020-2021学年第二学期','202102','term',NULL,'default','N','0','admin','2021-11-28 16:01:43','admin','2021-11-28 16:04:40',NULL),(142,103,'2020-2021学年第一学期','202101','term',NULL,'default','N','0','admin','2021-11-28 16:05:00','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2),(103,5),(104,5),(105,5);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2021-11-10 17:24:55','',NULL,'超级管理员'),(2,'管理员','common_admin',2,'1',1,1,'0','0','admin','2021-11-10 17:24:55','admin','2021-12-01 16:46:54','普通管理员'),(100,'学生','student',4,'1',1,1,'0','0','admin','2021-11-16 14:55:50','admin','2021-11-30 22:17:53','学生'),(101,'教师','teacher',3,'1',1,1,'0','0','admin','2021-11-16 14:56:45','admin','2021-12-01 14:46:09','教师');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(13) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','佛山科学技术学院',0,'','','','0','0','admin','2021-11-16 14:17:52','admin','2021-11-16 14:18:35'),(101,100,'0,100','江湾校区',1,'','','','0','0','admin','2021-11-16 14:17:52','admin','2021-11-16 14:23:41'),(102,100,'0,100','仙溪校区',2,'','','','0','0','admin','2021-11-16 14:17:52','admin','2021-11-16 14:24:05'),(103,101,'0,100,101','数学与大数据学院',1,'','0757-82272751','dangganguanli@b.qq.com','0','0','admin','2021-11-16 14:17:52','admin','2021-11-16 15:11:18'),(104,101,'0,100,101','材料科学与氢能学院',2,'','0757-82272751','','0','0','admin','2021-11-16 14:17:52','admin','2021-11-16 15:12:35'),(105,101,'0,100,101','工业设计与陶瓷艺术学院',3,'','0757-82272751','dangganguanli@b.qq.com','0','0','admin','2021-11-16 14:17:52','admin','2021-11-16 15:13:07'),(106,101,'0,100,101','环境与化学工程学院',4,'','0757-82272751','dangganguanli@b.qq.com','0','0','admin','2021-11-16 14:17:52','admin','2021-11-16 15:14:25'),(107,101,'0,100,101','经济管理学院',5,'','0757-82988648','','0','0','admin','2021-11-16 14:17:52','admin','2021-11-16 15:17:22'),(108,102,'0,100,102','粤台人工智能学院',1,'','0757-85516943','yuetai@fosu.edu.cn','0','0','admin','2021-11-16 14:17:52','admin','2021-11-16 14:49:26'),(109,102,'0,100,102','机电工程与自动化学院',2,'','0757-83960006','spoe@fosu.edu.cn','0','0','admin','2021-11-16 14:17:52','admin','2021-11-16 15:10:45'),(200,100,'0,100','河滨校区',3,NULL,NULL,NULL,'0','0','admin','2021-11-16 14:24:22','',NULL),(201,102,'0,100,102','电子信息工程学院',3,NULL,'0757-85500694',NULL,'0','0','admin','2021-11-16 14:30:10','admin','2021-11-16 15:10:59'),(202,102,'0,100,102','物理与光电工程学院',4,NULL,'0757-85505013','gjcyyjlb@126.com','0','0','admin','2021-11-16 14:30:43','admin','2021-11-16 15:11:55'),(203,102,'0,100,102','食品科学与工程学院',5,NULL,NULL,NULL,'0','0','admin','2021-11-16 14:32:09','',NULL),(204,102,'0,100,102','生命科学与工程学院',6,NULL,'0757-85505013',NULL,'0','0','admin','2021-11-16 14:32:18','admin','2021-11-16 15:13:46'),(205,102,'0,100,102','交通与土木建筑学院',7,NULL,'0757-83961117','JIAOJIAN@fosu.edu.cn','0','0','admin','2021-11-16 14:32:58','admin','2021-11-16 15:15:36'),(206,200,'0,100,200','口腔医学院',1,NULL,'0757-82815259','fkyyxy@126.com','0','0','admin','2021-11-16 14:33:17','admin','2021-11-17 13:14:31'),(207,102,'0,100,102','人文与教育学院',8,NULL,'0757-82809005','fskjxyrwyjyxy@163.com','0','0','admin','2021-11-16 14:33:48','admin','2021-11-16 15:16:45'),(208,101,'0,100,101','法学与知识产权学院',6,NULL,'0757-83354319','fzxy@fosu.edu.cn','0','0','admin','2021-11-16 14:34:36','admin','2021-11-16 15:17:58'),(209,101,'0,100,101','马克思主义学院',7,NULL,'0757-82962600','zzllb@163.com','0','0','admin','2021-11-16 14:34:51','admin','2021-11-16 15:18:24');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2052 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2021-11-10 17:24:55','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2021-11-10 17:24:55','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2021-11-10 17:24:55','',NULL,'系统工具目录'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2021-11-10 17:24:55','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2021-11-10 17:24:55','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2021-11-10 17:24:55','',NULL,'菜单管理菜单'),(103,'院系管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2021-11-10 17:24:55','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2021-11-10 17:24:55','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2021-11-10 17:24:55','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2021-11-10 17:24:55','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2021-11-10 17:24:55','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2021-11-10 17:24:55','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2021-11-10 17:24:55','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2021-11-10 17:24:55','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2021-11-10 17:24:55','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2021-11-10 17:24:55','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2021-11-10 17:24:55','',NULL,'缓存监控菜单'),(114,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2021-11-10 17:24:55','',NULL,'表单构建菜单'),(115,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2021-11-10 17:24:55','',NULL,'代码生成菜单'),(116,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2021-11-10 17:24:55','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2021-11-10 17:24:55','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2021-11-10 17:24:55','',NULL,'登录日志菜单'),(1001,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2021-11-10 17:24:55','',NULL,''),(1002,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2021-11-10 17:24:56','',NULL,''),(1003,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2021-11-10 17:24:56','',NULL,''),(1004,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2021-11-10 17:24:56','',NULL,''),(1005,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2021-11-10 17:24:56','',NULL,''),(1006,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2021-11-10 17:24:56','',NULL,''),(1007,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2021-11-10 17:24:56','',NULL,''),(1008,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2021-11-10 17:24:56','',NULL,''),(1009,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2021-11-10 17:24:56','',NULL,''),(1010,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2021-11-10 17:24:56','',NULL,''),(1011,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2021-11-10 17:24:56','',NULL,''),(1012,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2021-11-10 17:24:56','',NULL,''),(1013,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2021-11-10 17:24:56','',NULL,''),(1014,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2021-11-10 17:24:56','',NULL,''),(1015,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2021-11-10 17:24:56','',NULL,''),(1016,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2021-11-10 17:24:56','',NULL,''),(1017,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2021-11-10 17:24:56','',NULL,''),(1018,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2021-11-10 17:24:56','',NULL,''),(1019,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2021-11-10 17:24:56','',NULL,''),(1020,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2021-11-10 17:24:56','',NULL,''),(1021,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2021-11-10 17:24:56','',NULL,''),(1022,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2021-11-10 17:24:56','',NULL,''),(1023,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2021-11-10 17:24:56','',NULL,''),(1024,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2021-11-10 17:24:56','',NULL,''),(1025,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2021-11-10 17:24:56','',NULL,''),(1026,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2021-11-10 17:24:56','',NULL,''),(1027,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2021-11-10 17:24:56','',NULL,''),(1028,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2021-11-10 17:24:56','',NULL,''),(1029,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2021-11-10 17:24:56','',NULL,''),(1030,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2021-11-10 17:24:56','',NULL,''),(1031,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2021-11-10 17:24:56','',NULL,''),(1032,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2021-11-10 17:24:56','',NULL,''),(1033,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2021-11-10 17:24:56','',NULL,''),(1034,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2021-11-10 17:24:56','',NULL,''),(1035,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2021-11-10 17:24:56','',NULL,''),(1036,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2021-11-10 17:24:56','',NULL,''),(1037,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2021-11-10 17:24:56','',NULL,''),(1038,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2021-11-10 17:24:56','',NULL,''),(1039,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2021-11-10 17:24:56','',NULL,''),(1040,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2021-11-10 17:24:56','',NULL,''),(1041,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2021-11-10 17:24:56','',NULL,''),(1042,'日志导出',500,4,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2021-11-10 17:24:56','',NULL,''),(1043,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2021-11-10 17:24:56','',NULL,''),(1044,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2021-11-10 17:24:56','',NULL,''),(1045,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2021-11-10 17:24:56','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2021-11-10 17:24:56','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2021-11-10 17:24:56','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2021-11-10 17:24:56','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2021-11-10 17:24:56','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2021-11-10 17:24:56','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2021-11-10 17:24:56','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2021-11-10 17:24:56','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2021-11-10 17:24:56','',NULL,''),(1054,'任务导出',110,7,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2021-11-10 17:24:56','',NULL,''),(1055,'生成查询',115,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2021-11-10 17:24:56','',NULL,''),(1056,'生成修改',115,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2021-11-10 17:24:56','',NULL,''),(1057,'生成删除',115,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2021-11-10 17:24:56','',NULL,''),(1058,'导入代码',115,2,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2021-11-10 17:24:56','',NULL,''),(1059,'预览代码',115,4,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2021-11-10 17:24:56','',NULL,''),(1060,'生成代码',115,5,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2021-11-10 17:24:56','',NULL,''),(2000,'班级管理',1,3,'class','system/class/index',NULL,1,0,'C','0','0','system:class:list','component','admin','2021-11-16 16:16:56','admin','2021-11-30 22:45:51','班级管理菜单'),(2001,'班级管理查询',2000,1,'#','',NULL,1,0,'F','0','0','system:class:query','#','admin','2021-11-16 16:16:57','',NULL,''),(2002,'班级管理新增',2000,2,'#','',NULL,1,0,'F','0','0','system:class:add','#','admin','2021-11-16 16:16:57','',NULL,''),(2003,'班级管理修改',2000,3,'#','',NULL,1,0,'F','0','0','system:class:edit','#','admin','2021-11-16 16:16:57','',NULL,''),(2004,'班级管理删除',2000,4,'#','',NULL,1,0,'F','0','0','system:class:remove','#','admin','2021-11-16 16:16:57','',NULL,''),(2005,'班级管理导出',2000,5,'#','',NULL,1,0,'F','0','0','system:class:export','#','admin','2021-11-16 16:16:57','',NULL,''),(2007,'教师管理',0,11,'teacher',NULL,NULL,1,0,'M','0','0','','people','admin','2021-11-17 20:32:57','admin','2021-11-17 20:35:12',''),(2014,'学生管理',0,10,'student',NULL,NULL,1,0,'M','0','0',NULL,'people','admin','2021-11-18 20:26:46','',NULL,''),(2015,'学生信息管理',2014,1,'info','system/student/index',NULL,1,0,'C','0','0','system:student:list','#','admin','2021-11-18 20:35:20','admin','2021-11-30 20:32:18','个人信息管理菜单'),(2016,'个人信息管理查询',2015,1,'#','',NULL,1,0,'F','0','0','system:student:query','#','admin','2021-11-18 20:35:20','',NULL,''),(2017,'个人信息管理新增',2015,2,'#','',NULL,1,0,'F','0','0','system:student:add','#','admin','2021-11-18 20:35:20','',NULL,''),(2018,'个人信息管理修改',2015,3,'#','',NULL,1,0,'F','0','0','system:student:edit','#','admin','2021-11-18 20:35:20','',NULL,''),(2019,'个人信息管理删除',2015,4,'#','',NULL,1,0,'F','0','0','system:student:remove','#','admin','2021-11-18 20:35:20','',NULL,''),(2020,'个人信息管理导出',2015,5,'#','',NULL,1,0,'F','0','0','system:student:export','#','admin','2021-11-18 20:35:20','',NULL,''),(2021,'教师信息管理',2007,1,'info','system/teacher/index',NULL,1,0,'C','0','0','system:teacher:list','#','admin','2021-11-24 00:14:09','admin','2021-11-30 22:35:34','个人信息管理菜单'),(2022,'个人信息管理查询',2021,1,'#','',NULL,1,0,'F','0','0','system:teacher:query','#','admin','2021-11-24 00:14:10','',NULL,''),(2023,'个人信息管理新增',2021,2,'#','',NULL,1,0,'F','0','0','system:teacher:add','#','admin','2021-11-24 00:14:10','',NULL,''),(2024,'个人信息管理修改',2021,3,'#','',NULL,1,0,'F','0','0','system:teacher:edit','#','admin','2021-11-24 00:14:10','',NULL,''),(2025,'个人信息管理删除',2021,4,'#','',NULL,1,0,'F','0','0','system:teacher:remove','#','admin','2021-11-24 00:14:10','',NULL,''),(2026,'个人信息管理导出',2021,5,'#','',NULL,1,0,'F','0','0','system:teacher:export','#','admin','2021-11-24 00:14:10','',NULL,''),(2027,'课程管理',0,12,'lesson',NULL,NULL,1,0,'M','0','0','','list','admin','2021-11-25 10:56:01','admin','2021-11-25 10:56:12',''),(2034,'课程列表',2027,1,'list','system/lesson/index',NULL,1,0,'C','0','0','system:lesson:list','#','admin','2021-11-25 19:22:02','',NULL,'课程菜单'),(2035,'课程查询',2034,1,'#','',NULL,1,0,'F','0','0','system:lesson:query','#','admin','2021-11-25 19:22:02','',NULL,''),(2036,'课程新增',2034,2,'#','',NULL,1,0,'F','0','0','system:lesson:add','#','admin','2021-11-25 19:22:02','',NULL,''),(2037,'课程修改',2034,3,'#','',NULL,1,0,'F','0','0','system:lesson:edit','#','admin','2021-11-25 19:22:02','',NULL,''),(2038,'课程删除',2034,4,'#','',NULL,1,0,'F','0','0','system:lesson:remove','#','admin','2021-11-25 19:22:03','',NULL,''),(2039,'课程导出',2034,5,'#','',NULL,1,0,'F','0','0','system:lesson:export','#','admin','2021-11-25 19:22:03','',NULL,''),(2040,'课程安排',2027,2,'arrange','system/lesson/classLesson',NULL,1,0,'C','0','0','','#','admin','2021-11-28 21:21:36','admin','2021-11-28 21:22:10',''),(2041,'课程表',2014,2,'lesson','system/student/lessonTable',NULL,1,0,'C','0','0',NULL,'#','admin','2021-11-30 17:01:26','',NULL,''),(2042,'个人信息管理',2014,0,'personal','system/student/personal',NULL,1,0,'C','0','0','system:student:query','#','admin','2021-11-30 20:32:52','admin','2021-11-30 20:46:07',''),(2043,'课程查询',2040,1,'',NULL,NULL,1,0,'F','0','0','system:classLesson:query','#','admin','2021-11-30 20:41:01','',NULL,''),(2044,'课程新增',2040,2,'',NULL,NULL,1,0,'F','0','0','system:classLesson:add','#','admin','2021-11-30 20:41:22','',NULL,''),(2045,'课程删除',2040,3,'',NULL,NULL,1,0,'F','0','0','system:classLesson:remove','#','admin','2021-11-30 20:41:45','',NULL,''),(2046,'课程表导出',2040,4,'',NULL,NULL,1,0,'F','0','0','system:classLesson:export','#','admin','2021-11-30 20:42:08','',NULL,''),(2048,'班级列表',2042,0,'',NULL,NULL,1,0,'F','0','0','system:class:list','#','admin','2021-11-30 21:39:27','',NULL,''),(2049,'学生列表',2042,1,'',NULL,NULL,1,0,'F','0','0','system:student:list','#','admin','2021-11-30 22:17:41','',NULL,''),(2050,'个人信息管理',2007,0,'personal','system/teacher/personal',NULL,1,0,'C','0','0','system:teacher:query','#','admin','2021-11-30 22:36:19','admin','2021-11-30 22:36:38',''),(2051,'任课表',2007,2,'lesson','system/teacher/teachList',NULL,1,0,'C','0','0',NULL,'#','admin','2021-12-01 14:17:49','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler','STATE_ACCESS'),('RuoyiScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scms_class`
--

DROP TABLE IF EXISTS `scms_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scms_class` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `grade` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '年级',
  `class_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级',
  `major` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '专业',
  `school_id` bigint DEFAULT NULL COMMENT '院系id',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint DEFAULT '0' COMMENT '删除标志',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='班级';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scms_class`
--

LOCK TABLES `scms_class` WRITE;
/*!40000 ALTER TABLE `scms_class` DISABLE KEYS */;
INSERT INTO `scms_class` VALUES (1,'18','18物联网工程1班','物联网工程',201,'admin','2021-11-16 19:16:33',NULL,NULL,0,NULL),(2,'18','18物联网工程2班','物联网工程',201,'admin','2021-11-16 21:50:42',NULL,NULL,0,NULL),(3,'18','18计算机科学与技术1班','计算机科学与技术',201,'admin','2021-11-17 12:52:08',NULL,NULL,0,NULL),(4,'18','18计算机科学与技术2班','计算机科学与技术',201,'admin','2021-11-17 12:52:21',NULL,NULL,0,NULL),(5,'18','18计算机科学与技术3班','计算机科学与技术',201,'admin','2021-11-17 12:52:37',NULL,NULL,0,NULL),(6,'18','18计算机科学与技术4班','计算机科学与技术',201,'admin','2021-11-17 12:53:53','admin','2021-11-17 18:38:10',0,'人工智能方向'),(7,'21','21人工智能1班','人工智能',108,'admin','2021-11-17 12:55:54',NULL,NULL,0,NULL),(8,'20','20车辆工程1班','车辆工程',109,'admin','2021-11-17 13:09:14',NULL,NULL,0,NULL),(9,'19','19英语(师范)1班','英语',207,'admin','2021-11-17 13:11:12',NULL,NULL,0,'师范');
/*!40000 ALTER TABLE `scms_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','校长',1,'0','admin','2021-11-10 17:24:55','ry','2021-12-01 16:50:10',''),(2,'se','行政主管',2,'0','admin','2021-11-10 17:24:55','ry','2021-12-01 16:50:27',''),(5,'te','教师',3,'0','ry','2021-12-01 16:50:51','',NULL,NULL);
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler','LEGION-Y70001638499143929',1638500918799,15000);
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (19,'3','id',NULL,'bigint','Long','id','1','1',NULL,NULL,NULL,NULL,NULL,'EQ','input','',1,'admin','2021-11-16 15:25:32','','2021-11-16 16:15:27'),(20,'3','class_name','班级','varchar(255)','String','className','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2021-11-16 15:25:32','','2021-11-16 16:15:27'),(21,'3','major','专业','varchar(255)','String','major','0','0',NULL,'1','1','1','1','LIKE','input','',3,'admin','2021-11-16 15:25:32','','2021-11-16 16:15:27'),(22,'3','school_id','院系','bigint','Long','schoolId','0','0','1','1','1','1','1','EQ','select','',4,'admin','2021-11-16 15:25:32','','2021-11-16 16:15:27'),(23,'3','create_by','创建人','varchar(255)','String','createBy','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',5,'admin','2021-11-16 15:25:32','','2021-11-16 16:15:27'),(24,'3','create_time','创建时间','datetime','Date','createTime','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','datetime','',6,'admin','2021-11-16 15:25:32','','2021-11-16 16:15:27'),(25,'3','update_by','更新人','varchar(255)','String','updateBy','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',7,'admin','2021-11-16 15:25:32','','2021-11-16 16:15:27'),(26,'3','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','datetime','',8,'admin','2021-11-16 15:25:32','','2021-11-16 16:15:27'),(27,'3','del_flag','删除标志','tinyint','Long','delFlag','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',9,'admin','2021-11-16 15:25:32','','2021-11-16 16:15:27'),(28,'3','remark','备注','varchar(500)','String','remark','0','0',NULL,'1','1','1',NULL,'EQ','textarea','',10,'admin','2021-11-16 15:25:32','','2021-11-16 16:15:27'),(29,'4','student_id','学号','bigint','Long','studentId','1','0',NULL,'1','1','1','1','LIKE','input','',1,'admin','2021-11-17 19:59:57','','2021-11-18 23:53:52'),(30,'4','student_name','姓名','varchar(50)','String','studentName','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2021-11-17 19:59:57','','2021-11-18 23:53:52'),(31,'4','picture','照片','varchar(255)','String','picture','0','0',NULL,'1','1','1',NULL,'EQ','imageUpload','',3,'admin','2021-11-17 19:59:57','','2021-11-18 23:53:52'),(32,'4','sex','性别','tinyint','Integer','sex','0','0',NULL,'1','1','1',NULL,'EQ','radio','sys_user_sex',4,'admin','2021-11-17 19:59:57','','2021-11-18 23:53:52'),(33,'4','phone','联系电话','varchar(11)','String','phone','0','0',NULL,'1','1','1',NULL,'EQ','input','',5,'admin','2021-11-17 19:59:57','','2021-11-18 23:53:52'),(34,'4','class_id','班级编号','bigint','Long','classId','0','0',NULL,'1','1','1','1','EQ','select','',6,'admin','2021-11-17 19:59:57','','2021-11-18 23:53:52'),(35,'4','nation','民族','varchar(100)','String','nation','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',7,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(36,'4','birthday','出生日期','date','Date','birthday','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',8,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(37,'4','origin','生源地','varchar(255)','String','origin','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',9,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(38,'4','native_place','籍贯','varchar(255)','String','nativePlace','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',10,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(39,'4','household_place','户口所在地','varchar(255)','String','householdPlace','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',11,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(40,'4','household_type','户口性质','tinyint','Integer','householdType','0','0',NULL,'1','1',NULL,NULL,'EQ','select','household_type',12,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(41,'4','home_address','家庭住址','varchar(255)','String','homeAddress','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',13,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(42,'4','only_child','是否独生子女','char(1)','String','onlyChild','0','0',NULL,'1','1',NULL,NULL,'EQ','radio','sys_yes_no',14,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(43,'4','identity_type','身份证类型','tinyint','Integer','identityType','0','0',NULL,'1','1',NULL,NULL,'EQ','select','identity_type',15,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(44,'4','identity_num','身份证号','varchar(18)','String','identityNum','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',16,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(45,'4','political_status','政治面貌','varchar(50)','Integer','politicalStatus','0','0',NULL,'1','1',NULL,NULL,'EQ','select','political_status',17,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(46,'4','graduation','毕业去向','varchar(255)','String','graduation','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',18,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(47,'4','student_status','学籍状态','tinyint','Integer','studentStatus','0','0',NULL,'1','1',NULL,'1','EQ','select','student_status',19,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(48,'4','train','培养方式','varchar(100)','Integer','train','0','0',NULL,'1','1',NULL,NULL,'EQ','select','train',20,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(49,'4','edu_system','学制','tinyint','String','eduSystem','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',21,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(50,'4','enrollment_date','入学时间','date','Date','enrollmentDate','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',22,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(51,'4','expected_gradate','预计毕业时间','date','Date','expectedGradate','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',23,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(52,'4','actual_gradate','实际毕业时间','date','Date','actualGradate','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',24,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(53,'4','dormitory_school','宿舍校区','varchar(255)','Integer','dormitorySchool','0','0',NULL,'1','1',NULL,NULL,'EQ','select','scms_campus',25,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(54,'4','dormitory_name','宿舍楼名称','varchar(255)','String','dormitoryName','0','0',NULL,'1','1',NULL,NULL,'LIKE','input','',26,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(55,'4','dormitory_num','宿舍门牌号','varchar(255)','String','dormitoryNum','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',27,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(56,'4','dormitory_type','宿舍类型','varchar(255)','String','dormitoryType','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',28,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(57,'4','dormitory_member','宿舍成员','varchar(255)','String','dormitoryMember','0','0',NULL,'1','1',NULL,NULL,'EQ','select','',29,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(58,'4','create_by','创建人','varchar(255)','String','createBy','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',30,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(59,'4','create_time','创建时间','datetime','Date','createTime','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','datetime','',31,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(60,'4','update_by','更新人','varchar(255)','String','updateBy','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',32,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(61,'4','del_flag','删除标注','tinyint','Long','delFlag','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',33,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(62,'4','remark','备注','varchar(500)','String','remark','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','textarea','',34,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(63,'4','update_time','更新时间','datetime','Date','updateTime','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','datetime','',35,'admin','2021-11-17 19:59:58','','2021-11-18 23:53:52'),(64,'5','id','编号','bigint','Long','id','1','1',NULL,NULL,NULL,'1',NULL,'EQ','input','',1,'admin','2021-11-23 22:25:19','','2021-11-23 22:31:15'),(65,'5','teacher_id','工号','bigint','Long','teacherId','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2021-11-23 22:25:19','','2021-11-23 22:31:15'),(66,'5','teacherName','姓名','varchar(50)','String','teachername','0','0',NULL,'1','1','1','1','LIKE','input','',3,'admin','2021-11-23 22:25:19','','2021-11-23 22:31:15'),(67,'5','school_id','院系','bigint','Long','schoolId','0','0',NULL,'1','1','1','1','EQ','select','',4,'admin','2021-11-23 22:25:19','','2021-11-23 22:31:15'),(68,'5','title','职称','varchar(255)','String','title','0','0',NULL,'1','1','1',NULL,'LIKE','input','',5,'admin','2021-11-23 22:25:19','','2021-11-23 22:31:15'),(69,'5','phone','联系电话','varchar(11)','String','phone','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',6,'admin','2021-11-23 22:25:19','','2021-11-23 22:31:15'),(70,'5','mail','邮箱','varchar(100)','String','mail','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',7,'admin','2021-11-23 22:25:19','','2021-11-23 22:31:15'),(71,'5','lesson_id','所授课程','bigint','Long','lessonId','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',8,'admin','2021-11-23 22:25:19','','2021-11-23 22:31:15'),(72,'5','create_by','创建人','varchar(255)','String','createBy','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',9,'admin','2021-11-23 22:25:19','','2021-11-23 22:31:15'),(73,'5','create_time','创建时间','date','Date','createTime','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','datetime','',10,'admin','2021-11-23 22:25:19','','2021-11-23 22:31:15'),(74,'5','update_by','更新人','varchar(255)','String','updateBy','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',11,'admin','2021-11-23 22:25:19','','2021-11-23 22:31:15'),(75,'5','update_time','更新时间','date','Date','updateTime','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','datetime','',12,'admin','2021-11-23 22:25:19','','2021-11-23 22:31:15'),(76,'5','del_flag','删除标志','tinyint','Long','delFlag','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',13,'admin','2021-11-23 22:25:19','','2021-11-23 22:31:15'),(77,'5','remark','备注','varchar(500)','String','remark','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','textarea','',14,'admin','2021-11-23 22:25:19','','2021-11-23 22:31:15'),(78,'6','id','编号','bigint','Long','id','1','1',NULL,NULL,NULL,NULL,NULL,'EQ','input','',1,'admin','2021-11-25 13:50:28','','2021-11-25 14:03:16'),(79,'6','lesson_name','课程名称','varchar(50)','String','lessonName','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2021-11-25 13:50:28','','2021-11-25 14:03:16'),(80,'6','lesson_type','课程类型','tinyint','Integer','lessonType','0','0',NULL,'1','1','1','1','EQ','select','lesson_type',3,'admin','2021-11-25 13:50:28','','2021-11-25 14:03:16'),(81,'6','teacher_id','任课教师','bigint','Long','teacherId','0','0',NULL,'1','1','1','1','EQ','select','',4,'admin','2021-11-25 13:50:28','','2021-11-25 14:03:16'),(82,'6','credit','学分','float','Double','credit','0','0',NULL,'1','1','1',NULL,'EQ','input','',5,'admin','2021-11-25 13:50:28','','2021-11-25 14:03:16'),(83,'6','lesson_hour','学时','float','Double','lessonHour','0','0',NULL,'1','1','1',NULL,'EQ','input','',6,'admin','2021-11-25 13:50:28','','2021-11-25 14:03:16'),(84,'6','create_by','创建人','varchar(255)','String','createBy','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',7,'admin','2021-11-25 13:50:28','','2021-11-25 14:03:16'),(85,'6','create_time','创建时间','date','Date','createTime','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','datetime','',8,'admin','2021-11-25 13:50:28','','2021-11-25 14:03:16'),(86,'6','update_by','更新人','varchar(255)','String','updateBy','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',9,'admin','2021-11-25 13:50:28','','2021-11-25 14:03:16'),(87,'6','update_time','更新时间','date','Date','updateTime','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','datetime','',10,'admin','2021-11-25 13:50:28','','2021-11-25 14:03:16'),(88,'6','del_flag','删除标志','tinyint','Integer','delFlag','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',11,'admin','2021-11-25 13:50:28','','2021-11-25 14:03:16'),(89,'6','remark','备注','varchar(500)','String','remark','0','0',NULL,'1','1','1',NULL,'EQ','textarea','',12,'admin','2021-11-25 13:50:28','','2021-11-25 14:03:16'),(90,'7','class_id','班级编号','bigint','Long','classId','1','0',NULL,NULL,NULL,NULL,'1','EQ','input','',1,'admin','2021-11-28 15:53:28','','2021-11-28 16:09:39'),(91,'7','lesson_id','课程编号','bigint','Long','lessonId','1','0',NULL,'1','1','1',NULL,'EQ','input','',2,'admin','2021-11-28 15:53:28','','2021-11-28 16:09:39'),(92,'7','term','学期','tinyint','Integer','term','0','0',NULL,'1','1','1',NULL,'EQ','select','term',3,'admin','2021-11-28 15:53:28','','2021-11-28 16:09:39'),(93,'7','lesson_time','上课时间','varchar(255)','String','lessonTime','0','0',NULL,'1','1','1',NULL,'EQ','input','',4,'admin','2021-11-28 15:53:28','','2021-11-28 16:09:39'),(94,'7','lesson_place','上课地点','varchar(255)','String','lessonPlace','0','0',NULL,'1','1','1',NULL,'EQ','input','',5,'admin','2021-11-28 15:53:28','','2021-11-28 16:09:39'),(95,'8','id','编号','bigint','Long','id','1','1',NULL,NULL,NULL,NULL,NULL,'EQ','input','',1,'admin','2021-11-28 15:53:28','','2021-12-01 16:38:20'),(96,'8','student_id','学生编号','bigint','Long','studentId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2021-11-28 15:53:28','','2021-12-01 16:38:20'),(97,'8','lesson_id','课程编号','bigint','Long','lessonId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2021-11-28 15:53:28','','2021-12-01 16:38:20'),(98,'8','regular_grade','平时成绩','double','Double','regularGrade','0','0',NULL,'1','1','1',NULL,'EQ','input','',4,'admin','2021-11-28 15:53:28','','2021-12-01 16:38:20'),(99,'8','final_grade','期末成绩','double','Double','finalGrade','0','0',NULL,'1','1','1',NULL,'EQ','input','',5,'admin','2021-11-28 15:53:28','','2021-12-01 16:38:20'),(100,'8','total_grade','总成绩','double','Double','totalGrade','0','0',NULL,'1','1','1',NULL,'EQ','input','',6,'admin','2021-11-28 15:53:28','','2021-12-01 16:38:20'),(101,'8','grade_evaluation','成绩评定','tinyint','Integer','gradeEvaluation','0','0',NULL,'1','1','1',NULL,'EQ','select','',7,'admin','2021-11-28 15:53:28','','2021-12-01 16:38:20'),(102,'8','create_by','创建人','varchar(255)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',8,'admin','2021-11-28 15:53:28','','2021-12-01 16:38:20'),(103,'8','create_time','创建时间','date','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2021-11-28 15:53:28','','2021-12-01 16:38:20'),(104,'8','update_by','更新人','varchar(255)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',10,'admin','2021-11-28 15:53:28','','2021-12-01 16:38:20'),(105,'8','update_time','更新人','date','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',11,'admin','2021-11-28 15:53:28','','2021-12-01 16:38:20'),(106,'8','remark','备注','varchar(500)','String','remark','0','0',NULL,'1','1','1',NULL,'EQ','textarea','',12,'admin','2021-11-28 15:53:28','','2021-12-01 16:38:20');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scms_class_lesson`
--

DROP TABLE IF EXISTS `scms_class_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scms_class_lesson` (
  `class_id` bigint NOT NULL COMMENT '班级编号',
  `lesson_id` bigint NOT NULL COMMENT '课程编号',
  `term` int DEFAULT NULL COMMENT '学期',
  `lesson_time` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上课时间',
  `lesson_place` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上课地点',
  PRIMARY KEY (`class_id`,`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='班级课程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scms_class_lesson`
--

LOCK TABLES `scms_class_lesson` WRITE;
/*!40000 ALTER TABLE `scms_class_lesson` DISABLE KEYS */;
INSERT INTO `scms_class_lesson` VALUES (1,1,202101,'周二 3-4节；周四 6-7节','1-16周 C3-211'),(1,2,202102,'周一 1-2节；周四 1-2节','1-16周 周一 C3-106；周四 C4-308'),(1,3,202102,'周二 1-2节；周三 3-4节','1-13周 周二 、周三 C3-111；14-16周 周二 C3-111、周三 B3-305'),(2,2,202102,'周一 1-2节；周四 1-2节','1-16周 周一 C3-106；周四 C4-308');
/*!40000 ALTER TABLE `scms_class_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scms_student`
--

DROP TABLE IF EXISTS `scms_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scms_student` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '学生编号',
  `student_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学号',
  `user_id` bigint DEFAULT NULL COMMENT '用户编号',
  `student_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `picture` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '照片',
  `sex` tinyint DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `class_id` bigint DEFAULT NULL COMMENT '班级编号',
  `nation` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '民族',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `origin` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生源地',
  `native_place` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '籍贯',
  `household_place` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '户口所在地',
  `household_type` tinyint DEFAULT NULL COMMENT '户口性质',
  `home_address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家庭住址',
  `only_child` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否独生子女',
  `identity_type` tinyint DEFAULT NULL COMMENT '身份证类型',
  `identity_num` varchar(18) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身份证号',
  `political_status` tinyint DEFAULT NULL COMMENT '政治面貌',
  `graduation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '毕业去向',
  `student_type` tinyint DEFAULT NULL COMMENT '学生类型',
  `student_status` tinyint DEFAULT NULL COMMENT '学籍状态',
  `train` tinyint DEFAULT NULL COMMENT '培养方式',
  `edu_system` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学制',
  `enrollment_date` date DEFAULT NULL COMMENT '入学时间',
  `expected_gradate` date DEFAULT NULL COMMENT '预计毕业时间',
  `actual_gradate` date DEFAULT NULL COMMENT '实际毕业时间',
  `dormitory_school` tinyint DEFAULT NULL COMMENT '宿舍校区',
  `dormitory_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宿舍楼名称',
  `dormitory_num` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宿舍门牌号',
  `dormitory_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宿舍类型',
  `dormitory_member` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宿舍成员',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `del_flag` tinyint DEFAULT '0' COMMENT '删除标注',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `scms_student_student_id_uindex` (`student_id`),
  UNIQUE KEY `scms_student_user_id_uindex` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scms_student`
--

LOCK TABLES `scms_student` WRITE;
/*!40000 ALTER TABLE `scms_student` DISABLE KEYS */;
INSERT INTO `scms_student` VALUES (1,'20180070119',100,'陈观河','/profile/upload/2021/11/22/b4975eec-c913-420d-96d6-4d67997c00c1.jpg',0,'18888888888',1,'汉族',NULL,'[\"440000\",\"441800\"]','[\"440000\",\"441800\"]','[\"440000\",\"441800\"]',0,NULL,'Y',0,'44018011111111111X',NULL,NULL,0,0,0,'四年','2018-09-07','2022-06-30',NULL,1,'D3','522','男生宿舍','[\"20180070100\"]',NULL,'2021-11-22 21:27:04','admin',0,NULL,'2021-11-30 16:06:22'),(2,'20180070100',101,'张三',NULL,0,'13111111111',2,NULL,NULL,'[]','[]','[]',NULL,NULL,'Y',NULL,NULL,NULL,NULL,0,0,0,'四年',NULL,NULL,NULL,1,'D3','522','男生宿舍','[\"20180070119\"]',NULL,'2021-11-23 11:18:21','admin',0,NULL,'2021-12-01 11:29:30'),(3,'20191111111',102,'李四',NULL,1,NULL,9,NULL,NULL,'[]','[]','[]',NULL,NULL,'Y',NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,1,'D1',NULL,NULL,'[]',NULL,'2021-11-23 14:50:24','admin',0,NULL,'2021-11-30 22:49:08');
/*!40000 ALTER TABLE `scms_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scms_teacher`
--

DROP TABLE IF EXISTS `scms_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scms_teacher` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `teacher_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工号',
  `user_id` bigint DEFAULT NULL COMMENT '用户编号',
  `teacher_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `school_id` bigint DEFAULT NULL COMMENT '院系',
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '职称',
  `phone` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `mail` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` date DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint DEFAULT '0' COMMENT '删除标志',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `scms_teacher_teacher_id_uindex` (`teacher_id`),
  UNIQUE KEY `scms_teacher_user_id_uindex` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='教师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scms_teacher`
--

LOCK TABLES `scms_teacher` WRITE;
/*!40000 ALTER TABLE `scms_teacher` DISABLE KEYS */;
INSERT INTO `scms_teacher` VALUES (1,'000001',103,'张老师',207,'讲师','13111111111','zd@fosu.edu.cn','admin','2021-11-24','admin','2021-11-30',0,NULL),(2,'000002',104,'钟老师',201,'教授',NULL,NULL,'admin','2021-11-30','admin','2021-11-30',0,NULL),(3,'000003',105,'朱老师',201,'副教授',NULL,NULL,'admin','2021-11-30','admin','2021-11-30',0,NULL);
/*!40000 ALTER TABLE `scms_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2021-11-10 17:24:56','admin','2021-11-10 20:48:28','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2021-11-10 17:24:56','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2021-11-10 17:24:56','admin','2021-11-10 20:48:57','深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaOnOff','true','Y','admin','2021-11-10 17:24:56','admin','2021-11-10 20:49:11','是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2021-11-10 17:24:56','admin','2021-11-10 20:49:23','是否开启注册用户功能（true开启，false关闭）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scms_lesson`
--

DROP TABLE IF EXISTS `scms_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scms_lesson` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `lesson_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名称',
  `lesson_type` tinyint DEFAULT NULL COMMENT '课程类型',
  `teacher_id` bigint DEFAULT NULL COMMENT '教师编号',
  `credit` double DEFAULT NULL COMMENT '学分',
  `lesson_hour` double DEFAULT NULL COMMENT '学时',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` date DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint DEFAULT '0' COMMENT '删除标志',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scms_lesson`
--

LOCK TABLES `scms_lesson` WRITE;
/*!40000 ALTER TABLE `scms_lesson` DISABLE KEYS */;
INSERT INTO `scms_lesson` VALUES (1,'大学英语1',0,1,4.5,36,NULL,'2021-11-25',NULL,'2021-11-25',0,NULL),(2,'软件工程导论',0,2,2,40,NULL,'2021-11-30',NULL,NULL,0,NULL),(3,'数据库原理',0,3,3,36,NULL,'2021-11-30',NULL,NULL,0,NULL),(4,'面向对象程序设计',0,2,2,36,NULL,'2021-12-01',NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `scms_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,100),(2,101),(2,103),(2,104),(2,105),(2,107),(2,109),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1036),(2,1037),(2,1038),(2,1039),(2,1046),(2,1047),(2,1048),(2,2000),(2,2001),(2,2002),(2,2003),(2,2004),(2,2005),(2,2007),(2,2014),(2,2015),(2,2016),(2,2017),(2,2018),(2,2019),(2,2020),(2,2021),(2,2022),(2,2023),(2,2024),(2,2025),(2,2026),(2,2027),(2,2034),(2,2035),(2,2036),(2,2037),(2,2038),(2,2039),(2,2040),(2,2043),(2,2044),(2,2045),(2,2046),(100,2014),(100,2041),(100,2042),(100,2048),(100,2049),(101,2007),(101,2050),(101,2051);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,100,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2021-12-03 10:39:41','admin','2021-11-10 17:24:55','','2021-12-03 10:39:40','管理员'),(2,201,'ry','管理','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2021-12-01 16:57:45','admin','2021-11-10 17:24:55','admin','2021-12-01 16:57:45','测试员'),(100,201,'20180070119','陈观河','00','','','0','','$2a$10$WMvdMyDalK0IP4lE0T4rFe2IVBMnlfbEsVWzFMyxYVlSU39PA8fbW','0','0','127.0.0.1','2021-12-03 10:42:27','admin','2021-11-30 14:58:08','','2021-12-03 10:42:26',NULL),(101,201,'20180070100','张三','00','','','0','','$2a$10$nhF0x5mtHX/OmyfIaZ5/ZOVyyFngDCFwsOiffedLuX9811nU2EdG2','0','0','',NULL,'admin','2021-11-30 22:44:04','',NULL,NULL),(102,207,'20191111111','李四','00','','','0','','$2a$10$z6teHtTbbR0L4GeUJ.HNqOy8KkN34pL8hiXO4gLACbysGbFIC.3L2','0','0','',NULL,'admin','2021-11-30 22:44:27','admin','2021-11-30 22:44:32',NULL),(103,207,'000001','张老师','00','','','0','','$2a$10$0W1ea2fD0TZP00nr.XZKyO122WbObI/gTYioKu5SDoLa57rLH1lO6','0','0','127.0.0.1','2021-11-30 22:59:35','admin','2021-11-30 22:46:32','ry','2021-12-01 16:51:00',NULL),(104,201,'000002','钟老师','00','','','0','','$2a$10$sN46iXZQW1gD/7r11bZ3rOp25PdWDUXlF7sNDtwLADSmKJyhCCKrq','0','0','127.0.0.1','2021-12-01 16:56:00','admin','2021-11-30 22:46:47','ry','2021-12-01 16:55:59',NULL),(105,201,'000003','朱老师','00','','','0','','$2a$10$YPt/yNU1BVJgyF7tRBTdo.XDkKdgKLlwVk0dbLS5xXg.iulUdl5Ua','0','0','',NULL,'admin','2021-11-30 22:47:23','ry','2021-12-01 16:51:06',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(100,100),(101,100),(102,100),(103,101),(104,101),(105,101);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','0/10 * * * * ?','Asia/Shanghai'),('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','0/15 * * * * ?','Asia/Shanghai'),('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','0/20 * * * * ?','Asia/Shanghai');
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2021-11-10 17:24:56','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2021-11-10 17:24:56','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2021-11-10 17:24:56','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2021-11-10 17:24:56','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2021-11-10 17:24:56','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2021-11-10 17:24:56','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2021-11-10 17:24:56','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2021-11-10 17:24:56','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2021-11-10 17:24:56','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2021-11-10 17:24:56','',NULL,'登录状态列表'),(100,'校区','scms_campus','0','admin','2021-11-16 13:44:23','admin','2021-11-30 18:50:25','学生管理'),(102,'户口性质','household_type','0','admin','2021-11-18 22:44:12','',NULL,'学生管理'),(103,'身份证类型','identity_type','0','admin','2021-11-18 22:45:27','',NULL,'学生管理'),(104,'政治面貌','political_status','0','admin','2021-11-18 22:47:48','',NULL,'学生管理'),(105,'学籍状态','student_status','0','admin','2021-11-18 22:50:19','',NULL,'学生管理'),(106,'培养方式','train','0','admin','2021-11-18 22:54:01','',NULL,'学生管理'),(107,'学生类型','student_type','0','admin','2021-11-23 10:28:29','',NULL,'学生管理'),(108,'课程类型','lesson_type','0','admin','2021-11-25 13:53:54','',NULL,'课程管理'),(109,'学期','term','0','admin','2021-11-28 15:57:51','',NULL,'课程管理');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-03 11:09:43
