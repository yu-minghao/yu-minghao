/*
Navicat MySQL Data Transfer

Source Server         : localhost-3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : stutea

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2021-06-24 19:53:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(56) DEFAULT NULL,
  `author` varchar(32) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('52', 'e94a91bb773d47939210dcc2c7f2c7ffQQ图片20210528113514.png', '3333', 'C:\\Users\\zhanghaoyuan\\Desktop\\StuTeaSystem_v\\StuTeaSystem\\out\\artifacts\\StuTeaSystem\\uploadFile', '2021-06-09');
INSERT INTO `file` VALUES ('53', 'ed4d397798a24a0ba74e39b6db60a629活动图.docx', '3333', 'C:\\Users\\zhanghaoyuan\\Desktop\\StuTeaSystem_v\\StuTeaSystem\\out\\artifacts\\StuTeaSystem\\uploadFile', '2021-06-09');
INSERT INTO `file` VALUES ('54', 'afb1991ee19446bd88fe09e1e310a3cb', '3333', 'C:\\Users\\zhanghaoyuan\\Desktop\\StuTeaSystem_v\\StuTeaSystem\\out\\artifacts\\StuTeaSystem\\uploadFile', '2021-06-17');
INSERT INTO `file` VALUES ('55', 'ef7d7945031148d4951a556336fc0588', '3333', 'C:\\Users\\zhanghaoyuan\\Desktop\\StuTeaSystem_v\\StuTeaSystem\\out\\artifacts\\StuTeaSystem\\uploadFile', '2021-06-17');
INSERT INTO `file` VALUES ('56', 'de6a9bea1f574bb28f38cbcc839b18f6', '3333', 'C:\\Users\\zhanghaoyuan\\Desktop\\StuTeaSystem_v\\StuTeaSystem\\out\\artifacts\\StuTeaSystem\\uploadFile', '2021-06-17');
INSERT INTO `file` VALUES ('57', '682d72261fd04005b35eb0a06539f041', '3333', 'C:\\Users\\zhanghaoyuan\\Desktop\\StuTeaSystem_v\\StuTeaSystem\\out\\artifacts\\StuTeaSystem\\uploadFile', '2021-06-17');
INSERT INTO `file` VALUES ('58', '283bf6f1137947148cbcab0d612068d8', '3333', 'C:\\Users\\zhanghaoyuan\\Desktop\\StuTeaSystem_v\\StuTeaSystem\\out\\artifacts\\StuTeaSystem\\uploadFile', '2021-06-17');
