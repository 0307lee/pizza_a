-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.5-MariaDB - mariadb.org binary distribution
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

-- 테이블 pizza.(notyet)pizza_store 구조 내보내기
CREATE TABLE IF NOT EXISTS `(notyet)pizza_store` (
  `not yet` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `store_name` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza.(notyet)pizza_store:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `(notyet)pizza_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `(notyet)pizza_store` ENABLE KEYS */;

-- 테이블 pizza.0_naming_rule 구조 내보내기
CREATE TABLE IF NOT EXISTS `0_naming_rule` (
  `rule` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table명은 pizza_로 시작  (ex pizza_user)\r\n\r\nPRIMARY KEY는 table명을 다 써준다. (ex product_id) (cf 제외: user)\r\n\r\nkey가 아닌 row들은 table명을 축약하여서 앞에 써준다. (ex pizza order, o_status )\r\n\r\n';

-- 테이블 데이터 pizza.0_naming_rule:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `0_naming_rule` DISABLE KEYS */;
REPLACE INTO `0_naming_rule` (`rule`) VALUES
	('table명은 pizza_로 시작  (ex pizza_user)'),
	('PRIMARY KEY는 table명을 다 써준다. (ex product_id) (cf 제외: user)'),
	('key가 아닌 row들은 table명을 축약하여서 앞에 써준다.(ex pizza order, o_status ) '),
	(''),
	('');
/*!40000 ALTER TABLE `0_naming_rule` ENABLE KEYS */;

-- 테이블 pizza.pizza_auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_auth` (
  `u_id` varchar(50) DEFAULT NULL,
  `u_auth` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza.pizza_auth:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_auth` DISABLE KEYS */;
REPLACE INTO `pizza_auth` (`u_id`, `u_auth`) VALUES
	('asd', 'ROLE_USER'),
	('123', 'ROLE_USER'),
	('1234', 'ROLE_USER'),
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
  `b_views` tinyint(3) unsigned zerofill DEFAULT NULL,
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
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `order_status` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `order_time` datetime DEFAULT current_timestamp(),
  `required_time` time DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK1_u_id` (`u_id`),
  CONSTRAINT `FK1_u_id` FOREIGN KEY (`u_id`) REFERENCES `pizza_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza.pizza_order:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_order` DISABLE KEYS */;
REPLACE INTO `pizza_order` (`order_id`, `u_id`, `order_status`, `order_time`, `required_time`) VALUES
	(1, 'aaa', 'making', '2020-09-29 19:33:56', '00:30:00'),
	(2, 'aaaa', 'delivering', '2020-09-29 19:36:51', '00:20:00'),
	(3, 'aaaa', 'done', '2020-10-05 19:16:37', '00:00:00');
/*!40000 ALTER TABLE `pizza_order` ENABLE KEYS */;

-- 테이블 pizza.pizza_order_items 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_order_items` (
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `o_i_size` int(11) DEFAULT NULL,
  `o_i_quantity(EA)` int(11) DEFAULT NULL,
  `o_i_discount(per)` int(11) DEFAULT NULL,
  `o_i_list_price(won)` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK1_order_id` (`order_id`) USING BTREE,
  CONSTRAINT `FK1_order_id` FOREIGN KEY (`order_id`) REFERENCES `pizza_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza.pizza_order_items:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_order_items` DISABLE KEYS */;
REPLACE INTO `pizza_order_items` (`order_id`, `item_id`, `product_id`, `o_i_size`, `o_i_quantity(EA)`, `o_i_discount(per)`, `o_i_list_price(won)`) VALUES
	(1, 1, 1, 2, 1, 0, 20000),
	(2, 2, 2, 2, 1, 0, 20000),
	(1, 3, 2, 2, 1, 0, 25000);
/*!40000 ALTER TABLE `pizza_order_items` ENABLE KEYS */;

-- 테이블 pizza.pizza_products 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_products` (
  `product_id` int(11) DEFAULT NULL,
  `product_contents_no` int(11) DEFAULT NULL,
  `product_contents_quantity` int(11) DEFAULT NULL,
  `product_contents_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza.pizza_products:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_products` DISABLE KEYS */;
REPLACE INTO `pizza_products` (`product_id`, `product_contents_no`, `product_contents_quantity`, `product_contents_price`) VALUES
	(1, 1, 1, 4000),
	(2, 3, 1, 2000),
	(2, 1, 1, 2000),
	(2, 2, 1, 2000);
/*!40000 ALTER TABLE `pizza_products` ENABLE KEYS */;

-- 테이블 pizza.pizza_stocks 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_stocks` (
  `store_id` int(11) DEFAULT NULL,
  `product_contents_no` int(11) DEFAULT NULL,
  `product_contents_quantity` int(11) DEFAULT NULL,
  `product_contents_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 pizza.pizza_stocks:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_stocks` DISABLE KEYS */;
REPLACE INTO `pizza_stocks` (`store_id`, `product_contents_no`, `product_contents_quantity`, `product_contents_name`) VALUES
	(1, 1, 30, 'cheese'),
	(1, 2, 20, 'dough'),
	(1, 3, 10, 'sauce_tomato'),
	(1, 4, 10, 'olive');
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
  `u_address1` varchar(50) DEFAULT NULL,
  `u_zipcode1` int(11) DEFAULT NULL,
  `u_address2` varchar(50) DEFAULT NULL,
  `u_zipcode2` int(11) DEFAULT NULL,
  `u_address3` varchar(50) DEFAULT NULL,
  `u_zipcode3` int(11) DEFAULT NULL,
  `u_no` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`u_id`) USING BTREE,
  KEY `u_no` (`u_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza.pizza_user:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_user` DISABLE KEYS */;
REPLACE INTO `pizza_user` (`u_id`, `u_password`, `u_name`, `u_datetime`, `u_isAccountNonExpired`, `u_isAccountNonLocked`, `u_isCredentialNonExpired`, `u_isEnabled`, `u_level`, `u_disabled`, `u_address1`, `u_zipcode1`, `u_address2`, `u_zipcode2`, `u_address3`, `u_zipcode3`, `u_no`) VALUES
	('123', '$2a$10$6Y5ii5ODNls.C0AqsKt4pekqZtxu6g.jYvPNRYGjqAGugcq85D4.O', NULL, '2020-09-25 10:44:38', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
	('1234', '$2a$10$4y5rz5t/FMY5FvI6/5BA9ODxFJurfZSw2x6hrYlmZTuOTqm7/72UC', NULL, '2020-09-25 11:34:38', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
	('a', '$2a$10$wpZt/mvoudYbcLrMvBBNTeSCTjVUjqTE/Ks/wsguWMq7iHkT/2pS6', '123', '2020-09-11 21:49:47', 1, 1, 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3),
	('aaa', '$2a$10$ZSE0ra.nli3CWYMXp2mxEuPo0IYDoV2lSXAR99M9/1t6dWEmt2cZy', '123', '2020-08-27 21:47:26', 1, 1, 1, 1, 3, 0, '성서동로350 302동 1205호', 45713, NULL, NULL, NULL, NULL, 4),
	('aaaa', '$2a$10$6LGZWfCpwU87zFBSwDv/N.frvFCsZ2F47xvlCDaIh0xwj40O6wR9q', '1234', '2020-08-27 22:03:51', 1, 1, 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 5),
	('asd', '$2a$10$M/gdoqAe6Aemz5261EycjO2OckeHnAE7yrToNaTBiIETuS3r1Cxge', NULL, '2020-09-21 21:09:56', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6);
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

-- 테이블 데이터 pizza.spring_session:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
REPLACE INTO `spring_session` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
	('8d0cc992-5dfd-4b73-9f00-3556002671b5', 'e2440a00-2110-42b2-88a7-14b6ae38cb3c', 1601893641464, 1601893698395, 7200, 1601900898395, 'aaa');
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
REPLACE INTO `spring_session_attributes` (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`, `ATTRIBUTE_BYTES`) VALUES
	('8d0cc992-5dfd-4b73-9f00-3556002671b5', 'SPRING_SECURITY_CONTEXT', _binary 0xACED00057372003D6F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E636F6E746578742E5365637572697479436F6E74657874496D706C00000000000002120200014C000E61757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B78707372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000002120200024C000B63726564656E7469616C737400124C6A6176612F6C616E672F4F626A6563743B4C00097072696E636970616C71007E0004787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C7371007E0004787001737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00067870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000002120200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B7870740009524F4C455F555345527871007E000D737200486F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E57656241757468656E7469636174696F6E44657461696C7300000000000002120200024C000D72656D6F74654164647265737371007E000F4C000973657373696F6E496471007E000F787074000F303A303A303A303A303A303A303A3174002461396264653466372D393466362D343433652D613365312D3533626636666162643034647073720021636F6D2E70697A7A615F612E6578616D706C652E646F6D61696E2E55736572564F000000000000000102000B5A001369734163636F756E744E6F6E457870697265645A001269734163636F756E744E6F6E4C6F636B65645A0016697343726564656E7469616C4E6F6E457870697265645A00096973456E61626C6564490009755F7A6970636F64654C000B617574686F72697469657371007E00064C000870617373776F726471007E000F4C0009754461746554696D6571007E000F4C0005754E616D6571007E000F4C0009755F6164647265737371007E000F4C0008757365726E616D6571007E000F787001010101000000007371007E000C0000000177040000000171007E00107874003C243261243130245A53453072612E6E6C69334357594D5870326D784575506F304959446F56326C5358415239394D392F3174366457456D7432635A797074000331323370740003616161);
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
