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

 Date: 11/10/2019 16:00:03
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
) ENGINE = InnoDB AUTO_INCREMENT = 1020 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1001, 'Python数据分析与应用', 5, 20201001, 2);
INSERT INTO `course` VALUES (1002, '宏观经济学', 3, 20201002, 1);
INSERT INTO `course` VALUES (1004, 'java程序设计', 4, 20201001, 2);
INSERT INTO `course` VALUES (1005, '市场营销学', 6, 20201002, 3);
INSERT INTO `course` VALUES (1006, '大学英语', 3, 20201003, 1);
INSERT INTO `course` VALUES (1007, '国富论概述', 13, 20201002, 0);
INSERT INTO `course` VALUES (1008, '应用运筹学', 6, 20201004, 0);
INSERT INTO `course` VALUES (1015, '自动驾驶', 10, 20201001, 0);
INSERT INTO `course` VALUES (1016, '深度学习与应用', 8, 20201001, 0);
INSERT INTO `course` VALUES (1017, '矩阵论', 9, 20201004, 0);
INSERT INTO `course` VALUES (1019, 'TED演讲视听说', 8, 20201003, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_choose
-- ----------------------------
INSERT INTO `course_choose` VALUES (2, 20200003, 1002, 85);
INSERT INTO `course_choose` VALUES (9, 20200002, 1001, 100);
INSERT INTO `course_choose` VALUES (11, 20200006, 1001, 45);
INSERT INTO `course_choose` VALUES (14, 20200002, 1004, 0);
INSERT INTO `course_choose` VALUES (15, 20200002, 1006, 0);
INSERT INTO `course_choose` VALUES (17, 20200004, 1005, 0);
INSERT INTO `course_choose` VALUES (19, 20200004, 1007, 0);
INSERT INTO `course_choose` VALUES (20, 20200006, 1004, 59);
INSERT INTO `course_choose` VALUES (26, 20200001, 1005, 0);
INSERT INTO `course_choose` VALUES (27, 20200003, 1005, 0);
INSERT INTO `course_choose` VALUES (28, 20200003, 1019, 0);
INSERT INTO `course_choose` VALUES (29, 20200001, 1007, 0);

-- ----------------------------
-- Table structure for course_limit
-- ----------------------------
DROP TABLE IF EXISTS `course_limit`;
CREATE TABLE `course_limit`  (
  `limitId` int(11) NOT NULL AUTO_INCREMENT,
  `classId` int(11) NOT NULL,
  `insId` int(11) NOT NULL,
  PRIMARY KEY (`limitId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1052 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `course_limit` VALUES (1049, 1019, 1001);
INSERT INTO `course_limit` VALUES (1050, 1019, 1004);
INSERT INTO `course_limit` VALUES (1051, 1019, 1005);

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
INSERT INTO `institution` VALUES (1001, '软件学院');
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
INSERT INTO `student` VALUES (20200005, '孙七', '20200005', 1004, '管理学院');
INSERT INTO `student` VALUES (20200001, '张三', '20200001', 1005, '经济学院');
INSERT INTO `student` VALUES (20200002, '李四', '20200002', 1001, '软件学院');
INSERT INTO `student` VALUES (20200003, '王五', '20200003', 1005, '经济学院');
INSERT INTO `student` VALUES (20200004, '赵六', '20200004', 1005, '经济学院');
INSERT INTO `student` VALUES (20200006, '周八', '20200006', 1001, '软件学院');
INSERT INTO `student` VALUES (20200007, '吴九', '20200007', 1004, '管理学院');
INSERT INTO `student` VALUES (20200008, '郑十', '20200008', 1001, '软件学院');
INSERT INTO `student` VALUES (20200009, '刘备', '20200009', 1004, '管理学院');
INSERT INTO `student` VALUES (20200010, '关羽', '20200010', 1002, '医学院');
INSERT INTO `student` VALUES (20200011, '张飞', '20200011', 1002, '医学院');
INSERT INTO `student` VALUES (20200012, '小明', '20200012', 1006, '理学院');

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
INSERT INTO `teacher` VALUES (20201001, '张老师', '20201001');
INSERT INTO `teacher` VALUES (20201002, '李老师', '20201002');
INSERT INTO `teacher` VALUES (20201003, '王老师', '20201003');
INSERT INTO `teacher` VALUES (20201004, '陈老师', '20201004');
INSERT INTO `teacher` VALUES (20201005, '黄老师', '20201005');

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admId` int(11) NOT NULL,
  `admName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admPass` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`admId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (0001, '管理员1','0001');
INSERT INTO `admin` VALUES (0002, '管理员2','0002');


