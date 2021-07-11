/*
Navicat MySQL Data Transfer

Source Server         : localhost-3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : stutea

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2021-06-24 19:53:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for studentinfo
-- ----------------------------
DROP TABLE IF EXISTS `studentinfo`;
CREATE TABLE `studentinfo` (
  `stuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `stuNo` varchar(20) NOT NULL COMMENT '学生学号',
  `stuName` varchar(20) NOT NULL COMMENT '学生姓名',
  `stuPassword` varchar(20) NOT NULL COMMENT '学生密码',
  PRIMARY KEY (`stuId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of studentinfo
-- ----------------------------
INSERT INTO `studentinfo` VALUES ('1', '201901014301', '王刚', '1111');
INSERT INTO `studentinfo` VALUES ('2', '2222', '2222', '2222');
