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

-- 테이블 데이터 pizza_a.pizza_auth:~19 rows (대략적) 내보내기
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
	('5', 'ROLE_USER'),
	('aaaaa', 'ROLE_USER'),
	('bbb', 'ROLE_USER'),
	('tye', 'ROLE_USER');
/*!40000 ALTER TABLE `pizza_auth` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_basic_payment_n_k 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_basic_payment_n_k` (
  `u_pay_method_number` int(11) DEFAULT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `partner_order_id` varchar(50) DEFAULT NULL COMMENT '가맹점 주문번호',
  `partner_user_id` varchar(50) DEFAULT NULL COMMENT '가맹점 주문자 식별키',
  `item_name` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `tax_free_amount` int(11) DEFAULT NULL,
  `approval_url` varchar(50) DEFAULT NULL,
  `cancel_url` varchar(50) DEFAULT NULL,
  `fail_url` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='naverpay kakaopay';

-- 테이블 데이터 pizza_a.pizza_basic_payment_n_k:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_basic_payment_n_k` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizza_basic_payment_n_k` ENABLE KEYS */;

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

-- 테이블 pizza_a.pizza_order 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `order_time` datetime DEFAULT current_timestamp(),
  `required_time` time DEFAULT NULL,
  `u_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `order_TOTAL_PRICE_WON` int(11) DEFAULT NULL,
  `order_store_id` int(11) DEFAULT NULL,
  `order_deliver` tinyint(3) unsigned zerofill DEFAULT NULL,
  `order_request` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `order_address_id` int(11) DEFAULT NULL,
  `order_address` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `order_zipcode` int(11) DEFAULT NULL,
  `order_pay_method` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK1_u_id` (`u_id`),
  KEY `store_id` (`order_store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza_a.pizza_order:~57 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_order` DISABLE KEYS */;
REPLACE INTO `pizza_order` (`order_id`, `order_status`, `order_time`, `required_time`, `u_id`, `order_TOTAL_PRICE_WON`, `order_store_id`, `order_deliver`, `order_request`, `order_address_id`, `order_address`, `order_zipcode`, `order_pay_method`) VALUES
	(1, 'baking', '2020-09-29 19:33:56', '00:30:00', 'aaa', 23000, 1, 001, '국이짜다', NULL, NULL, NULL, NULL),
	(2, 'delivering', '2020-09-29 19:36:51', '00:20:00', 'aaaa', 42440, 1, 000, '애미야', NULL, NULL, NULL, NULL),
	(3, 'preparing', '2020-10-06 19:43:22', '00:20:23', 'aaa', 57000, 1, 001, '간장쫌', NULL, NULL, NULL, NULL),
	(4, 'preparing', '2020-10-06 22:00:10', '00:00:00', 'aaa', 57500, 1, 000, '물좀', NULL, NULL, NULL, NULL),
	(5, 'checking', '2020-10-12 18:10:17', '00:11:00', 'aaa', 75000, 2, 001, '올때매로나', NULL, NULL, NULL, NULL),
	(6, 'denied', '2020-10-12 20:12:51', '00:00:00', 'aaa', 320000, 1, 001, '아 일하기싫어', NULL, NULL, NULL, NULL),
	(7, 'done', '2020-10-12 20:13:44', '21:15:46', 'aaa', 15000, 1, 000, '진짜 짜요 좀덜짜게좀', NULL, NULL, NULL, NULL),
	(8, 'delivering', '2020-10-19 20:05:37', '04:24:56', 'a', 57000, 3, 001, '그리', NULL, NULL, NULL, NULL),
	(9, 'preparing', '2020-10-19 20:14:34', '00:00:00', '123', 15000, 2, 001, '막스', NULL, NULL, NULL, NULL),
	(10, 'preparing', '2020-10-19 20:19:15', '00:20:23', 'aaa', 57000, 1, 000, '웹툰', NULL, NULL, NULL, NULL),
	(11, 'baking', '2020-10-19 21:05:04', '00:05:09', 'aaaa', 13120, 3, 001, '아 싫다싫어 ㅋㅋ', NULL, NULL, NULL, NULL),
	(63, 'preparing', '2020-12-28 16:08:40', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(64, 'preparing', '2020-12-28 18:08:22', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(65, 'preparing', '2020-12-28 18:17:40', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(66, 'preparing', '2020-12-28 18:19:22', NULL, 'aaa', NULL, 1, NULL, NULL, NULL, '자이프루지오2호', 18877, NULL),
	(67, 'preparing', '2020-12-28 18:46:38', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(68, 'preparing', '2020-12-28 18:48:30', NULL, 'aa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(69, 'preparing', '2020-12-28 18:53:04', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(70, 'preparing', '2020-12-28 19:20:24', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(71, 'preparing', '2020-12-28 19:20:26', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(72, 'preparing', '2020-12-28 19:20:34', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(73, 'preparing', '2020-12-28 19:21:02', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(74, 'preparing', '2020-12-28 19:21:13', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(75, 'preparing', '2020-12-28 19:31:55', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(76, 'preparing', '2020-12-28 19:32:07', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(77, 'preparing', '2020-12-28 19:35:20', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(78, 'preparing', '2020-12-28 19:35:33', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(79, 'preparing', '2020-12-28 19:36:59', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(80, 'preparing', '2020-12-28 19:37:38', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(81, 'preparing', '2020-12-28 19:37:45', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(82, 'preparing', '2020-12-28 19:41:10', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(83, 'preparing', '2020-12-28 19:41:13', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(84, 'preparing', '2020-12-28 19:41:24', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(85, 'preparing', '2020-12-28 19:51:25', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(86, 'preparing', '2020-12-28 19:52:49', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(87, 'preparing', '2020-12-28 19:52:51', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(88, 'preparing', '2020-12-28 19:52:59', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(89, 'preparing', '2020-12-28 19:53:05', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(90, 'preparing', '2020-12-28 19:53:41', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(91, 'preparing', '2020-12-28 19:54:16', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(92, 'preparing', '2020-12-28 19:54:42', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(93, 'preparing', '2020-12-28 19:54:43', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(94, 'preparing', '2020-12-28 19:54:45', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(95, 'preparing', '2020-12-28 19:55:37', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(96, 'preparing', '2020-12-28 20:03:52', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(97, 'preparing', '2020-12-28 20:14:38', NULL, 'aaa', NULL, 1, NULL, NULL, NULL, '자이프루지오2호', 18877, NULL),
	(98, 'preparing', '2020-12-28 20:31:46', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(99, 'preparing', '2020-12-28 20:33:18', NULL, 'tye', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(100, 'preparing', '2020-12-28 20:33:27', NULL, 'tye', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(101, 'preparing', '2020-12-28 20:37:31', NULL, 'tye', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(102, 'preparing', '2020-12-28 20:41:23', NULL, 'tye', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(103, 'preparing', '2020-12-28 20:41:26', NULL, 'tye', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(104, 'preparing', '2020-12-28 20:41:41', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(105, 'preparing', '2020-12-28 20:42:00', NULL, 'aaa', NULL, 1, NULL, NULL, NULL, '자이프루지오2호', 18877, NULL),
	(106, 'preparing', '2020-12-30 18:56:19', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(107, 'preparing', '2020-12-30 18:56:25', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(108, 'preparing', '2020-12-30 19:00:19', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(109, 'preparing', '2020-12-30 20:42:13', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(110, 'preparing', '2020-12-30 20:42:20', NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza_a.pizza_order_items:~32 rows (대략적) 내보내기
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
	(7, 00000000025, 'XL', 3, 18000, NULL),
	(6, 00000000026, 'L', 1, 1155000, NULL),
	(61, 00000000068, 'M', 4, 9000, NULL),
	(62, 00000000069, 'M', 7, 16000, NULL),
	(63, 00000000070, 'M', 2, 20000, NULL),
	(64, 00000000071, 'XL', 7, 63000, NULL),
	(65, 00000000072, 'XL', 6, 78000, NULL),
	(66, 00000000073, 'XL', 2, 40000, NULL),
	(79, 00000000074, 'XL', 3, 20000, NULL),
	(80, 00000000075, 'XL', 3, 20000, NULL),
	(81, 00000000076, 'XL', 3, 15000, NULL),
	(84, 00000000077, 'XL', 4, 20000, NULL),
	(85, 00000000078, 'XL', 4, 20000, NULL),
	(95, 00000000079, 'XL', 4, 17000, NULL),
	(96, 00000000080, 'XL', 2, 15000, NULL),
	(97, 00000000081, 'XL', 3, 20000, NULL),
	(98, 00000000082, 'L', 3, 20000, NULL),
	(99, 00000000083, 'XL', 4, 17000, NULL),
	(100, 00000000084, 'XL', 4, 17000, NULL),
	(101, 00000000085, 'L', 3, 16000, NULL),
	(105, 00000000086, 'XL', 2, 20000, NULL),
	(106, 00000000087, 'XL', 4, 20000, NULL),
	(107, 00000000088, 'XL', 4, 20000, NULL),
	(108, 00000000089, 'XL', 4, 20000, NULL),
	(109, 00000000090, 'XL', 3, 20000, NULL),
	(110, 00000000091, 'XL', 3, 20000, NULL);
/*!40000 ALTER TABLE `pizza_order_items` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_store 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_store` (
  `store_id` int(11) DEFAULT NULL,
  `store_name` varchar(50) DEFAULT NULL,
  `store_manager` varchar(50) DEFAULT NULL,
  `store_phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza_a.pizza_store:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_store` DISABLE KEYS */;
REPLACE INTO `pizza_store` (`store_id`, `store_name`, `store_manager`, `store_phone`) VALUES
	(3, '대구 중구1점', 'park', '01051647894'),
	(1, '대구 달성1점', 'lee', '01051934532'),
	(2, '대구 용산점', 'kim', '01051934532'),
	(4, '부산 광안리점', 'fukne', '01051642311');
/*!40000 ALTER TABLE `pizza_store` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_store_ingredients 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_store_ingredients` (
  `ingredient_CODE` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT 'AUTO_INCREMENT',
  `ingredient_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ingredient_quantity` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  KEY `order_item_id` (`order_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza_a.pizza_store_ingredients:~46 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_store_ingredients` DISABLE KEYS */;
REPLACE INTO `pizza_store_ingredients` (`ingredient_CODE`, `ingredient_name`, `ingredient_quantity`, `order_item_id`) VALUES
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
/*!40000 ALTER TABLE `pizza_store_ingredients` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_store_stocks 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_store_stocks` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_CODE` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `stock_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `stock_remain_time` time DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza_a.pizza_store_stocks:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_store_stocks` DISABLE KEYS */;
REPLACE INTO `pizza_store_stocks` (`stock_id`, `stock_CODE`, `stock_quantity`, `stock_name`, `stock_remain_time`, `store_id`) VALUES
	(1, 'DU1S2T1', 100, 'dough', '20:08:55', 1),
	(2, 'CH1S0T1', 144, 'cheese', '20:09:01', 1),
	(3, 'SC1S0T1', 144, 'source', '20:09:02', 1),
	(4, 'PP1S1T1', 44, 'pepperoni', '20:09:00', 1),
	(5, 'CH1S0T2', 3, 'cheese bri', '20:19:40', 1),
	(6, 'CH1S0T1', 10, 'cheese', '00:21:33', 1),
	(7, 'DU1S1T2', 10, 'dough special', '20:42:10', 1);
/*!40000 ALTER TABLE `pizza_store_stocks` ENABLE KEYS */;

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
  `u_disabled_` tinyint(1) unsigned zerofill DEFAULT NULL,
  `M_store_id` int(11) DEFAULT NULL,
  `u_basic_address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_no` (`u_no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='u_phone only Domestic\r\n';

-- 테이블 데이터 pizza_a.pizza_user:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_user` DISABLE KEYS */;
REPLACE INTO `pizza_user` (`u_id`, `u_password`, `u_no`, `u_name`, `u_phone`, `u_datetime`, `u_isAccountNonExpired`, `u_isAccountNonLocked`, `u_isCredentialNonExpired`, `u_isEnabled`, `u_level`, `u_disabled_`, `M_store_id`, `u_basic_address_id`) VALUES
	('123', '$2a$10$6Y5ii5ODNls.C0AqsKt4pekqZtxu6g.jYvPNRYGjqAGugcq85D4.O', 1, NULL, '01051934563', '2020-09-25 10:44:38', 1, 1, 1, 1, NULL, NULL, NULL, 11),
	('1234', '$2a$10$4y5rz5t/FMY5FvI6/5BA9ODxFJurfZSw2x6hrYlmZTuOTqm7/72UC', 2, NULL, '01051934563', '2020-09-25 11:34:38', 1, 1, 1, 1, NULL, NULL, NULL, 1),
	('5', '$2a$10$hbOjMsjnuFDlPSEXrY9DIuTeoFkfmIUlVaeDVcI3f5/y/h5EbBO7W', 9, NULL, '124', '2020-10-14 21:00:07', 1, 1, 1, 1, 1, 0, NULL, 6),
	('a', '$2a$10$wpZt/mvoudYbcLrMvBBNTeSCTjVUjqTE/Ks/wsguWMq7iHkT/2pS6', 3, '123', '01051934563', '2020-09-11 21:49:47', 1, 1, 1, 1, 1, 0, NULL, 1),
	('aaa', '$2a$10$ZSE0ra.nli3CWYMXp2mxEuPo0IYDoV2lSXAR99M9/1t6dWEmt2cZy', 4, '123', '01051934563', '2020-08-27 21:47:26', 1, 1, 1, 1, 3, 0, NULL, 5),
	('aaa44', '$2a$10$0Tl5BppYj3exmcE2pFqw4.UKHM..5Cg8bZ0ZkRshnf0OKYXDIMNS.', 8, NULL, '01051934532', '2020-10-14 20:46:49', 1, 1, 1, 1, 1, 0, NULL, 5),
	('aaaa', '$2a$10$6LGZWfCpwU87zFBSwDv/N.frvFCsZ2F47xvlCDaIh0xwj40O6wR9q', 5, 'lee', '01051934563', '2020-08-27 22:03:51', 1, 1, 1, 1, 1, 0, 1, 6),
	('aaaaa', '$2a$10$szB0cbtDztpIPn00wV3EKuoY69YkwAzULaCAcR.nfyVTaLeAJzexS', 10, NULL, '0105123452', '2020-10-22 19:08:08', 1, 1, 1, 1, 1, 0, NULL, 3),
	('asd', '$2a$10$M/gdoqAe6Aemz5261EycjO2OckeHnAE7yrToNaTBiIETuS3r1Cxge', 6, NULL, '01051934563', '2020-09-21 21:09:56', 1, 1, 1, 1, NULL, NULL, NULL, 5),
	('bbb', '$2a$10$gyBHfQKUJqrHp5IjinWqEe/x0RdxCNnSUHgk.3U4g8V/weykM5pca', 11, NULL, '01051934532', '2020-12-07 19:54:09', 1, 1, 1, 1, 1, 0, NULL, 7),
	('qwe', '$2a$10$hoInIyEr8VAnORJoc/quR.UnmgwVnloCpWOxPu1bEXrWzmgZqS/l2', 7, NULL, '01051934563', '2020-10-12 17:51:26', 1, 1, 1, 1, NULL, NULL, 2, 1),
	('tye', '$2a$10$zuGzEuTfMROEW3dwtfISoeWNgwLy/U/.kiU3EYznqM5ylnd.Cl/8.', 12, NULL, '0105', '2020-12-28 20:33:13', 1, 1, 1, 1, 1, 0, NULL, NULL);
/*!40000 ALTER TABLE `pizza_user` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_user_additional 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_user_additional` (
  `u_id` varchar(50) DEFAULT NULL,
  `u_add_point` int(11) DEFAULT NULL,
  `u_add_coupon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza_a.pizza_user_additional:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_user_additional` DISABLE KEYS */;
REPLACE INTO `pizza_user_additional` (`u_id`, `u_add_point`, `u_add_coupon`) VALUES
	('asd', 88, NULL),
	('123', 100100, NULL),
	('11', 88, NULL),
	('111', 100100, NULL),
	('aaa', 100, NULL),
	('aa', 8888, NULL),
	('s', 100, NULL),
	('bb', 8888, NULL),
	('sdf', 88, NULL),
	('qwe', 8888, NULL),
	('123', 888888, NULL),
	('v', 21512, NULL);
/*!40000 ALTER TABLE `pizza_user_additional` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_user_address 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_user_address` (
  `u_id` varchar(50) NOT NULL,
  `u_address_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `u_address` varchar(50) DEFAULT NULL,
  `u_zipcode` int(11) DEFAULT NULL,
  `u_store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza_a.pizza_user_address:~20 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_user_address` DISABLE KEYS */;
REPLACE INTO `pizza_user_address` (`u_id`, `u_address_id`, `u_address`, `u_zipcode`, `u_store_id`) VALUES
	('123', 1, '평화타운 320동 2301호', 15123, 1),
	('123', 2, '평화타운 302222호', 48546, 1),
	('1234', 3, '마을이장님댁', 48546, 2),
	('1234', 4, '가수마을 102호', 15123, 1),
	('5', 5, '자이프루지오2호', 18877, 1),
	('5', 6, '20호 30구의 주차장', 51542, 1),
	('a', 7, '빌헤밍턴아저씨집', 48546, 1),
	('a', 8, '테크투북로 305길', 61234, 1),
	('aaa', 9, '중구 파출소', 48293, 3),
	('aaa', 10, '성서동로350 302동 1205호', 45713, 2),
	('aaa44', 11, '한남동 50호', 13246, 2),
	('aaa44', 12, '마이클집주소', 23425, 1),
	('aaaa', 13, '이태원 사하구 301호', 48546, 2),
	('aaaa', 14, '달성군 301', 45231, 1),
	('aaaaa', 15, '나의 집주소 1번 예시', 12451, 3),
	('aaaaa', 16, '전라북도 전흥구 50호', 45641, 1),
	('asd', 17, '사는곳은 거미집', 36346, 1),
	('asd', 18, '우리집앞 506호', 46451, 2),
	('qwe', 19, '우리집에 살아요302호', 48546, 1),
	('qwe', 20, '사랑한다 아들아 504호', 48546, 2);
/*!40000 ALTER TABLE `pizza_user_address` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_user_payment_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_user_payment_info` (
  `u_payment_number` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `u_id` varchar(50) DEFAULT NULL,
  `u_pay_method_number` int(11) DEFAULT NULL,
  `u_account_holder` varchar(50) DEFAULT NULL,
  `u_account_number` int(11) DEFAULT NULL,
  `u_receipt_phone_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`u_payment_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='s';

-- 테이블 데이터 pizza_a.pizza_user_payment_info:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_user_payment_info` DISABLE KEYS */;
REPLACE INTO `pizza_user_payment_info` (`u_payment_number`, `u_id`, `u_pay_method_number`, `u_account_holder`, `u_account_number`, `u_receipt_phone_number`) VALUES
	(1, 'aaa', 2, NULL, NULL, '0150193452'),
	(2, 'aa', 1, NULL, NULL, '2362626234'),
	(3, 's', 2, NULL, NULL, '6234534534'),
	(4, '123', 2, NULL, NULL, '235236235'),
	(5, 'asd', 3, NULL, NULL, '234623572345'),
	(6, 'bbb', 1, NULL, NULL, '234623573');
/*!40000 ALTER TABLE `pizza_user_payment_info` ENABLE KEYS */;

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
	('fa05f1e6-e203-42dc-a977-add34acb7275', '4220f912-ae41-434c-89a3-fbdf6960bb2b', 1609326888107, 1609328831746, 7200, 1609336031746, 'aaa');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;

-- 테이블 pizza_a.spring_session_attributes 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 pizza_a.spring_session_attributes:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
REPLACE INTO `spring_session_attributes` (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`, `ATTRIBUTE_BYTES`) VALUES
	('fa05f1e6-e203-42dc-a977-add34acb7275', 'SPRING_SECURITY_CONTEXT', _binary 0xACED00057372003D6F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E636F6E746578742E5365637572697479436F6E74657874496D706C00000000000002120200014C000E61757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B78707372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000002120200024C000B63726564656E7469616C737400124C6A6176612F6C616E672F4F626A6563743B4C00097072696E636970616C71007E0004787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C7371007E0004787001737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00067870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000002770400000002737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000002120200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B7870740009524F4C455F555345527371007E000E740009524F4C455F555345527871007E000D737200486F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E57656241757468656E7469636174696F6E44657461696C7300000000000002120200024C000D72656D6F74654164647265737371007E000F4C000973657373696F6E496471007E000F787074000F303A303A303A303A303A303A303A3174002433333037373561382D343263342D343765342D386531372D3638653066663237646436637073720021636F6D2E70697A7A615F612E6578616D706C652E646F6D61696E2E55736572564F00000000000000010200164900084D53746F726549645A001369734163636F756E744E6F6E457870697265645A001269734163636F756E744E6F6E4C6F636B65645A0016697343726564656E7469616C4E6F6E457870697265645A00096973456E61626C656449000975416464506F696E7449000A7541646472657373496449000F7542617369634164647265737349644900097544697361626C6564490006754C6576656C490010755061794D6574686F644E756D6265724900097553746F7265496431490009755A6970636F6465314C000B617574686F72697469657371007E00064C000870617373776F726471007E000F4C000975416464726573733171007E000F4C0009754461746554696D6571007E000F4C0005754E616D6571007E000F4C00067550686F6E6571007E000F4C0013755265636569707450686F6E654E756D62657271007E000F4C000B7553746F72654E616D653171007E000F4C0008757365726E616D6571007E000F7870000000000101010100000000000000000000000000000000000000000000000000000000000000007371007E000C0000000277040000000271007E001071007E00127874003C243261243130245A53453072612E6E6C69334357594D5870326D784575506F304959446F56326C5358415239394D392F3174366457456D7432635A797070740003313233707070740003616161);
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
