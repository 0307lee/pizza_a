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

-- 테이블 pizza.lc_auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `lc_auth` (
  `u_id` varchar(50) DEFAULT NULL,
  `u_auth` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza.lc_auth:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lc_auth` DISABLE KEYS */;
REPLACE INTO `lc_auth` (`u_id`, `u_auth`) VALUES
	('aaaa', 'ROLE_MASTER'),
	('aaa', 'ROLE_USER');
/*!40000 ALTER TABLE `lc_auth` ENABLE KEYS */;

-- 테이블 pizza.lc_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `lc_board` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_title` varchar(255) DEFAULT NULL,
  `b_content` text DEFAULT NULL,
  `b_writer` varchar(255) DEFAULT NULL,
  `b_datetime` datetime DEFAULT current_timestamp(),
  `u_id` varchar(50) DEFAULT NULL,
  `b_disabled` tinyint(1) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `user_id` (`u_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`u_id`) REFERENCES `lc_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza.lc_board:~11 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lc_board` DISABLE KEYS */;
REPLACE INTO `lc_board` (`b_id`, `b_title`, `b_content`, `b_writer`, `b_datetime`, `u_id`, `b_disabled`) VALUES
	(1, 'wdefs', 'content', 'lee', '2020-08-26 19:11:37', 'a', 0),
	(2, 'sdf', 'csdfs', 'sfg', '2020-08-26 19:11:56', 'aaa', 0),
	(3, 'x', 'sdfsf', 'wee', '2020-09-09 19:56:26', 'aaa', 0),
	(45, '234', 'sd', '1241w', '2020-09-15 20:49:04', 'aaaa', 0),
	(46, '222', '222', 'sdf', '2020-09-15 20:53:47', NULL, 0),
	(47, 'adxasdc', 'asfsg', 'as', '2020-09-15 20:58:17', 'aaaa', 0),
	(48, '', 'sdf', '', '2020-09-15 20:58:35', 'aaaa', 0),
	(49, 'xbsg2', '42', 'sg', '2020-09-15 21:01:08', 'aaaa', 0),
	(50, 'cs', 'sd', '23', '2020-09-15 21:53:38', 'aaa', 1),
	(51, '121', '14123123', 'test', '2020-09-15 22:03:13', 'aaa', 1),
	(52, '15as', 'sdaaf', 'asd134', '2020-09-16 18:35:16', 'aaa', 1);
/*!40000 ALTER TABLE `lc_board` ENABLE KEYS */;

-- 테이블 pizza.lc_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `lc_user` (
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
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 pizza.lc_user:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lc_user` DISABLE KEYS */;
REPLACE INTO `lc_user` (`u_id`, `u_password`, `u_name`, `u_datetime`, `u_isAccountNonExpired`, `u_isAccountNonLocked`, `u_isCredentialNonExpired`, `u_isEnabled`, `u_level`, `u_disabled`) VALUES
	('a', '$2a$10$wpZt/mvoudYbcLrMvBBNTeSCTjVUjqTE/Ks/wsguWMq7iHkT/2pS6', '123', '2020-09-11 21:49:47', 1, 1, 1, 1, 1, 0),
	('aaa', '$2a$10$ZSE0ra.nli3CWYMXp2mxEuPo0IYDoV2lSXAR99M9/1t6dWEmt2cZy', '123', '2020-08-27 21:47:26', 1, 1, 1, 1, 3, 0),
	('aaaa', '$2a$10$6LGZWfCpwU87zFBSwDv/N.frvFCsZ2F47xvlCDaIh0xwj40O6wR9q', '1234', '2020-08-27 22:03:51', 1, 1, 1, 1, 1, 0);
/*!40000 ALTER TABLE `lc_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
