/*
 Navicat Premium Data Transfer

 Source Server         : hello
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : leavemanage

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 15/05/2019 15:49:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_classes
-- ----------------------------
DROP TABLE IF EXISTS `sys_classes`;
CREATE TABLE `sys_classes`  (
  `classID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班号',
  `className` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `depID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二级学院编号',
  `major` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级',
  PRIMARY KEY (`classID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_classes
-- ----------------------------
INSERT INTO `sys_classes` VALUES ('101', '外语1班', '2016', '外语', '17级');
INSERT INTO `sys_classes` VALUES ('501', '软件5班', '2068', '软件工程', '17级');

-- ----------------------------
-- Table structure for sys_course
-- ----------------------------
DROP TABLE IF EXISTS `sys_course`;
CREATE TABLE `sys_course`  (
  `courseID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程编号',
  `classID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班号',
  `courseName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `year` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学年',
  `term` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学期',
  `hour` int(6) NULL DEFAULT NULL COMMENT '学时',
  PRIMARY KEY (`courseID`) USING BTREE,
  INDEX `classID`(`classID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_course
-- ----------------------------
INSERT INTO `sys_course` VALUES ('0608', '501', 'java web', '19', '大二第二学期', 16);
INSERT INTO `sys_course` VALUES ('668', '501', '操作系统', '19', '大二第二学期', 16);

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department`  (
  `depID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二级学院编号',
  `depName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`depID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('2068', '大数据与软件工程学院');
INSERT INTO `sys_department` VALUES ('5456688', '信电学院');

-- ----------------------------
-- Table structure for sys_instructor
-- ----------------------------
DROP TABLE IF EXISTS `sys_instructor`;
CREATE TABLE `sys_instructor`  (
  `instID` int(30) NOT NULL COMMENT '工号',
  `instName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `depID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二级学院编号',
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `password` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`instID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_instructor
-- ----------------------------
INSERT INTO `sys_instructor` VALUES (115, '龙五', '2068', '17683636886', '1');
INSERT INTO `sys_instructor` VALUES (20115, '李四', '2068', '18377663668', '1');

-- ----------------------------
-- Table structure for sys_leave
-- ----------------------------
DROP TABLE IF EXISTS `sys_leave`;
CREATE TABLE `sys_leave`  (
  `leaveID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请假编号',
  `courseID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程编号',
  `reason` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请假事由',
  `daynum` int(4) NULL DEFAULT NULL COMMENT '天数',
  `stuNo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `applytime` datetime(6) NULL DEFAULT NULL COMMENT '请假时间',
  `status` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `audittime` datetime(6) NULL DEFAULT NULL COMMENT '审核时间',
  `opinion` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`leaveID`, `courseID`) USING BTREE,
  INDEX `courseID`(`courseID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_leave
-- ----------------------------
INSERT INTO `sys_leave` VALUES ('11', '0608', '感冒', 1, '201725', '2019-01-18 22:03:23.123000', '1', '2019-04-21 15:41:52.000000', '');
INSERT INTO `sys_leave` VALUES ('2019-04-19 09:01:06203', '0608', '发烧', 1, '2017501', '2019-04-19 09:01:06.000000', '1', '2019-04-19 20:27:54.000000', '注意身体，好好休息');
INSERT INTO `sys_leave` VALUES ('2019-04-19 09:02:08771', '0608', '发烧', 1, '2017501', '2019-04-19 09:02:08.000000', '1', '2019-04-21 15:24:22.000000', '');
INSERT INTO `sys_leave` VALUES ('2019-04-19 20:15:39419', '0608', '发烧', 1, '2017501', '2019-04-19 20:15:39.000000', '1', '2019-04-21 15:24:40.000000', 'test');
INSERT INTO `sys_leave` VALUES ('2019-04-19 20:32:29493', '11686', '发烧', 1, '2017501', '2019-04-19 20:32:29.000000', '2', '2019-04-19 20:41:04.000000', '');
INSERT INTO `sys_leave` VALUES ('2019-04-21 15:44:13521', '11686', '发烧', 1, '2017501', '2019-04-21 15:44:13.000000', '0', NULL, NULL);
INSERT INTO `sys_leave` VALUES ('2019-04-21 15:44:30332', '0608', '发烧', 1, '2017501', '2019-04-21 15:44:30.000000', '0', NULL, NULL);

-- ----------------------------
-- Table structure for sys_student
-- ----------------------------
DROP TABLE IF EXISTS `sys_student`;
CREATE TABLE `sys_student`  (
  `stuID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `classID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班号',
  `stuName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通讯地址',
  `stuTel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生电话',
  `contact` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contactTel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `password` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`stuID`) USING BTREE,
  INDEX `classID_Stu`(`classID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_student
-- ----------------------------
INSERT INTO `sys_student` VALUES ('2017002', '006', '赵得住', '男', '广西', '18376767258', '张三', '18376767258', '1');
INSERT INTO `sys_student` VALUES ('2017501', '501', '李四', '男', '广西', '18376767258', '张三', '18376767258', '12345');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `userid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工号',
  `fullname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('2017116118', '张三', '1', '18377636688');

SET FOREIGN_KEY_CHECKS = 1;
