/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : casecomment

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 04/30/2017 16:25:24 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `bd_casecheck`
-- ----------------------------
DROP TABLE IF EXISTS `bd_casecheck`;
CREATE TABLE `bd_casecheck` (
  `ajpcid` varchar(64) NOT NULL COMMENT '主键',
  `ajpcggid` varchar(64) DEFAULT NULL COMMENT '所属评查活动公告id',
  `ajid` varchar(200) NOT NULL,
  `fpzj` varchar(64) DEFAULT NULL COMMENT '分配专家',
  `pssj` datetime DEFAULT NULL COMMENT '评审时间',
  `df` decimal(10,2) DEFAULT NULL COMMENT '得分',
  `zldj` varchar(20) DEFAULT NULL COMMENT '质量等级',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `zt` varchar(20) DEFAULT NULL COMMENT '保存状态，未评查，暂存：保存',
  `jydp` varchar(2000) DEFAULT NULL COMMENT '简要点评',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`ajpcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_casecheck_jy`
-- ----------------------------
DROP TABLE IF EXISTS `bd_casecheck_jy`;
CREATE TABLE `bd_casecheck_jy` (
  `ajpcjyid` varchar(64) NOT NULL,
  `ajpcggid` varchar(64) DEFAULT NULL,
  `jy` varchar(255) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`ajpcjyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_casecheck_notice`
-- ----------------------------
DROP TABLE IF EXISTS `bd_casecheck_notice`;
CREATE TABLE `bd_casecheck_notice` (
  `ajpcggid` varchar(64) NOT NULL COMMENT '案件评查公告id',
  `bt` varchar(200) DEFAULT NULL COMMENT '标题',
  `zt` varchar(20) DEFAULT NULL COMMENT '状态',
  `lx` varchar(20) DEFAULT NULL COMMENT '类型',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  `btys` varchar(10) DEFAULT NULL COMMENT '标题颜色',
  PRIMARY KEY (`ajpcggid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_casecheck_noticeread`
-- ----------------------------
DROP TABLE IF EXISTS `bd_casecheck_noticeread`;
CREATE TABLE `bd_casecheck_noticeread` (
  `ajpcggydid` varchar(64) NOT NULL COMMENT '主键id',
  `gjpcggid` varchar(64) DEFAULT NULL COMMENT '案件评查公告id',
  `ydr` varchar(64) DEFAULT NULL COMMENT '阅读人',
  `ydsj` datetime DEFAULT NULL,
  PRIMARY KEY (`ajpcggydid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_casecheck_pf`
-- ----------------------------
DROP TABLE IF EXISTS `bd_casecheck_pf`;
CREATE TABLE `bd_casecheck_pf` (
  `pfid` varchar(64) NOT NULL,
  `psnr` varchar(200) DEFAULT NULL,
  `pfbz` varchar(2000) DEFAULT NULL,
  `fz` decimal(10,2) DEFAULT NULL,
  `kf` decimal(10,2) DEFAULT NULL,
  `ly` varchar(2000) DEFAULT NULL,
  `df` decimal(10,2) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  `px` int(10) DEFAULT NULL,
  `ajpcid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pfid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_casecheck_pfsz`
-- ----------------------------
DROP TABLE IF EXISTS `bd_casecheck_pfsz`;
CREATE TABLE `bd_casecheck_pfsz` (
  `ajpcpfxid` varchar(64) DEFAULT NULL,
  `px` int(10) DEFAULT NULL,
  `psnr` varchar(200) DEFAULT NULL,
  `pfbz` varchar(2000) DEFAULT NULL,
  `fz` decimal(10,2) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_casecheck_zldjsz`
-- ----------------------------
DROP TABLE IF EXISTS `bd_casecheck_zldjsz`;
CREATE TABLE `bd_casecheck_zldjsz` (
  `ajzldjid` varchar(64) NOT NULL,
  `px` int(10) DEFAULT NULL,
  `dj` varchar(200) DEFAULT NULL,
  `qsfz` int(10) DEFAULT NULL,
  `jsfz` int(10) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`ajzldjid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_casechosen`
-- ----------------------------
DROP TABLE IF EXISTS `bd_casechosen`;
CREATE TABLE `bd_casechosen` (
  `sjpxid` varchar(64) NOT NULL COMMENT '主键',
  `sjpxggid` varchar(64) DEFAULT NULL COMMENT '所属评查活动公告id',
  `ajid` varchar(200) NOT NULL,
  `fpzj` varchar(64) DEFAULT NULL COMMENT '分配专家',
  `pssj` datetime DEFAULT NULL COMMENT '评审时间',
  `df` decimal(10,2) DEFAULT NULL COMMENT '得分',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `zt` varchar(20) DEFAULT NULL COMMENT '保存状态，未评查，暂存：保存',
  `jydp` varchar(2000) DEFAULT NULL COMMENT '简要点评',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`sjpxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_casechosen_jy`
-- ----------------------------
DROP TABLE IF EXISTS `bd_casechosen_jy`;
CREATE TABLE `bd_casechosen_jy` (
  `sjpxjyid` varchar(64) NOT NULL,
  `xjpxggid` varchar(64) DEFAULT NULL,
  `jy` varchar(255) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`sjpxjyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_casechosen_notice`
-- ----------------------------
DROP TABLE IF EXISTS `bd_casechosen_notice`;
CREATE TABLE `bd_casechosen_notice` (
  `sjpxggid` varchar(64) NOT NULL,
  `bt` varchar(2000) DEFAULT NULL COMMENT '标题',
  `btys` varchar(10) DEFAULT NULL COMMENT '标题颜色',
  `pxlx` varchar(10) DEFAULT NULL COMMENT '评选类型',
  `scjzrq` datetime DEFAULT NULL COMMENT '上传截止日期',
  `ggnr` varchar(9999) DEFAULT NULL,
  `tzry` varchar(6000) DEFAULT NULL,
  `zt` varchar(10) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`sjpxggid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_casechosen_noticeread`
-- ----------------------------
DROP TABLE IF EXISTS `bd_casechosen_noticeread`;
CREATE TABLE `bd_casechosen_noticeread` (
  `sjpxggydid` varchar(64) NOT NULL COMMENT '主键id',
  `sjpxggid` varchar(64) DEFAULT NULL COMMENT '案件评查公告id',
  `ydr` varchar(64) DEFAULT NULL COMMENT '阅读人',
  `ydsj` datetime DEFAULT NULL,
  PRIMARY KEY (`sjpxggydid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_casechosen_pf`
-- ----------------------------
DROP TABLE IF EXISTS `bd_casechosen_pf`;
CREATE TABLE `bd_casechosen_pf` (
  `pfid` varchar(64) NOT NULL,
  `psnr` varchar(200) DEFAULT NULL,
  `pfbz` varchar(2000) DEFAULT NULL,
  `fz` decimal(10,2) DEFAULT NULL,
  `kf` decimal(10,2) DEFAULT NULL,
  `ly` varchar(2000) DEFAULT NULL,
  `df` decimal(10,2) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  `px` int(10) DEFAULT NULL,
  `sjpxid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pfid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_casechosen_pfsz`
-- ----------------------------
DROP TABLE IF EXISTS `bd_casechosen_pfsz`;
CREATE TABLE `bd_casechosen_pfsz` (
  `sjpxpfxid` varchar(64) DEFAULT NULL,
  `px` int(10) DEFAULT NULL,
  `psnr` varchar(200) DEFAULT NULL,
  `pfbz` varchar(2000) DEFAULT NULL,
  `fz` decimal(10,2) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_middle_case`
-- ----------------------------
DROP TABLE IF EXISTS `bd_middle_case`;
CREATE TABLE `bd_middle_case` (
  `ajid` varchar(64) NOT NULL COMMENT '案件id',
  `ah` varchar(200) NOT NULL COMMENT '案号',
  `gsfy` varchar(200) DEFAULT NULL COMMENT '归属法院',
  `cbbm` varchar(200) DEFAULT NULL COMMENT '承办部门',
  `cbr` varchar(60) DEFAULT NULL COMMENT '承办人',
  `ajxz` varchar(20) DEFAULT NULL COMMENT '案件性质',
  `ay` varchar(2000) DEFAULT NULL COMMENT '案由',
  `jafs` varchar(100) DEFAULT NULL COMMENT '结案方式',
  `jasj` datetime DEFAULT NULL COMMENT '结案时间',
  `ajlx` varchar(500) DEFAULT NULL COMMENT '案件类型',
  `tdhajid` varchar(100) DEFAULT NULL COMMENT '通达海案件id',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  `lasj` datetime DEFAULT NULL COMMENT '立案时间',
  `tsyx` varchar(1000) DEFAULT NULL COMMENT '庭审影像地址',
  `cpws` varchar(1000) DEFAULT NULL COMMENT '裁判文书地址',
  PRIMARY KEY (`ajid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_publish`
-- ----------------------------
DROP TABLE IF EXISTS `bd_publish`;
CREATE TABLE `bd_publish` (
  `xxid` varchar(64) NOT NULL,
  `bt` varchar(2000) DEFAULT NULL,
  `btys` varchar(10) DEFAULT NULL,
  `xxlx` varchar(255) DEFAULT NULL,
  `xxnr` varchar(9999) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`xxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_publish_read`
-- ----------------------------
DROP TABLE IF EXISTS `bd_publish_read`;
CREATE TABLE `bd_publish_read` (
  `xxggydid` varchar(64) NOT NULL COMMENT '主键id',
  `xxggid` varchar(64) DEFAULT NULL COMMENT '案件评查公告id',
  `ydr` varchar(64) DEFAULT NULL COMMENT '阅读人',
  `ydsj` datetime DEFAULT NULL,
  PRIMARY KEY (`xxggydid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sd_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sd_dict`;
CREATE TABLE `sd_dict` (
  `zdbh` varchar(64) NOT NULL COMMENT '字典编号',
  `zdmc` varchar(100) DEFAULT NULL COMMENT '字典名称',
  `sjzdbh` varchar(64) DEFAULT NULL COMMENT '上级字典编号',
  `sort` int(11) DEFAULT NULL COMMENT '字典排序',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`zdbh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
--  Records of `sd_dict`
-- ----------------------------
BEGIN;
INSERT INTO `sd_dict` VALUES ('103', '流程模块', '0', null, null, null, null, null, null, '1'), ('10301', '案件评查公告流程', '103', '1', null, null, null, null, null, '1'), ('10302', '三精评选公告流程', '103', '2', null, null, null, null, null, '1'), ('10303', '信息公开审核流程', '103', '3', null, null, null, null, null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `sd_file`
-- ----------------------------
DROP TABLE IF EXISTS `sd_file`;
CREATE TABLE `sd_file` (
  `id` varchar(64) NOT NULL COMMENT '主键ID',
  `user_id` varchar(64) DEFAULT NULL COMMENT '所有者用户ID',
  `is_pub` varchar(2) DEFAULT '1' COMMENT '是否公开,0否,1是',
  `file_name` varchar(255) DEFAULT NULL COMMENT '上传文件名',
  `save_name` varchar(255) DEFAULT NULL,
  `directory` varchar(255) DEFAULT NULL COMMENT '文件夹路径',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `file_size` int(11) DEFAULT NULL COMMENT '文件字节大小，应限制单文件不可超过1G',
  `md5` varchar(32) DEFAULT NULL COMMENT '文件MD5校验码',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字索引,以英文逗号分隔',
  `download_count` int(11) DEFAULT '0' COMMENT '下载次数',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建用户',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(2) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
--  Records of `sd_file`
-- ----------------------------
BEGIN;
INSERT INTO `sd_file` VALUES ('00b4540fbb744372bcdd07ef808ee8f7', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'code.png', 'code-41b734a8daaf447bbf9f1b74c9f8fbe9.png', '2017-04-07', 'png', '5913', '2c42acc9459a8614b46cf51e46e7a985', 'code.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:08:39', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('0565995b0a62406abcb62a606a567d3c', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'carousel_bg.png', 'carousel_bg-b52406f7a3a14c929c871534f9144d98.png', '2017-04-07', 'png', '44277', 'e9b6a14e6417f9d0297bd169ab54d98b', 'carousel_bg.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:07:19', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('095a0dce328b4b50b153e33f305ea541', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'carousel_bg.png', 'carousel_bg-b52406f7a3a14c929c871534f9144d98.png', '2017-04-07', 'png', '44277', 'e9b6a14e6417f9d0297bd169ab54d98b', 'carousel_bg.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:39:08', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('0a822e5155fc4ad9b0a59795cf56730d', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'code.png', 'code-41b734a8daaf447bbf9f1b74c9f8fbe9.png', '2017-04-07', 'png', '5913', '2c42acc9459a8614b46cf51e46e7a985', 'code.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:24:01', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('0e2f2acc57b14bf4a780b755294e8805', 'eaf34bcf8ba945598067b7f88fad0099', '1', '_photo_3.jpg', '_photo_3-517f3c5b9d5d46b4ad419cb0d28be79c.jpg', '2017-04-07', 'jpg', '19042', '8b806c8a74d9c92f10a3bc5b310d2749', '_photo_3.jpg', '3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 11:14:23', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('11b4b6fd8256456ca6b9a9ea73b756ed', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'code.png', 'code-41b734a8daaf447bbf9f1b74c9f8fbe9.png', '2017-04-07', 'png', '5913', '2c42acc9459a8614b46cf51e46e7a985', 'code.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:36:50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('134c46cbf3b34c16aff0a13ee8b1465d', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'carousel_bg.png', 'carousel_bg-b52406f7a3a14c929c871534f9144d98.png', '2017-04-07', 'png', '44277', 'e9b6a14e6417f9d0297bd169ab54d98b', 'carousel_bg.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:46:54', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('152917543b3246f2a25c9b7980b2608d', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'a6.jpg', 'a6-28a290fff19841bab129b475aabdfca8.jpg', '2017-04-08', 'jpg', '18357', 'c435098ccf06e4248d918f91ed0992c8', 'a6.jpg', '23', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:43', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:04', null, '1'), ('159f87d4975b4ecf974de4e385d38115', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'green.png', 'green-cec79b426e2248e89973d7b712cfd0ab.png', '2017-04-08', 'png', '20818', '3c4bf794e3e2af3e68d2f4bd77d0baa7', 'green.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:36:27', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('1c50e1ac952346f2a759020ad4ee845d', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'green.png', 'green-cec79b426e2248e89973d7b712cfd0ab.png', '2017-04-08', 'png', '20818', '3c4bf794e3e2af3e68d2f4bd77d0baa7', 'green.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:03:48', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('1d5c6cc63fbf40f385b3f089cd80db65', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'a8.jpg', 'a8-04363c818bf34750a292834a2dc96f25.jpg', '2017-04-17', 'jpg', '10758', 'cc608c637bec9117018cef0e4cc9c6dd', 'a8.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 18:40:28', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:04', null, '1'), ('29326d5db53e4bb7b76c9e8c47a23e66', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'a7.jpg', 'a7-22e5d0a1298d451a87912e82eaf5f649.jpg', '2017-04-17', 'jpg', '10399', 'bd835163b61fa2dd11579b2de70023fc', 'a7.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 18:31:50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:04', null, '1'), ('29f6bad72ef84b8a989265654ceed9b0', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'b4_01.png', 'b4_01-2aeb762710634c799aaf654f0567ccd6.png', '2017-04-17', 'png', '84473', 'f72169e3e52af5889cbad1b970f90ebd', 'b4_01.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:23', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:23', null, '0'), ('2c13e0aecffb4db8a236bbc5d2d27ecc', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'carousel_bg.png', 'carousel_bg-b52406f7a3a14c929c871534f9144d98.png', '2017-04-07', 'png', '44277', 'e9b6a14e6417f9d0297bd169ab54d98b', 'carousel_bg.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:47:10', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('2fb5945ff271429d84d85da7149ef6dd', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'code.png', 'code-41b734a8daaf447bbf9f1b74c9f8fbe9.png', '2017-04-07', 'png', '5913', '2c42acc9459a8614b46cf51e46e7a985', 'code.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:17:38', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('3364e3ecce824cf3b76552f10e8d3b50', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'default_img.jpg', 'default_img-c14a89c9d69e4f8e8db00422af15b4f7.jpg', '2017-04-07', 'jpg', '13804', '2883be7f1bce717b0785abfcd2605fde', 'default_img.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:06:39', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('356d3efb2c074e1d9286f77fb316918e', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'code.png', 'code-41b734a8daaf447bbf9f1b74c9f8fbe9.png', '2017-04-07', 'png', '5913', '2c42acc9459a8614b46cf51e46e7a985', 'code.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 10:46:18', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('3f11549cbd7e4b6591a0b56630296696', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'code.png', 'code-41b734a8daaf447bbf9f1b74c9f8fbe9.png', '2017-04-07', 'png', '5913', '2c42acc9459a8614b46cf51e46e7a985', 'code.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-07 22:47:36', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('49c4da0c2ffb48d4b3213c8c3399fc15', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'carousel_bg.png', 'carousel_bg-b52406f7a3a14c929c871534f9144d98.png', '2017-04-07', 'png', '44277', 'e9b6a14e6417f9d0297bd169ab54d98b', 'carousel_bg.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 11:14:39', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('4b7c8c51f23248519a610b5a4a4d06b6', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'locked.png', 'locked-91a7c3c738a143e786e7682a9140f685.png', '2017-04-08', 'png', '1132', 'f6f30beb72f584e218bfec975eb1109d', 'locked.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:37:48', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('4c60c16054c04e75a7da6945bb9b31cf', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'default_img.jpg', 'default_img-c14a89c9d69e4f8e8db00422af15b4f7.jpg', '2017-04-07', 'jpg', '13804', '2883be7f1bce717b0785abfcd2605fde', 'default_img.jpg', '15', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-07 22:49:57', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('4f69ed1d48a34f9aacaa83a712d89567', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'a6.jpg', 'a6-28a290fff19841bab129b475aabdfca8.jpg', '2017-04-08', 'jpg', '18357', 'c435098ccf06e4248d918f91ed0992c8', 'a6.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 19:35:56', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:04', null, '1'), ('58195139f86644c7bddaf7b3b9172e44', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'browser.png', 'browser-7fa6afbfb55847698aeeb0a7117cae9e.png', '2017-04-17', 'png', '70303', '825be84e1765d43556bbd52b3f2c0640', 'browser.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:41', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:41', null, '0'), ('5c909e2ebf634bf3aa7ee84be91637cd', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'default_img.jpg', 'default_img-c14a89c9d69e4f8e8db00422af15b4f7.jpg', '2017-04-07', 'jpg', '13804', '2883be7f1bce717b0785abfcd2605fde', 'default_img.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:37:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:12', null, '1'), ('68fe2cf753ee48f1b18282a529694092', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'default_img.jpg', 'default_img-c14a89c9d69e4f8e8db00422af15b4f7.jpg', '2017-04-07', 'jpg', '13804', '2883be7f1bce717b0785abfcd2605fde', 'default_img.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:09:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('6a0cb6f6311b41659ea9a18ffb089bb0', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'green.png', 'green-cec79b426e2248e89973d7b712cfd0ab.png', '2017-04-08', 'png', '20818', '3c4bf794e3e2af3e68d2f4bd77d0baa7', 'green.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:00:50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('6e9691409fac44c899382521209f021c', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'bmdec.png', 'bmdec-33dfcfb30810476bb0be22d20ae4efae.png', '2017-04-07', 'png', '96936', '9f1028a2c01a466ce641b8d506a433f5', 'bmdec.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:18:31', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('76752f2658c84af2a426ca27a6ebf23e', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'code.png', 'code-41b734a8daaf447bbf9f1b74c9f8fbe9.png', '2017-04-07', 'png', '5913', '2c42acc9459a8614b46cf51e46e7a985', 'code.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:35:09', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('78b274443f2c497081ac02b0a12380c8', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'bmdec.png', 'bmdec-33dfcfb30810476bb0be22d20ae4efae.png', '2017-04-07', 'png', '96936', '9f1028a2c01a466ce641b8d506a433f5', 'bmdec.png', '7', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-07 22:09:14', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('7c533032363c4dcb9b56559f409e75cc', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'carousel_bg.png', 'carousel_bg-b52406f7a3a14c929c871534f9144d98.png', '2017-04-07', 'png', '44277', 'e9b6a14e6417f9d0297bd169ab54d98b', 'carousel_bg.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:27:58', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('7ec30b434ca54a5caaf3adbe07209421', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'b4_01.png', 'b4_01-446a3ef2550545708d7cd66f2c17d1c8.png', '2017-04-08', 'png', '84473', 'f72169e3e52af5889cbad1b970f90ebd', 'b4_01.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:47:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('8192cd45d15644c9ad3d628e56677df6', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'carousel_bg.png', 'carousel_bg-b52406f7a3a14c929c871534f9144d98.png', '2017-04-07', 'png', '44277', 'e9b6a14e6417f9d0297bd169ab54d98b', 'carousel_bg.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-07 22:49:51', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('81ecc69fad004b01bb2c3e6321c2f0ac', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'green.png', 'green-cec79b426e2248e89973d7b712cfd0ab.png', '2017-04-08', 'png', '20818', '3c4bf794e3e2af3e68d2f4bd77d0baa7', 'green.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:30:43', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('85d07f36cc244beeba7388f07c716799', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'a7.jpg', 'a7-22e5d0a1298d451a87912e82eaf5f649.jpg', '2017-04-17', 'jpg', '10399', 'bd835163b61fa2dd11579b2de70023fc', 'a7.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:09:45', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:04', null, '1'), ('9c59116b91de4ebc80faf15dbafc4842', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'default_img.jpg', 'default_img-c14a89c9d69e4f8e8db00422af15b4f7.jpg', '2017-04-07', 'jpg', '13804', '2883be7f1bce717b0785abfcd2605fde', 'default_img.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:00:09', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('9d929fb4c9d540288e38c1c354b5e86b', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'bg.png', 'bg-983de810e0ac4f2386466ab5461857e3.png', '2017-04-17', 'png', '2851', '8ddad23ce6dcc70bf111b23ae022f10c', 'bg.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 18:57:41', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:04', null, '1'), ('9f513e2aaae44e638841bc6345fadefb', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'carousel_bg.png', 'carousel_bg-b52406f7a3a14c929c871534f9144d98.png', '2017-04-07', 'png', '44277', 'e9b6a14e6417f9d0297bd169ab54d98b', 'carousel_bg.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:16:59', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('a6069ddbbeec446a914f4c25dda5822f', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'bmdec.png', 'bmdec-33dfcfb30810476bb0be22d20ae4efae.png', '2017-04-07', 'png', '96936', '9f1028a2c01a466ce641b8d506a433f5', 'bmdec.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 00:59:31', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('a84b113588a0496b9711a0938d79579c', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'a8.jpg', 'a8-04363c818bf34750a292834a2dc96f25.jpg', '2017-04-17', 'jpg', '10758', 'cc608c637bec9117018cef0e4cc9c6dd', 'a8.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 18:27:47', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:04', null, '1'), ('ae81374531504fcca70a38a50bfb4595', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'code.png', 'code-41b734a8daaf447bbf9f1b74c9f8fbe9.png', '2017-04-07', 'png', '5913', '2c42acc9459a8614b46cf51e46e7a985', 'code.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:37:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('afc183a853d441bc8ccf0ad8c24d8222', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'a8.jpg', 'a8-d8a8fdf945ef4e30a2bb2dbcc7440194.jpg', '2017-04-17', 'jpg', '10758', 'cc608c637bec9117018cef0e4cc9c6dd', 'a8.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:18:41', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:18:41', null, '0'), ('b130a8d9b6554b87863677ed26358f14', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'a6.jpg', 'a6-28a290fff19841bab129b475aabdfca8.jpg', '2017-04-08', 'jpg', '18357', 'c435098ccf06e4248d918f91ed0992c8', 'a6.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:05:25', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:04', null, '1'), ('bbd9eea14e6246c590918a9b348d3c00', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'index.jpg', 'index-bfd31bb13da84558a6a752fdfcc9173c.jpg', '2017-04-17', 'jpg', '60187', '6326cd02ec7029ff4027da83ff09374f', 'index.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 18:58:55', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:04', null, '1'), ('bec08bb5c72b4b999c886ba6e49197ff', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'a8.jpg', 'a8-04363c818bf34750a292834a2dc96f25.jpg', '2017-04-17', 'jpg', '10758', 'cc608c637bec9117018cef0e4cc9c6dd', 'a8.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 18:17:40', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:04', null, '1'), ('c4a16ed9cc8044ae83513d71604f0bca', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'LOGO_dx.png', 'LOGO_dx-1b599e3156cd41149b74f39fc0cafac2.png', '2017-04-08', 'png', '7629', 'ffabb5dea73cdeb24ba8684d7a125416', 'LOGO_dx.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:48:06', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('c4f4b740784f4351834502ff8b522730', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'a6.jpg', 'a6-2adf97c98d63442e92f448b06adaebb4.jpg', '2017-04-17', 'jpg', '18357', 'c435098ccf06e4248d918f91ed0992c8', 'a6.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:15', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:15', null, '0'), ('cb77fa552f0549898f24d99c084b6549', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'a8.jpg', 'a8-04363c818bf34750a292834a2dc96f25.jpg', '2017-04-17', 'jpg', '10758', 'cc608c637bec9117018cef0e4cc9c6dd', 'a8.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 19:35:38', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:04', null, '1'), ('d2e4841544904adaaee4fcb18165234a', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'a7.jpg', 'a7-22e5d0a1298d451a87912e82eaf5f649.jpg', '2017-04-17', 'jpg', '10399', 'bd835163b61fa2dd11579b2de70023fc', 'a7.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 18:28:53', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:04', null, '1'), ('d826ac3ab18c4085ad7a32fb2b1cf0f2', 'eaf34bcf8ba945598067b7f88fad0099', '1', '_photo_3.jpg', '_photo_3-517f3c5b9d5d46b4ad419cb0d28be79c.jpg', '2017-04-07', 'jpg', '19042', '8b806c8a74d9c92f10a3bc5b310d2749', '_photo_3.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-07 22:41:16', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('d99e7a4115ad49c9b77fd55034e812a5', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'code.png', 'code-41b734a8daaf447bbf9f1b74c9f8fbe9.png', '2017-04-07', 'png', '5913', '2c42acc9459a8614b46cf51e46e7a985', 'code.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:02:29', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('dc6ef7f4e67a45249caef7a7362eab44', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'default_img.jpg', 'default_img-c14a89c9d69e4f8e8db00422af15b4f7.jpg', '2017-04-07', 'jpg', '13804', '2883be7f1bce717b0785abfcd2605fde', 'default_img.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:03:03', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('ddeb121930b648bd89e9d3354bdd32a4', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'default_img.jpg', 'default_img-c14a89c9d69e4f8e8db00422af15b4f7.jpg', '2017-04-07', 'jpg', '13804', '2883be7f1bce717b0785abfcd2605fde', 'default_img.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-07 22:49:33', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('df9a5c92fa094fef90901c72c0c6ca0c', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'b3_01.png', 'b3_01-51ab1240151d45448581923ae8681b26.png', '2017-04-08', 'png', '16681', '1bb8d5432acb08b109f015ada6af9bd2', 'b3_01.png', '41', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:48:53', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('e17fcd1f8bbe4b6f90fb23b9a5eea163', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'a8.jpg', 'a8-04363c818bf34750a292834a2dc96f25.jpg', '2017-04-17', 'jpg', '10758', 'cc608c637bec9117018cef0e4cc9c6dd', 'a8.jpg', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 19:36:20', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 20:10:04', null, '1'), ('e1d836ed9c9c46c890400d99bfccdb0e', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'code.png', 'code-41b734a8daaf447bbf9f1b74c9f8fbe9.png', '2017-04-07', 'png', '5913', '2c42acc9459a8614b46cf51e46e7a985', 'code.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:47:48', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:54:03', null, '1'), ('f0f0e6c70a8143b4a148311e4298b4e9', 'eaf34bcf8ba945598067b7f88fad0099', '1', 'bmdec.png', 'bmdec-33dfcfb30810476bb0be22d20ae4efae.png', '2017-04-07', 'png', '96936', '9f1028a2c01a466ce641b8d506a433f5', 'bmdec.png', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 01:09:58', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 14:53:43', null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `sd_flow_config`
-- ----------------------------
DROP TABLE IF EXISTS `sd_flow_config`;
CREATE TABLE `sd_flow_config` (
  `id` varchar(64) NOT NULL COMMENT '主键id',
  `lcmk` varchar(12) DEFAULT NULL COMMENT '流程模块',
  `hjmc` varchar(255) DEFAULT NULL COMMENT '环节名称',
  `lcbb` int(11) DEFAULT NULL COMMENT '流程版本',
  `lcqyrq` datetime DEFAULT NULL COMMENT '流程启用日期',
  `bzxh` int(5) DEFAULT NULL COMMENT '步骤序号',
  `ztlx` varchar(12) DEFAULT NULL COMMENT '主体类型：1角色；2个人；3岗位',
  `ztid` varchar(6500) DEFAULT NULL COMMENT '主体id',
  `btgthz` int(5) DEFAULT '0' COMMENT '不通过退回至',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审核配置表';

-- ----------------------------
--  Table structure for `sd_flow_config_field`
-- ----------------------------
DROP TABLE IF EXISTS `sd_flow_config_field`;
CREATE TABLE `sd_flow_config_field` (
  `id` varchar(64) NOT NULL,
  `lcmk` varchar(12) DEFAULT NULL COMMENT '流程模块',
  `zdmc` varchar(255) DEFAULT NULL COMMENT '字段名称',
  `zdms` varchar(255) DEFAULT NULL COMMENT '字段描述',
  `zdlx` varchar(255) DEFAULT 'String' COMMENT '字段类型',
  `kjlx` varchar(255) DEFAULT 'input' COMMENT '控件类型(input,number,textarea,date,bool,select:zdbh,multiselect:zdbh)',
  `ysfs` varchar(255) DEFAULT NULL COMMENT '支持运算方式(多个以英文逗号分隔)',
  `sjy` varchar(255) DEFAULT NULL COMMENT '数据源',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程可配置字段';

-- ----------------------------
--  Table structure for `sd_flow_config_role`
-- ----------------------------
DROP TABLE IF EXISTS `sd_flow_config_role`;
CREATE TABLE `sd_flow_config_role` (
  `id` varchar(64) NOT NULL,
  `lcpzid` varchar(64) DEFAULT NULL COMMENT '流程配置ID',
  `lczdid` varchar(64) DEFAULT NULL COMMENT '流程字段ID',
  `ysfs` varchar(12) DEFAULT NULL COMMENT '运算方式',
  `value1` varchar(5000) DEFAULT NULL COMMENT '参数1',
  `value2` varchar(5000) DEFAULT NULL COMMENT '参数2',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程配置条件表';

-- ----------------------------
--  Table structure for `sd_flow_config_tx`
-- ----------------------------
DROP TABLE IF EXISTS `sd_flow_config_tx`;
CREATE TABLE `sd_flow_config_tx` (
  `txid` varchar(64) NOT NULL,
  `lcmk` varchar(64) DEFAULT NULL,
  `lcbb` varchar(64) DEFAULT NULL,
  `txnr` varchar(20000) DEFAULT '' COMMENT '图形内容',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL,
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`txid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sd_flow_history`
-- ----------------------------
DROP TABLE IF EXISTS `sd_flow_history`;
CREATE TABLE `sd_flow_history` (
  `id` varchar(64) NOT NULL COMMENT '主键id',
  `shnrid` varchar(64) DEFAULT NULL COMMENT '审核id',
  `lcmk` varchar(64) DEFAULT NULL COMMENT '流程模块',
  `shjg` varchar(12) DEFAULT NULL COMMENT '审核结果',
  `shyj` varchar(255) DEFAULT '' COMMENT '审核意见',
  `bzxh` int(6) DEFAULT NULL COMMENT '步骤序号',
  `sfzhyb` char(1) DEFAULT '0' COMMENT '是否最后一步',
  `shhj` varchar(255) DEFAULT NULL COMMENT '审核环节',
  `shr` varchar(64) DEFAULT NULL COMMENT '审核人',
  `shsj` datetime DEFAULT NULL COMMENT '审核时间',
  `bz` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审核历史表';

-- ----------------------------
--  Table structure for `sd_flow_job`
-- ----------------------------
DROP TABLE IF EXISTS `sd_flow_job`;
CREATE TABLE `sd_flow_job` (
  `id` varchar(64) NOT NULL,
  `lcmk` varchar(100) DEFAULT NULL COMMENT '流程模块',
  `lcpzid` varchar(64) DEFAULT NULL COMMENT '流程配置ID',
  `shnrid` varchar(64) DEFAULT NULL COMMENT '审核内容id',
  `dqbz` int(5) DEFAULT '1' COMMENT '当前步骤',
  `dqbzmc` varchar(100) DEFAULT NULL COMMENT '当前步骤名称',
  `shbtgthbz` int(5) DEFAULT NULL COMMENT '审核不通过退回步骤',
  `shztlx` varchar(12) DEFAULT NULL COMMENT '审核主体类型（1角色；2个人）',
  `shztid` varchar(6500) DEFAULT NULL COMMENT '审核主体ID',
  `zyfw` varchar(255) DEFAULT NULL,
  `lcbb` varchar(40) DEFAULT NULL COMMENT '流程版本',
  `sfzhyb` varchar(12) DEFAULT NULL COMMENT '是否最后一步：1是；0否',
  `sqr` varchar(64) DEFAULT NULL COMMENT '申请人',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审核任务表';

-- ----------------------------
--  Table structure for `sd_logs`
-- ----------------------------
DROP TABLE IF EXISTS `sd_logs`;
CREATE TABLE `sd_logs` (
  `logid` varchar(64) NOT NULL,
  `mod` varchar(200) DEFAULT NULL COMMENT '操作模块，本系统已菜单为单位',
  `czr` varchar(64) DEFAULT NULL COMMENT '操作人',
  `czlx` varchar(10) DEFAULT NULL COMMENT '操作类型',
  `czsj` datetime DEFAULT NULL COMMENT '操作时间',
  `xxqk` varchar(9999) DEFAULT NULL COMMENT '详细情况',
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sd_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sd_menu`;
CREATE TABLE `sd_menu` (
  `cdid` varchar(64) NOT NULL COMMENT '菜单id',
  `cdmc` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `sjcdid` varchar(64) DEFAULT NULL COMMENT '上级菜单id',
  `cdurl` varchar(255) DEFAULT NULL COMMENT '菜单url',
  `tb` varchar(100) DEFAULT NULL COMMENT '图标',
  `px` int(11) DEFAULT NULL COMMENT '排序',
  `ymgd` int(11) DEFAULT NULL COMMENT '页面高度',
  `ymkd` int(11) DEFAULT NULL COMMENT '页面宽度',
  `bz` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`cdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
--  Records of `sd_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sd_menu` VALUES ('056de10f22fd419882b828877361cc66', '我的评查', 'cc1910b66fdd413eb8225045d4c0409e', 'casecheck/check/history.do', null, '20', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 15:38:13', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 15:38:13', null, '1'), ('103a07e57f3741909f54e2b60e5c5be5', '我的办理', '7c34e9a57e954d17bbf75ee821401342', 'casechosen/notice/history.do', null, '40', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:56:44', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:56:44', null, '1'), ('11ad72a65ace4f79b730061c2e80d3ad', '组织机构', '4dc94fc707ab45d584e0657f02dee603', 'setting/organization/list.do', 'fa fa-sitemap', '10', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:26:04', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:26:04', null, '1'), ('11cce286be1b425ba4516fff95ff14cc', '首页', '0', 'home.do', 'fa fa-home', '10', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:19:04', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:19:04', null, '1'), ('126726c607984b18a07221b858127a40', '案件抽取', 'd571f1273bce479da2c43b3068a072ca', 'casecheck/extract.do', 'fa fa-flag', '10', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 15:32:24', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 15:32:24', null, '1'), ('135b95088ab74c098be63e68494d61f1', '三精评选', '875b89e8d5824d54ae6e3f07e0b557c6', null, 'fa fa-thumbs-o-up', '20', null, null, 'badge_sjpx_sjpx_total', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:59:15', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:59:15', null, '1'), ('13f7fb9a8b4a41caba4f950791aff45e', '评查公告', 'd571f1273bce479da2c43b3068a072ca', null, 'fa fa-bell', '20', null, null, 'badge_ajpc_pcgg_total', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:21:57', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:21:57', null, '1'), ('14036c102e4542599ac379afc3b9aafd', '操作日志', '4dc94fc707ab45d584e0657f02dee603', 'setting/log/list.do', 'fa fa-terminal', '40', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:53:19', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:53:19', null, '1'), ('168bc4244c524d2daaa6750514f231ed', '质量等级', '588ec6332235459bbcaaec44289b3977', 'casecheck/config/level.do', null, '20', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 16:11:52', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 16:11:52', null, '1'), ('17f9306193664001b53c8b2fa2caaf65', '评选配置', '875b89e8d5824d54ae6e3f07e0b557c6', null, 'fa fa-wrench', '30', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:07:39', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:07:39', null, '1'), ('2317882e44984ea9a51a3b4c748e52c6', '评分项', '588ec6332235459bbcaaec44289b3977', 'casecheck/config/score.do', null, '10', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 16:11:26', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 16:11:26', null, '1'), ('24b456b326e2414f815465cdc11d6bce', '我已查看', '93d7a63ceaef49e09b25c4553b9ceedf', 'publish/watched.do', 'fa fa-history', '40', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:54:48', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:54:48', null, '1'), ('309bf72e10d64b13839242e8800145be', '我的发起', '13f7fb9a8b4a41caba4f950791aff45e', 'casecheck/notice/mylist.do', null, '11', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 14:52:06', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 14:52:06', null, '1'), ('316a2a9587f74c09ae696345049a976e', '我的评选', '135b95088ab74c098be63e68494d61f1', 'casechosen/chosen/history.do', null, '20', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:06:03', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:06:03', null, '1'), ('395dc8c5ff0241019bb005185a247975', '我的发起', '7c34e9a57e954d17bbf75ee821401342', 'casechosen/notice/mylist.do', null, '11', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 14:54:25', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-17 14:54:25', null, '1'), ('40118bd041334420a2614ac261a76181', '统计分析', '0', null, 'fa fa-bar-chart', '40', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:21:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:21:21', null, '1'), ('450c5ed39b2f403e860b2b3f3e9dae05', '我的查看', '13f7fb9a8b4a41caba4f950791aff45e', 'casecheck/notice/history.do', null, '30', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:30:02', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:30:02', null, '1'), ('474ae47f06d14743841482945c302c37', '信息审核', '93d7a63ceaef49e09b25c4553b9ceedf', 'publish/verify.do', 'fa fa-eye', '20', null, null, 'badge_xxgk_xxsh', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 11:14:49', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 11:14:49', null, '1'), ('4dc94fc707ab45d584e0657f02dee603', '系统管理', '0', null, 'fa fa-cogs', '60', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:17:59', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:17:59', null, '1'), ('51fcd89a5bf048828fb885848d2fea65', '菜单管理', '4dc94fc707ab45d584e0657f02dee603', 'setting/menu/list.do', 'fa fa-server', '60', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:55:57', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:55:57', null, '1'), ('588ec6332235459bbcaaec44289b3977', '评查配置', 'd571f1273bce479da2c43b3068a072ca', null, 'fa fa-wrench', '40', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 16:10:10', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 16:10:10', null, '1'), ('6307238c678e473297c2c7c200857db6', '所有评查', 'cc1910b66fdd413eb8225045d4c0409e', 'casecheck/check/list.do', null, '40', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 16:07:40', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 16:07:40', null, '1'), ('71f34484e71f4c98acf097c3f6c75c81', '我的发起', 'cc1910b66fdd413eb8225045d4c0409e', 'casecheck/check/mylist.do', null, '30', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 15:38:31', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 15:38:31', null, '1'), ('7755393ff88440848eebcd52f2baa28c', '所有信息', '93d7a63ceaef49e09b25c4553b9ceedf', 'publish/list.do', 'fa fa-info-circle', '60', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:55:42', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:55:42', null, '1'), ('7c34e9a57e954d17bbf75ee821401342', '评选公告', '875b89e8d5824d54ae6e3f07e0b557c6', null, 'fa fa-bell', '10', null, null, 'badge_sjpx_pxgg_total', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:55:20', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:55:20', null, '1'), ('875b89e8d5824d54ae6e3f07e0b557c6', '三精评选', '0', null, 'fa fa-thumbs-o-up', '30', null, null, 'badge_sjpx_total', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:19:58', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:19:58', null, '1'), ('89969121ce194ffda12c2e30e103f08c', '待我评查', 'cc1910b66fdd413eb8225045d4c0409e', 'casecheck/check/todo.do', null, '10', null, null, 'badge_ajpc_ajpc_dwpc', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 15:37:50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 15:37:50', null, '1'), ('8af1157b7ad144a58a285942e68f59f7', '专家管理', '4dc94fc707ab45d584e0657f02dee603', 'setting/professional/list.do', 'fa fa-black-tie', '30', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:51:39', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:51:39', null, '1'), ('91c13c44ee77442183f28d964a53d053', '公告审核', '7c34e9a57e954d17bbf75ee821401342', 'casechosen/notice/verify.do', null, '20', null, null, 'badge_sjpx_pxgg_ggsh', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 11:12:50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 11:12:50', null, '1'), ('93d7a63ceaef49e09b25c4553b9ceedf', '信息公开', '0', null, 'fa fa-info-circle', '50', null, null, 'badge_xxgk_total', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:20:29', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:20:29', null, '1'), ('96e1b96208514ca1bc39db3523ee432c', '所有公告', '7c34e9a57e954d17bbf75ee821401342', 'casechosen/notice/list.do', null, '60', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:57:42', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:57:42', null, '1'), ('9927f1db7cae4826b6430b99ce67cfdc', '待我查看', '93d7a63ceaef49e09b25c4553b9ceedf', 'publish/unwatch.do', 'fa fa-at', '30', null, null, 'badge_xxgk_dwck', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:54:33', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:54:33', null, '1'), ('9d463430dfc14efabba6552083a8b8d5', '字典管理', '4dc94fc707ab45d584e0657f02dee603', 'setting/dict/list.do', 'fa fa-book', '70', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:56:08', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:56:08', null, '1'), ('9f63254fd83c4ce2b08c2fcd4d086e3b', '待我办理', '7c34e9a57e954d17bbf75ee821401342', 'casechosen/notice/handle.do', null, '30', null, null, 'badge_sjpx_pxgg_dwbl', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:56:23', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:56:23', null, '1'), ('a4929fd64ac84f7287ca58ae00014700', '用户管理', '4dc94fc707ab45d584e0657f02dee603', 'setting/user/list.do', 'fa fa-group', '20', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:26:51', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:26:51', null, '1'), ('aca6eb7d6b3b47d390f90e7cafde2c1d', '所有公告', '13f7fb9a8b4a41caba4f950791aff45e', 'casecheck/notice/list.do', null, '50', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:27:33', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:27:33', null, '1'), ('bb43ba78612648b3b353ae6290ab8c3d', '案件评查排名', '40118bd041334420a2614ac261a76181', 'statics/checktop.do', '20', '20', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:10:48', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:10:48', null, '1'), ('bd1b7298961946c89b607ea8520ff6f1', '角色管理', '4dc94fc707ab45d584e0657f02dee603', 'setting/role/list.do', 'fa fa-user-secret', '50', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:55:03', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:55:03', null, '1'), ('c1370458ae7c4407b6346b866e7cc818', '我的发起', '93d7a63ceaef49e09b25c4553b9ceedf', 'publish/mylist.do', 'fa fa-hand-lizard-o', '11', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:55:10', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:55:10', null, '1'), ('caad87c859aa44d2902288985161d1ef', '三精评选排名', '40118bd041334420a2614ac261a76181', 'statics/chosentop.do', null, '50', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:12:39', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:12:39', null, '1'), ('cc1910b66fdd413eb8225045d4c0409e', '案件评查', 'd571f1273bce479da2c43b3068a072ca', null, 'fa fa-balance-scale', '30', null, null, 'badge_ajpc_ajpc_total', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 15:34:48', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 15:34:48', null, '1'), ('cc55c3cf191e41cdbc570d36282aae3a', '三精评选报告', '40118bd041334420a2614ac261a76181', 'statics/chosenreport.do', null, '40', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:12:19', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:12:19', null, '1'), ('d1a2fb4b84474132b171f5d2f7863334', '待我查看', '13f7fb9a8b4a41caba4f950791aff45e', 'casecheck/notice/handle.do', null, '20', null, null, 'badge_ajpc_pcgg_dwbl', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:26:50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:26:50', null, '1'), ('d571f1273bce479da2c43b3068a072ca', '案件评查', '0', null, 'fa fa-balance-scale', '20', null, null, 'badge_ajpc_total', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:19:32', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:19:32', null, '1'), ('e406a4d23cca435aa8dadb77ee33f6a8', '我的发起', '135b95088ab74c098be63e68494d61f1', 'casechosen/chosen/mylist.do', null, '30', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:06:34', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:06:34', null, '1'), ('e57ff83f54dc453ebaaeb13af56303e8', '所有评选', '135b95088ab74c098be63e68494d61f1', 'casechosen/chosen/list.do', null, '40', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:06:50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:06:50', null, '1'), ('e830f2a7548b49b7a21c09115e1b0d7c', '流程配置', '4dc94fc707ab45d584e0657f02dee603', 'setting/flowconfig/list.do', 'fa fa-map-signs', '61', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-09 15:20:27', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-09 15:20:27', null, '1'), ('eb7a02890237472c805243a00fb32424', '待我评选', '135b95088ab74c098be63e68494d61f1', 'casechosen/chosen/todo.do', null, '10', null, null, 'badge_sjpx_sjpx_dwpx', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:05:49', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:05:49', null, '1'), ('efe32bf653a349fbb620a01fad1e50e7', '新建公告', '7c34e9a57e954d17bbf75ee821401342', 'casechosen/notice/input.do', null, '10', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:56:05', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 09:56:05', null, '1'), ('efec8efb775743b086afa7939ead0f32', '公告审核', '13f7fb9a8b4a41caba4f950791aff45e', 'casecheck/notice/verify.do', null, '10', null, null, 'badge_ajpc_pcgg_ggsh', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 11:09:27', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 11:09:27', null, '1'), ('f431758e9c8b44bb8d54492199f3f3d5', '案件评查统计', '40118bd041334420a2614ac261a76181', 'statics/checkdata.do', null, '30', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:11:10', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:11:10', null, '1'), ('f7bc3d3d151d4cebac94e36df1a20dd1', '评分项', '17f9306193664001b53c8b2fa2caaf65', 'casechosen/config/score.do', null, '10', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:09:56', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:09:56', null, '1'), ('f961991ede0145b6b9a7139963f19093', '案件评查报告', '40118bd041334420a2614ac261a76181', 'statics/checkreport.do', '10', null, null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:10:20', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:10:20', null, '1'), ('ff4438a1d52940c5a5462ac17cfd3eeb', '发布信息', '93d7a63ceaef49e09b25c4553b9ceedf', 'publish/input.do', 'fa fa-edit', '10', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:54:13', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:54:13', null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `sd_organization`
-- ----------------------------
DROP TABLE IF EXISTS `sd_organization`;
CREATE TABLE `sd_organization` (
  `zzjgid` varchar(64) NOT NULL COMMENT '组织机构id',
  `zzjgmc` varchar(100) DEFAULT NULL COMMENT '组织机构名称',
  `sjzzjgid` varchar(64) DEFAULT '0' COMMENT '上级组织机构id',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  `sfyzdw` varchar(12) DEFAULT 'false' COMMENT '是否业主单位',
  PRIMARY KEY (`zzjgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构表';

-- ----------------------------
--  Records of `sd_organization`
-- ----------------------------
BEGIN;
INSERT INTO `sd_organization` VALUES ('1ca40efde4c14912a0abbc8e4f9ccf75', '安徽省高级人民法院', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-07 12:58:30', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-07 13:13:00', null, '1', 'true'), ('912f33fa894f44b5813350ba04c9f343', '合肥市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-07 13:12:48', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-07 13:12:48', null, '1', 'true');
COMMIT;

-- ----------------------------
--  Table structure for `sd_professional`
-- ----------------------------
DROP TABLE IF EXISTS `sd_professional`;
CREATE TABLE `sd_professional` (
  `zjid` varchar(64) NOT NULL COMMENT '主键',
  `zy` varchar(500) DEFAULT NULL COMMENT '专业',
  `bq` varchar(2000) DEFAULT NULL COMMENT '标签',
  `tx` varchar(2000) DEFAULT NULL COMMENT '头衔',
  `userid` varchar(64) DEFAULT NULL,
  `js` varchar(9999) DEFAULT NULL,
  PRIMARY KEY (`zjid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sd_role`
-- ----------------------------
DROP TABLE IF EXISTS `sd_role`;
CREATE TABLE `sd_role` (
  `id` varchar(64) NOT NULL DEFAULT '1' COMMENT '角色id',
  `jsmc` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `jssm` varchar(255) DEFAULT NULL COMMENT '角色说明',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
--  Records of `sd_role`
-- ----------------------------
BEGIN;
INSERT INTO `sd_role` VALUES ('066cd508c2c2430996085eb4bfc26db3', '经营负责人', null, null, '2016-08-31 14:50:13', null, '2016-08-31 14:50:13', null, null), ('19836a2aeda9465e9aea0afc028337c2', '工程师', null, null, '2016-08-31 14:49:27', null, '2016-08-31 14:49:27', null, null), ('19a9b46f011848e7bc892c529ebdc86d', '档案审核人', null, null, '2016-11-16 09:57:41', null, '2016-11-16 09:57:41', null, null), ('2fc76f5330e240dd96604c4347f55d68', '经营分管副总', null, null, '2016-08-31 14:50:23', null, '2016-08-31 14:50:23', null, null), ('3880f646e23f419ebdcb672d2cd41d01', '行业主管部门', '行业主管部门', null, '2016-11-24 09:09:08', null, '2016-11-24 09:09:08', null, null), ('45e9cbedabbb4d308428572ba84ad2f0', '系统管理员', '系统管理员', null, '2016-11-15 14:05:11', null, '2016-11-15 14:05:11', null, null), ('715e8664b3984d86a98a45e8036d63ff', '体验账户角色', null, null, '2016-11-29 08:47:15', null, '2016-11-29 08:47:15', null, null), ('82edfdf15b894f9b8a5c35fb302924f6', '造价成果审核人', null, null, '2016-11-16 09:57:35', null, '2016-11-16 09:57:35', null, null), ('89c27d2e145b45628e0f3c72ec4e808b', '施工单位(被审计单位)', '施工单位(被审计单位)', null, '2016-11-24 09:09:39', null, '2016-11-24 09:09:39', null, null), ('966d0871498a452cbda67fe8e01e9d8c', '公司领导', null, null, '2016-08-31 14:50:02', null, '2016-08-31 14:50:02', null, null), ('b0d228fb6f9344f5a8572b1a52612539', '造价分管副总', null, null, '2016-11-16 09:57:04', null, '2016-11-16 09:57:04', null, null), ('b43260db409c413aa7098975398f45db', '设计方', null, null, '2016-11-25 21:50:06', null, '2016-11-25 21:50:06', null, null), ('cada7f30a62b4d0bb141598ad09dfe1b', '设计单位', '设计单位', null, '2016-11-24 09:09:22', null, '2016-11-24 09:09:22', null, null), ('cb49aa5e051c4534986929073e82fa9d', '项目经理', null, null, '2016-11-16 09:54:49', null, '2016-11-16 09:54:49', null, null), ('e67b451506c1479b8f2d9a0d3d8912af', '业主单位工程部经理', null, null, '2016-11-17 16:32:57', null, '2016-11-17 16:32:57', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `sd_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sd_role_menu`;
CREATE TABLE `sd_role_menu` (
  `cdid` varchar(64) NOT NULL COMMENT '菜单id',
  `jsid` varchar(64) NOT NULL COMMENT '角色id',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色可见菜单表';

-- ----------------------------
--  Records of `sd_role_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sd_role_menu` VALUES ('11cce286be1b425ba4516fff95ff14cc', '82edfdf15b894f9b8a5c35fb302924f6', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 13:49:33', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 13:49:33', null, '1'), ('11cce286be1b425ba4516fff95ff14cc', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('d571f1273bce479da2c43b3068a072ca', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('126726c607984b18a07221b858127a40', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('13f7fb9a8b4a41caba4f950791aff45e', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('efec8efb775743b086afa7939ead0f32', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('309bf72e10d64b13839242e8800145be', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('d1a2fb4b84474132b171f5d2f7863334', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('450c5ed39b2f403e860b2b3f3e9dae05', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('aca6eb7d6b3b47d390f90e7cafde2c1d', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('cc1910b66fdd413eb8225045d4c0409e', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('89969121ce194ffda12c2e30e103f08c', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('056de10f22fd419882b828877361cc66', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('71f34484e71f4c98acf097c3f6c75c81', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('6307238c678e473297c2c7c200857db6', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('588ec6332235459bbcaaec44289b3977', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('2317882e44984ea9a51a3b4c748e52c6', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('168bc4244c524d2daaa6750514f231ed', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('875b89e8d5824d54ae6e3f07e0b557c6', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('7c34e9a57e954d17bbf75ee821401342', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('efe32bf653a349fbb620a01fad1e50e7', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('395dc8c5ff0241019bb005185a247975', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('91c13c44ee77442183f28d964a53d053', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('9f63254fd83c4ce2b08c2fcd4d086e3b', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('103a07e57f3741909f54e2b60e5c5be5', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('96e1b96208514ca1bc39db3523ee432c', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('135b95088ab74c098be63e68494d61f1', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('eb7a02890237472c805243a00fb32424', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('316a2a9587f74c09ae696345049a976e', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('e406a4d23cca435aa8dadb77ee33f6a8', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('e57ff83f54dc453ebaaeb13af56303e8', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('17f9306193664001b53c8b2fa2caaf65', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('f7bc3d3d151d4cebac94e36df1a20dd1', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('a5431dd0fa1d475988cea2113b8a4020', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('40118bd041334420a2614ac261a76181', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('f961991ede0145b6b9a7139963f19093', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('bb43ba78612648b3b353ae6290ab8c3d', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('f431758e9c8b44bb8d54492199f3f3d5', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('cc55c3cf191e41cdbc570d36282aae3a', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('caad87c859aa44d2902288985161d1ef', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('103a25225c1147c8832016c9d1f3d085', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('93d7a63ceaef49e09b25c4553b9ceedf', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('ff4438a1d52940c5a5462ac17cfd3eeb', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('474ae47f06d14743841482945c302c37', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('9927f1db7cae4826b6430b99ce67cfdc', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('24b456b326e2414f815465cdc11d6bce', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('c1370458ae7c4407b6346b866e7cc818', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('7755393ff88440848eebcd52f2baa28c', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('4dc94fc707ab45d584e0657f02dee603', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('11ad72a65ace4f79b730061c2e80d3ad', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('a4929fd64ac84f7287ca58ae00014700', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('8af1157b7ad144a58a285942e68f59f7', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('14036c102e4542599ac379afc3b9aafd', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('bd1b7298961946c89b607ea8520ff6f1', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('51fcd89a5bf048828fb885848d2fea65', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('e830f2a7548b49b7a21c09115e1b0d7c', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('9d463430dfc14efabba6552083a8b8d5', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1'), ('b01287ca8dc34567a0dbe287017e9106', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:13:22', null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `sd_setting`
-- ----------------------------
DROP TABLE IF EXISTS `sd_setting`;
CREATE TABLE `sd_setting` (
  `szid` varchar(64) NOT NULL,
  `setkey` varchar(255) DEFAULT NULL COMMENT '设置属性',
  `setvalue` varchar(255) DEFAULT NULL COMMENT '设置值',
  `ms` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`szid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统设置表';

-- ----------------------------
--  Table structure for `sd_user`
-- ----------------------------
DROP TABLE IF EXISTS `sd_user`;
CREATE TABLE `sd_user` (
  `yhid` varchar(64) NOT NULL COMMENT '用户id',
  `zh` varchar(100) DEFAULT NULL COMMENT '账号',
  `mm` varchar(100) DEFAULT NULL COMMENT '密码',
  `jsid` varchar(1000) DEFAULT NULL COMMENT '所属角色id',
  `zzid` varchar(64) DEFAULT NULL COMMENT '所属组织机构id',
  `dzyx` varchar(255) DEFAULT NULL COMMENT '电子邮箱',
  `tx` varchar(64) DEFAULT NULL COMMENT '头像',
  `dh` varchar(20) DEFAULT NULL COMMENT '电话',
  `sj` varchar(20) DEFAULT NULL COMMENT '手机',
  `xm` varchar(100) DEFAULT NULL COMMENT '姓名',
  `zhzt` varchar(12) NOT NULL DEFAULT '1' COMMENT '账户状态1:启用，2：禁用',
  `ygid` varchar(64) DEFAULT '' COMMENT '员工id',
  `ygxm` varchar(50) DEFAULT NULL COMMENT '员工姓名',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`yhid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Records of `sd_user`
-- ----------------------------
BEGIN;
INSERT INTO `sd_user` VALUES ('eaf34bcf8ba945598067b7f88fad0099', 'lw', '1', '066cd508c2c2430996085eb4bfc26db3;2fc76f5330e240dd96604c4347f55d68;45e9cbedabbb4d308428572ba84ad2f0;715e8664b3984d86a98a45e8036d63ff;cb49aa5e051c4534986929073e82fa9d', '912f33fa894f44b5813350ba04c9f343', '123@123.com', '152917543b3246f2a25c9b7980b2608d', null, '18855150306', '刘韦', '1', 'b99f97d09f364b5eb0db29fd89c10f11', '刘韦', 'b99f97d09f364b5eb0db29fd89c10f11', '2016-10-24 17:06:52', 'b99f97d09f364b5eb0db29fd89c10f11', '2017-04-23 10:43:38', null, '1');
COMMIT;

-- ----------------------------
--  View structure for `v_flow_job`
-- ----------------------------
DROP VIEW IF EXISTS `v_flow_job`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_flow_job` AS select `sfj`.`id` AS `id`,`sfj`.`lcmk` AS `lcmk`,`sfj`.`lcpzid` AS `lcpzid`,`sfj`.`shnrid` AS `shnrid`,`sfj`.`dqbz` AS `dqbz`,`sfj`.`dqbzmc` AS `dqbzmc`,`sfj`.`shbtgthbz` AS `shbtgthbz`,`sfj`.`shztlx` AS `shztlx`,`sfj`.`shztid` AS `shztid`,`sfj`.`zyfw` AS `zyfw`,`sfj`.`lcbb` AS `lcbb`,`sfj`.`sfzhyb` AS `sfzhyb`,`sfj`.`sqr` AS `sqr`,`sfj`.`create_by` AS `create_by`,`sfj`.`create_date` AS `create_date`,`sfj`.`update_by` AS `update_by`,`sfj`.`update_date` AS `update_date`,`sfj`.`remarks` AS `remarks`,`sfj`.`flag` AS `flag`,`su`.`yhid` AS `yhid` from (`sd_flow_job` `sfj` join `sd_user` `su`) where (((`sfj`.`shztlx` = '1') and find_in_set(`sfj`.`shztid`,replace(`su`.`jsid`,';',','))) or ((`sfj`.`shztlx` = '2') and (`sfj`.`shztid` like concat('%',`su`.`yhid`,'%'))));

-- ----------------------------
--  Function structure for `fn_get_childs`
-- ----------------------------
DROP FUNCTION IF EXISTS `fn_get_childs`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_childs`(`rootid` varchar(255)) RETURNS varchar(21845) CHARSET utf8
    COMMENT '查询字典子id'
BEGIN
	DECLARE sTemp VARCHAR(21845);
  DECLARE sTempChd VARCHAR(21845);

  SET sTemp = '';
  SET sTempChd = rootid;

  WHILE sTempChd is not null DO

  SET sTemp = concat(sTemp,',',sTempChd);

  SELECT group_concat(zzjgid) INTO sTempChd FROM sd_organization where FIND_IN_SET(sjzzjgid,sTempChd)>0;
  END WHILE;
  RETURN substring(sTemp,2,LENGTH(sTemp));
END
 ;;
delimiter ;

-- ----------------------------
--  Function structure for `fn_get_childs_menu`
-- ----------------------------
DROP FUNCTION IF EXISTS `fn_get_childs_menu`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_childs_menu`(`rootid` varchar(64)) RETURNS varchar(1000) CHARSET utf8
BEGIN
	DECLARE sTemp VARCHAR(1000);
  DECLARE sTempChd VARCHAR(1000);

  SET sTemp = '';
  SET sTempChd = rootid;

  WHILE sTempChd is not null DO

  SET sTemp = concat(sTemp,',',sTempChd);

  SELECT group_concat(cdid) INTO sTempChd FROM sd_menu where FIND_IN_SET(sjcdid,sTempChd)>0;
  END WHILE;
  RETURN substring(sTemp,2,LENGTH(sTemp));
END
 ;;
delimiter ;

-- ----------------------------
--  Function structure for `fn_get_dict`
-- ----------------------------
DROP FUNCTION IF EXISTS `fn_get_dict`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_dict`(`context` varchar(1000)) RETURNS varchar(500) CHARSET utf8
    COMMENT '查询多字典'
BEGIN
DECLARE groupname VARCHAR(1000) DEFAULT '';
DECLARE groupitem VARCHAR(255) DEFAULT '';
DECLARE valuetext VARCHAR(255) DEFAULT '';
DECLARE charindex int(11);
SET context = REPLACE(context,',',';');
WHILE(length(context) <> length(REPLACE(context,';',''))) DO
SET charindex = LOCATE(';',context);
SET valuetext = SUBSTR(context,1,charindex-1);
SET context = SUBSTR(context,charindex+1);
SET groupitem = valuetext;
SELECT sd_dict.zdmc INTO groupitem FROM sd_dict WHERE sd_dict.zdbh = valuetext ;
SET groupname = CONCAT(groupname,groupitem);
SET groupname = CONCAT(groupname,';');
END WHILE;

SET groupitem = context;
SELECT sd_dict.zdmc INTO groupitem FROM sd_dict WHERE sd_dict.zdbh = context;
SET groupname = CONCAT(groupname,groupitem);

RETURN groupname;  
END
 ;;
delimiter ;

-- ----------------------------
--  Function structure for `fn_get_rolename`
-- ----------------------------
DROP FUNCTION IF EXISTS `fn_get_rolename`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_rolename`(`jsid` varchar(2000)) RETURNS varchar(255) CHARSET utf8
BEGIN
DECLARE rolename VARCHAR(1000) DEFAULT '';
DECLARE groupitem VARCHAR(255) DEFAULT '';
DECLARE valuetext VARCHAR(255) DEFAULT '';
DECLARE charindex int(11);

WHILE(length(jsid) <> length(REPLACE(jsid,';',''))) DO
SET charindex = LOCATE(';',jsid);
SET valuetext = SUBSTR(jsid,1,charindex-1);
SET jsid = SUBSTR(jsid,charindex+1);
SET groupitem = valuetext;
SELECT jsmc INTO groupitem FROM sd_role WHERE id = valuetext ;
SET rolename = CONCAT(rolename,groupitem);
SET rolename = CONCAT(rolename,';');
END WHILE;

SET groupitem = jsid;
SELECT jsmc INTO groupitem FROM sd_role WHERE id = jsid;
SET rolename = CONCAT(rolename,groupitem);

RETURN rolename;  
END
 ;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
