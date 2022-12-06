/*
 Navicat Premium Data Transfer

 Source Server         : 锅巴
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : db0824

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 05/12/2022 10:50:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'Java');
INSERT INTO `course` VALUES (2, 'PHP');
INSERT INTO `course` VALUES (3, 'MySQL');
INSERT INTO `course` VALUES (4, 'Hadoop');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '研发部');
INSERT INTO `dept` VALUES (2, '市场部');
INSERT INTO `dept` VALUES (3, '财务部');
INSERT INTO `dept` VALUES (4, '销售部');
INSERT INTO `dept` VALUES (5, '总经办');
INSERT INTO `dept` VALUES (6, '人事部');

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `job` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `salary` int(11) NULL DEFAULT NULL COMMENT '薪资',
  `entrydate` date NULL DEFAULT NULL COMMENT '入职时间',
  `managerid` int(11) NULL DEFAULT NULL COMMENT '直属领导ID',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_emp_dept_id`(`dept_id`) USING BTREE,
  CONSTRAINT `fk_emp_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES (1, '金庸', 66, '总裁', 20000, '2000-01-01', NULL, 5);
INSERT INTO `emp` VALUES (2, '张无忌', 20, '项目经理', 12500, '2005-12-05', 1, 1);
INSERT INTO `emp` VALUES (3, '杨逍', 33, '开发', 8400, '2000-11-03', 2, 1);
INSERT INTO `emp` VALUES (4, '韦一笑', 48, '开发', 11000, '2002-02-05', 2, 1);
INSERT INTO `emp` VALUES (5, '常遇春', 43, '开发', 10500, '2004-09-07', 3, 1);
INSERT INTO `emp` VALUES (6, '小昭', 19, '程序员鼓励师', 6600, '2004-10-12', 2, 1);
INSERT INTO `emp` VALUES (7, '灭绝', 60, '财务总监', 8500, '2002-09-12', 1, 3);
INSERT INTO `emp` VALUES (8, '周芷若', 19, '会计', 48000, '2006-06-02', 7, 3);
INSERT INTO `emp` VALUES (9, '丁敏君', 23, '出纳', 5250, '2009-05-13', 7, 3);
INSERT INTO `emp` VALUES (10, '赵敏', 20, '市场部总监', 12500, '2004-10-12', 1, 2);
INSERT INTO `emp` VALUES (11, '鹿杖客', 56, '职员', 3750, '2006-10-03', 10, 2);
INSERT INTO `emp` VALUES (12, '鹤笔翁', 19, '职员', 3750, '2007-05-09', 10, 2);
INSERT INTO `emp` VALUES (13, '方东白', 19, '职员', 5500, '2009-02-12', 10, 2);
INSERT INTO `emp` VALUES (14, '张三丰', 88, '销售总监', 14000, '2004-10-12', 1, 4);
INSERT INTO `emp` VALUES (15, '俞莲舟', 38, '销售', 4600, '2004-10-12', 14, 4);
INSERT INTO `emp` VALUES (16, '宋远桥', 40, '销售', 4600, '2004-10-12', 14, 4);
INSERT INTO `emp` VALUES (17, '陈友谅', 42, NULL, 2000, '2011-10-12', 1, NULL);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `NAME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `NO` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '黛绮丝', '2000100101');
INSERT INTO `student` VALUES (2, '谢逊', '2000100102');
INSERT INTO `student` VALUES (3, '殷天正', '2000100103');
INSERT INTO `student` VALUES (4, '韦一笑', '2000100104');

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `studentid` int(11) NOT NULL COMMENT '学生ID',
  `courseid` int(11) NOT NULL COMMENT '课程ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_courseid`(`courseid`) USING BTREE,
  INDEX `fk_studentid`(`studentid`) USING BTREE,
  CONSTRAINT `fk_courseid` FOREIGN KEY (`courseid`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_studentid` FOREIGN KEY (`studentid`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生课程中间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_course
-- ----------------------------
INSERT INTO `student_course` VALUES (1, 1, 1);
INSERT INTO `student_course` VALUES (2, 1, 2);
INSERT INTO `student_course` VALUES (3, 1, 3);
INSERT INTO `student_course` VALUES (4, 2, 2);
INSERT INTO `student_course` VALUES (5, 2, 3);
INSERT INTO `student_course` VALUES (6, 3, 4);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1: 男 , 2: 女',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户基本信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, '黄渤', 45, '1', '18800001111');
INSERT INTO `tb_user` VALUES (2, '冰冰', 35, '2', '18800002222');
INSERT INTO `tb_user` VALUES (3, '码云', 55, '1', '18800008888');
INSERT INTO `tb_user` VALUES (4, '李彦宏', 50, '1', '18800009999');

-- ----------------------------
-- Table structure for tb_user_edu
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_edu`;
CREATE TABLE `tb_user_edu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `degree` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `major` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `primaryschool` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小学',
  `middleschool` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中学',
  `university` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大学',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `fk_userid` FOREIGN KEY (`userid`) REFERENCES `tb_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户教育信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_edu
-- ----------------------------
INSERT INTO `tb_user_edu` VALUES (1, '本科', '舞蹈', '静安区第一小学', '静安区第一中学', '北京舞蹈学院', 1);
INSERT INTO `tb_user_edu` VALUES (2, '硕士', '表演', '朝阳区第一小学', '朝阳区第一中学', '北京电影学院', 2);
INSERT INTO `tb_user_edu` VALUES (3, '本科', '英语', '杭州市第一小学', '杭州市第一中学', '杭州师范大学', 3);
INSERT INTO `tb_user_edu` VALUES (4, '本科', '应用数学', '阳泉第一小学', '阳泉区第一中学', '清华大学', 4);

SET FOREIGN_KEY_CHECKS = 1;
