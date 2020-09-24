-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.4-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- pizza 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `pizza` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pizza`;

-- 테이블 pizza.pizza_auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_auth` (
  `u_id` varchar(50) DEFAULT NULL,
  `u_auth` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza.pizza_auth:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_auth` DISABLE KEYS */;
REPLACE INTO `pizza_auth` (`u_id`, `u_auth`) VALUES
	('aaaa', 'ROLE_MASTER'),
	('aaa', 'ROLE_USER');
/*!40000 ALTER TABLE `pizza_auth` ENABLE KEYS */;

-- 테이블 pizza.pizza_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_board` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_title` varchar(255) DEFAULT NULL,
  `b_content` text DEFAULT NULL,
  `b_writer` varchar(255) DEFAULT NULL,
  `b_datetime` datetime DEFAULT current_timestamp(),
  `u_id` varchar(50) DEFAULT NULL,
  `b_disabled` tinyint(1) unsigned zerofill DEFAULT NULL,
  `b_views` int(11) DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `user_id` (`u_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`u_id`) REFERENCES `pizza_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza.pizza_board:~11 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_board` DISABLE KEYS */;
REPLACE INTO `pizza_board` (`b_id`, `b_title`, `b_content`, `b_writer`, `b_datetime`, `u_id`, `b_disabled`, `b_views`) VALUES
	(1, 'wdefs', 'content', 'lee', '2020-08-26 19:11:37', 'a', 0, NULL),
	(2, 'sdf', 'csdfs', 'sfg', '2020-08-26 19:11:56', 'aaa', 0, NULL),
	(3, 'x', 'sdfsf', 'wee', '2020-09-09 19:56:26', 'aaa', 0, NULL),
	(45, '234', 'sd', '1241w', '2020-09-15 20:49:04', 'aaaa', 0, NULL),
	(46, '222', '222', 'sdf', '2020-09-15 20:53:47', NULL, 0, NULL),
	(47, 'adxasdc', 'asfsg', 'as', '2020-09-15 20:58:17', 'aaaa', 0, NULL),
	(48, '', 'sdf', '', '2020-09-15 20:58:35', 'aaaa', 0, NULL),
	(49, 'xbsg2', '42', 'sg', '2020-09-15 21:01:08', 'aaaa', 0, NULL),
	(50, 'cs', 'sd', '23', '2020-09-15 21:53:38', 'aaa', 1, NULL),
	(51, '121', '14123123', 'test', '2020-09-15 22:03:13', 'aaa', 1, NULL),
	(52, '15as', 'sdaaf', 'asd134', '2020-09-16 18:35:16', 'aaa', 1, NULL);
/*!40000 ALTER TABLE `pizza_board` ENABLE KEYS */;

-- 테이블 pizza.pizza_order 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_order` (
  `order_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `order_time` int(11) DEFAULT NULL,
  `required_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza.pizza_order:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizza_order` ENABLE KEYS */;

-- 테이블 pizza.pizza_order_items 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_order_items` (
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `list_price` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza.pizza_order_items:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizza_order_items` ENABLE KEYS */;

-- 테이블 pizza.pizza_products 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_products` (
  `product_id` int(11) DEFAULT NULL,
  `product_name` int(11) DEFAULT NULL,
  `list_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza.pizza_products:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizza_products` ENABLE KEYS */;

-- 테이블 pizza.pizza_stocks 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_stocks` (
  `store_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza.pizza_stocks:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizza_stocks` ENABLE KEYS */;

-- 테이블 pizza.pizza_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_user` (
  `u_id` varchar(50) NOT NULL,
  `u_password` varchar(200) DEFAULT NULL,
  `u_name` varchar(50) DEFAULT NULL,
  `u_datetime` datetime DEFAULT current_timestamp(),
  `u_isAccountNonExpired` tinyint(4) DEFAULT NULL,
  `u_isAccountNonLocked` tinyint(4) DEFAULT NULL,
  `u_isCredentialNonExpired` tinyint(4) DEFAULT NULL,
  `u_isEnabled` tinyint(4) DEFAULT NULL,
  `u_level` int(11) DEFAULT NULL,
  `u_disabled` tinyint(1) unsigned zerofill DEFAULT NULL,
  `u_address` int(11) DEFAULT NULL,
  `u_zipcode` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza.pizza_user:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_user` DISABLE KEYS */;
REPLACE INTO `pizza_user` (`u_id`, `u_password`, `u_name`, `u_datetime`, `u_isAccountNonExpired`, `u_isAccountNonLocked`, `u_isCredentialNonExpired`, `u_isEnabled`, `u_level`, `u_disabled`, `u_address`, `u_zipcode`) VALUES
	('a', '$2a$10$wpZt/mvoudYbcLrMvBBNTeSCTjVUjqTE/Ks/wsguWMq7iHkT/2pS6', '123', '2020-09-11 21:49:47', 1, 1, 1, 1, 1, 0, NULL, NULL),
	('aaa', '$2a$10$ZSE0ra.nli3CWYMXp2mxEuPo0IYDoV2lSXAR99M9/1t6dWEmt2cZy', '123', '2020-08-27 21:47:26', 1, 1, 1, 1, 3, 0, NULL, NULL),
	('aaaa', '$2a$10$6LGZWfCpwU87zFBSwDv/N.frvFCsZ2F47xvlCDaIh0xwj40O6wR9q', '1234', '2020-08-27 22:03:51', 1, 1, 1, 1, 1, 0, NULL, NULL);
/*!40000 ALTER TABLE `pizza_user` ENABLE KEYS */;

-- 테이블 pizza.spring_session 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 pizza.spring_session:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
REPLACE INTO `spring_session` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
	('630afa15-3d2f-4174-9b0e-21544eef19aa', 'f10f3cd2-53ff-4e6d-96b0-1a441481b5ba', 1600923071556, 1600923084966, 7200, 1600930284966, NULL),
	('a8798a26-2edf-46f5-b45d-d539407ebea0', 'c2c36900-a1fe-4a20-841b-0e611500bf84', 1600922233244, 1600922233664, 7200, 1600929433664, NULL);
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;

-- 테이블 pizza.spring_session_attributes 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 pizza.spring_session_attributes:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
