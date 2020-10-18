/*
 Navicat Premium Data Transfer

 Source Server         : develop
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : web

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 11/10/2019 14:59:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classNum` int(11) NOT NULL,
  `teaId` int(11) NOT NULL,
  `classChooseNum` int(11) NOT NULL,
  PRIMARY KEY (`classId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1019 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1001, 'c语言程序设计', 5, 20191001, 2);
INSERT INTO `course` VALUES (1002, '宏观经济学', 3, 20191002, 2);
INSERT INTO `course` VALUES (1004, 'java程序设计', 4, 20191001, 2);
INSERT INTO `course` VALUES (1005, '市场营销学', 6, 20191002, 2);
INSERT INTO `course` VALUES (1006, '大学英语', 3, 20191003, 1);
INSERT INTO `course` VALUES (1007, '计算机基础', 13, 20191002, 0);
INSERT INTO `course` VALUES (1008, '高等数学', 6, 20191004, 0);
INSERT INTO `course` VALUES (1015, '自动驾驶', 10, 20191001, 0);
INSERT INTO `course` VALUES (1016, 'C++', 8, 20191001, 0);
INSERT INTO `course` VALUES (1017, '矩阵论', 9, 20191004, 0);
INSERT INTO `course` VALUES (1018, 'Python', 7, 20191001, 0);

-- ----------------------------
-- Table structure for course_choose
-- ----------------------------
DROP TABLE IF EXISTS `course_choose`;
CREATE TABLE `course_choose`  (
  `chooseId` int(11) NOT NULL AUTO_INCREMENT,
  `stuId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`chooseId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_choose
-- ----------------------------
INSERT INTO `course_choose` VALUES (2, 20190003, 1002, 85);
INSERT INTO `course_choose` VALUES (9, 20190002, 1001, 99);
INSERT INTO `course_choose` VALUES (11, 20190006, 1001, 45);
INSERT INTO `course_choose` VALUES (13, 20190001, 1007, 0);
INSERT INTO `course_choose` VALUES (14, 20190002, 1004, 0);
INSERT INTO `course_choose` VALUES (15, 20190002, 1006, 0);
INSERT INTO `course_choose` VALUES (17, 20190004, 1005, 0);
INSERT INTO `course_choose` VALUES (19, 20190004, 1007, 0);
INSERT INTO `course_choose` VALUES (20, 20190006, 1004, 59);
INSERT INTO `course_choose` VALUES (25, 20190001, 1002, 0);
INSERT INTO `course_choose` VALUES (26, 20190001, 1005, 0);

-- ----------------------------
-- Table structure for course_limit
-- ----------------------------
DROP TABLE IF EXISTS `course_limit`;
CREATE TABLE `course_limit`  (
  `limitId` int(11) NOT NULL AUTO_INCREMENT,
  `classId` int(11) NOT NULL,
  `insId` int(11) NOT NULL,
  PRIMARY KEY (`limitId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1044 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_limit
-- ----------------------------
INSERT INTO `course_limit` VALUES (1001, 1001, 1001);
INSERT INTO `course_limit` VALUES (1002, 1002, 1004);
INSERT INTO `course_limit` VALUES (1003, 1002, 1005);
INSERT INTO `course_limit` VALUES (1005, 1004, 1001);
INSERT INTO `course_limit` VALUES (1006, 1005, 1005);
INSERT INTO `course_limit` VALUES (1007, 1006, 1001);
INSERT INTO `course_limit` VALUES (1008, 1006, 1002);
INSERT INTO `course_limit` VALUES (1009, 1007, 1004);
INSERT INTO `course_limit` VALUES (1010, 1007, 1005);
INSERT INTO `course_limit` VALUES (1011, 1008, 1001);
INSERT INTO `course_limit` VALUES (1040, 1015, 1001);
INSERT INTO `course_limit` VALUES (1041, 1016, 1006);
INSERT INTO `course_limit` VALUES (1042, 1016, 1001);
INSERT INTO `course_limit` VALUES (1043, 1018, 1001);

-- ----------------------------
-- Table structure for institution
-- ----------------------------
DROP TABLE IF EXISTS `institution`;
CREATE TABLE `institution`  (
  `insId` int(11) NOT NULL AUTO_INCREMENT,
  `insName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`insId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1007 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of institution
-- ----------------------------
INSERT INTO `institution` VALUES (1001, '信息科学技术学院');
INSERT INTO `institution` VALUES (1002, '医学院');
INSERT INTO `institution` VALUES (1004, '管理学院');
INSERT INTO `institution` VALUES (1005, '经济学院');
INSERT INTO `institution` VALUES (1006, '理学院');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `stuId` int(11) NOT NULL,
  `stuName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stuPass` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `insId` int(11) NULL DEFAULT NULL,
  `insName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`stuId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (20100005, '孙七', '20190005', 1004, '管理学院');
INSERT INTO `student` VALUES (20190001, '张三', '20190001', 1005, '经济学院');
INSERT INTO `student` VALUES (20190002, '李四', '20190002', 1001, '信息科学技术学院');
INSERT INTO `student` VALUES (20190003, '王五', '20190003', 1005, '经济学院');
INSERT INTO `student` VALUES (20190004, '赵六', '20190004', 1005, '经济学院');
INSERT INTO `student` VALUES (20190006, '周八', '20190006', 1001, '信息科学技术学院');
INSERT INTO `student` VALUES (20190007, '吴九', '20190007', 1004, '管理学院');
INSERT INTO `student` VALUES (20190008, '郑十', '20190008', 1001, '信息科学技术学院');
INSERT INTO `student` VALUES (20190009, '刘备', '20190009', 1004, '管理学院');
INSERT INTO `student` VALUES (20190010, '关羽', '20180010', 1002, '医学院');
INSERT INTO `student` VALUES (20190011, '张飞', '20180011', 1002, '医学院');
INSERT INTO `student` VALUES (20190012, '小明', '20180012', 1006, '理学院');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teaId` int(11) NOT NULL,
  `teaName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teaPass` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`teaId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (20191001, '张老师', '20191001');
INSERT INTO `teacher` VALUES (20191002, '李老师', '20191002');
INSERT INTO `teacher` VALUES (20191003, '王老师', '20191003');
INSERT INTO `teacher` VALUES (20191004, '陈老师', '20191004');
INSERT INTO `teacher` VALUES (20191005, '黄老师', '20191005');

SET FOREIGN_KEY_CHECKS = 1;
