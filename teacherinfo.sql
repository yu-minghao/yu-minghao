/*
Navicat MySQL Data Transfer

Source Server         : localhost-3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : stutea

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2021-06-24 19:53:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for teacherinfo
-- ----------------------------
DROP TABLE IF EXISTS `teacherinfo`;
CREATE TABLE `teacherinfo` (
  `teaId` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师id',
  `teaNo` varchar(20) NOT NULL COMMENT '教师工号',
  `teaName` varchar(20) NOT NULL COMMENT '教师姓名',
  `teaPassword` varchar(20) NOT NULL COMMENT '教师密码',
  PRIMARY KEY (`teaId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of teacherinfo
-- ----------------------------
INSERT INTO `teacherinfo` VALUES ('14', '1', '1', '1');
INSERT INTO `teacherinfo` VALUES ('15', '3', '2', '3');
INSERT INTO `teacherinfo` VALUES ('17', '3333', '3333', '3333');
