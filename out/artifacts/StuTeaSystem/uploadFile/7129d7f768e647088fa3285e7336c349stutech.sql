/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.5
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : localhost:3307
 Source Schema         : stutech

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 08/06/2021 20:18:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adId` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `adNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员工号',
  `adName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员姓名',
  `adPassword` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`adId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '1001', 'administrator', '000000');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (34, 'a38f062041124aed9f2f5a8c0e55c1d21.enctype.docx', NULL, 'E:\\JavaWeb课设\\StuTeaSystem\\out\\artifacts\\StuTeaSystem_war_exploded\\WEB-INF\\upload', '2021-06-01');
INSERT INTO `file` VALUES (44, 'e275d48d93534d0ba02d01f740b60e12iqiyi.png', NULL, 'D:\\csdn\\StuTeaSystem\\out\\artifacts\\StuTeaSystem\\uploadFile', '2021-06-06');
INSERT INTO `file` VALUES (45, '5b3f1e53740a45c39b9229a919f2150ckugou.png', NULL, 'D:\\csdn\\StuTeaSystem\\out\\artifacts\\StuTeaSystem\\uploadFile', '2021-06-06');
INSERT INTO `file` VALUES (46, 'd124cc6817fd4633b6d5914b20633e6eqqpcmgr.png', NULL, 'D:\\csdn\\StuTeaSystem\\out\\artifacts\\StuTeaSystem\\uploadFile', '2021-06-06');
INSERT INTO `file` VALUES (48, '160f9d2f0d3f4abea6770e91dffd268bkdesk.png', '1111', 'D:\\csdn\\StuTeaSystem\\out\\artifacts\\StuTeaSystem\\uploadFile', '2021-06-08');

-- ----------------------------
-- Table structure for studentinfo
-- ----------------------------
DROP TABLE IF EXISTS `studentinfo`;
CREATE TABLE `studentinfo`  (
  `stuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `stuNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生学号',
  `stuName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生姓名',
  `stuPassword` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生密码',
  PRIMARY KEY (`stuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of studentinfo
-- ----------------------------
INSERT INTO `studentinfo` VALUES (1, '201901014477', '海虹', '123456');
INSERT INTO `studentinfo` VALUES (2, '201901014478', '刘帅', '456');
INSERT INTO `studentinfo` VALUES (6, '201901014810', '柳华', '123456');
INSERT INTO `studentinfo` VALUES (7, '1111', '1111', '1111');
INSERT INTO `studentinfo` VALUES (9, '1112', 'ad2', '000000');

-- ----------------------------
-- Table structure for teacherinfo
-- ----------------------------
DROP TABLE IF EXISTS `teacherinfo`;
CREATE TABLE `teacherinfo`  (
  `teaId` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师id',
  `teaNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师工号',
  `teaName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师姓名',
  `teaPassword` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师密码',
  PRIMARY KEY (`teaId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacherinfo
-- ----------------------------
INSERT INTO `teacherinfo` VALUES (1, '1901011', '张清', '123');
INSERT INTO `teacherinfo` VALUES (2, '1901012', '刘海', 'qq2021');
INSERT INTO `teacherinfo` VALUES (4, '1901013', '汪雪', '123456');
INSERT INTO `teacherinfo` VALUES (6, '1113', '11', '1111');
INSERT INTO `teacherinfo` VALUES (7, '1111', '1111', '1111');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (34, '78e1600bb23641a683f45b2812575693timg.mp4', NULL, 'E:\\JavaWeb课设\\StuTeaSystem\\out\\artifacts\\StuTeaSystem_war_exploded\\WEB-INF\\upload', '2021-06-01', NULL);
INSERT INTO `video` VALUES (39, '0e44fc845059427dbd17ab7d7560fc9e360se.png', NULL, 'D:\\csdn\\StuTeaSystem\\out\\artifacts\\StuTeaSystem\\uploadFile', '2021-06-06', NULL);
INSERT INTO `video` VALUES (40, '78e1600bb23641a683f45b28125756932345pinyin.png', '11', 'D:\\csdn\\StuTeaSystem\\out\\artifacts\\StuTeaSystem\\uploadFile', '2021-06-06', NULL);

SET FOREIGN_KEY_CHECKS = 1;
