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

-- 테이블 데이터 pizza.pizza_auth:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_auth` DISABLE KEYS */;
REPLACE INTO `pizza_auth` (`u_id`, `u_auth`) VALUES
	('aaaa', 'ROLE_MASTER'),
	('aaa', 'ROLE_USER'),
	('asd', 'ROLE_USER'),
	('sd', 'ROLE_USER'),
	('asdasd', 'ROLE_USER'),
	('adfa', 'ROLE_USER');
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

-- 테이블 pizza.pizza_orders 구조 내보내기
CREATE TABLE IF NOT EXISTS `pizza_orders` (
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza.pizza_orders:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizza_orders` ENABLE KEYS */;

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
  `u_phone` int(11) DEFAULT NULL,
  `u_address` char(50) DEFAULT NULL,
  `u_zipcode` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza.pizza_user:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pizza_user` DISABLE KEYS */;
REPLACE INTO `pizza_user` (`u_id`, `u_password`, `u_name`, `u_datetime`, `u_isAccountNonExpired`, `u_isAccountNonLocked`, `u_isCredentialNonExpired`, `u_isEnabled`, `u_level`, `u_disabled`, `u_phone`, `u_address`, `u_zipcode`) VALUES
	('a', '$2a$10$wpZt/mvoudYbcLrMvBBNTeSCTjVUjqTE/Ks/wsguWMq7iHkT/2pS6', '123', '2020-09-11 21:49:47', 1, 1, 1, 1, 1, 0, NULL, NULL, NULL),
	('aaa', '$2a$10$ZSE0ra.nli3CWYMXp2mxEuPo0IYDoV2lSXAR99M9/1t6dWEmt2cZy', '123', '2020-08-27 21:47:26', 1, 1, 1, 1, 3, 0, NULL, NULL, NULL),
	('aaaa', '$2a$10$6LGZWfCpwU87zFBSwDv/N.frvFCsZ2F47xvlCDaIh0xwj40O6wR9q', '1234', '2020-08-27 22:03:51', 1, 1, 1, 1, 1, 0, NULL, NULL, NULL),
	('adfa', '$2a$10$mKzn0ws3UT9gvApP6PFuJeFVSGh54JUtJpe5hUC13nUGm.jcIbKDm', NULL, '2020-09-22 22:02:50', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
	('asd', '$2a$10$M/gdoqAe6Aemz5261EycjO2OckeHnAE7yrToNaTBiIETuS3r1Cxge', NULL, '2020-09-21 21:09:56', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
	('asdasd', '$2a$10$F9oxY.TbpIVFOt5rt6HdIusg4cbRTPLIy4vyjGdI/6uPdL84MvTUW', NULL, '2020-09-22 21:48:28', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL),
	('sd', '$2a$10$l0/xi3msp.o.FkjIbN/PYust/a5U3s2Mtk64UzMIAKdrqkdjHHq.y', NULL, '2020-09-22 21:46:28', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL);
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

-- 테이블 데이터 pizza.spring_session:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
REPLACE INTO `spring_session` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
	('02389714-a081-41aa-a7d3-19276b55d550', 'a7c5dc3f-64bc-4ed4-afa3-c293824570a6', 1600856373352, 1600856609927, 7200, 1600863809927, NULL),
	('203dabed-d2be-4586-ba15-3a3a4e4f101f', '38ef71ef-1714-4e07-8b49-29c2b3a2a646', 1600854718683, 1600854718823, 7200, 1600861918823, NULL),
	('63f8b434-897f-4d02-bd4f-50a60222b32d', '1ba03afd-d89e-4408-9d85-fe599bb54a0d', 1600859317841, 1600859554972, 7200, 1600866754972, 'aaa'),
	('9cda8bd8-a9d0-4c04-84a1-7d80c01041c4', '139c8913-b470-4bdd-a91a-cf1ad7f8b375', 1600857460202, 1600857493831, 7200, 1600864693831, NULL);
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;

-- 테이블 pizza.spring_session_attributes 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 pizza.spring_session_attributes:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
REPLACE INTO `spring_session_attributes` (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`, `ATTRIBUTE_BYTES`) VALUES
	('02389714-a081-41aa-a7d3-19276b55d550', 'SPRING_SECURITY_LAST_EXCEPTION', _binary 0xACED0005737200526F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E496E7465726E616C41757468656E7469636174696F6E53657276696365457863657074696F6EAC5265F398181B500200007872004A6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E41757468656E7469636174696F6E53657276696365457863657074696F6EE9E968687E742CC4020000787200396F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E41757468656E7469636174696F6E457863657074696F6E1C045130E20B67540200007872001A6A6176612E6C616E672E52756E74696D65457863657074696F6E9E5F06470A3483E5020000787200136A6176612E6C616E672E457863657074696F6ED0FD1F3E1A3B1CC4020000787200136A6176612E6C616E672E5468726F7761626C65D5C635273977B8CB0300044C000563617573657400154C6A6176612F6C616E672F5468726F7761626C653B4C000D64657461696C4D6573736167657400124C6A6176612F6C616E672F537472696E673B5B000A737461636B547261636574001E5B4C6A6176612F6C616E672F537461636B5472616365456C656D656E743B4C001473757070726573736564457863657074696F6E737400104C6A6176612F7574696C2F4C6973743B78707372001E6A6176612E6C616E672E4E756C6C506F696E746572457863657074696F6E47A5A18EFF31E1B80200007871007E000371007E000C707572001E5B4C6A6176612E6C616E672E537461636B5472616365456C656D656E743B02462A3C3CFD22390200007870000000397372001B6A6176612E6C616E672E537461636B5472616365456C656D656E746109C59A2636DD8502000449000A6C696E654E756D6265724C000E6465636C6172696E67436C61737371007E00074C000866696C654E616D6571007E00074C000A6D6574686F644E616D6571007E000778700000001874002B636F6D2E70697A7A615F612E6578616D706C652E736572766963652E5573657253657276696365496D706C7400145573657253657276696365496D706C2E6A6176617400126C6F6164557365724279557365726E616D657371007E000F0000006C7400496F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E64616F2E44616F41757468656E7469636174696F6E50726F766964657274001E44616F41757468656E7469636174696F6E50726F76696465722E6A61766174000C7265747269657665557365727371007E000F000000907400596F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E64616F2E41627374726163745573657244657461696C7341757468656E7469636174696F6E50726F766964657274002E41627374726163745573657244657461696C7341757468656E7469636174696F6E50726F76696465722E6A61766174000C61757468656E7469636174657371007E000F000000C774003B6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E50726F76696465724D616E6167657274001450726F76696465724D616E616765722E6A61766171007E001B7371007E000F000000DB71007E001D71007E001E71007E001B7371007E000F0000005F7400546F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E46696C746572740029557365726E616D6550617373776F726441757468656E7469636174696F6E46696C7465722E6A617661740015617474656D707441757468656E7469636174696F6E7371007E000F000000D47400566F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E50726F63657373696E6746696C74657274002B416273747261637441757468656E7469636174696F6E50726F63657373696E6746696C7465722E6A617661740008646F46696C7465727371007E000F0000014E7400446F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E46696C746572436861696E50726F7879245669727475616C46696C746572436861696E74001546696C746572436861696E50726F78792E6A61766171007E00277371007E000F000000747400436F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E6C6F676F75742E4C6F676F757446696C7465727400114C6F676F757446696C7465722E6A61766171007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F0000005C74003A6F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E6865616465722E48656164657257726974657246696C74657274001748656164657257726974657246696C7465722E6A61766174000E646F4865616465727341667465727371007E000F0000004D71007E003071007E0031740010646F46696C746572496E7465726E616C7371007E000F000000777400336F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E4F6E63655065725265717565737446696C7465727400194F6E63655065725265717565737446696C7465722E6A61766171007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F000000697400496F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E636F6E746578742E5365637572697479436F6E7465787450657273697374656E636546696C7465727400255365637572697479436F6E7465787450657273697374656E636546696C7465722E6A61766171007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F000000387400576F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E636F6E746578742E726571756573742E6173796E632E5765624173796E634D616E61676572496E746567726174696F6E46696C7465727400255765624173796E634D616E61676572496E746567726174696F6E46696C7465722E6A61766171007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F000000D77400316F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E46696C746572436861696E50726F787971007E002A71007E00347371007E000F000000B271007E004371007E002A71007E00277371007E000F000001667400346F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F787974001A44656C65676174696E6746696C74657250726F78792E6A61766174000E696E766F6B6544656C65676174657371007E000F0000010F71007E004671007E004771007E00277371007E000F000000C174002F6F72672E6170616368652E636174616C696E612E636F72652E4170706C69636174696F6E46696C746572436861696E74001B4170706C69636174696F6E46696C746572436861696E2E6A617661740010696E7465726E616C446F46696C7465727371007E000F000000A671007E004B71007E004C71007E00277371007E000F000000647400336F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E52657175657374436F6E7465787446696C74657274001952657175657374436F6E7465787446696C7465722E6A61766171007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F0000005D7400306F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E466F726D436F6E74656E7446696C746572740016466F726D436F6E74656E7446696C7465722E6A61766171007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F0000008D74003C6F72672E737072696E676672616D65776F726B2E73657373696F6E2E7765622E687474702E53657373696F6E5265706F7369746F727946696C74657274001C53657373696F6E5265706F7369746F727946696C7465722E6A61766171007E00347371007E000F000000527400396F72672E737072696E676672616D65776F726B2E73657373696F6E2E7765622E687474702E4F6E63655065725265717565737446696C74657271007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F000000C97400366F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E436861726163746572456E636F64696E6746696C74657274001C436861726163746572456E636F64696E6746696C7465722E6A61766171007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F000000CA74002D6F72672E6170616368652E636174616C696E612E636F72652E5374616E646172645772617070657256616C76657400195374616E646172645772617070657256616C76652E6A617661740006696E766F6B657371007E000F0000006074002D6F72672E6170616368652E636174616C696E612E636F72652E5374616E64617264436F6E7465787456616C76657400195374616E64617264436F6E7465787456616C76652E6A61766171007E006B7371007E000F0000021D7400336F72672E6170616368652E636174616C696E612E61757468656E74696361746F722E41757468656E74696361746F724261736574001641757468656E74696361746F72426173652E6A61766171007E006B7371007E000F0000008B74002A6F72672E6170616368652E636174616C696E612E636F72652E5374616E64617264486F737456616C76657400165374616E64617264486F737456616C76652E6A61766171007E006B7371007E000F0000005C74002B6F72672E6170616368652E636174616C696E612E76616C7665732E4572726F725265706F727456616C76657400154572726F725265706F727456616C76652E6A61766171007E006B7371007E000F0000004A74002C6F72672E6170616368652E636174616C696E612E636F72652E5374616E64617264456E67696E6556616C76657400185374616E64617264456E67696E6556616C76652E6A61766171007E006B7371007E000F0000015774002B6F72672E6170616368652E636174616C696E612E636F6E6E6563746F722E436F796F746541646170746572740012436F796F7465416461707465722E6A617661740007736572766963657371007E000F000001757400286F72672E6170616368652E636F796F74652E6874747031312E48747470313150726F636573736F7274001448747470313150726F636573736F722E6A61766171007E007E7371007E000F000000417400286F72672E6170616368652E636F796F74652E416273747261637450726F636573736F724C6967687474001B416273747261637450726F636573736F724C696768742E6A61766174000770726F636573737371007E000F000003647400346F72672E6170616368652E636F796F74652E416273747261637450726F746F636F6C24436F6E6E656374696F6E48616E646C6572740015416273747261637450726F746F636F6C2E6A61766171007E00857371007E000F000006357400366F72672E6170616368652E746F6D6361742E7574696C2E6E65742E4E696F456E64706F696E7424536F636B657450726F636573736F727400104E696F456E64706F696E742E6A617661740005646F52756E7371007E000F0000003174002E6F72672E6170616368652E746F6D6361742E7574696C2E6E65742E536F636B657450726F636573736F7242617365740018536F636B657450726F636573736F72426173652E6A61766174000372756E7371007E000FFFFFFFFF7400276A6176612E7574696C2E636F6E63757272656E742E546872656164506F6F6C4578656375746F727074000972756E576F726B65727371007E000FFFFFFFFF74002E6A6176612E7574696C2E636F6E63757272656E742E546872656164506F6F6C4578656375746F7224576F726B65727071007E00907371007E000F0000003D74003A6F72672E6170616368652E746F6D6361742E7574696C2E746872656164732E5461736B546872656164245772617070696E6752756E6E61626C6574000F5461736B5468726561642E6A61766171007E00907371007E000FFFFFFFFF7400106A6176612E6C616E672E5468726561647071007E0090737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C69737471007E00097872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000007704000000007871007E00A078707571007E000D000000387371007E000F0000007B71007E001571007E001671007E00177371007E000F0000009071007E001971007E001A71007E001B7371007E000F000000C771007E001D71007E001E71007E001B7371007E000F000000DB71007E001D71007E001E71007E001B7371007E000F0000005F71007E002171007E002271007E00237371007E000F000000D471007E002571007E002671007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F0000007471007E002C71007E002D71007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F0000005C71007E003071007E003171007E00327371007E000F0000004D71007E003071007E003171007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F0000006971007E003A71007E003B71007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F0000003871007E003E71007E003F71007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F000000D771007E004371007E002A71007E00347371007E000F000000B271007E004371007E002A71007E00277371007E000F0000016671007E004671007E004771007E00487371007E000F0000010F71007E004671007E004771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F0000006471007E005071007E005171007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F0000005D71007E005671007E005771007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F0000008D71007E005C71007E005D71007E00347371007E000F0000005271007E005F71007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F000000C971007E006371007E006471007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F000000CA71007E006971007E006A71007E006B7371007E000F0000006071007E006D71007E006E71007E006B7371007E000F0000021D71007E007071007E007171007E006B7371007E000F0000008B71007E007371007E007471007E006B7371007E000F0000005C71007E007671007E007771007E006B7371007E000F0000004A71007E007971007E007A71007E006B7371007E000F0000015771007E007C71007E007D71007E007E7371007E000F0000017571007E008071007E008171007E007E7371007E000F0000004171007E008371007E008471007E00857371007E000F0000036471007E008771007E008871007E00857371007E000F0000063571007E008A71007E008B71007E008C7371007E000F0000003171007E008E71007E008F71007E00907371007E000FFFFFFFFF71007E00927071007E00937371007E000FFFFFFFFF71007E00957071007E00907371007E000F0000003D71007E009771007E009871007E00907371007E000FFFFFFFFF71007E009A7071007E009071007E009E78),
	('63f8b434-897f-4d02-bd4f-50a60222b32d', 'SPRING_SECURITY_CONTEXT', _binary 0xACED00057372003D6F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E636F6E746578742E5365637572697479436F6E74657874496D706C00000000000002120200014C000E61757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B78707372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000002120200024C000B63726564656E7469616C737400124C6A6176612F6C616E672F4F626A6563743B4C00097072696E636970616C71007E0004787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C7371007E0004787001737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00067870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000002120200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B7870740009524F4C455F555345527871007E000D737200486F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E57656241757468656E7469636174696F6E44657461696C7300000000000002120200024C000D72656D6F74654164647265737371007E000F4C000973657373696F6E496471007E000F787074000F303A303A303A303A303A303A303A3174002437326664396134362D633835642D343534342D393339392D3833356232633539343037387073720021636F6D2E70697A7A615F612E6578616D706C652E646F6D61696E2E55736572564F00000000000000010200095A001369734163636F756E744E6F6E457870697265645A001269734163636F756E744E6F6E4C6F636B65645A0016697343726564656E7469616C4E6F6E457870697265645A00096973456E61626C65644C000B617574686F72697469657371007E00064C000870617373776F726471007E000F4C0009754461746554696D6571007E000F4C0005754E616D6571007E000F4C0008757365726E616D6571007E000F7870010101017371007E000C0000000177040000000171007E00107874003C243261243130245A53453072612E6E6C69334357594D5870326D784575506F304959446F56326C5358415239394D392F3174366457456D7432635A7970740003313233740003616161),
	('9cda8bd8-a9d0-4c04-84a1-7d80c01041c4', 'SPRING_SECURITY_LAST_EXCEPTION', _binary 0xACED0005737200526F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E496E7465726E616C41757468656E7469636174696F6E53657276696365457863657074696F6EAC5265F398181B500200007872004A6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E41757468656E7469636174696F6E53657276696365457863657074696F6EE9E968687E742CC4020000787200396F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E41757468656E7469636174696F6E457863657074696F6E1C045130E20B67540200007872001A6A6176612E6C616E672E52756E74696D65457863657074696F6E9E5F06470A3483E5020000787200136A6176612E6C616E672E457863657074696F6ED0FD1F3E1A3B1CC4020000787200136A6176612E6C616E672E5468726F7761626C65D5C635273977B8CB0300044C000563617573657400154C6A6176612F6C616E672F5468726F7761626C653B4C000D64657461696C4D6573736167657400124C6A6176612F6C616E672F537472696E673B5B000A737461636B547261636574001E5B4C6A6176612F6C616E672F537461636B5472616365456C656D656E743B4C001473757070726573736564457863657074696F6E737400104C6A6176612F7574696C2F4C6973743B78707372001E6A6176612E6C616E672E4E756C6C506F696E746572457863657074696F6E47A5A18EFF31E1B80200007871007E000371007E000C707572001E5B4C6A6176612E6C616E672E537461636B5472616365456C656D656E743B02462A3C3CFD22390200007870000000397372001B6A6176612E6C616E672E537461636B5472616365456C656D656E746109C59A2636DD8502000449000A6C696E654E756D6265724C000E6465636C6172696E67436C61737371007E00074C000866696C654E616D6571007E00074C000A6D6574686F644E616D6571007E000778700000001874002B636F6D2E70697A7A615F612E6578616D706C652E736572766963652E5573657253657276696365496D706C7400145573657253657276696365496D706C2E6A6176617400126C6F6164557365724279557365726E616D657371007E000F0000006C7400496F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E64616F2E44616F41757468656E7469636174696F6E50726F766964657274001E44616F41757468656E7469636174696F6E50726F76696465722E6A61766174000C7265747269657665557365727371007E000F000000907400596F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E64616F2E41627374726163745573657244657461696C7341757468656E7469636174696F6E50726F766964657274002E41627374726163745573657244657461696C7341757468656E7469636174696F6E50726F76696465722E6A61766174000C61757468656E7469636174657371007E000F000000C774003B6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E50726F76696465724D616E6167657274001450726F76696465724D616E616765722E6A61766171007E001B7371007E000F000000DB71007E001D71007E001E71007E001B7371007E000F0000005F7400546F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E46696C746572740029557365726E616D6550617373776F726441757468656E7469636174696F6E46696C7465722E6A617661740015617474656D707441757468656E7469636174696F6E7371007E000F000000D47400566F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E50726F63657373696E6746696C74657274002B416273747261637441757468656E7469636174696F6E50726F63657373696E6746696C7465722E6A617661740008646F46696C7465727371007E000F0000014E7400446F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E46696C746572436861696E50726F7879245669727475616C46696C746572436861696E74001546696C746572436861696E50726F78792E6A61766171007E00277371007E000F000000747400436F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E6C6F676F75742E4C6F676F757446696C7465727400114C6F676F757446696C7465722E6A61766171007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F0000005C74003A6F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E6865616465722E48656164657257726974657246696C74657274001748656164657257726974657246696C7465722E6A61766174000E646F4865616465727341667465727371007E000F0000004D71007E003071007E0031740010646F46696C746572496E7465726E616C7371007E000F000000777400336F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E4F6E63655065725265717565737446696C7465727400194F6E63655065725265717565737446696C7465722E6A61766171007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F000000697400496F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E636F6E746578742E5365637572697479436F6E7465787450657273697374656E636546696C7465727400255365637572697479436F6E7465787450657273697374656E636546696C7465722E6A61766171007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F000000387400576F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E636F6E746578742E726571756573742E6173796E632E5765624173796E634D616E61676572496E746567726174696F6E46696C7465727400255765624173796E634D616E61676572496E746567726174696F6E46696C7465722E6A61766171007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F000000D77400316F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E46696C746572436861696E50726F787971007E002A71007E00347371007E000F000000B271007E004371007E002A71007E00277371007E000F000001667400346F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E44656C65676174696E6746696C74657250726F787974001A44656C65676174696E6746696C74657250726F78792E6A61766174000E696E766F6B6544656C65676174657371007E000F0000010F71007E004671007E004771007E00277371007E000F000000C174002F6F72672E6170616368652E636174616C696E612E636F72652E4170706C69636174696F6E46696C746572436861696E74001B4170706C69636174696F6E46696C746572436861696E2E6A617661740010696E7465726E616C446F46696C7465727371007E000F000000A671007E004B71007E004C71007E00277371007E000F000000647400336F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E52657175657374436F6E7465787446696C74657274001952657175657374436F6E7465787446696C7465722E6A61766171007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F0000005D7400306F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E466F726D436F6E74656E7446696C746572740016466F726D436F6E74656E7446696C7465722E6A61766171007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F0000008D74003C6F72672E737072696E676672616D65776F726B2E73657373696F6E2E7765622E687474702E53657373696F6E5265706F7369746F727946696C74657274001C53657373696F6E5265706F7369746F727946696C7465722E6A61766171007E00347371007E000F000000527400396F72672E737072696E676672616D65776F726B2E73657373696F6E2E7765622E687474702E4F6E63655065725265717565737446696C74657271007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F000000C97400366F72672E737072696E676672616D65776F726B2E7765622E66696C7465722E436861726163746572456E636F64696E6746696C74657274001C436861726163746572456E636F64696E6746696C7465722E6A61766171007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F000000CA74002D6F72672E6170616368652E636174616C696E612E636F72652E5374616E646172645772617070657256616C76657400195374616E646172645772617070657256616C76652E6A617661740006696E766F6B657371007E000F0000006074002D6F72672E6170616368652E636174616C696E612E636F72652E5374616E64617264436F6E7465787456616C76657400195374616E64617264436F6E7465787456616C76652E6A61766171007E006B7371007E000F0000021D7400336F72672E6170616368652E636174616C696E612E61757468656E74696361746F722E41757468656E74696361746F724261736574001641757468656E74696361746F72426173652E6A61766171007E006B7371007E000F0000008B74002A6F72672E6170616368652E636174616C696E612E636F72652E5374616E64617264486F737456616C76657400165374616E64617264486F737456616C76652E6A61766171007E006B7371007E000F0000005C74002B6F72672E6170616368652E636174616C696E612E76616C7665732E4572726F725265706F727456616C76657400154572726F725265706F727456616C76652E6A61766171007E006B7371007E000F0000004A74002C6F72672E6170616368652E636174616C696E612E636F72652E5374616E64617264456E67696E6556616C76657400185374616E64617264456E67696E6556616C76652E6A61766171007E006B7371007E000F0000015774002B6F72672E6170616368652E636174616C696E612E636F6E6E6563746F722E436F796F746541646170746572740012436F796F7465416461707465722E6A617661740007736572766963657371007E000F000001757400286F72672E6170616368652E636F796F74652E6874747031312E48747470313150726F636573736F7274001448747470313150726F636573736F722E6A61766171007E007E7371007E000F000000417400286F72672E6170616368652E636F796F74652E416273747261637450726F636573736F724C6967687474001B416273747261637450726F636573736F724C696768742E6A61766174000770726F636573737371007E000F000003647400346F72672E6170616368652E636F796F74652E416273747261637450726F746F636F6C24436F6E6E656374696F6E48616E646C6572740015416273747261637450726F746F636F6C2E6A61766171007E00857371007E000F000006357400366F72672E6170616368652E746F6D6361742E7574696C2E6E65742E4E696F456E64706F696E7424536F636B657450726F636573736F727400104E696F456E64706F696E742E6A617661740005646F52756E7371007E000F0000003174002E6F72672E6170616368652E746F6D6361742E7574696C2E6E65742E536F636B657450726F636573736F7242617365740018536F636B657450726F636573736F72426173652E6A61766174000372756E7371007E000FFFFFFFFF7400276A6176612E7574696C2E636F6E63757272656E742E546872656164506F6F6C4578656375746F727074000972756E576F726B65727371007E000FFFFFFFFF74002E6A6176612E7574696C2E636F6E63757272656E742E546872656164506F6F6C4578656375746F7224576F726B65727071007E00907371007E000F0000003D74003A6F72672E6170616368652E746F6D6361742E7574696C2E746872656164732E5461736B546872656164245772617070696E6752756E6E61626C6574000F5461736B5468726561642E6A61766171007E00907371007E000FFFFFFFFF7400106A6176612E6C616E672E5468726561647071007E0090737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C69737471007E00097872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000007704000000007871007E00A078707571007E000D000000387371007E000F0000007B71007E001571007E001671007E00177371007E000F0000009071007E001971007E001A71007E001B7371007E000F000000C771007E001D71007E001E71007E001B7371007E000F000000DB71007E001D71007E001E71007E001B7371007E000F0000005F71007E002171007E002271007E00237371007E000F000000D471007E002571007E002671007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F0000007471007E002C71007E002D71007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F0000005C71007E003071007E003171007E00327371007E000F0000004D71007E003071007E003171007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F0000006971007E003A71007E003B71007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F0000003871007E003E71007E003F71007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F0000014E71007E002971007E002A71007E00277371007E000F000000D771007E004371007E002A71007E00347371007E000F000000B271007E004371007E002A71007E00277371007E000F0000016671007E004671007E004771007E00487371007E000F0000010F71007E004671007E004771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F0000006471007E005071007E005171007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F0000005D71007E005671007E005771007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F0000008D71007E005C71007E005D71007E00347371007E000F0000005271007E005F71007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F000000C971007E006371007E006471007E00347371007E000F0000007771007E003671007E003771007E00277371007E000F000000C171007E004B71007E004C71007E004D7371007E000F000000A671007E004B71007E004C71007E00277371007E000F000000CA71007E006971007E006A71007E006B7371007E000F0000006071007E006D71007E006E71007E006B7371007E000F0000021D71007E007071007E007171007E006B7371007E000F0000008B71007E007371007E007471007E006B7371007E000F0000005C71007E007671007E007771007E006B7371007E000F0000004A71007E007971007E007A71007E006B7371007E000F0000015771007E007C71007E007D71007E007E7371007E000F0000017571007E008071007E008171007E007E7371007E000F0000004171007E008371007E008471007E00857371007E000F0000036471007E008771007E008871007E00857371007E000F0000063571007E008A71007E008B71007E008C7371007E000F0000003171007E008E71007E008F71007E00907371007E000FFFFFFFFF71007E00927071007E00937371007E000FFFFFFFFF71007E00957071007E00907371007E000F0000003D71007E009771007E009871007E00907371007E000FFFFFFFFF71007E009A7071007E009071007E009E78);
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;