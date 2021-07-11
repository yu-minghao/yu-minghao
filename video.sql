/*
Navicat MySQL Data Transfer

Source Server         : localhost-3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : stutea

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2021-06-24 19:53:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(56) DEFAULT NULL,
  `author` varchar(32) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('43', '48809e03e6be41e5ab98c1af60cef56fQQ图片20210528113605.png', '3333', 'C:\\Users\\zhanghaoyuan\\Desktop\\StuTeaSystem_v\\StuTeaSystem\\out\\artifacts\\StuTeaSystem\\uploadFile', '2021-06-09', null);
