/*
Navicat MySQL Data Transfer

Source Server         : localhost-3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : stutea

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2021-06-24 19:53:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adId` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `adNo` varchar(20) NOT NULL COMMENT '管理员工号',
  `adName` varchar(20) NOT NULL COMMENT '管理员姓名',
  `adPassword` varchar(20) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`adId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1001', 'administrator', '000000');
INSERT INTO `admin` VALUES ('2', '1111', '1111', '1111');
