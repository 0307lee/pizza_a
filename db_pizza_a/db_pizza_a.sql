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

-- 테이블 데이터 pizza_a.000000000_naming_rule:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `000000000_naming_rule` DISABLE KEYS */;
REPLACE INTO `000000000_naming_rule` (`rule`) VALUES
	('table명은 pizza_로 시작  (ex pizza_user)'),
	('PRIMARY KEY는 table명을 다 써준다. (ex product_id) (cf 제외: user)'),
	('key가 아닌 row들은 table명을 축약하여서 앞에 써준다.(ex pizza order, o_status ) '),
	(''),
	('');
/*!40000 ALTER TABLE `000000000_naming_rule` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_auth` (
  `u_id` varchar(50) DEFAULT NULL,
  `u_auth` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza_a.pizza_auth:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_auth` DISABLE KEYS */;
REPLACE INTO `pizza_auth` (`u_id`, `u_auth`) VALUES
	('asd', 'ROLE_USER'),
	('123', 'ROLE_USER'),
	('1234', 'ROLE_USER'),
	('aaaa', 'ROLE_MASTER'),
	('aaa', 'ROLE_USER'),
	('qwe', 'ROLE_USER');
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

-- 테이블 데이터 pizza_a.pizza_ingredients:~23 rows (대략적) 내보내기
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
  `store_id` tinyint(3) unsigned DEFAULT NULL,
  `order_deliver` tinyint(3) unsigned zerofill DEFAULT NULL,
  `order_zipcode` int(11) DEFAULT NULL,
  `order_address` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK1_u_id` (`u_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza_a.pizza_order:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_order` DISABLE KEYS */;
REPLACE INTO `pizza_order` (`order_id`, `order_status`, `order_time`, `required_time`, `u_id`, `order_TOTAL_PRICE_WON`, `store_id`, `order_deliver`, `order_zipcode`, `order_address`) VALUES
	(1, 'baking', '2020-09-29 19:33:56', '00:30:00', 'aaa', 23000, 1, 001, 12451, '대구'),
	(2, 'delivering', '2020-09-29 19:36:51', '00:20:00', 'aaaa', 42440, 2, 000, 12451, '대구'),
	(3, 'preparing', '2020-10-06 19:43:22', '00:20:23', 'aaa', 57000, 1, 001, 12451, '대구'),
	(4, 'preparing', '2020-10-06 22:00:10', '00:00:00', 'aaa', 57500, 1, 000, 12451, '대구'),
	(5, 'checking', '2020-10-12 18:10:17', '00:11:00', 'aaa', 75000, 2, 001, 12451, '대구'),
	(6, 'denied', '2020-10-12 20:12:51', '00:00:00', 'aaa', 320000, 1, 001, 12451, '서울'),
	(7, 'done', '2020-10-12 20:13:44', '21:15:46', 'aaa', 15000, 1, 000, 12451, '대구'),
	(65, 'preparing', '2020-10-13 20:53:42', NULL, 'aaa', NULL, NULL, NULL, 12451, '대구'),
	(66, 'preparing', '2020-10-13 20:55:30', NULL, 'aaa', NULL, NULL, NULL, 12451, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza_a.pizza_order_items:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_order_items` DISABLE KEYS */;
REPLACE INTO `pizza_order_items` (`order_id`, `order_item_id`, `order_item_size`, `order_item_quantity_EA`, `order_item_price_won`, `order_item_name`) VALUES
	(1, 00000000001, 'L', 1, 20000, 'cheese'),
	(2, 00000000002, 'L', 2, 20000, 'Luv U'),
	(3, 00000000003, 'M', 2, 15000, 'U can Do It'),
	(3, 00000000004, 'XL', 2, 20000, 'fighting'),
	(4, 00000000005, 'L', 1, 5000, 'good'),
	(66, 00000000009, 'M', 2, 16000, NULL);
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
	(1, '대구 달성1점', 'lee', '01051934532'),
	(2, '대구 용산점', 'kim', '01051934532'),
	(3, '대구 중구1점', 'lee', '01051647894');
/*!40000 ALTER TABLE `pizza_store` ENABLE KEYS */;

-- 테이블 pizza_a.pizza_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_user` (
  `u_id` varchar(50) NOT NULL,
  `u_password` varchar(200) DEFAULT NULL,
  `u_no` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(50) DEFAULT NULL,
  `u_datetime` datetime DEFAULT current_timestamp(),
  `u_isAccountNonExpired` tinyint(4) DEFAULT NULL,
  `u_isAccountNonLocked` tinyint(4) DEFAULT NULL,
  `u_isCredentialNonExpired` tinyint(4) DEFAULT NULL,
  `u_isEnabled` tinyint(4) DEFAULT NULL,
  `u_level` int(11) DEFAULT NULL,
  `u_disabled` tinyint(1) unsigned zerofill DEFAULT NULL,
  `u_address1` varchar(50) DEFAULT NULL,
  `u_zipcode1` int(11) DEFAULT NULL,
  `store_id_1` int(11) DEFAULT NULL,
  `u_address2` varchar(50) DEFAULT NULL,
  `u_zipcode2` int(11) DEFAULT NULL,
  `store_id_2` int(11) DEFAULT NULL,
  `u_address3` varchar(50) DEFAULT NULL,
  `u_zipcode3` int(11) DEFAULT NULL,
  `store_id_3` int(11) DEFAULT NULL,
  `M_store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_no` (`u_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza_a.pizza_user:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_user` DISABLE KEYS */;
REPLACE INTO `pizza_user` (`u_id`, `u_password`, `u_no`, `u_name`, `u_datetime`, `u_isAccountNonExpired`, `u_isAccountNonLocked`, `u_isCredentialNonExpired`, `u_isEnabled`, `u_level`, `u_disabled`, `u_address1`, `u_zipcode1`, `store_id_1`, `u_address2`, `u_zipcode2`, `store_id_2`, `u_address3`, `u_zipcode3`, `store_id_3`, `M_store_id`) VALUES
	('123', '$2a$10$6Y5ii5ODNls.C0AqsKt4pekqZtxu6g.jYvPNRYGjqAGugcq85D4.O', 1, NULL, '2020-09-25 10:44:38', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('1234', '$2a$10$4y5rz5t/FMY5FvI6/5BA9ODxFJurfZSw2x6hrYlmZTuOTqm7/72UC', 2, NULL, '2020-09-25 11:34:38', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('a', '$2a$10$wpZt/mvoudYbcLrMvBBNTeSCTjVUjqTE/Ks/wsguWMq7iHkT/2pS6', 3, '123', '2020-09-11 21:49:47', 1, 1, 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('aaa', '$2a$10$ZSE0ra.nli3CWYMXp2mxEuPo0IYDoV2lSXAR99M9/1t6dWEmt2cZy', 4, '123', '2020-08-27 21:47:26', 1, 1, 1, 1, 3, 0, '성서동로350 302동 1205호', 45713, 1, '중구 파출소', 48293, 3, NULL, NULL, NULL, NULL),
	('aaaa', '$2a$10$6LGZWfCpwU87zFBSwDv/N.frvFCsZ2F47xvlCDaIh0xwj40O6wR9q', 5, 'lee', '2020-08-27 22:03:51', 1, 1, 1, 1, 1, 0, '달성군 301', 45231, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1),
	('asd', '$2a$10$M/gdoqAe6Aemz5261EycjO2OckeHnAE7yrToNaTBiIETuS3r1Cxge', 6, NULL, '2020-09-21 21:09:56', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('qwe', '$2a$10$hoInIyEr8VAnORJoc/quR.UnmgwVnloCpWOxPu1bEXrWzmgZqS/l2', 7, NULL, '2020-10-12 17:51:26', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
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

-- 테이블 데이터 pizza_a.spring_session:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
REPLACE INTO `spring_session` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
	('51786025-c5bf-45de-8bf4-7f2d9d0f94fa', '546c3780-1b53-4afd-bb4d-26b4adde2551', 1602588908458, 1602590135367, 7200, 1602597335367, 'aaa'),
	('bf815ab4-b1b8-4e73-96cb-3df81a086b1f', 'a130f89e-c646-47a9-a179-5a4fd7881aa3', 1602588908325, 1602588908325, 7200, 1602596108325, NULL);
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
	('51786025-c5bf-45de-8bf4-7f2d9d0f94fa', 'SPRING_SECURITY_CONTEXT', _binary 0xACED00057372003D6F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E636F6E746578742E5365637572697479436F6E74657874496D706C00000000000002120200014C000E61757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B78707372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000002120200024C000B63726564656E7469616C737400124C6A6176612F6C616E672F4F626A6563743B4C00097072696E636970616C71007E0004787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C7371007E0004787001737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00067870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000002120200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B7870740009524F4C455F555345527871007E000D737200486F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E57656241757468656E7469636174696F6E44657461696C7300000000000002120200024C000D72656D6F74654164647265737371007E000F4C000973657373696F6E496471007E000F787074000F303A303A303A303A303A303A303A3174002463633366386333312D636137352D343736342D613838312D3261363632386363363466357073720021636F6D2E70697A7A615F612E6578616D706C652E646F6D61696E2E55736572564F000000000000000102000B5A001369734163636F756E744E6F6E457870697265645A001269734163636F756E744E6F6E4C6F636B65645A0016697343726564656E7469616C4E6F6E457870697265645A00096973456E61626C6564490009755F7A6970636F64654C000B617574686F72697469657371007E00064C000870617373776F726471007E000F4C0009754461746554696D6571007E000F4C0005754E616D6571007E000F4C0009755F6164647265737371007E000F4C0008757365726E616D6571007E000F787001010101000000007371007E000C0000000177040000000171007E00107874003C243261243130245A53453072612E6E6C69334357594D5870326D784575506F304959446F56326C5358415239394D392F3174366457456D7432635A797074000331323370740003616161);
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
