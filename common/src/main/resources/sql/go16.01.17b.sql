/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : go

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-01-16 16:44:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of databasechangelog
-- ----------------------------

-- ----------------------------
-- Table structure for databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO `databasechangeloglock` VALUES ('1', '\0', null, null);

-- ----------------------------
-- Table structure for go_account
-- ----------------------------
DROP TABLE IF EXISTS `go_account`;
CREATE TABLE `go_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `no` varchar(64) DEFAULT NULL COMMENT '编号',
  `public_flag` varchar(64) DEFAULT '1' COMMENT '是否公开（0：隐藏；1：公开）',
  `name` varchar(64) DEFAULT NULL COMMENT '作品名称',
  `breed` varchar(64) DEFAULT NULL COMMENT '品种',
  `type` varchar(64) DEFAULT NULL COMMENT '作品类型',
  `gy_type` varchar(64) DEFAULT NULL COMMENT '工艺制作',
  `level_zk` varchar(64) DEFAULT NULL COMMENT '篆刻级别',
  `works_meaning` varchar(1000) DEFAULT NULL COMMENT '作品诠释',
  `status` varchar(64) DEFAULT NULL COMMENT '审核状态',
  `recommend` varchar(64) DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `kqdy` varchar(45) DEFAULT NULL,
  `maker` varchar(45) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  `slide` mediumint(11) DEFAULT NULL COMMENT '是否轮播 字典表：是，否，随机 （作品轮播：）',
  `slide_till` datetime DEFAULT NULL COMMENT '截止日期（和slide联合判断）',
  `browser_count` int(11) DEFAULT NULL COMMENT '浏览次数：（ip）',
  `follow_count` int(11) DEFAULT NULL COMMENT '关注数量，冗余字段',
  `value` decimal(11,2) DEFAULT NULL COMMENT '价值',
  `value_till` datetime DEFAULT NULL COMMENT '价值有效时间',
  `certified` mediumint(8) DEFAULT NULL COMMENT '是否认证(如果认证了，则页面有大红章，才能在页面显示value)',
  `working_status` mediumint(8) DEFAULT NULL COMMENT '作品状态字典表 完成、加工中',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `length` decimal(11,2) DEFAULT NULL COMMENT '长度',
  `width` decimal(11,2) DEFAULT NULL COMMENT '宽度',
  `height` decimal(11,2) DEFAULT NULL COMMENT '高度',
  `weight` decimal(11,2) DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='物品/作品';

-- ----------------------------
-- Records of go_account
-- ----------------------------

-- ----------------------------
-- Table structure for go_archiv
-- ----------------------------
DROP TABLE IF EXISTS `go_archiv`;
CREATE TABLE `go_archiv` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `no` varchar(64) DEFAULT NULL COMMENT '编号',
  `public_flag` varchar(64) DEFAULT '1' COMMENT '是否公开（0：隐藏；1：公开）',
  `name` varchar(64) DEFAULT NULL COMMENT '作品名称',
  `breed` varchar(64) DEFAULT NULL COMMENT '品种',
  `type` varchar(64) DEFAULT NULL COMMENT '作品类型',
  `gy_type` varchar(64) DEFAULT NULL COMMENT '工艺制作',
  `level_zk` varchar(64) DEFAULT NULL COMMENT '篆刻级别',
  `works_meaning` varchar(1000) DEFAULT NULL COMMENT '作品诠释',
  `status` varchar(64) DEFAULT NULL COMMENT '审核状态',
  `recommend` varchar(64) DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `kqdy` varchar(45) DEFAULT NULL,
  `maker` varchar(45) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  `slide` mediumint(11) DEFAULT NULL COMMENT '是否轮播 字典表：是，否，随机 （作品轮播：）',
  `slide_till` datetime DEFAULT NULL COMMENT '截止日期（和slide联合判断）',
  `browser_count` int(11) DEFAULT NULL COMMENT '浏览次数：（ip）',
  `follow_count` int(11) DEFAULT NULL COMMENT '关注数量，冗余字段',
  `value` decimal(11,2) DEFAULT NULL COMMENT '价值',
  `value_till` datetime DEFAULT NULL COMMENT '价值有效时间',
  `certified` mediumint(8) DEFAULT NULL COMMENT '是否认证(如果认证了，则页面有大红章，才能在页面显示value)',
  `working_status` mediumint(8) DEFAULT NULL COMMENT '作品状态字典表 完成、加工中',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `length` decimal(11,2) DEFAULT NULL COMMENT '长度',
  `width` decimal(11,2) DEFAULT NULL COMMENT '宽度',
  `height` decimal(11,2) DEFAULT NULL COMMENT '高度',
  `weight` decimal(11,2) DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='物品/作品';

-- ----------------------------
-- Records of go_archiv
-- ----------------------------

-- ----------------------------
-- Table structure for go_compare
-- ----------------------------
DROP TABLE IF EXISTS `go_compare`;
CREATE TABLE `go_compare` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `no` varchar(64) DEFAULT NULL COMMENT '编号',
  `public_flag` varchar(64) DEFAULT '1' COMMENT '是否公开（0：隐藏；1：公开）',
  `name` varchar(64) DEFAULT NULL COMMENT '作品名称',
  `breed` varchar(64) DEFAULT NULL COMMENT '品种',
  `type` varchar(64) DEFAULT NULL COMMENT '作品类型',
  `gy_type` varchar(64) DEFAULT NULL COMMENT '工艺制作',
  `level_zk` varchar(64) DEFAULT NULL COMMENT '篆刻级别',
  `works_meaning` varchar(1000) DEFAULT NULL COMMENT '作品诠释',
  `status` varchar(64) DEFAULT NULL COMMENT '审核状态',
  `recommend` varchar(64) DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `kqdy` varchar(45) DEFAULT NULL,
  `maker` varchar(45) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  `slide` mediumint(11) DEFAULT NULL COMMENT '是否轮播 字典表：是，否，随机 （作品轮播：）',
  `slide_till` datetime DEFAULT NULL COMMENT '截止日期（和slide联合判断）',
  `browser_count` int(11) DEFAULT NULL COMMENT '浏览次数：（ip）',
  `follow_count` int(11) DEFAULT NULL COMMENT '关注数量，冗余字段',
  `value` decimal(11,2) DEFAULT NULL COMMENT '价值',
  `value_till` datetime DEFAULT NULL COMMENT '价值有效时间',
  `certified` mediumint(8) DEFAULT NULL COMMENT '是否认证(如果认证了，则页面有大红章，才能在页面显示value)',
  `working_status` mediumint(8) DEFAULT NULL COMMENT '作品状态字典表 完成、加工中',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `length` decimal(11,2) DEFAULT NULL COMMENT '长度',
  `width` decimal(11,2) DEFAULT NULL COMMENT '宽度',
  `height` decimal(11,2) DEFAULT NULL COMMENT '高度',
  `weight` decimal(11,2) DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='物品/作品';

-- ----------------------------
-- Records of go_compare
-- ----------------------------

-- ----------------------------
-- Table structure for go_inquiry
-- ----------------------------
DROP TABLE IF EXISTS `go_inquiry`;
CREATE TABLE `go_inquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `no` varchar(64) DEFAULT NULL COMMENT '编号',
  `public_flag` varchar(64) DEFAULT '1' COMMENT '是否公开（0：隐藏；1：公开）',
  `name` varchar(64) DEFAULT NULL COMMENT '作品名称',
  `breed` varchar(64) DEFAULT NULL COMMENT '品种',
  `type` varchar(64) DEFAULT NULL COMMENT '作品类型',
  `gy_type` varchar(64) DEFAULT NULL COMMENT '工艺制作',
  `level_zk` varchar(64) DEFAULT NULL COMMENT '篆刻级别',
  `works_meaning` varchar(1000) DEFAULT NULL COMMENT '作品诠释',
  `status` varchar(64) DEFAULT NULL COMMENT '审核状态',
  `recommend` varchar(64) DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `kqdy` varchar(45) DEFAULT NULL,
  `maker` varchar(45) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  `slide` mediumint(11) DEFAULT NULL COMMENT '是否轮播 字典表：是，否，随机 （作品轮播：）',
  `slide_till` datetime DEFAULT NULL COMMENT '截止日期（和slide联合判断）',
  `browser_count` int(11) DEFAULT NULL COMMENT '浏览次数：（ip）',
  `follow_count` int(11) DEFAULT NULL COMMENT '关注数量，冗余字段',
  `value` decimal(11,2) DEFAULT NULL COMMENT '价值',
  `value_till` datetime DEFAULT NULL COMMENT '价值有效时间',
  `certified` mediumint(8) DEFAULT NULL COMMENT '是否认证(如果认证了，则页面有大红章，才能在页面显示value)',
  `working_status` mediumint(8) DEFAULT NULL COMMENT '作品状态字典表 完成、加工中',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `length` decimal(11,2) DEFAULT NULL COMMENT '长度',
  `width` decimal(11,2) DEFAULT NULL COMMENT '宽度',
  `height` decimal(11,2) DEFAULT NULL COMMENT '高度',
  `weight` decimal(11,2) DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='物品/作品';

-- ----------------------------
-- Records of go_inquiry
-- ----------------------------

-- ----------------------------
-- Table structure for go_management
-- ----------------------------
DROP TABLE IF EXISTS `go_management`;
CREATE TABLE `go_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `no` varchar(64) DEFAULT NULL COMMENT '编号',
  `public_flag` varchar(64) DEFAULT '1' COMMENT '是否公开（0：隐藏；1：公开）',
  `name` varchar(64) DEFAULT NULL COMMENT '作品名称',
  `breed` varchar(64) DEFAULT NULL COMMENT '品种',
  `type` varchar(64) DEFAULT NULL COMMENT '作品类型',
  `gy_type` varchar(64) DEFAULT NULL COMMENT '工艺制作',
  `level_zk` varchar(64) DEFAULT NULL COMMENT '篆刻级别',
  `works_meaning` varchar(1000) DEFAULT NULL COMMENT '作品诠释',
  `status` varchar(64) DEFAULT NULL COMMENT '审核状态',
  `recommend` varchar(64) DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `kqdy` varchar(45) DEFAULT NULL,
  `maker` varchar(45) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  `slide` mediumint(11) DEFAULT NULL COMMENT '是否轮播 字典表：是，否，随机 （作品轮播：）',
  `slide_till` datetime DEFAULT NULL COMMENT '截止日期（和slide联合判断）',
  `browser_count` int(11) DEFAULT NULL COMMENT '浏览次数：（ip）',
  `follow_count` int(11) DEFAULT NULL COMMENT '关注数量，冗余字段',
  `value` decimal(11,2) DEFAULT NULL COMMENT '价值',
  `value_till` datetime DEFAULT NULL COMMENT '价值有效时间',
  `certified` mediumint(8) DEFAULT NULL COMMENT '是否认证(如果认证了，则页面有大红章，才能在页面显示value)',
  `working_status` mediumint(8) DEFAULT NULL COMMENT '作品状态字典表 完成、加工中',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `length` decimal(11,2) DEFAULT NULL COMMENT '长度',
  `width` decimal(11,2) DEFAULT NULL COMMENT '宽度',
  `height` decimal(11,2) DEFAULT NULL COMMENT '高度',
  `weight` decimal(11,2) DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='物品/作品';

-- ----------------------------
-- Records of go_management
-- ----------------------------

-- ----------------------------
-- Table structure for go_owner
-- ----------------------------
DROP TABLE IF EXISTS `go_owner`;
CREATE TABLE `go_owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `no` varchar(64) DEFAULT NULL COMMENT '编号',
  `public_flag` varchar(64) DEFAULT '1' COMMENT '是否公开（0：隐藏；1：公开）',
  `name` varchar(64) DEFAULT NULL COMMENT '作品名称',
  `breed` varchar(64) DEFAULT NULL COMMENT '品种',
  `type` varchar(64) DEFAULT NULL COMMENT '作品类型',
  `gy_type` varchar(64) DEFAULT NULL COMMENT '工艺制作',
  `level_zk` varchar(64) DEFAULT NULL COMMENT '篆刻级别',
  `works_meaning` varchar(1000) DEFAULT NULL COMMENT '作品诠释',
  `status` varchar(64) DEFAULT NULL COMMENT '审核状态',
  `recommend` varchar(64) DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `kqdy` varchar(45) DEFAULT NULL,
  `maker` varchar(45) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  `slide` mediumint(11) DEFAULT NULL COMMENT '是否轮播 字典表：是，否，随机 （作品轮播：）',
  `slide_till` datetime DEFAULT NULL COMMENT '截止日期（和slide联合判断）',
  `browser_count` int(11) DEFAULT NULL COMMENT '浏览次数：（ip）',
  `follow_count` int(11) DEFAULT NULL COMMENT '关注数量，冗余字段',
  `value` decimal(11,2) DEFAULT NULL COMMENT '价值',
  `value_till` datetime DEFAULT NULL COMMENT '价值有效时间',
  `certified` mediumint(8) DEFAULT NULL COMMENT '是否认证(如果认证了，则页面有大红章，才能在页面显示value)',
  `working_status` mediumint(8) DEFAULT NULL COMMENT '作品状态字典表 完成、加工中',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `length` decimal(11,2) DEFAULT NULL COMMENT '长度',
  `width` decimal(11,2) DEFAULT NULL COMMENT '宽度',
  `height` decimal(11,2) DEFAULT NULL COMMENT '高度',
  `weight` decimal(11,2) DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='物品/作品';

-- ----------------------------
-- Records of go_owner
-- ----------------------------

-- ----------------------------
-- Table structure for go_progress
-- ----------------------------
DROP TABLE IF EXISTS `go_progress`;
CREATE TABLE `go_progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `no` varchar(64) DEFAULT NULL COMMENT '编号',
  `public_flag` varchar(64) DEFAULT '1' COMMENT '是否公开（0：隐藏；1：公开）',
  `name` varchar(64) DEFAULT NULL COMMENT '作品名称',
  `breed` varchar(64) DEFAULT NULL COMMENT '品种',
  `type` varchar(64) DEFAULT NULL COMMENT '作品类型',
  `gy_type` varchar(64) DEFAULT NULL COMMENT '工艺制作',
  `level_zk` varchar(64) DEFAULT NULL COMMENT '篆刻级别',
  `works_meaning` varchar(1000) DEFAULT NULL COMMENT '作品诠释',
  `status` varchar(64) DEFAULT NULL COMMENT '审核状态',
  `recommend` varchar(64) DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `kqdy` varchar(45) DEFAULT NULL,
  `maker` varchar(45) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  `slide` mediumint(11) DEFAULT NULL COMMENT '是否轮播 字典表：是，否，随机 （作品轮播：）',
  `slide_till` datetime DEFAULT NULL COMMENT '截止日期（和slide联合判断）',
  `browser_count` int(11) DEFAULT NULL COMMENT '浏览次数：（ip）',
  `follow_count` int(11) DEFAULT NULL COMMENT '关注数量，冗余字段',
  `value` decimal(11,2) DEFAULT NULL COMMENT '价值',
  `value_till` datetime DEFAULT NULL COMMENT '价值有效时间',
  `certified` mediumint(8) DEFAULT NULL COMMENT '是否认证(如果认证了，则页面有大红章，才能在页面显示value)',
  `working_status` mediumint(8) DEFAULT NULL COMMENT '作品状态字典表 完成、加工中',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `length` decimal(11,2) DEFAULT NULL COMMENT '长度',
  `width` decimal(11,2) DEFAULT NULL COMMENT '宽度',
  `height` decimal(11,2) DEFAULT NULL COMMENT '高度',
  `weight` decimal(11,2) DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='物品/作品';

-- ----------------------------
-- Records of go_progress
-- ----------------------------

-- ----------------------------
-- Table structure for go_repairlist
-- ----------------------------
DROP TABLE IF EXISTS `go_repairlist`;
CREATE TABLE `go_repairlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `no` varchar(64) DEFAULT NULL COMMENT '编号',
  `public_flag` varchar(64) DEFAULT '1' COMMENT '是否公开（0：隐藏；1：公开）',
  `name` varchar(64) DEFAULT NULL COMMENT '作品名称',
  `breed` varchar(64) DEFAULT NULL COMMENT '品种',
  `type` varchar(64) DEFAULT NULL COMMENT '作品类型',
  `gy_type` varchar(64) DEFAULT NULL COMMENT '工艺制作',
  `level_zk` varchar(64) DEFAULT NULL COMMENT '篆刻级别',
  `works_meaning` varchar(1000) DEFAULT NULL COMMENT '作品诠释',
  `status` varchar(64) DEFAULT NULL COMMENT '审核状态',
  `recommend` varchar(64) DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `kqdy` varchar(45) DEFAULT NULL,
  `maker` varchar(45) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  `slide` mediumint(11) DEFAULT NULL COMMENT '是否轮播 字典表：是，否，随机 （作品轮播：）',
  `slide_till` datetime DEFAULT NULL COMMENT '截止日期（和slide联合判断）',
  `browser_count` int(11) DEFAULT NULL COMMENT '浏览次数：（ip）',
  `follow_count` int(11) DEFAULT NULL COMMENT '关注数量，冗余字段',
  `value` decimal(11,2) DEFAULT NULL COMMENT '价值',
  `value_till` datetime DEFAULT NULL COMMENT '价值有效时间',
  `certified` mediumint(8) DEFAULT NULL COMMENT '是否认证(如果认证了，则页面有大红章，才能在页面显示value)',
  `working_status` mediumint(8) DEFAULT NULL COMMENT '作品状态字典表 完成、加工中',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `length` decimal(11,2) DEFAULT NULL COMMENT '长度',
  `width` decimal(11,2) DEFAULT NULL COMMENT '宽度',
  `height` decimal(11,2) DEFAULT NULL COMMENT '高度',
  `weight` decimal(11,2) DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='物品/作品';

-- ----------------------------
-- Records of go_repairlist
-- ----------------------------

-- ----------------------------
-- Table structure for go_ship
-- ----------------------------
DROP TABLE IF EXISTS `go_ship`;
CREATE TABLE `go_ship` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `no` varchar(64) DEFAULT NULL COMMENT '编号',
  `public_flag` varchar(64) DEFAULT '1' COMMENT '是否公开（0：隐藏；1：公开）',
  `name` varchar(64) DEFAULT NULL COMMENT '作品名称',
  `breed` varchar(64) DEFAULT NULL COMMENT '品种',
  `type` varchar(64) DEFAULT NULL COMMENT '作品类型',
  `gy_type` varchar(64) DEFAULT NULL COMMENT '工艺制作',
  `level_zk` varchar(64) DEFAULT NULL COMMENT '篆刻级别',
  `works_meaning` varchar(1000) DEFAULT NULL COMMENT '作品诠释',
  `status` varchar(64) DEFAULT NULL COMMENT '审核状态',
  `recommend` varchar(64) DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `kqdy` varchar(45) DEFAULT NULL,
  `maker` varchar(45) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  `slide` mediumint(11) DEFAULT NULL COMMENT '是否轮播 字典表：是，否，随机 （作品轮播：）',
  `slide_till` datetime DEFAULT NULL COMMENT '截止日期（和slide联合判断）',
  `browser_count` int(11) DEFAULT NULL COMMENT '浏览次数：（ip）',
  `follow_count` int(11) DEFAULT NULL COMMENT '关注数量，冗余字段',
  `value` decimal(11,2) DEFAULT NULL COMMENT '价值',
  `value_till` datetime DEFAULT NULL COMMENT '价值有效时间',
  `certified` mediumint(8) DEFAULT NULL COMMENT '是否认证(如果认证了，则页面有大红章，才能在页面显示value)',
  `working_status` mediumint(8) DEFAULT NULL COMMENT '作品状态字典表 完成、加工中',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `length` decimal(11,2) DEFAULT NULL COMMENT '长度',
  `width` decimal(11,2) DEFAULT NULL COMMENT '宽度',
  `height` decimal(11,2) DEFAULT NULL COMMENT '高度',
  `weight` decimal(11,2) DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='物品/作品';

-- ----------------------------
-- Records of go_ship
-- ----------------------------
INSERT INTO `go_ship` VALUES ('1', '2016-12-25 20:00:53', '1', '2016-12-25 23:53:46', '', '0', '身份证', '1', '阿拉伯黑石号', '2', '2', '1', '3', '123213', '3', null, null, '70', '123', '2016-12-25 00:00:00', '1', null, null, null, null, null, null, null, '1', '123.00', '213.00', '123.00', '213.00');
INSERT INTO `go_ship` VALUES ('2', '2016-12-26 20:08:39', '1', '2016-12-26 20:08:42', '', '0', '', '1', '123', '', '', '', '', '', '3', null, null, '', '', null, '1', null, null, null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `go_ship` VALUES ('3', '2016-12-28 20:14:55', '1', '2016-12-28 20:14:57', '', '0', '', '1', 'asda', '', '', '', '', '', '3', null, null, '', '', null, '0', null, null, null, null, null, null, null, '1', null, null, null, null);

-- ----------------------------
-- Table structure for go_yard
-- ----------------------------
DROP TABLE IF EXISTS `go_yard`;
CREATE TABLE `go_yard` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `no` varchar(64) DEFAULT NULL COMMENT '编号',
  `public_flag` varchar(64) DEFAULT '1' COMMENT '是否公开（0：隐藏；1：公开）',
  `name` varchar(64) DEFAULT NULL COMMENT '作品名称',
  `breed` varchar(64) DEFAULT NULL COMMENT '品种',
  `type` varchar(64) DEFAULT NULL COMMENT '作品类型',
  `gy_type` varchar(64) DEFAULT NULL COMMENT '工艺制作',
  `level_zk` varchar(64) DEFAULT NULL COMMENT '篆刻级别',
  `works_meaning` varchar(1000) DEFAULT NULL COMMENT '作品诠释',
  `status` varchar(64) DEFAULT NULL COMMENT '审核状态',
  `recommend` varchar(64) DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `kqdy` varchar(45) DEFAULT NULL,
  `maker` varchar(45) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  `slide` mediumint(11) DEFAULT NULL COMMENT '是否轮播 字典表：是，否，随机 （作品轮播：）',
  `slide_till` datetime DEFAULT NULL COMMENT '截止日期（和slide联合判断）',
  `browser_count` int(11) DEFAULT NULL COMMENT '浏览次数：（ip）',
  `follow_count` int(11) DEFAULT NULL COMMENT '关注数量，冗余字段',
  `value` decimal(11,2) DEFAULT NULL COMMENT '价值',
  `value_till` datetime DEFAULT NULL COMMENT '价值有效时间',
  `certified` mediumint(8) DEFAULT NULL COMMENT '是否认证(如果认证了，则页面有大红章，才能在页面显示value)',
  `working_status` mediumint(8) DEFAULT NULL COMMENT '作品状态字典表 完成、加工中',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `length` decimal(11,2) DEFAULT NULL COMMENT '长度',
  `width` decimal(11,2) DEFAULT NULL COMMENT '宽度',
  `height` decimal(11,2) DEFAULT NULL COMMENT '高度',
  `weight` decimal(11,2) DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='物品/作品';

-- ----------------------------
-- Records of go_yard
-- ----------------------------

-- ----------------------------
-- Table structure for sys_button
-- ----------------------------
DROP TABLE IF EXISTS `sys_button`;
CREATE TABLE `sys_button` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL COMMENT '子菜单名称',
  `button_name` varchar(64) NOT NULL COMMENT '按钮名称',
  `button_url` varchar(255) NOT NULL COMMENT '按钮路径',
  `del_flag` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_button
-- ----------------------------
INSERT INTO `sys_button` VALUES ('1', '2', '新增菜单/子菜单', 'right/addMenu', '0');
INSERT INTO `sys_button` VALUES ('2', '2', '修改菜单/子菜单', 'right/editMenu', '0');
INSERT INTO `sys_button` VALUES ('3', '2', '删除菜单/子菜单', 'right/deleteMenu', '0');
INSERT INTO `sys_button` VALUES ('4', '2', '批量删除菜单/子菜单', 'right/batchDeleteMenu', '0');
INSERT INTO `sys_button` VALUES ('5', '2', '子菜单信息', 'right/subMenu', '0');
INSERT INTO `sys_button` VALUES ('6', '2', '权限信息', 'right/button', '0');
INSERT INTO `sys_button` VALUES ('7', '2', '新增权限', 'right/addBtn', '0');
INSERT INTO `sys_button` VALUES ('8', '2', '修改权限', 'right/editBtn', '0');
INSERT INTO `sys_button` VALUES ('9', '2', '删除权限', 'right/deleteBtn', '0');
INSERT INTO `sys_button` VALUES ('10', '2', '批量删除权限', 'right/batchDeleteBtn', '0');
INSERT INTO `sys_button` VALUES ('11', '3', '新增', 'user/add', '0');
INSERT INTO `sys_button` VALUES ('12', '3', '修改', 'user/edit', '0');
INSERT INTO `sys_button` VALUES ('13', '3', '删除', 'user/delete', '0');
INSERT INTO `sys_button` VALUES ('14', '3', '批量删除', 'user/batchDelete', '0');
INSERT INTO `sys_button` VALUES ('15', '3', '授权', 'user/editRole', '0');
INSERT INTO `sys_button` VALUES ('16', '4', '新增', 'role/add', '0');
INSERT INTO `sys_button` VALUES ('17', '4', '修改', 'role/edit', '0');
INSERT INTO `sys_button` VALUES ('18', '4', '删除', 'role/delete', '0');
INSERT INTO `sys_button` VALUES ('19', '4', '批量删除', 'role/batchDelete', '0');
INSERT INTO `sys_button` VALUES ('20', '4', '编辑权限', 'role/editRight', '0');
INSERT INTO `sys_button` VALUES ('35', '101', '新增船舶', 'ship/addBtn', '0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(64) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) DEFAULT NULL COMMENT '菜单URL',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `menu_order` int(11) DEFAULT NULL COMMENT '菜单顺序',
  `menu_icon` varchar(128) DEFAULT NULL COMMENT '菜单图标',
  `menu_type` int(11) DEFAULT NULL COMMENT '菜单类型 资源类型：1-分类； 2-菜单',
  `removable` int(11) NOT NULL DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  `del_flag` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统配置', '#', '0', '40', 'http://windyeel.oss-cn-shanghai.aliyuncs.com/go/sys/nav_40.png', '1', '0', '系统配置', '0');
INSERT INTO `sys_menu` VALUES ('2', '权限管理', 'right', '1', '41', '', '2', '1', '权限管理', '0');
INSERT INTO `sys_menu` VALUES ('3', '用户管理', 'user', '1', '42', '', '2', '1', '用户管理', '0');
INSERT INTO `sys_menu` VALUES ('4', '角色管理', 'role', '1', '43', '', '2', '1', '角色管理', '0');
INSERT INTO `sys_menu` VALUES ('93', '维修进度', '#', '0', '30', 'http://windyeel.oss-cn-shanghai.aliyuncs.com/go/sys/nav_30.png', '1', '1', '维修进度', '0');
INSERT INTO `sys_menu` VALUES ('100', '维修工程管理', 'management', '93', '31', null, '2', '1', '维修工程管理', '0');
INSERT INTO `sys_menu` VALUES ('101', '基础信息', '#', '0', '10', 'http://windyeel.oss-cn-shanghai.aliyuncs.com/go/sys/nav_10.png', '1', '1', '基础信息', '0');
INSERT INTO `sys_menu` VALUES ('102', '船舶信息', 'ship', '101', '11', null, '2', '1', '船舶信息', '0');
INSERT INTO `sys_menu` VALUES ('103', '船厂信息', 'yard', '101', '12', null, '2', '1', '船厂信息', '0');
INSERT INTO `sys_menu` VALUES ('104', '公司信息', 'owner', '101', '13', null, '2', '1', '公司信息', '0');
INSERT INTO `sys_menu` VALUES ('105', '维修进度汇报', 'progress', '93', '32', null, '2', '1', '维修进度汇报', '0');
INSERT INTO `sys_menu` VALUES ('106', '账号设置', 'account', '1', '45', null, '2', '1', '账号设置', '0');
INSERT INTO `sys_menu` VALUES ('107', '公司资料', 'archiv', '1', '46', null, '2', '1', '公司资料', '0');
INSERT INTO `sys_menu` VALUES ('108', '维修工程单', '#', '0', '20', 'http://windyeel.oss-cn-shanghai.aliyuncs.com/go/sys/nav_20.png', '1', '1', '维修工程单', '0');
INSERT INTO `sys_menu` VALUES ('109', '维修工程单', 'repairlist', '108', '21', null, '2', '1', '维修工程单', '0');
INSERT INTO `sys_menu` VALUES ('110', '工程单询价', 'inquiry', '108', '22', null, '2', '1', '工程单询价', '0');
INSERT INTO `sys_menu` VALUES ('111', '工程单比价', 'compare', '108', '23', null, '2', '1', '工程单比价', '0');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '部门名称',
  `parent_id` char(32) NOT NULL COMMENT '父部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_office
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) NOT NULL COMMENT '角色名称',
  `removable` int(3) NOT NULL DEFAULT '0' COMMENT '可被删除 0=不行 1=可以',
  `allocatable` int(3) DEFAULT '1' COMMENT '可被分配 0=不行 1=可以',
  `description` varchar(255) DEFAULT NULL,
  `del_flag` int(3) NOT NULL DEFAULT '1' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '0', '1', '系统管理员', '0');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `resource_id` int(11) NOT NULL DEFAULT '0',
  `resource_type` int(3) NOT NULL DEFAULT '0' COMMENT '资源类型：1-分类； 2-菜单；3-按钮',
  PRIMARY KEY (`id`),
  KEY `role_id_idx` (`role_id`),
  KEY `resource_id_idx` (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8 COMMENT='权限和资源（菜单+按钮）';

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES ('374', '1', '1', '1');
INSERT INTO `sys_role_resource` VALUES ('375', '1', '2', '2');
INSERT INTO `sys_role_resource` VALUES ('376', '1', '3', '2');
INSERT INTO `sys_role_resource` VALUES ('377', '1', '4', '2');
INSERT INTO `sys_role_resource` VALUES ('379', '1', '93', '1');
INSERT INTO `sys_role_resource` VALUES ('380', '1', '100', '2');
INSERT INTO `sys_role_resource` VALUES ('381', '1', '101', '1');
INSERT INTO `sys_role_resource` VALUES ('382', '1', '102', '2');
INSERT INTO `sys_role_resource` VALUES ('383', '1', '103', '2');
INSERT INTO `sys_role_resource` VALUES ('384', '1', '104', '2');
INSERT INTO `sys_role_resource` VALUES ('385', '1', '105', '2');
INSERT INTO `sys_role_resource` VALUES ('386', '1', '106', '2');
INSERT INTO `sys_role_resource` VALUES ('387', '1', '107', '2');
INSERT INTO `sys_role_resource` VALUES ('388', '1', '108', '1');
INSERT INTO `sys_role_resource` VALUES ('389', '1', '109', '2');
INSERT INTO `sys_role_resource` VALUES ('390', '1', '110', '2');
INSERT INTO `sys_role_resource` VALUES ('391', '1', '111', '2');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) NOT NULL COMMENT '登录名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `last_login` datetime DEFAULT NULL COMMENT '上次登录时间',
  `ip` varchar(32) DEFAULT NULL COMMENT 'IP',
  `del_flag` varchar(32) DEFAULT NULL COMMENT '状态',
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(32) DEFAULT NULL,
  `identification` varchar(64) DEFAULT NULL COMMENT '身份证',
  `public` varchar(64) DEFAULT NULL COMMENT '是否公开',
  `score` int(11) DEFAULT '0' COMMENT '积分',
  `type` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `office_id` varchar(30) DEFAULT NULL COMMENT '部门Id',
  `open_id` varchar(200) DEFAULT NULL COMMENT 'openId',
  `prefer` varchar(64) DEFAULT NULL COMMENT '偏好',
  `address` varchar(64) DEFAULT NULL COMMENT '地址',
  `head_img_url` varchar(200) DEFAULT NULL COMMENT '头像图片地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'dd94709528bb1c83d08f3088d4043f4742891f4f', 'admin', '2017-01-16 16:43:15', '0:0:0:0:0:0:0:1', '0', '123', '1234', '123', null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='用户和角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1');