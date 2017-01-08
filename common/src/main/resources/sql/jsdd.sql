/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost
 Source Database       : jsdd

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : utf-8

 Date: 12/29/2016 23:31:15 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `DATABASECHANGELOG`
-- ----------------------------
DROP TABLE IF EXISTS `DATABASECHANGELOG`;
CREATE TABLE `DATABASECHANGELOG` (
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
--  Records of `DATABASECHANGELOG`
-- ----------------------------
BEGIN;
INSERT INTO `DATABASECHANGELOG` VALUES ('15862614903-001', 'SunHan', 'src/main/resources/changelog.xml', '2016-11-29 00:22:13', '1', 'EXECUTED', '7:85828a0d96ba799dd33667b8134ebfc0', 'createTable tableName=sys_office', '', null, '3.5.3', null, null, '0350133697'), ('15862614903-002', 'SunHan', 'src/main/resources/changelog.xml', '2016-11-29 00:22:13', '2', 'EXECUTED', '7:14e3e6ef96d6d103979ad7df3f7f6219', 'addColumn tableName=sys_user', '', null, '3.5.3', null, null, '0350133697'), ('15862614903-003', 'SunHan', 'src/main/resources/changelog.xml', '2016-11-29 00:22:13', '3', 'EXECUTED', '7:cf81f7cfd67266dbaf8d75bf8511af41', 'sql', '', null, '3.5.3', null, null, '0350133697'), ('James', '18964317375-001', 'src/main/resources/changelog.xml', '2016-11-29 00:22:13', '4', 'EXECUTED', '7:d756fe3930d06b9736e192ffcb6e5861', 'addColumn tableName=sys_user', '', null, '3.5.3', null, null, '0350133697'), ('15862614903-004', 'SunHan', 'src/main/resources/changelog.xml', '2016-11-29 00:22:13', '5', 'EXECUTED', '7:d8bdff6f35d2d1df7f0941358d6afc04', 'sql', '', null, '3.5.3', null, null, '0350133697'), ('15862614903-005', 'SunHan', 'src/main/resources/changelog.xml', '2016-11-29 00:22:13', '6', 'EXECUTED', '7:41963d1082a28a28864888d5a7cd7250', 'sql', '', null, '3.5.3', null, null, '0350133697'), ('15862614903-006', 'SunHan', 'src/main/resources/changelog.xml', '2016-11-30 23:43:18', '7', 'EXECUTED', '7:0a3d6b95802dca6ee766febec1daaf47', 'sql', '', null, '3.5.3', null, null, '0520598575'), ('15862614903-007', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-01 22:47:03', '8', 'EXECUTED', '7:8c43f4e02508fda824f3f9d515eb4028', 'sql', '', null, '3.5.3', null, null, '0603623443'), ('15862614903-008', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-02 00:28:38', '9', 'EXECUTED', '7:c7067b4443f78d9d8ba0650728947b7c', 'sql', '', null, '3.5.3', null, null, '0609718531'), ('15862614903-009', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-20 21:36:22', '10', 'EXECUTED', '7:d93cbdd408506a84eebd080db65984a0', 'sql', '', null, '3.5.3', null, null, '2240982756'), ('15862614903-010', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-20 21:36:22', '11', 'EXECUTED', '7:82dba0d33d2522a201c4bd4b0796cf0d', 'sql', '', null, '3.5.3', null, null, '2240982756'), ('15862614903-011', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-20 21:36:23', '12', 'EXECUTED', '7:fe35c35449db850d97f53cdd4794650d', 'sql', '', null, '3.5.3', null, null, '2240982756'), ('15950097942-012', 'WangShun', 'src/main/resources/changelog.xml', '2016-12-20 21:36:23', '13', 'EXECUTED', '7:b62126862ea553c604dc0d1432c35ed6', 'sql', '', null, '3.5.3', null, null, '2240982756'), ('15950097942-013', 'WangShun', 'src/main/resources/changelog.xml', '2016-12-20 21:36:23', '14', 'EXECUTED', '7:a7899b46e1849f4c38ab7a0c48d121b3', 'sql', '', null, '3.5.3', null, null, '2240982756'), ('15950097942-014', 'WangShun', 'src/main/resources/changelog.xml', '2016-12-20 21:36:23', '15', 'EXECUTED', '7:3df971e54bec94fb151f2ffd0c3ee957', 'sql', '', null, '3.5.3', null, null, '2240982756'), ('15950097942-015', 'WangShun', 'src/main/resources/changelog.xml', '2016-12-20 21:36:23', '16', 'EXECUTED', '7:8e0b0e78db8f0090b0ea4712b1d4bdce', 'sql', '', null, '3.5.3', null, null, '2240982756'), ('15950097942-016', 'WangShun', 'src/main/resources/changelog.xml', '2016-12-20 21:36:23', '17', 'EXECUTED', '7:1d3c5c8e9f8dcf42cc5f8c9a463cbfbb', 'sql', '', null, '3.5.3', null, null, '2240982756'), ('15950097942-017', 'WangShun', 'src/main/resources/changelog.xml', '2016-12-20 21:36:23', '18', 'EXECUTED', '7:83e020f1456ac45fed58c58385fb6bbb', 'sql', '', null, '3.5.3', null, null, '2240982756'), ('15862614903-012', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-20 21:37:27', '19', 'EXECUTED', '7:bc4a526621af97cc9942427e99608448', 'sql', '', null, '3.5.3', null, null, '2241047072'), ('15950097942-018', 'WangShun', 'src/main/resources/changelog.xml', '2016-12-20 21:37:27', '20', 'EXECUTED', '7:902dcd80a2db243c8113071c47459bc4', 'sql', '', null, '3.5.3', null, null, '2241047072'), ('15606137056-001', 'SunZhongYang', 'src/main/resources/changelog.xml', '2016-12-20 21:37:27', '21', 'EXECUTED', '7:9dde0af0aa38e1414a4b99714a70372b', 'sql', '', null, '3.5.3', null, null, '2241047072'), ('15606137056-002', 'SunZhongYang', 'src/main/resources/changelog.xml', '2016-12-20 21:37:27', '22', 'EXECUTED', '7:8f96ce58a3d25728eb42d4172752ab1b', 'sql', '', null, '3.5.3', null, null, '2241047072'), ('15606137056-003', 'SunZhongYang', 'src/main/resources/changelog.xml', '2016-12-20 21:37:27', '23', 'EXECUTED', '7:e9c3e116c81a8cfb00eeb56c5b394f70', 'sql', '', null, '3.5.3', null, null, '2241047072'), ('15950097942-019', 'WangShun', 'src/main/resources/changelog.xml', '2016-12-23 21:28:39', '24', 'EXECUTED', '7:171e13a0dafac4a66843ab1d82dc4c14', 'sql', '', null, '3.5.3', null, null, '2499719210'), ('15862614903-013', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-23 21:28:39', '25', 'EXECUTED', '7:cf13b687ecdbe1a6d9b6a7d0aa72494c', 'sql', '', null, '3.5.3', null, null, '2499719210'), ('15862614903-014', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-23 21:29:23', '26', 'EXECUTED', '7:2a84830b266f7818de03c28e4fbd51cb', 'sql', '', null, '3.5.3', null, null, '2499763167'), ('15950097942-021', 'WangShun', 'src/main/resources/changelog.xml', '2016-12-23 21:29:23', '27', 'EXECUTED', '7:619afa4280948b090320f2c5e26cf9e1', 'sql', '', null, '3.5.3', null, null, '2499763167'), ('15950097942-022', 'WangShun', 'src/main/resources/changelog.xml', '2016-12-23 21:29:23', '28', 'EXECUTED', '7:74d458aec3a6c0ace998f76f536afba8', 'sql', '', null, '3.5.3', null, null, '2499763167'), ('15862614903-015', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-23 22:44:06', '29', 'EXECUTED', '7:c9a629e50e34a8d5984115b0e8596f35', 'sql', '', null, '3.5.3', null, null, '2504246889'), ('15862614903-016', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-25 13:45:24', '30', 'EXECUTED', '7:5e9adf85a7056f0d6f4b4443ac893767', 'sql', '', null, '3.5.3', null, null, '2644724194'), ('15862614903-017', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-25 14:18:08', '31', 'EXECUTED', '7:9fc70f76295824035a59cf970b245612', 'sql', '', null, '3.5.3', null, null, '2646687793'), ('15862614903-018', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-25 14:19:36', '32', 'EXECUTED', '7:2a88fb70791c33f68d5f58e327aaa9e8', 'sql', '', null, '3.5.3', null, null, '2646776832'), ('15862614903-019', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-25 16:34:40', '33', 'EXECUTED', '7:1f61ff9cf39bb76549dc2866a4997be7', 'sql', '', null, '3.5.3', null, null, '2654880405'), ('15862614903-020', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-25 16:34:40', '34', 'EXECUTED', '7:4b153dc2ea243a7c272f64dcdbc11b27', 'sql', '', null, '3.5.3', null, null, '2654880405'), ('15862614903-021', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-25 17:10:33', '35', 'EXECUTED', '7:d9e59703c47fefcb4412818cac592142', 'sql', '', null, '3.5.3', null, null, '2657033061'), ('15862614903-022', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-25 20:05:16', '36', 'EXECUTED', '7:1df547ed3c3ee0834b41a641032fb5d1', 'sql', '', null, '3.5.3', null, null, '2667516375'), ('15950097942-023', 'WangShun', 'src/main/resources/changelog.xml', '2016-12-26 23:59:25', '37', 'EXECUTED', '7:05bc2f7138df4d58775c857d3614fb77', 'sql', '', null, '3.5.3', null, null, '2767965387'), ('15950097942-024', 'WangShun', 'src/main/resources/changelog.xml', '2016-12-26 23:59:25', '38', 'EXECUTED', '7:262e69af0e148ae9372aa99bbec1f33c', 'sql', '', null, '3.5.3', null, null, '2767965387'), ('15950097942-025', 'WangShun', 'src/main/resources/changelog.xml', '2016-12-26 23:59:25', '39', 'EXECUTED', '7:48ee230d973d54e712c0ae8dc311beed', 'sql', '', null, '3.5.3', null, null, '2767965387'), ('15950097942-026', 'WangShun', 'src/main/resources/changelog.xml', '2016-12-26 23:59:25', '40', 'EXECUTED', '7:faff7e12b8b72b1654b4bdc2f720a577', 'sql', '', null, '3.5.3', null, null, '2767965387'), ('15862614903-023', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-27 00:01:28', '41', 'EXECUTED', '7:da4388e14b25bd2235c52f4c4f16aa9b', 'sql', '', null, '3.5.3', null, null, '2768088566'), ('15950097942-027', 'WangShun', 'src/main/resources/changelog.xml', '2016-12-28 22:18:25', '42', 'EXECUTED', '7:7ed4673ce99f52382b384f8da3e61cba', 'sql', '', null, '3.5.3', null, null, '2934705349'), ('15862614903-024', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-28 22:18:25', '43', 'EXECUTED', '7:8153ff24243e3312548a5037a20a6991', 'sql', '', null, '3.5.3', null, null, '2934705349'), ('15862614903-025', 'SunHan', 'src/main/resources/changelog.xml', '2016-12-28 23:56:44', '44', 'EXECUTED', '7:c5c6d379271b6b57c0e2627f3ede58ca', 'sql', '', null, '3.5.3', null, null, '2940604878');
COMMIT;

-- ----------------------------
--  Table structure for `DATABASECHANGELOGLOCK`
-- ----------------------------
DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `DATABASECHANGELOGLOCK`
-- ----------------------------
BEGIN;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES ('1', b'0', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `dd_browser_history`
-- ----------------------------
DROP TABLE IF EXISTS `dd_browser_history`;
CREATE TABLE `dd_browser_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '浏览历史id',
  `user_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `type` mediumint(8) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='浏览历史';

-- ----------------------------
--  Table structure for `dd_comments`
-- ----------------------------
DROP TABLE IF EXISTS `dd_comments`;
CREATE TABLE `dd_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `works_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '创建者',
  `type` mediumint(8) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT '评论有递归',
  `follow_count` int(11) DEFAULT NULL COMMENT '关注数量，冗余字段',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dd_consumer`
-- ----------------------------
DROP TABLE IF EXISTS `dd_consumer`;
CREATE TABLE `dd_consumer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `type` varchar(64) DEFAULT NULL COMMENT '用户类型',
  `customer` varchar(64) DEFAULT NULL COMMENT '备选名字',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `address` varchar(64) DEFAULT NULL COMMENT '地址',
  `phone` varchar(64) DEFAULT NULL COMMENT '联系方式',
  `no` varchar(64) DEFAULT NULL COMMENT '身份证',
  `remark` text COMMENT '备注',
  `datetime` datetime DEFAULT NULL COMMENT '登记/收藏时间',
  `pub` varchar(64) DEFAULT '0' COMMENT '是否公开',
  `works_id` int(11) DEFAULT NULL COMMENT '作品id',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='提供/收藏者';

-- ----------------------------
--  Records of `dd_consumer`
-- ----------------------------
BEGIN;
INSERT INTO `dd_consumer` VALUES ('1', '2016-12-25 20:00:53', '2016-12-25 23:53:46', null, '0', '1', null, '提供者,提供者', '联系地址,联系地址', '手机号码,手机号码', '身份证,身份证', null, '2016-12-25 00:00:00', 'on', '1', '1', '1'), ('2', '2016-12-25 20:02:57', '2016-12-25 23:53:46', null, '0', '2', null, '收藏者 收藏者', '联系地址', '手机号码 请输入手机号码', '身份证 请输入身份证', null, '2016-12-25 00:00:00', '0', '1', '1', '1'), ('4', '2016-12-25 20:59:17', '2016-12-25 20:59:17', null, '0', '1', null, '提供者', '联系地址', '手机号码', '身份证', null, '2016-12-25 00:00:00', '1', '2', '1', '1'), ('6', '2016-12-26 20:08:52', '2016-12-26 20:08:52', null, '0', '2', null, '', '', '', '', null, null, '0', '2', '1', '1'), ('7', '2016-12-28 20:14:55', '2016-12-28 20:14:55', null, '0', '1', null, '', '', '', '', null, null, null, '3', '1', '1'), ('8', '2016-12-28 20:15:03', '2016-12-28 20:15:03', null, '0', '2', null, '', '', '', '', null, null, '0', '3', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `dd_follow_history`
-- ----------------------------
DROP TABLE IF EXISTS `dd_follow_history`;
CREATE TABLE `dd_follow_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注历史id',
  `user_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `type` mediumint(8) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dd_images`
-- ----------------------------
DROP TABLE IF EXISTS `dd_images`;
CREATE TABLE `dd_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) DEFAULT NULL COMMENT '目标Id，根据type来判断哪张表的主键',
  `url` varchar(200) DEFAULT NULL COMMENT '图片相对路径',
  `type` varchar(10) DEFAULT NULL COMMENT '图片类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `dd_images`
-- ----------------------------
BEGIN;
INSERT INTO `dd_images` VALUES ('6', '1', 'works-image/fwDjmamrWD.jpg', '0'), ('7', '1', 'works-image/s6788cYhbn.jpg', '2'), ('8', '1', 'works-image/TaGAFKQ535.jpg', '1'), ('9', '2', 'works-image/QACjRw55DF.jpg', '0'), ('10', '2', 'works-image/G8R575za7f.jpg', '0'), ('11', '2', 'works-image/XwHXDbprkt.jpg', '0'), ('12', '2', 'works-image/hzc8Q7XWR2.jpg', '0'), ('13', '2', 'works-image/GMEDJHWCPz.jpg', '0'), ('14', '2', 'works-image/HndbCkiJ74.jpg', '0'), ('15', '1', 'works-image/b7pDw85y75.jpg', '0'), ('16', '1', 'works-image/BzatDXEeJa.jpg', '0'), ('17', '1', 'works-image/knjsMcbzf8.jpg', '0'), ('18', '1', 'works-image/r4Z2iYM5Rk.jpg', '0'), ('19', '1', 'works-image/A4zJy5R4Qn.jpg', '0'), ('20', '1', 'works-image/TWHNMAcQWT.jpg', '3'), ('21', '1', 'works-image/E32b76NGhP.jpg', '3'), ('22', '1', 'works-image/dNYJRpewzS.jpg', '3'), ('23', '1', 'works-image/fDybbcJ8sM.jpg', '3'), ('24', '1', 'works-image/apSA3J8s5E.jpg', '3'), ('25', '2', 'works-image/saQ3brBdMm.jpg', '3'), ('26', '2', 'works-image/CHdES2kPzQ.jpg', '3'), ('27', '2', 'works-image/CdPptmwdwm.jpg', '3'), ('28', '3', 'works-image/QaM8a3FdXx.jpg', '3'), ('29', '3', 'works-image/wExNriTXjC.jpg', '3'), ('30', '3', 'works-image/FZMPWEGZBG.jpg', '3'), ('31', '3', 'works-image/t5rKCW3PS2.jpg', '3');
COMMIT;

-- ----------------------------
--  Table structure for `dd_interpretation`
-- ----------------------------
DROP TABLE IF EXISTS `dd_interpretation`;
CREATE TABLE `dd_interpretation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `works_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '创建表',
  `type` varchar(64) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT '诠释有递归',
  `score_demanded` mediumint(8) DEFAULT NULL COMMENT '想要的分数 选项20 50 100',
  `status` mediumint(8) DEFAULT NULL COMMENT '是否提交成功',
  `deal_date` datetime DEFAULT NULL,
  `follow_count` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `description` varchar(1000) DEFAULT NULL COMMENT '诠释文字说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `dd_interpretation`
-- ----------------------------
BEGIN;
INSERT INTO `dd_interpretation` VALUES ('1', '1', '1', null, null, '20', null, null, null, '2016-12-28 23:59:41', '2016-12-28 23:59:41', '1', '1', '0', null, '123123'), ('2', '1', '1', null, null, '50', null, null, null, '2016-12-29 00:00:54', '2016-12-29 00:00:54', '1', '1', '0', null, 'qweqwe'), ('3', '1', '1', null, null, '100', null, null, null, '2016-12-29 00:02:25', '2016-12-29 00:02:25', '1', '1', '0', null, 'qweqwe');
COMMIT;

-- ----------------------------
--  Table structure for `dd_message`
-- ----------------------------
DROP TABLE IF EXISTS `dd_message`;
CREATE TABLE `dd_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息';

-- ----------------------------
--  Table structure for `dd_report`
-- ----------------------------
DROP TABLE IF EXISTS `dd_report`;
CREATE TABLE `dd_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `works_id` int(11) DEFAULT NULL COMMENT '作品Id',
  `works_no` varchar(64) DEFAULT NULL COMMENT '作品编号',
  `des` text COMMENT '描述',
  `certify` text COMMENT '认证报告',
  `valid_time` datetime DEFAULT NULL COMMENT '价值有效时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='评估报告';

-- ----------------------------
--  Records of `dd_report`
-- ----------------------------
BEGIN;
INSERT INTO `dd_report` VALUES ('1', '1', '2016-12-25 20:02:17', '1', '2016-12-25 23:53:46', null, '0', '1', null, '作品详细评估报告\n作品详细评估报告作品详细评估报告作品详细评估报告作品详细评估报告作品详细评估报告作品详细评估报告\n作品详细评估报告', '作品价值认证报作品价值认证报作品价值认证报作品价值认证报作品价值认证报', '2016-12-25 00:00:00'), ('2', '1', '2016-12-26 20:08:49', '1', '2016-12-26 20:08:49', null, '0', '2', null, '', '', null), ('3', '1', '2016-12-28 20:15:01', '1', '2016-12-28 20:15:01', null, '0', '3', null, '', '', null);
COMMIT;

-- ----------------------------
--  Table structure for `dd_score_calc`
-- ----------------------------
DROP TABLE IF EXISTS `dd_score_calc`;
CREATE TABLE `dd_score_calc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `value` decimal(11,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` varchar(64) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分计算方式';

-- ----------------------------
--  Table structure for `dd_score_history`
-- ----------------------------
DROP TABLE IF EXISTS `dd_score_history`;
CREATE TABLE `dd_score_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分历史记录id',
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL COMMENT '加减积分',
  `type` mediumint(8) DEFAULT NULL COMMENT '(字典表)(如果是交易类型的，标注to,from)',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dd_transfer_history`
-- ----------------------------
DROP TABLE IF EXISTS `dd_transfer_history`;
CREATE TABLE `dd_transfer_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '转让历史id',
  `works_id` int(11) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `relation` varchar(64) DEFAULT NULL,
  `transfer_type` mediumint(8) DEFAULT NULL,
  `score` decimal(11,2) DEFAULT NULL,
  `status` mediumint(8) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dd_working_progress`
-- ----------------------------
DROP TABLE IF EXISTS `dd_working_progress`;
CREATE TABLE `dd_working_progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '作品加工状态id',
  `works_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `picture` varchar(64) DEFAULT NULL,
  `percent` varchar(64) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '加工者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dd_works`
-- ----------------------------
DROP TABLE IF EXISTS `dd_works`;
CREATE TABLE `dd_works` (
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
--  Records of `dd_works`
-- ----------------------------
BEGIN;
INSERT INTO `dd_works` VALUES ('1', '2016-12-25 20:00:53', '1', '2016-12-25 23:53:46', '作品描述作品描述作品描述作品描述作品描述作品描述', '0', '身份证', '1', '作品名称', '2', '2', '1', '3', '123213', '3', null, null, '70', '123', '2016-12-25 00:00:00', '1', null, null, null, null, null, null, null, '1', '123.00', '213.00', '123.00', '213.00'), ('2', '2016-12-26 20:08:39', '1', '2016-12-26 20:08:42', '', '0', '', '1', '123', '', '', '', '', '', '3', null, null, '', '', null, '1', null, null, null, null, null, null, null, '1', null, null, null, null), ('3', '2016-12-28 20:14:55', '1', '2016-12-28 20:14:57', '', '0', '', '1', 'asda', '', '', '', '', '', '3', null, null, '', '', null, '1', null, null, null, null, null, null, null, '1', null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `dd_works_level`
-- ----------------------------
DROP TABLE IF EXISTS `dd_works_level`;
CREATE TABLE `dd_works_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `works_id` int(11) DEFAULT NULL COMMENT '作品id',
  `zhidi` varchar(64) DEFAULT NULL COMMENT '质地',
  `zhidi2` varchar(64) DEFAULT NULL COMMENT '质地二',
  `ganguan` varchar(64) DEFAULT NULL COMMENT '感官',
  `moshidu` varchar(64) DEFAULT NULL COMMENT '磨氏度',
  `xueliang` varchar(64) DEFAULT NULL COMMENT '血量',
  `xuese` varchar(64) DEFAULT NULL COMMENT '血色',
  `xuexing` varchar(64) DEFAULT NULL COMMENT '血形',
  `nongyandu` varchar(64) DEFAULT NULL COMMENT '浓艳度',
  `dise` varchar(64) DEFAULT NULL COMMENT '地色',
  `liu` varchar(64) DEFAULT NULL COMMENT '绺',
  `lie` varchar(64) DEFAULT NULL COMMENT '裂',
  `inithanxueliang` varchar(64) DEFAULT NULL COMMENT '原石含血量',
  `hanxuemian` varchar(64) DEFAULT NULL COMMENT '印章含血面',
  `hanxueliang` varchar(64) DEFAULT NULL COMMENT '雕件含血量',
  `hanxuefangshi` varchar(45) DEFAULT NULL,
  `chunjingdu` varchar(64) DEFAULT NULL COMMENT '纯净度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='作品等级';

-- ----------------------------
--  Records of `dd_works_level`
-- ----------------------------
BEGIN;
INSERT INTO `dd_works_level` VALUES ('1', '1', '2016-12-25 20:01:47', '1', '2016-12-25 20:01:47', null, '0', '1', '3', '50', '5', '4', '2', '1', '4', '1', '7', '2', '5', '3', null, null, '2', '2'), ('2', '1', '2016-12-26 20:08:46', '1', '2016-12-26 20:08:46', null, '0', '2', '', '', '', '', '', '', '', '', '', '', '', '', null, null, '', ''), ('3', '1', '2016-12-28 20:14:59', '1', '2016-12-28 20:14:59', null, '0', '3', '', '', '', '', '', '', '', '', '', '', '', '', null, null, '', '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_app_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) NOT NULL COMMENT '登录名',
  `password` varchar(64) NOT NULL COMMENT '登录密码',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `identification` varchar(64) DEFAULT NULL COMMENT '身份证',
  `pub` bit(1) DEFAULT NULL COMMENT '是否公开',
  `score` int(11) DEFAULT '0' COMMENT '积分',
  `open_id` varchar(200) DEFAULT NULL COMMENT 'openId',
  `prefer` varchar(64) DEFAULT NULL COMMENT '偏好',
  `address` varchar(64) DEFAULT NULL COMMENT '地址',
  `head_img_url` varchar(200) DEFAULT NULL COMMENT '头像图片地址',
  `name` varchar(64) DEFAULT NULL COMMENT '真实姓名',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  `last_login` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_app_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_app_user` VALUES ('1', 'sunhan', '71431ddb024987660b7faedf7880fbf35eb9f1dc', 'sunhan521@qq.com', '15862614903', '', null, null, null, '2', '江苏省苏州市', 'works-image/ARZJzRW2mw.jpg', '孙汉', '0', null), ('2', 'sunhan1', 'f03f12751d53e0e8c1d4712ce8f8a05c955ec176', '', null, null, null, null, null, null, null, null, null, '0', null), ('3', 'sunhan2', '6f76a95b069f04d0a1545454585e493d1f17c0f6', '', null, null, null, null, null, null, null, null, null, '0', null), ('4', 'sunhan4', '573e2c3f0ff3f09a8cfb73b89691a1e78d1f6a3f', '', null, null, null, null, null, null, null, null, null, '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_button`
-- ----------------------------
DROP TABLE IF EXISTS `sys_button`;
CREATE TABLE `sys_button` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL COMMENT '子菜单名称',
  `button_name` varchar(64) NOT NULL COMMENT '按钮名称',
  `button_url` varchar(255) NOT NULL COMMENT '按钮路径',
  `del_flag` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_button`
-- ----------------------------
BEGIN;
INSERT INTO `sys_button` VALUES ('1', '2', '新增菜单/子菜单', 'right/addMenu', '0'), ('2', '2', '修改菜单/子菜单', 'right/editMenu', '0'), ('3', '2', '删除菜单/子菜单', 'right/deleteMenu', '0'), ('4', '2', '批量删除菜单/子菜单', 'right/batchDeleteMenu', '0'), ('5', '2', '子菜单信息', 'right/subMenu', '0'), ('6', '2', '权限信息', 'right/button', '0'), ('7', '2', '新增权限', 'right/addBtn', '0'), ('8', '2', '修改权限', 'right/editBtn', '0'), ('9', '2', '删除权限', 'right/deleteBtn', '0'), ('10', '2', '批量删除权限', 'right/batchDeleteBtn', '0'), ('11', '3', '新增', 'user/add', '0'), ('12', '3', '修改', 'user/edit', '0'), ('13', '3', '删除', 'user/delete', '0'), ('14', '3', '批量删除', 'user/batchDelete', '0'), ('15', '3', '授权', 'user/editRole', '0'), ('16', '4', '新增', 'role/add', '0'), ('17', '4', '修改', 'role/edit', '0'), ('18', '4', '删除', 'role/delete', '0'), ('19', '4', '批量删除', 'role/batchDelete', '0'), ('20', '4', '编辑权限', 'role/editRight', '0'), ('21', '4', '123', '123', '0'), ('22', '4', '1234', '234', '0'), ('23', '4', '123qwe', '123qwe', '0'), ('24', '97', '新增', 'dict/add', '0'), ('25', '97', '修改', 'dict/edit', '0'), ('26', '97', '删除', 'dict/delete', '0'), ('27', '97', '批量删除', 'dict/batchDelete', '0'), ('30', '100', '作品等级', 'works/level', '0'), ('31', '100', '作品信息', 'works/info', '0'), ('32', '100', '收藏者信息', 'works/collect', '0'), ('33', '100', '提供者信息', 'works/provider', '0'), ('34', '100', '评估报告', 'works/report', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
--  Records of `sys_dict`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('001d31a2e0424874aa9cbd8e851d71b4', '4', '4-5', 'dd_moshidu', '磨氏度', '40', '0', '', '0'), ('006d08892fb04e2bb86c65498115397c', '50', '灰刚板地', 'dd_zhidi2', '质地二', '50', '0', '', '0'), ('046495809ab54a6b80cdbb699362ce28', '3', '&gt;15%', 'dd_xueliang', '血量', '30', '0', '', '0'), ('049f941b3b62432a8bcdbcb261c2e517', '70', '康山岭', 'dd_kqdy', '矿区地域', '70', '0', '', '0'), ('0507fb414217482f9010c14b5e34eca9', '30', '粗糠坞', 'dd_kqdy', '矿区地域', '30', '0', '', '0'), ('0852237bdb59452197a47de0b293e42e', '3', '硬', 'dd_zhidi', '质地', '30', '0', '', '0'), ('0a22f3278a624882a822e0820f27efcb', '1', '主表', 'table_type', '表类型', '20', '0', '', '0'), ('0b3ad7ad1d63428793805b6d4b0504fc', '3', '黑', 'dd_dise', '地色', '30', '0', '', '0'), ('0d0914ea72d14061a46f33c1d3ec9a9f', '1', '浓艳', 'dd_nongyandu', '浓艳度', '10', '0', '', '0'), ('0d7a2285c70147a5a51d25716169edcc', '2', '软', 'dd_zhidi', '质地', '20', '0', '', '0'), ('0d7bf35943e84c52ae25582d2ac82477', '2', '昌化田黄石', 'dd_pinzhong', '品种', '20', '0', '', '0'), ('0ee131f8703b433d96e7c441b40b8b0b', '1', '表面含血', 'dd_hanxuefangshi', '含血方式', '10', '0', '', '0'), ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', null, '0'), ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', null, '0'), ('105', '1', '会议通告\0\0', 'oa_notify_type', '通知通告类型', '10', '0', null, '0'), ('106', '2', '奖惩通告\0\0', 'oa_notify_type', '通知通告类型', '20', '0', null, '0'), ('107', '3', '活动通告\0\0', 'oa_notify_type', '通知通告类型', '30', '0', null, '0'), ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', '10', '0', null, '0'), ('109', '1', '发布', 'oa_notify_status', '通知通告状态', '20', '0', null, '0'), ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', null, '0'), ('110', '0', '未读', 'oa_notify_read', '通知通告状态', '10', '0', null, '0'), ('111', '1', '已读', 'oa_notify_read', '通知通告状态', '20', '0', null, '0'), ('11b0e9453f5a42798adacaf921ead448', '2', '2-4', 'dd_moshidu', '磨氏度', '20', '0', '', '0'), ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', null, '0'), ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', null, '0'), ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', null, '0'), ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', null, '0'), ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', null, '0'), ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', null, '0'), ('1973488a10db4f58a7b50ffbc0061dbb', '1', '净', 'dd_jingdu', '精度', '10', '0', '', '0'), ('1a238da3b6de4fdd95800faaf50ab383', '110', '笔架石', 'dd_kqdy', '矿区地域', '110', '0', '', '0'), ('1c0ac576c33d41fcb4c16602bf4fad5d', 'post', 'post', 'interface_type', '接口类型', '20', '0', '', '0'), ('1dbf52e46c8e4263b2acefbcdf9aab61', '120', '灰石岭', 'dd_kqdy', '矿区地域', '120', '0', '', '0'), ('1e6a4444f7834307b2bc22eb58989430', '5', '褐', 'dd_dise', '地色', '50', '0', '', '0'), ('1eb6c056151943debc494db4b8062cdf', '1', '鲜红', 'dd_xuese', '血色', '10', '0', '', '0'), ('1f191377c532482abdff242209963bb1', '6', '星点状', 'dd_xuexing', '血形', '70', '0', '', '0'), ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', null, '0'), ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', null, '0'), ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', null, '0'), ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', null, '0'), ('221a918bd1e149239a17ab0fdeaf5ecd', 'get', 'get', 'interface_type', '接口类型', '10', '0', '', '0'), ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', null, '0'), ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', null, '0'), ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', null, '0'), ('25f9dfd73c4f4f31b1d76a6c28246635', '5', '网脉状', 'dd_xuexing', '血形', '50', '0', '', '0'), ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', null, '0'), ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', null, '0'), ('27c183e802b0459da5d5403f46b26dd3', '60', '活刚板地', 'dd_zhidi2', '质地二', '60', '0', '', '0'), ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', null, '0'), ('281b416efb774626897b20933050c423', '2', '艳', 'dd_nongyandu', '浓艳度', '20', '0', '', '0'), ('2878a390fde7406cb593835fc4498d05', '2', '裂', 'dd_lie', '裂', '20', '0', '', '0'), ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', null, '0'), ('2c39d7c90ea34cd7bd23a2bc197b44d3', '1', '微裂', 'dd_lie', '裂', '10', '0', '', '0'), ('2d231c87a6844c39b77d29a7d407ab47', '4', '复位黏结', 'dd_lie', '裂', '40', '0', '', '0'), ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', null, '0'), ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', null, '0'), ('3069d36c610840d8a55fb457226be15a', '6', '1面', 'dd_mian', '印章含血面', '60', '0', '', '0'), ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', null, '0'), ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', null, '0'), ('321ec8d0ab714518acf0eea10c932348', '40', '老鹰岩', 'dd_kqdy', '矿区地域', '40', '0', '', '0'), ('326e7bc5590546239f3d10c102e86d36', '3', '花', 'dd_jingdu', '精度', '30', '0', '', '0'), ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', null, '0'), ('33bbe7a5d3764c35974ad7bb86509b8f', '6', '青', 'dd_dise', '地色', '60', '0', '', '0'), ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', null, '0'), ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', null, '0'), ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', null, '0'), ('36e938a425624de0801fcd2f37f37083', '2', '5面', 'dd_mian', '印章含血面', '20', '0', '', '0'), ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', null, '0'), ('3778e8dba108458fb4def094385098d3', '1', '审核中', 'dd_status', '作品审核', '10', '0', '', '0'), ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', null, '0'), ('382955c8e8244dd2bc65065d19bb7caa', '3', '透、细腻、干', 'dd_ganguan', '感官', '30', '0', '', '0'), ('3883fd12606c4bd5bbff8ff4c959e0b3', '2', '印章', 'dd_zuopinleixing', '作品类型', '20', '0', '', '0'), ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', null, '0'), ('3aa4470658154053b9531106c786f26a', '1', '2&ndash;2.5', 'dd_moshidu', '磨氏度', '10', '0', '', '0'), ('3c37273e37bc475fa078041eb0ba6ed7', '2', '白', 'dd_dise', '地色', '20', '0', '', '0'), ('3c791be00171489cbb669ad571245e60', '3', '三级', 'dd_level', '级别', '30', '0', '', '0'), ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', null, '0'), ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', null, '0'), ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', null, '0'), ('42', 'basic', '基础主题', 'cms_theme', '站点主题', '10', '0', null, '0'), ('426d26147d8a4bc083a9d111cd0ae5ac', '130', '鸡冠岩', 'dd_kqdy', '矿区地域', '130', '0', '', '0'), ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', '20', '0', null, '0'), ('43c9472f411c4d3eafb3bf5319ffe499', '2', '异常报告', 'report_type', '异常的报告', '20', '0', '', '0'), ('44', 'red', '红色主题', 'cms_theme', '站点主题', '30', '0', null, '0'), ('45', 'article', '文章模型', 'cms_module', '栏目模型', '10', '0', null, '0'), ('46', 'picture', '图片模型', 'cms_module', '栏目模型', '20', '0', null, '0'), ('47', 'download', '下载模型', 'cms_module', '栏目模型', '30', '0', null, '0'), ('479b623a72504c7bb0794c8154d6de82', '5', '无', 'dd_lie', '裂', '50', '0', '', '0'), ('48', 'link', '链接模型', 'cms_module', '栏目模型', '40', '0', null, '0'), ('49', 'special', '专题模型', 'cms_module', '栏目模型', '50', '0', null, '0'), ('4996faa1719341d483f11e17a4d6e9cf', '7', '混合', 'dd_dise', '地色', '70', '0', '', '0'), ('4a953baa9f3b4014a1d22e1669cd83bb', '4', '杂', 'dd_jingdu', '精度', '40', '0', '', '0'), ('4c593f5e344f49a6814a900d135b7c10', '4', '不透、细腻、温润', 'dd_ganguan', '感官', '40', '0', '', '0'), ('4c7fe66af9b64f5192d5ce01618adefa', '4', '复位黏结', 'dd_liu', '绺', '40', '0', '', '0'), ('4ed93f4ca2a64297b972d4fc5c5b5993', '1', '&gt;50%', 'dd_xueliang', '血量', '10', '0', '', '0'), ('5', '1', '是', 'yes_no', '是/否', '10', '0', null, '0'), ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', '10', '0', null, '0'), ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', '20', '0', null, '0'), ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', '30', '0', null, '0'), ('52250b5574d9497ab4b27ee685c67531', '2', '二级', 'dd_level', '级别', '20', '0', '', '0'), ('52f52a5fb006420981753b3b001b0a2b', '1', '昌化田黄鸡血石', 'dd_pinzhong', '品种', '10', '0', '', '0'), ('53', '0', '发布', 'cms_del_flag', '内容状态', '10', '0', null, '0'), ('537354e101d44095914ac34f3fcfbf0e', '3', '裂', 'dd_liu', '绺', '30', '0', '', '0'), ('53e64e07c4cf41fe894dfcee387ef71b', '1', '黄', 'dd_dise', '地色', '10', '0', '', '0'), ('54', '1', '删除', 'cms_del_flag', '内容状态', '20', '0', null, '0'), ('55', '2', '审核', 'cms_del_flag', '内容状态', '15', '0', null, '0'), ('56', '1', '首页焦点图', 'cms_posid', '推荐位', '10', '0', null, '0'), ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', '20', '0', null, '0'), ('57b74b81792741528beea50524d0120a', '6', '其他', 'dd_zuopinleixing', '作品类型', '60', '0', '', '0'), ('58', '1', '咨询', 'cms_guestbook', '留言板分类', '10', '0', null, '0'), ('5859360f9f2b4483b7e936ad4363a6f7', '10', '纤岭', 'dd_kqdy', '矿区地域', '10', '0', '', '0'), ('59', '2', '建议', 'cms_guestbook', '留言板分类', '20', '0', null, '0'), ('5b899603552c48519e7ba8eb9da0b41f', '0', '单表', 'table_type', '表类型', '10', '0', '', '0'), ('5cc745f5851f4429adaa80dae2a1e195', '50', '红硐岩', 'dd_kqdy', '矿区地域', '50', '0', '', '0'), ('6', '0', '否', 'yes_no', '是/否', '20', '0', null, '0'), ('60', '3', '投诉', 'cms_guestbook', '留言板分类', '30', '0', null, '0'), ('61', '4', '其它', 'cms_guestbook', '留言板分类', '40', '0', null, '0'), ('618ed09f357e45ada15523a8cd9b334f', '1', '原石', 'dd_zuopinleixing', '作品类型', '10', '0', '', '0'), ('62', '1', '公休', 'oa_leave_type', '请假类型', '10', '0', null, '0'), ('62c46500d26b405c9aaf6cf4abd3394d', '2', '古玩', 'dd_preference', '收藏偏好', '20', '0', '', '0'), ('63', '2', '病假', 'oa_leave_type', '请假类型', '20', '0', null, '0'), ('64', '3', '事假', 'oa_leave_type', '请假类型', '30', '0', null, '0'), ('64e59b749e924dd990522504ffa12b49', '3', '条状', 'dd_xuexing', '血形', '30', '0', '', '0'), ('65', '4', '调休', 'oa_leave_type', '请假类型', '40', '0', null, '0'), ('66', '5', '婚假', 'oa_leave_type', '请假类型', '60', '0', null, '0'), ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', null, '0'), ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', null, '0'), ('680ddd8c91fe43588a7bb7aafe816633', '1', '正常报告', 'report_type', '正常的报告', '10', '0', '正常的报告', '0'), ('684b56a51508445e9dd8031c1afa6656', '70', '刚硬地', 'dd_zhidi2', '质地二', '70', '0', '', '0'), ('68f91e9c1c12456ca74857a6c1a0de87', '4', '暗红', 'dd_xuese', '血色', '40', '0', '', '0'), ('69', 'leave', '请假流程', 'act_type', '流程类型', '10', '0', null, '0'), ('6a3fe5cdfe7642468ce8f572a376da86', '5', '4-6', 'dd_moshidu', '磨氏度', '50', '0', '', '0'), ('6ced885afc3348e79312d164531af705', '2', '未通过', 'dd_status', '作品审核', '20', '0', '', '0'), ('7', 'red', '红色', 'color', '颜色值', '10', '0', null, '0'), ('70', 'test_audit', '审批测试流程', 'act_type', '流程类型', '20', '0', null, '0'), ('700975067b454350836de058eba62df4', '4', '小玩件', 'dd_zuopinleixing', '作品类型', '40', '0', '', '0'), ('71', '1', '分类1', 'act_category', '流程分类', '10', '0', '', '0'), ('71804c6b820048b09c9f6f2c11121113', 'ace', 'ACE风格', 'theme', '主题方案', '15', '0', '', '0'), ('71cf200c40d04a7b9ef9209a69ebd958', '1', '一级', 'dd_level', '级别', '10', '0', '', '0'), ('72', '2', '分类2', 'act_category', '流程分类', '20', '0', null, '0'), ('72c5bd5aacd14ba0a5dbe3cf4c99069a', '2', '内在含血', 'dd_hanxuefangshi', '含血方式', '20', '0', '', '0'), ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', '10', '0', null, '0'), ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', '20', '0', null, '0'), ('747623f17c4d4d6ab5d3f7a7e31095fe', '60', '红硐湾', 'dd_kqdy', '矿区地域', '60', '0', '', '0'), ('75', 'tree', '树结构', 'gen_category', '代码生成分类', '30', '0', null, '0'), ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', null, '0'), ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', null, '0'), ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', null, '0'), ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', null, '0'), ('7c6e845565204df387791ee78b32d2d3', '4', '灰', 'dd_dise', '地色', '40', '0', '', '0'), ('7cbd8538fcba476ebb973ca49209be24', '2', '收藏者', 'dd_user_type', '用户类型', '20', '0', '', '0'), ('8', 'green', '绿色', 'color', '颜色值', '20', '0', null, '0'), ('80', 'between', 'Between', 'gen_query_type', '查询方式', '50', '0', null, '0'), ('81', 'like', 'Like', 'gen_query_type', '查询方式', '60', '0', null, '0'), ('813f9694a4144b86b4254529a43916f3', '10', '冻地', 'dd_zhidi2', '质地二', '10', '0', '', '0'), ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', '70', '0', null, '0'), ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', '80', '0', null, '0'), ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', '10', '0', null, '0'), ('84200b9655a14d1fb5de4ac43e8ab249', '3', '淡', 'dd_nongyandu', '浓艳度', '30', '0', '', '0'), ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', '20', '0', null, '0'), ('85ba34675ca64fc98c39fb535e459d60', '1', '6面', 'dd_mian', '印章含血面', '10', '0', '', '0'), ('85ff7713ec0c401183d9f58332b7ec82', '3', '4面', 'dd_mian', '印章含血面', '30', '0', '', '0'), ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', '30', '0', null, '0'), ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', '40', '0', null, '0'), ('87d1d47af7a141a19dee9b26f381cbfe', '90', '其他', 'dd_zhidi2', '质地二', '90', '0', '', '0'), ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', '50', '0', null, '0'), ('88467409951845aa9f79998e185eaa0d', '3', '表面及内在含血', 'dd_hanxuefangshi', '含血方式', '30', '0', '', '0'), ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', '60', '0', null, '0'), ('8901e8145f1b463d8cc5c5eb58b0146b', '4', '&gt;5%', 'dd_xueliang', '血量', '40', '0', '', '0'), ('8c3145a687274cd38fac84ea2288f10f', '8', '其他', 'dd_dise', '地色', '80', '0', '', '0'), ('8e04d72f945b4e258748a6dfb7b12862', '4', '云雾状', 'dd_xuexing', '血形', '40', '0', '', '0'), ('8eb9be94a4de4a198c6a202632f39e18', '5', '昌化彩石、奇石', 'dd_pinzhong', '品种', '50', '0', '', '0'), ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', null, '0'), ('90', 'userselect', '人员选择', 'gen_show_type', '字段生成方案', '70', '0', null, '0'), ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', '80', '0', null, '0'), ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', '90', '0', null, '0'), ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', null, '0'), ('9343745e55b841ed847f4fba7bb52ee0', '3', '淡红', 'dd_xuese', '血色', '30', '0', '', '0'), ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', null, '0'), ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类\0\0\0\0', '40', '0', null, '0'), ('96', '1', '男', 'sex', '性别', '10', '0', null, '0'), ('97', '2', '女', 'sex', '性别', '20', '0', null, '0'), ('9774ef7899e447fbbb2b0210a2323c82', '80', '冷水湾', 'dd_kqdy', '矿区地域', '80', '0', '', '0'), ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', null, '0'), ('9818440417374f49860abc6ab3f01d27', '80', '硬地', 'dd_zhidi2', '质地二', '80', '0', '', '0'), ('98aab714bc284422ad14307a4b080c7b', '4', '刚', 'dd_zhidi', '质地', '40', '0', '', '0'), ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', null, '0'), ('9a4432917cde413d89ef521f86b613d6', '3', '古家具', 'dd_preference', '收藏偏好', '30', '0', '', '0'), ('9bf15a8bf0eb4a8e8c095c0d1b26dada', '6', '5-6', 'dd_moshidu', '磨氏度', '60', '0', '', '0'), ('9c3ddec31631448abd4e919849124e17', '1', '玉石', 'dd_preference', '收藏偏好', '10', '0', '', '0'), ('9ffed451cbe24bd88fc9b546e81f2145', '1', '提供者', 'dd_user_type', '用户类型', '10', '0', '', '0'), ('9fff790bbe7b438e84ed2da12b56e37a', '2', '接收', 'check', '审核动作', '20', '0', '', '0'), ('a00bfaa427444983b1d6c9bafaf669bb', '4', '四级', 'dd_level', '级别', '40', '0', '', '0'), ('a1a2a3b21cbc4bd09be3956e1253c15a', '20', '软地', 'dd_zhidi2', '质地二', '20', '0', '', '0'), ('a2b4a2979dcc4e5ba9b3b688d380ff7a', '5', '2面', 'dd_mian', '印章含血面', '50', '0', '', '0'), ('a309516d7d654ce3b2acbdf814e07c06', '3', '雕件', 'dd_zuopinleixing', '作品类型', '30', '0', '', '0'), ('a8e3b524ff0b4c259842f2165ffd29ce', '2', '&gt;30%', 'dd_xueliang', '血量', '20', '0', '', '0'), ('aa836aaca1e8414c93179a91b8347ac5', '3', '裂缝', 'dd_lie', '裂', '30', '0', '', '0'), ('aad55f3973294c798aa28298072c77da', '2', '略净', 'dd_jingdu', '精度', '20', '0', '', '0'), ('ab22169ab7c2418dab12de5a0b7046dd', '5', '组合套件', 'dd_zuopinleixing', '作品类型', '50', '0', '', '0'), ('abf513f559334f33be0cb4b85d9ff43f', '2', '微透、细腻、温润', 'dd_ganguan', '感官', '20', '0', '', '0'), ('ad0ffa57e88d4c679306c4f9f7a8a6ce', '5', '不透、细腻、干', 'dd_ganguan', '感官', '50', '0', '', '0'), ('b010b1c1f614402486f4e3f13cc48460', '1', '冻', 'dd_zhidi', '质地', '10', '0', '', '0'), ('ba4a69b250214b30923ca20b12400e16', '0', '无', 'dd_liu', '绺', '50', '0', '', '0'), ('bb20c58dd8174251ac2cd271ab99a61d', '2', '格', 'dd_liu', '绺', '20', '0', '', '0'), ('bde6043665ef4571b85d0edab667cd15', '3', '树结构表', 'table_type', '表类型', '40', '0', '', '0'), ('c48d1da62d4e40e29ab5ee8d34e43b1e', '3', '退还', 'check', '审核动作', '30', '0', '', '0'), ('c6672ff59b7a46e8b1f0fd1f537986cb', '2', '片状', 'dd_xuexing', '血形', '20', '0', '', '0'), ('c6c9204ff37c48a8a8c8b1a0d4a2b1d7', '4', '昌化冻石', 'dd_pinzhong', '品种', '40', '0', '', '0'), ('cc94b0c5df554a46894991210a5fc486', '2', '附表', 'table_type', '表类型', '30', '0', '', '0'), ('d1655ae5a6a34fadb5feee88de295689', '4', '3面', 'dd_mian', '印章含血面', '40', '0', '', '0'), ('d17eb3b764ae42a997ce7514844bdf34', '6', '细脉状', 'dd_xuexing', '血形', '60', '0', '', '0'), ('d66f262f2cd7448bb300197b5d48393e', '100', '蚱蜢脚盘', 'dd_kqdy', '矿区地域', '100', '0', '', '0'), ('d97e569ff76d4b5a9580bbd7495fb849', '11', '冻软地', 'dd_zhidi2', '质地二', '11', '0', '', '0'), ('de5dd84524524d8ca2d29cdabd7f45b6', '1', '透、细腻、温润', 'dd_ganguan', '感官', '10', '0', '', '0'), ('e129a4e2ee7c4559ba721ab5db1d5f82', '1', '绺', 'dd_liu', '绺', '10', '0', '', '0'), ('e15141405b534ce39e58c13fbadf56d3', '1', '递交', 'check', '审核动作', '10', '0', '', '0'), ('e17eea632d7b4ccf9cc56c21a77c1485', '5', '&gt;0%', 'dd_xueliang', '血量', '50', '0', '', '0'), ('e2ccae02e319499aab2daa223092124e', '4', '稀', 'dd_nongyandu', '浓艳度', '40', '0', '', '0'), ('e2fb6aaac72b442d923c30a87ebe5c32', '3', '昌化鸡血石', 'dd_pinzhong', '品种', '30', '0', '', '0'), ('e5da08652d4646b5b788ba14c142da01', '8', '其他', 'dd_xuexing', '血形', '80', '0', '', '0'), ('e6fcd84000a4449cb6d8a1a7af68d7ba', '3', '已通过', 'dd_status', '作品审核', '30', '0', '', '0'), ('eb8003913351432e8045e6727224488a', '20', '核桃岭', 'dd_kqdy', '矿区地域', '20', '0', '', '0'), ('f03a34ab39e04e49b7b2e0785d1ee8a0', '40', '冻软硬地', 'dd_zhidi2', '质地二', '40', '0', '', '0'), ('f55203290d7f40929c81e800fcded6f8', '3', '2-6', 'dd_moshidu', '磨氏度', '30', '0', '', '0'), ('f94fb24757c04405b7b5c6b45bdc2a56', '90', '仰天荡', 'dd_kqdy', '矿区地域', '90', '0', '', '0'), ('fa30f4449d9444a2b5c00749d7e99952', '30', '冻软刚地', 'dd_zhidi2', '质地二', '30', '0', '', '0'), ('fd6347bb1e65460a8ee939b8907f966c', '1', '团块状', 'dd_xuexing', '血形', '10', '0', '', '0'), ('fef8cca584114142b11f4a9d22dcf86d', '2', '红', 'dd_xuese', '血色', '20', '0', '', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(64) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) DEFAULT NULL COMMENT '菜单URL',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `menu_order` int(11) DEFAULT NULL COMMENT '菜单顺序',
  `menu_icon` varchar(32) DEFAULT NULL COMMENT '菜单图标',
  `menu_type` int(11) DEFAULT NULL COMMENT '菜单类型 资源类型：1-分类； 2-菜单',
  `removable` int(11) NOT NULL DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  `del_flag` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '2', '', '1', '0', '系统管理', '0'), ('2', '权限管理', 'right', '1', '2', '', '2', '1', '权限管理', '0'), ('3', '用户管理', 'user', '1', '3', '', '2', '1', '用户管理', '0'), ('4', '角色管理', 'role', '1', '4', '', '2', '1', '角色管理', '0'), ('93', '金石典当', '#', '0', '10', null, '1', '1', '', '0'), ('96', '123', '123qwe', '1', '12', null, '2', '1', '123', '0'), ('97', '字典表管理', 'dict', '1', '123', null, '2', '1', '字典表管理', '0'), ('100', '作品审核', 'works', '93', '10', null, '2', '1', '', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_office`
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '部门名称',
  `parent_id` char(32) NOT NULL COMMENT '父部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_role`
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
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '0', '1', '系统管理员', '0'), ('5', '测试人员', '1', '1', '123123', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_resource`
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
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8 COMMENT='权限和资源（菜单+按钮）';

-- ----------------------------
--  Records of `sys_role_resource`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_resource` VALUES ('359', '2', '1', '1'), ('370', '6', '1', '1'), ('371', '6', '2', '2'), ('372', '6', '3', '3'), ('373', '6', '4', '3'), ('374', '1', '1', '1'), ('375', '1', '2', '2'), ('376', '1', '3', '2'), ('377', '1', '4', '2'), ('378', '1', '97', '2'), ('379', '1', '93', '1'), ('380', '1', '100', '2'), ('381', '1', '30', '3'), ('382', '1', '31', '3'), ('383', '1', '32', '3'), ('384', '1', '33', '3'), ('385', '1', '34', '3');
COMMIT;

-- ----------------------------
--  Table structure for `sys_score_calc`
-- ----------------------------
DROP TABLE IF EXISTS `sys_score_calc`;
CREATE TABLE `sys_score_calc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分计算方式';

-- ----------------------------
--  Table structure for `sys_user`
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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', 'admin', 'dd94709528bb1c83d08f3088d4043f4742891f4f', 'admin', '2016-12-29 22:38:08', '0:0:0:0:0:0:0:1', '0', '123', '123', '123', null, null, null, null, null, null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='用户和角色';

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1', '1', '1'), ('74', '89', '1'), ('75', '91', '1'), ('76', '92', '1'), ('77', '92', '5'), ('78', '90', '1'), ('79', '85', '1'), ('82', '84', '1'), ('83', '84', '5'), ('87', '95', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
