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


-- pizza_a 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `pizza_a` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pizza_a`;

-- 테이블 pizza_a.000000000_naming_rule 구조 내보내기
CREATE TABLE IF NOT EXISTS `000000000_naming_rule` (
  `rule` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table명은 pizza_로 시작  (ex pizza_user)\r\n\r\nPRIMARY KEY는 table명을 다 써준다. (ex product_id) (cf 제외: user)\r\n\r\n\r\n';

-- 테이블 데이터 pizza_a.000000000_naming_rule:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `000000000_naming_rule` DISABLE KEYS */;
REPLACE INTO `000000000_naming_rule` (`rule`) VALUES
	('table명은 pizza_로 시작  (ex pizza_user)'),
	('PRIMARY KEY는 table명을 다 써준다. (ex product_id) (cf 제외: user)'),
	('key가 아닌 row들은 table명을 축약하여서 앞에 써준다.(ex pizza order, o_status ) '),
	(''),
	(''),
	('table명은 pizza_로 시작  (ex pizza_user)'),
	('PRIMARY KEY는 table명을 다 써준다. (ex product_id) (cf 제외: user)'),
	('key가 아닌 row들은 table명을 축약하여서 앞에 써준다.(ex pizza order, o_status ) '),
	(''),
	('');
/*!40000 ALTER TABLE `000000000_naming_rule` ENABLE KEYS */;

-- 테이블 pizza_a.ingredient_code 구조 내보내기
CREATE TABLE IF NOT EXISTS `ingredient_code` (
  `ingredient_CODE` varchar(50) DEFAULT NULL,
  `ingredient_NAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza_a.ingredient_code:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `ingredient_code` DISABLE KEYS */;
REPLACE INTO `ingredient_code` (`ingredient_CODE`, `ingredient_NAME`) VALUES
	('CH1S0T1', 'cheese1_size0_type1'),
	('DU1S1T1', 'dough1_size1_type1'),
	('SC1S0T1', 'sauce1_size0_type1'),
	('DU1S2T1', 'dough1_size2_type1'),
	('PP1S1T1', 'pepperoni1_size1_type1'),
	('OL1S1T1', 'olive1_size1_type1'),
	('CH2S0T1', 'cheese2_size0_type1');
/*!40000 ALTER TABLE `ingredient_code` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_auth` (
  `u_id` varchar(50) DEFAULT NULL,
  `u_auth` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza_a.pizza_auth:~16 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_auth` DISABLE KEYS */;
REPLACE INTO `pizza_auth` (`u_id`, `u_auth`) VALUES
	('asd', 'ROLE_USER'),
	('123', 'ROLE_USER'),
	('1234', 'ROLE_USER'),
	('aaaa', 'ROLE_MASTER'),
	('aaa', 'ROLE_USER'),
	('qwe', 'ROLE_USER'),
	('aaa44', 'ROLE_USER'),
	('5', 'ROLE_USER'),
	('asd', 'ROLE_USER'),
	('123', 'ROLE_USER'),
	('1234', 'ROLE_USER'),
	('aaaa', 'ROLE_MASTER'),
	('aaa', 'ROLE_USER'),
	('qwe', 'ROLE_USER'),
	('aaa44', 'ROLE_USER'),
	('5', 'ROLE_USER');
/*!40000 ALTER TABLE `pizza_auth` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_board` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_title` varchar(255) DEFAULT NULL,
  `b_content` text DEFAULT NULL,
  `b_writer` varchar(255) DEFAULT NULL,
  `b_datetime` datetime DEFAULT current_timestamp(),
  `u_id` varchar(50) DEFAULT NULL,
  `b_disabled` tinyint(1) unsigned zerofill DEFAULT NULL,
  `b_views` tinyint(3) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `user_id` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza_a.pizza_board:~11 rows (대략적) 내보내기
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

-- 테이블 pizza_a.pizza_ingredients 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_ingredients` (
  `ingredient_CODE` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT 'AUTO_INCREMENT',
  `ingredient_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ingredient_quantity` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  KEY `order_item_id` (`order_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza_a.pizza_ingredients:~46 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_ingredients` DISABLE KEYS */;
REPLACE INTO `pizza_ingredients` (`ingredient_CODE`, `ingredient_name`, `ingredient_quantity`, `order_item_id`) VALUES
	('CH1S0T1', 'cheese', 2, 1),
	('DU1S1T1\r\n', 'dough', 1, 1),
	('PP1S1T1', 'pepperoni', 1, 2),
	('OL1S1T1', 'olive', 1, 3),
	('SC1S0T1', 'sauce', 1, 1),
	('CH1S0T1', 'cheese', 1, 2),
	('SC1S0T1', 'sauce', 1, 2),
	('DU1S2T1', 'dough', 1, 2),
	('CH1S0T1', 'cheese', 1, 3),
	('SC1S0T1', 'sauce', 1, 3),
	('DU1S2T1', 'dough', 1, 3),
	('CH1S0T1', 'cheese', 1, 4),
	('SC1S0T1', 'sauce', 1, 4),
	('DU1S2T1', 'dough', 1, 4),
	('CH1S0T1', 'cheese', 1, 5),
	('SC1S0T1', 'sauce', 1, 5),
	('DU1S2T1', 'dough', 1, 5),
	('CH1S0T1', 'cheese', 1, 7),
	('SC1S0T1', 'sauce', 1, 7),
	('DU1S2T1', 'dough', 1, 7),
	('CH1S0T1', 'cheese', 1, 6),
	('SC1S0T1', 'sauce', 1, 6),
	('DU1S2T1', 'dough', 1, 6),
	('CH1S0T1', 'cheese', 2, 1),
	('DU1S1T1\r\n', 'dough', 1, 1),
	('PP1S1T1', 'pepperoni', 1, 2),
	('OL1S1T1', 'olive', 1, 3),
	('SC1S0T1', 'sauce', 1, 1),
	('CH1S0T1', 'cheese', 1, 2),
	('SC1S0T1', 'sauce', 1, 2),
	('DU1S2T1', 'dough', 1, 2),
	('CH1S0T1', 'cheese', 1, 3),
	('SC1S0T1', 'sauce', 1, 3),
	('DU1S2T1', 'dough', 1, 3),
	('CH1S0T1', 'cheese', 1, 4),
	('SC1S0T1', 'sauce', 1, 4),
	('DU1S2T1', 'dough', 1, 4),
	('CH1S0T1', 'cheese', 1, 5),
	('SC1S0T1', 'sauce', 1, 5),
	('DU1S2T1', 'dough', 1, 5),
	('CH1S0T1', 'cheese', 1, 7),
	('SC1S0T1', 'sauce', 1, 7),
	('DU1S2T1', 'dough', 1, 7),
	('CH1S0T1', 'cheese', 1, 6),
	('SC1S0T1', 'sauce', 1, 6),
	('DU1S2T1', 'dough', 1, 6);
/*!40000 ALTER TABLE `pizza_ingredients` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_order 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `order_time` datetime DEFAULT current_timestamp(),
  `required_time` time DEFAULT NULL,
  `u_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `order_TOTAL_PRICE_WON` int(11) DEFAULT NULL,
  `store_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `order_deliver` tinyint(3) unsigned zerofill DEFAULT NULL,
  `order_zipcode` int(11) DEFAULT NULL,
  `order_address` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `order_request` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK1_u_id` (`u_id`),
  KEY `store_id` (`store_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza_a.pizza_order:~15 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_order` DISABLE KEYS */;
REPLACE INTO `pizza_order` (`order_id`, `order_status`, `order_time`, `required_time`, `u_id`, `order_TOTAL_PRICE_WON`, `store_name`, `order_deliver`, `order_zipcode`, `order_address`, `order_request`) VALUES
	(1, 'baking', '2020-09-29 19:33:56', '00:30:00', 'aaa', 23000, '대구 달성1점', 001, 12451, '대구', '국이짜다'),
	(2, 'delivering', '2020-09-29 19:36:51', '00:20:00', 'aaaa', 42440, '대구 용산점', 000, 12451, '대구 상세생략!', '애미야'),
	(3, 'preparing', '2020-10-06 19:43:22', '00:20:23', 'aaa', 57000, '대구 달성1점', 001, 12451, '대구 상세생략!', '간장쫌'),
	(4, 'preparing', '2020-10-06 22:00:10', '00:00:00', 'aaa', 57500, '대구 달성1점', 000, 12451, '대구 상세생략!', '물좀'),
	(5, 'checking', '2020-10-12 18:10:17', '00:11:00', 'aaa', 75000, '대구 용산점', 001, 12451, '대구 상세생략!', '올때매로나'),
	(6, 'denied', '2020-10-12 20:12:51', '00:00:00', 'aaa', 320000, '대구 달성1점', 001, 12451, '서울 상세생략!', '아 일하기싫어'),
	(7, 'done', '2020-10-12 20:13:44', '21:15:46', 'aaa', 15000, '대구 달성1점', 000, 12451, '대구 상세생략!', '진짜 짜요'),
	(8, 'delivering', '2020-10-19 20:05:37', '04:24:56', 'a', 57000, '대구 용산점', 001, 14123, '서울 우아우', '그리'),
	(9, 'preparing', '2020-10-19 20:14:34', '00:00:00', '123', 15000, '대구 달성1점', 001, 15123, '대구 상세생략!', '막스'),
	(10, 'preparing', '2020-10-19 20:19:15', '00:20:23', 'aaa', 57000, '대구 달성1점', 000, 15324, '부산 대구두구', '웹툰'),
	(11, 'baking', '2020-10-19 21:05:04', '00:05:09', 'aaaa', 13120, '대구 중구1점', 001, 15641, '대누타우닝', '아 싫다싫어 ㅋㅋ'),
	(12, 'preparing', '2020-10-19 21:29:37', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 'preparing', '2020-10-19 21:30:43', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL),
	(14, 'preparing', '2020-10-19 21:35:48', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 'preparing', '2020-10-21 18:50:29', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `pizza_order` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_order_items 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_order_items` (
  `order_id` int(11) DEFAULT NULL,
  `order_item_id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `order_item_size` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `order_item_quantity_EA` int(11) DEFAULT NULL,
  `order_item_price_won` int(11) DEFAULT NULL,
  `order_item_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`order_item_id`) USING BTREE,
  KEY `FK1_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza_a.pizza_order_items:~28 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_order_items` DISABLE KEYS */;
REPLACE INTO `pizza_order_items` (`order_id`, `order_item_id`, `order_item_size`, `order_item_quantity_EA`, `order_item_price_won`, `order_item_name`) VALUES
	(1, 00000000001, 'L', 1, 20000, 'cheese'),
	(2, 00000000002, 'L', 2, 20000, 'Luv U'),
	(3, 00000000003, 'M', 2, 15000, 'U can Do It'),
	(3, 00000000004, 'XL', 2, 20000, 'fighting'),
	(4, 00000000005, 'L', 1, 5000, 'good'),
	(3, 00000000009, 'M', 2, 16000, '5256'),
	(5, 00000000010, 'M', 2, 16000, '235'),
	(4, 00000000011, 'M', 2, 16000, NULL),
	(6, 00000000012, 'XL', 2, 12000, NULL),
	(6, 00000000013, 'L', 1, 13000, NULL),
	(7, 00000000014, 'L', 1, 13000, NULL),
	(10, 00000000015, 'L', 2, 20000, NULL),
	(8, 00000000016, 'L', 2, 20000, NULL),
	(51, 00000000017, 'L', 2, 20000, NULL),
	(5, 00000000018, 'L', 2, 20000, NULL),
	(4, 00000000019, 'M', 2, 20000, NULL),
	(6, 00000000020, 'L', 2, 18000, NULL),
	(1, 00000000021, 'L', 1, 16000, NULL),
	(1, 00000000022, 'L', 3, 15000, NULL),
	(2, 00000000023, 'L', 0, 20000, NULL),
	(300, 00000000024, NULL, 1, 20000, NULL),
	(7, 00000000025, 'M', 2, 18000, NULL),
	(7, 00000000026, 'L', 1, 20000, NULL),
	(106, 00000000027, 'L', 3, 20000, NULL),
	(9, 00000000028, 'L', 1, 20000, NULL),
	(10, 00000000029, 'XL', 3, 20000, NULL),
	(13, 00000000030, 'L', 4, 15000, NULL),
	(15, 00000000031, 'M', 2, 17000, NULL);
/*!40000 ALTER TABLE `pizza_order_items` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_stocks 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_stocks` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_CODE` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `stock_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `stock_remain_time` time DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza_a.pizza_stocks:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_stocks` DISABLE KEYS */;
REPLACE INTO `pizza_stocks` (`stock_id`, `stock_CODE`, `stock_quantity`, `stock_name`, `stock_remain_time`, `store_id`) VALUES
	(1, 'DU1S2T1', 100, 'dough', '20:08:55', 1),
	(2, 'CH1S0T1', 144, 'cheese', '20:09:01', 1),
	(3, 'SC1S0T1', 144, 'source', '20:09:02', 1),
	(4, 'PP1S1T1', 44, 'pepperoni', '20:09:00', 1),
	(5, 'CH1S0T2', 3, 'cheese bri', '20:19:40', 1),
	(6, 'CH1S0T1', 10, 'cheese', '00:21:33', 1),
	(7, 'DU1S1T2', 10, 'dough special', '20:42:10', 1);
/*!40000 ALTER TABLE `pizza_stocks` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_store 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_store` (
  `store_id` int(11) DEFAULT NULL,
  `store_name` varchar(50) DEFAULT NULL,
  `store_namager` varchar(50) DEFAULT NULL,
  `store_phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza_a.pizza_store:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_store` DISABLE KEYS */;
REPLACE INTO `pizza_store` (`store_id`, `store_name`, `store_namager`, `store_phone`) VALUES
	(3, '대구 중구1점', 'park', '01051647894'),
	(1, '대구 달성1점', 'lee', '01051934532'),
	(2, '대구 용산점', 'kim', '01051934532');
/*!40000 ALTER TABLE `pizza_store` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_user` (
  `u_id` varchar(50) NOT NULL,
  `u_password` varchar(200) DEFAULT NULL,
  `u_no` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(50) DEFAULT NULL,
  `u_phone` varchar(11) DEFAULT NULL,
  `u_datetime` datetime DEFAULT current_timestamp(),
  `u_isAccountNonExpired` tinyint(4) DEFAULT NULL,
  `u_isAccountNonLocked` tinyint(4) DEFAULT NULL,
  `u_isCredentialNonExpired` tinyint(4) DEFAULT NULL,
  `u_isEnabled` tinyint(4) DEFAULT NULL,
  `u_level` int(11) DEFAULT NULL,
  `u_disabled` tinyint(1) unsigned zerofill DEFAULT NULL,
  `u_address1` varchar(50) DEFAULT NULL,
  `u_zipcode1` int(11) DEFAULT NULL,
  `store_name_1` varchar(255) DEFAULT NULL,
  `u_address2` varchar(50) DEFAULT NULL,
  `u_zipcode2` int(11) DEFAULT NULL,
  `store_name_2` varchar(255) DEFAULT NULL,
  `u_address3` varchar(50) DEFAULT NULL,
  `u_zipcode3` int(11) DEFAULT NULL,
  `store_name_3` varchar(255) DEFAULT NULL,
  `M_store_id` int(11) DEFAULT NULL,
  `u_basic_address` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_no` (`u_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='u_phone only Domestic\r\n';

-- 테이블 데이터 pizza_a.pizza_user:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_user` DISABLE KEYS */;
REPLACE INTO `pizza_user` (`u_id`, `u_password`, `u_no`, `u_name`, `u_phone`, `u_datetime`, `u_isAccountNonExpired`, `u_isAccountNonLocked`, `u_isCredentialNonExpired`, `u_isEnabled`, `u_level`, `u_disabled`, `u_address1`, `u_zipcode1`, `store_name_1`, `u_address2`, `u_zipcode2`, `store_name_2`, `u_address3`, `u_zipcode3`, `store_name_3`, `M_store_id`, `u_basic_address`) VALUES
	('123', '$2a$10$6Y5ii5ODNls.C0AqsKt4pekqZtxu6g.jYvPNRYGjqAGugcq85D4.O', 1, NULL, '01051934563', '2020-09-25 10:44:38', 1, 1, 1, 1, NULL, NULL, NULL, NULL, '대구 용산점', NULL, NULL, NULL, NULL, NULL, '대구 달성1점', NULL, 1),
	('1234', '$2a$10$4y5rz5t/FMY5FvI6/5BA9ODxFJurfZSw2x6hrYlmZTuOTqm7/72UC', 2, NULL, '01051934563', '2020-09-25 11:34:38', 1, 1, 1, 1, NULL, NULL, NULL, NULL, '대구 용산점', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
	('5', '$2a$10$hbOjMsjnuFDlPSEXrY9DIuTeoFkfmIUlVaeDVcI3f5/y/h5EbBO7W', 9, NULL, '124', '2020-10-14 21:00:07', 1, 1, 1, 1, 1, 0, NULL, NULL, '대구 용산점', NULL, NULL, NULL, NULL, NULL, '대구 달성1점', NULL, 1),
	('a', '$2a$10$wpZt/mvoudYbcLrMvBBNTeSCTjVUjqTE/Ks/wsguWMq7iHkT/2pS6', 3, '123', '01051934563', '2020-09-11 21:49:47', 1, 1, 1, 1, 1, 0, NULL, NULL, '대구 용산점', NULL, NULL, NULL, NULL, NULL, '대구 달성1점', NULL, 1),
	('aaa', '$2a$10$ZSE0ra.nli3CWYMXp2mxEuPo0IYDoV2lSXAR99M9/1t6dWEmt2cZy', 4, '123', '01051934563', '2020-08-27 21:47:26', 1, 1, 1, 1, 3, 0, '성서동로350 302동 1205호', 45713, '대구 달성1점', '중구 파출소', 48293, '대구 중구1점', NULL, NULL, '대구 용산점', NULL, 1),
	('aaa44', '$2a$10$0Tl5BppYj3exmcE2pFqw4.UKHM..5Cg8bZ0ZkRshnf0OKYXDIMNS.', 8, NULL, '01051934532', '2020-10-14 20:46:49', 1, 1, 1, 1, 1, 0, NULL, NULL, '대구 용산점', NULL, NULL, NULL, NULL, NULL, '대구 달성1점', NULL, 1),
	('aaaa', '$2a$10$6LGZWfCpwU87zFBSwDv/N.frvFCsZ2F47xvlCDaIh0xwj40O6wR9q', 5, 'lee', '01051934563', '2020-08-27 22:03:51', 1, 1, 1, 1, 1, 0, '달성군 301', 45231, '대구 용산점', NULL, NULL, NULL, NULL, NULL, '대구 달성1점', 1, 1),
	('asd', '$2a$10$M/gdoqAe6Aemz5261EycjO2OckeHnAE7yrToNaTBiIETuS3r1Cxge', 6, NULL, '01051934563', '2020-09-21 21:09:56', 1, 1, 1, 1, NULL, NULL, NULL, NULL, '대구 용산점', NULL, NULL, '대구 용산점', NULL, NULL, '대구 달성1점', NULL, 1),
	('qwe', '$2a$10$hoInIyEr8VAnORJoc/quR.UnmgwVnloCpWOxPu1bEXrWzmgZqS/l2', 7, NULL, '01051934563', '2020-10-12 17:51:26', 1, 1, 1, 1, NULL, NULL, NULL, NULL, '대구 용산점', NULL, NULL, NULL, NULL, NULL, '대구 달성1점', 2, 1);
/*!40000 ALTER TABLE `pizza_user` ENABLE KEYS */;

-- 테이블 pizza_a.spring_session 구조 내보내기
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

-- 테이블 데이터 pizza_a.spring_session:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
REPLACE INTO `spring_session` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
	('73d0f2f2-5812-4c6c-b0bc-5e13275f131e', '92b09fd7-ac83-4ce5-89ba-6daff172e38e', 1603273821153, 1603276303170, 7200, 1603283503170, 'aaa');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;

-- 테이블 pizza_a.spring_session_attributes 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 pizza_a.spring_session_attributes:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
REPLACE INTO `spring_session_attributes` (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`, `ATTRIBUTE_BYTES`) VALUES
	('73d0f2f2-5812-4c6c-b0bc-5e13275f131e', 'SPRING_SECURITY_CONTEXT', _binary 0xACED00057372003D6F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E636F6E746578742E5365637572697479436F6E74657874496D706C00000000000002120200014C000E61757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B78707372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000002120200024C000B63726564656E7469616C737400124C6A6176612F6C616E672F4F626A6563743B4C00097072696E636970616C71007E0004787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C7371007E0004787001737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00067870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000002770400000002737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000002120200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B7870740009524F4C455F555345527371007E000E740009524F4C455F555345527871007E000D737200486F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E57656241757468656E7469636174696F6E44657461696C7300000000000002120200024C000D72656D6F74654164647265737371007E000F4C000973657373696F6E496471007E000F787074000F303A303A303A303A303A303A303A3174002438623363636465632D323032642D343838612D613639362D6264313364613163366335627073720021636F6D2E70697A7A615F612E6578616D706C652E646F6D61696E2E55736572564F00000000000000010200164900084D53746F726549645A001369734163636F756E744E6F6E457870697265645A001269734163636F756E744E6F6E4C6F636B65645A0016697343726564656E7469616C4E6F6E457870697265645A00096973456E61626C656449000873746F726549643149000873746F726549643249000873746F72654964334900097544697361626C6564490006754C6576656C490009755A6970636F646531490009755A6970636F646532490009755A6970636F6465334C000B617574686F72697469657371007E00064C000870617373776F726471007E000F4C000975416464726573733171007E000F4C000975416464726573733271007E000F4C000975416464726573733371007E000F4C0009754461746554696D6571007E000F4C0005754E616D6571007E000F4C00067550686F6E6571007E000F4C0008757365726E616D6571007E000F7870000000000101010100000000000000000000000000000000000000000000000000000000000000007371007E000C0000000277040000000271007E001071007E00127874003C243261243130245A53453072612E6E6C69334357594D5870326D784575506F304959446F56326C5358415239394D392F3174366457456D7432635A797070707074000331323370740003616161);
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
