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

 Date: 10/17/2017 13:28:54 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `WS_LOG`
-- ----------------------------
DROP TABLE IF EXISTS `WS_LOG`;
CREATE TABLE `WS_LOG` (
  `errorid` varchar(200) NOT NULL,
  `taskid` varchar(200) DEFAULT NULL,
  `taskitemid` varchar(200) DEFAULT NULL,
  `log` longtext,
  `remark1` varchar(1000) DEFAULT NULL,
  `remark2` varchar(1000) DEFAULT NULL,
  `remark3` varchar(1000) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`errorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WS_TASK`
-- ----------------------------
DROP TABLE IF EXISTS `WS_TASK`;
CREATE TABLE `WS_TASK` (
  `taskid` varchar(200) NOT NULL,
  `tasktype` varchar(100) DEFAULT NULL COMMENT '任务类型：1A1/A2:获取基本信息 B1/B2：获取档案信息 C1/C2：获取视频信息 1为全 2为更新',
  `begeindate` datetime DEFAULT NULL COMMENT '任务开始时间',
  `enddate` datetime DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `remark1` varchar(1000) DEFAULT NULL,
  `remark2` varchar(1000) DEFAULT NULL,
  `remark3` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `WS_TASK_ITEMS`
-- ----------------------------
DROP TABLE IF EXISTS `WS_TASK_ITEMS`;
CREATE TABLE `WS_TASK_ITEMS` (
  `taskitemid` varchar(200) NOT NULL,
  `taskid` varchar(200) DEFAULT NULL,
  `params` varchar(2000) DEFAULT NULL,
  `results` longtext,
  `datacount` int(11) DEFAULT NULL,
  `handlecount` int(11) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `remark1` varchar(1000) DEFAULT NULL,
  `remark2` varchar(1000) DEFAULT NULL,
  `remark3` varchar(1000) DEFAULT NULL,
  `exetime` datetime DEFAULT NULL,
  PRIMARY KEY (`taskitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_check`
-- ----------------------------
DROP TABLE IF EXISTS `bd_check`;
CREATE TABLE `bd_check` (
  `checkid` varchar(100) NOT NULL COMMENT '主键',
  `bt` varchar(2000) DEFAULT NULL COMMENT '标题',
  `btys` varchar(100) DEFAULT NULL COMMENT '标题颜色',
  `pclx` varchar(100) DEFAULT NULL COMMENT '评查类型',
  `pcrw` varchar(100) DEFAULT NULL COMMENT '评查任务',
  `pfb` varchar(100) DEFAULT NULL COMMENT '评分表id',
  `nr` text COMMENT '内容',
  `fqr` varchar(100) DEFAULT NULL COMMENT '发起人',
  `fqsj` datetime DEFAULT NULL COMMENT '发起时间',
  `shr` varchar(100) DEFAULT NULL COMMENT '审核人',
  `shsj` datetime DEFAULT NULL COMMENT '审核时间',
  `shyj` varchar(2000) DEFAULT NULL COMMENT '审核意见',
  `zt` varchar(100) DEFAULT NULL COMMENT '状态：0:待审核 1:审核通过 2:审核不通过',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`checkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_check_cases`
-- ----------------------------
DROP TABLE IF EXISTS `bd_check_cases`;
CREATE TABLE `bd_check_cases` (
  `ccid` varchar(100) NOT NULL COMMENT '主键',
  `checkid` varchar(100) DEFAULT NULL COMMENT '评查活动id',
  `ajid` varchar(100) DEFAULT NULL COMMENT '被评查案件id 关联middlecase',
  `psgroupid` varchar(100) DEFAULT NULL COMMENT '评审组id',
  `jydp` varchar(2000) DEFAULT NULL COMMENT '简要点评',
  `zzpcdf` varchar(100) DEFAULT NULL COMMENT '最终评查得分',
  `zzzldj` varchar(100) DEFAULT NULL COMMENT '最终质量等级',
  `dpr` varchar(100) DEFAULT NULL COMMENT '点评人',
  `dpsj` datetime DEFAULT NULL COMMENT '点评时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`ccid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_check_distribution`
-- ----------------------------
DROP TABLE IF EXISTS `bd_check_distribution`;
CREATE TABLE `bd_check_distribution` (
  `cdid` varchar(100) NOT NULL,
  `checkid` varchar(100) DEFAULT NULL,
  `fbxmc` varchar(200) DEFAULT NULL COMMENT '分布项名称',
  `fbxlx` varchar(100) DEFAULT NULL COMMENT '分布项类型：1：区域 2:性质；3：类型',
  `fbx` varchar(100) DEFAULT NULL COMMENT '分布项具体值，归属法院，性质，或类型',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`cdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_check_groups`
-- ----------------------------
DROP TABLE IF EXISTS `bd_check_groups`;
CREATE TABLE `bd_check_groups` (
  `cgid` varchar(100) NOT NULL COMMENT '主键',
  `checkid` varchar(100) DEFAULT NULL COMMENT '评查活动id',
  `groupname` varchar(2000) DEFAULT NULL COMMENT '评查组名称',
  `pcajs` int(11) DEFAULT NULL COMMENT '评查案件数',
  `zb` varchar(255) DEFAULT NULL COMMENT '占比',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  `tdcy` varchar(2000) DEFAULT NULL COMMENT '团队成员',
  PRIMARY KEY (`cgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_check_levels`
-- ----------------------------
DROP TABLE IF EXISTS `bd_check_levels`;
CREATE TABLE `bd_check_levels` (
  `levelid` varchar(100) NOT NULL,
  `levelname` varchar(100) DEFAULT NULL,
  `maxscore` varchar(100) DEFAULT NULL,
  `minscore` varchar(100) DEFAULT NULL,
  `xh` int(10) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`levelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `bd_check_levels`
-- ----------------------------
BEGIN;
INSERT INTO `bd_check_levels` VALUES ('2', '合格', '89', '70', '2', null, null, null, null, null, null), ('6d4e141d555d493eb1b2679a79055244', '优秀', '100', '90', '1', null, null, null, null, null, null), ('8d15a13686784d4ab17a48302db62687', '瑕疵', '69', '60', '3', null, null, null, null, null, null), ('e2ded9e03fe44fd8bdfeafab2b0f8bbb', '差错', '59', '0', '4', null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `bd_check_pros`
-- ----------------------------
DROP TABLE IF EXISTS `bd_check_pros`;
CREATE TABLE `bd_check_pros` (
  `cpid` varchar(100) NOT NULL COMMENT '主键',
  `checkid` varchar(100) DEFAULT NULL COMMENT '核查活动id',
  `groupid` varchar(100) DEFAULT NULL COMMENT '组id',
  `proid` varchar(100) DEFAULT NULL COMMENT '专家id',
  `sfzz` varchar(100) DEFAULT NULL COMMENT '是否组长 1:是 0 否',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`cpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_check_read`
-- ----------------------------
DROP TABLE IF EXISTS `bd_check_read`;
CREATE TABLE `bd_check_read` (
  `readid` varchar(100) NOT NULL,
  `readman` varchar(100) DEFAULT NULL,
  `readtime` datetime DEFAULT NULL,
  `checkid` varchar(100) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`readid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_check_records`
-- ----------------------------
DROP TABLE IF EXISTS `bd_check_records`;
CREATE TABLE `bd_check_records` (
  `crid` varchar(100) NOT NULL COMMENT '主键',
  `checkid` varchar(100) DEFAULT NULL COMMENT '活动id',
  `ajid` varchar(100) DEFAULT NULL COMMENT '案件id',
  `pcr` varchar(100) DEFAULT NULL COMMENT '评查人',
  `pcsj` datetime DEFAULT NULL COMMENT '评查时间',
  `pcfs` varchar(100) DEFAULT NULL COMMENT '评查分数',
  `pczt` varchar(100) DEFAULT NULL COMMENT '评查状态；1：暂存，2：提交评查',
  `zldj` varchar(100) DEFAULT NULL COMMENT '质量等级',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`crid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_check_reject_read`
-- ----------------------------
DROP TABLE IF EXISTS `bd_check_reject_read`;
CREATE TABLE `bd_check_reject_read` (
  `readid` varchar(100) NOT NULL,
  `readman` varchar(100) DEFAULT NULL,
  `readtime` datetime DEFAULT NULL,
  `checkid` varchar(100) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`readid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_check_score`
-- ----------------------------
DROP TABLE IF EXISTS `bd_check_score`;
CREATE TABLE `bd_check_score` (
  `scoreid` varchar(100) NOT NULL,
  `crid` varchar(100) DEFAULT NULL,
  `tableid` varchar(100) DEFAULT NULL,
  `itemid` varchar(100) DEFAULT NULL,
  `kf` varchar(100) DEFAULT NULL,
  `kfyy` varchar(1000) DEFAULT NULL,
  `df` varchar(255) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`scoreid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_chosen`
-- ----------------------------
DROP TABLE IF EXISTS `bd_chosen`;
CREATE TABLE `bd_chosen` (
  `chosenid` varchar(100) NOT NULL,
  `bt` varchar(2000) DEFAULT NULL COMMENT '标题',
  `btys` varchar(100) DEFAULT NULL COMMENT '标题颜色',
  `pclx` varchar(100) DEFAULT NULL COMMENT '评查类型',
  `pfb` varchar(100) DEFAULT NULL COMMENT '评分表id',
  `nr` text COMMENT '内容',
  `fqr` varchar(100) DEFAULT NULL COMMENT '发起人',
  `fqsj` datetime DEFAULT NULL COMMENT '发起时间',
  `shr` varchar(100) DEFAULT NULL COMMENT '审核人',
  `shsj` datetime DEFAULT NULL COMMENT '审核时间',
  `shyj` varchar(2000) DEFAULT NULL COMMENT '审核意见',
  `zt` varchar(100) DEFAULT NULL COMMENT '状态：0:待审核 1:审核通过 2:审核不通过',
  `jzrq` datetime DEFAULT NULL COMMENT '填报案例截止日期',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  `sffp` varchar(100) DEFAULT NULL COMMENT '是否分配 0:未分配1 已分配',
  PRIMARY KEY (`chosenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_chosen_cases`
-- ----------------------------
DROP TABLE IF EXISTS `bd_chosen_cases`;
CREATE TABLE `bd_chosen_cases` (
  `ccid` varchar(100) NOT NULL COMMENT '主键',
  `chosenid` varchar(100) DEFAULT NULL COMMENT '评查活动id',
  `ajid` varchar(100) DEFAULT NULL COMMENT '被评查案件id 关联middlecase',
  `psgroupid` varchar(100) DEFAULT NULL COMMENT '评审组id',
  `jydp` varchar(2000) DEFAULT NULL COMMENT '简要点评',
  `zzpxdf` varchar(100) DEFAULT NULL COMMENT '最终评选得分',
  `dpr` varchar(100) DEFAULT NULL COMMENT '点评人',
  `dpsj` datetime DEFAULT NULL COMMENT '点评时间',
  `tjly` varchar(2000) DEFAULT NULL COMMENT '推荐理由',
  `tbrq` datetime DEFAULT NULL COMMENT '填报日期',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`ccid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_chosen_groups`
-- ----------------------------
DROP TABLE IF EXISTS `bd_chosen_groups`;
CREATE TABLE `bd_chosen_groups` (
  `cgid` varchar(100) NOT NULL COMMENT '主键',
  `chosenid` varchar(100) DEFAULT NULL COMMENT '评查活动id',
  `groupname` varchar(2000) DEFAULT NULL COMMENT '评查组名称',
  `pcajs` int(11) DEFAULT NULL COMMENT '评查案件数',
  `zb` varchar(255) DEFAULT NULL COMMENT '占比',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  `tdcy` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`cgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_chosen_msgto`
-- ----------------------------
DROP TABLE IF EXISTS `bd_chosen_msgto`;
CREATE TABLE `bd_chosen_msgto` (
  `msgtoid` varchar(100) NOT NULL,
  `chosenid` varchar(100) DEFAULT NULL COMMENT '活动id',
  `proid` varchar(100) DEFAULT NULL COMMENT '专家id',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  `proname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`msgtoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_chosen_pros`
-- ----------------------------
DROP TABLE IF EXISTS `bd_chosen_pros`;
CREATE TABLE `bd_chosen_pros` (
  `cpid` varchar(100) NOT NULL COMMENT '主键',
  `chosenid` varchar(100) DEFAULT NULL COMMENT '核查活动id',
  `groupid` varchar(100) DEFAULT NULL COMMENT '组id',
  `proid` varchar(100) DEFAULT NULL COMMENT '专家id',
  `sfzz` varchar(100) DEFAULT NULL COMMENT '是否组长',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`cpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_chosen_read`
-- ----------------------------
DROP TABLE IF EXISTS `bd_chosen_read`;
CREATE TABLE `bd_chosen_read` (
  `readid` varchar(100) NOT NULL,
  `readman` varchar(100) DEFAULT NULL,
  `readtime` datetime DEFAULT NULL,
  `chosenid` varchar(100) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`readid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_chosen_records`
-- ----------------------------
DROP TABLE IF EXISTS `bd_chosen_records`;
CREATE TABLE `bd_chosen_records` (
  `crid` varchar(100) NOT NULL COMMENT '主键',
  `chosenid` varchar(100) DEFAULT NULL COMMENT '活动id',
  `ajid` varchar(100) DEFAULT NULL COMMENT '案件id',
  `pcr` varchar(100) DEFAULT NULL COMMENT '评查人',
  `pcsj` datetime DEFAULT NULL COMMENT '评查时间',
  `pcfs` varchar(100) DEFAULT NULL COMMENT '评查分数',
  `pczt` varchar(100) DEFAULT NULL COMMENT '评查状态；1：暂存，2：提交评查',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`crid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_chosen_reject_read`
-- ----------------------------
DROP TABLE IF EXISTS `bd_chosen_reject_read`;
CREATE TABLE `bd_chosen_reject_read` (
  `readid` varchar(100) NOT NULL,
  `readman` varchar(100) DEFAULT NULL,
  `readtime` datetime DEFAULT NULL,
  `chosenid` varchar(100) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`readid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_chosen_score`
-- ----------------------------
DROP TABLE IF EXISTS `bd_chosen_score`;
CREATE TABLE `bd_chosen_score` (
  `scoreid` varchar(100) NOT NULL,
  `crid` varchar(100) DEFAULT NULL,
  `tableid` varchar(100) DEFAULT NULL,
  `itemid` varchar(100) DEFAULT NULL,
  `kf` varchar(100) DEFAULT NULL COMMENT '扣费',
  `kfyy` varchar(1000) DEFAULT NULL COMMENT '扣分原因',
  `df` varchar(255) DEFAULT NULL COMMENT '得分',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`scoreid`)
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
  `xz` varchar(20) DEFAULT NULL COMMENT '案件性质',
  `ay` varchar(2000) DEFAULT NULL COMMENT '案由',
  `jafs` varchar(100) DEFAULT NULL COMMENT '结案方式',
  `jasj` datetime DEFAULT NULL COMMENT '结案时间',
  `lx` varchar(500) DEFAULT NULL COMMENT '案件类型',
  `thirdid` varchar(100) DEFAULT NULL COMMENT '通达海案件id',
  `relatedcasecount` int(11) DEFAULT NULL COMMENT '关联案件数量',
  `relatedcaseid` varchar(2000) DEFAULT NULL COMMENT '关联案件id 分号分割',
  `passcheck` varchar(50) DEFAULT NULL COMMENT '是否通过检查1:为通过，0或空都为不通过。',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  `wsbasealltaskid` varchar(200) DEFAULT NULL,
  `wsbaseupdatetaskid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ajid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_middle_file`
-- ----------------------------
DROP TABLE IF EXISTS `bd_middle_file`;
CREATE TABLE `bd_middle_file` (
  `fileid` varchar(100) NOT NULL COMMENT '主键',
  `pfileid` varchar(100) DEFAULT NULL COMMENT '父id',
  `xname` varchar(2000) DEFAULT NULL COMMENT '文件或目录名',
  `xurl` varchar(2000) DEFAULT NULL COMMENT '文件路径',
  `xorder` int(11) DEFAULT NULL COMMENT '排序号',
  `ajid` varchar(200) DEFAULT NULL COMMENT '案件id',
  `require` varchar(10) DEFAULT NULL COMMENT '是否必要，1必要，0或空为不必要',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  `wsfilealltaskid` varchar(200) DEFAULT NULL,
  `wsfileupdatetaskid` varchar(200) DEFAULT NULL,
  `wsvideoalltaskid` varchar(200) DEFAULT NULL,
  `wsvideoupdatetaskid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`fileid`)
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
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
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
--  Table structure for `bd_scoretable_items`
-- ----------------------------
DROP TABLE IF EXISTS `bd_scoretable_items`;
CREATE TABLE `bd_scoretable_items` (
  `itemid` varchar(100) NOT NULL,
  `psnr` varchar(1000) DEFAULT NULL,
  `pfbz` varchar(1000) DEFAULT NULL,
  `fz` varchar(100) DEFAULT NULL,
  `xh` int(10) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bd_scoretables`
-- ----------------------------
DROP TABLE IF EXISTS `bd_scoretables`;
CREATE TABLE `bd_scoretables` (
  `tableid` varchar(100) NOT NULL COMMENT '主键',
  `mbmc` varchar(1000) DEFAULT NULL COMMENT '模板名称',
  `mcms` varchar(1000) DEFAULT NULL COMMENT '模板描述',
  `sfqy` varchar(100) DEFAULT NULL COMMENT '是否启用0：未启用，1：启用',
  `lx` varchar(100) DEFAULT NULL COMMENT '类型：1：评查，2：评选',
  `mf` varchar(100) DEFAULT NULL COMMENT '满分',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '状态(哈哈哈)',
  `flag` varchar(12) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`tableid`)
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
INSERT INTO `sd_dict` VALUES ('103', '流程模块', '0', null, null, null, null, null, null, '1'), ('10301', '案件评查公告流程', '103', '1', null, null, null, null, null, '1'), ('10302', '三精评选公告流程', '103', '2', null, null, null, null, null, '1'), ('10303', '信息公开审核流程', '103', '3', null, null, null, null, null, '1'), ('105', '审核结果', '0', '1', null, null, null, null, null, '1'), ('10501', '审核通过', '105', '1', null, null, null, null, null, '1'), ('10502', '审核不通过', '105', '2', null, null, null, null, null, '1'), ('106', '审核状态', '0', null, null, null, null, null, null, '1'), ('10601', '待审核', '106', '1', null, null, null, null, null, '1'), ('10602', '审核中', '106', '2', null, null, null, null, null, '1'), ('10603', '已审核', '106', '3', null, null, null, null, null, '1'), ('149', '错误类型', '0', null, null, null, null, null, null, '1'), ('14901', '流程未定义', '149', '1', null, null, null, null, null, '1'), ('14902', '不满足流程定义的条件，无法提交', '149', '2', null, null, null, null, '不满足流程定义的条件，无法提交', '1'), ('801', '操作类型', '0', '2', null, null, null, null, '日志模块', '1'), ('80101', '登录', '801', '1', null, null, null, null, null, '1'), ('80102', '增加', '801', '2', null, null, null, null, null, '1'), ('80103', '修改', '801', '3', null, null, null, null, null, '1'), ('80104', '删除', '801', '4', null, null, null, null, null, '1'), ('802', '信息类型', '0', '3', null, null, null, null, '信息公开模块', '1'), ('80201', '通知通告', '802', '1', null, null, null, null, null, '1'), ('804', '案件性质', '0', '5', null, null, null, null, null, '1'), ('80401', '刑事', '804', '1', null, null, null, null, null, '1'), ('80402', '民事', '804', '2', null, null, null, null, null, '1'), ('80403', '行政', '804', '3', null, null, null, null, null, '1'), ('80404', '赔偿', '804', '4', null, null, null, null, null, '1'), ('80405', '执行', '804', '5', null, null, null, null, null, '1'), ('80406', '其他', '804', '6', null, null, null, null, null, '1'), ('805', '专家标签', '0', '6', null, null, null, null, null, '1'), ('80501', '人大代表', '805', '1', null, null, null, null, null, '1'), ('80502', '政协委员', '805', '2', null, null, null, null, null, '1'), ('80503', '资深检察官', '805', '3', null, null, null, null, null, '1'), ('80504', '专业学者', '805', '4', null, null, null, null, null, '1'), ('806', '案件类型', '0', '7', null, null, null, null, null, '1'), ('80601', '抗诉', '806', '1', null, null, null, null, null, '1'), ('80602', '发回改判', '806', '2', null, null, null, null, null, '1'), ('80603', '再审', '806', '3', null, null, null, null, null, '1'), ('80604', '审理周期超过一年半以上', '806', '4', null, null, null, null, null, '1'), ('80605', '执行异议复议', '806', '5', null, null, null, null, null, '1');
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
--  Records of `sd_flow_config`
-- ----------------------------
BEGIN;
INSERT INTO `sd_flow_config` VALUES ('1354d9ec2fcd4cc7b498154f4fdfffa0', '10303', '任务', '2', '2017-10-07 00:00:00', '1', '1', '6a5ffc10493048bc881a5ab0ab6a7acd', '0', null, '2017-10-08 00:00:59', null, '2017-10-08 00:00:59', null, '1'), ('58ee929e110140d0a9690f0b630d01db', '10303', '任务', '1', '2016-01-01 00:00:00', '1', '2', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '0', null, '2017-05-03 16:38:52', null, '2017-05-03 16:38:52', null, '1');
COMMIT;

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
--  Records of `sd_flow_config_tx`
-- ----------------------------
BEGIN;
INSERT INTO `sd_flow_config_tx` VALUES ('35dc1d6a79c343dfb5e8f03c773cdcc9', '10303', '1', '{states:{rect1:{type:\'start\',text:{text:\'开始\'}, attr:{ x:16, y:294, width:100, height:50}, props:{text:{value:\'开始\'}}},rect2:{type:\'end\',text:{text:\'结束\'}, attr:{ x:946, y:294, width:100, height:50}, props:{text:{value:\'结束\'}}},rect3:{type:\'task\',text:{text:\'任务\'}, attr:{ x:290, y:291, width:100, height:50}, props:{text:{value:\'任务\'},hjbz:{value:\'1\'},shztlx:{value:\'2\'},shzt:{value:\'ccd1e2bea7fd48caa39b93a97aa09ffd_吕仁钊\'},btgth:{value:\'0\'}}}},paths:{path4:{from:\'rect1\',to:\'rect3\', dots:[],text:{text:\'TO 任务\'},textPos:{x:0,y:-10}, props:{text:{value:\'\'}}},path5:{from:\'rect3\',to:\'rect2\', dots:[],text:{text:\'TO 结束\'},textPos:{x:0,y:-10}, props:{text:{value:\'\'}}}},props:{props:{name:{value:\'信息公开审核流程\'},key:{value:\'1\'},desc:{value:\'2016-01-01\'}}}}', null, '2017-05-03 16:38:52', null, '2017-05-03 16:38:52', null, '1'), ('5c50dc50c7844a788dfe0ff4d5974906', '10303', '2', '{states:{rect1:{type:\'start\',text:{text:\'开始\'}, attr:{ x:16, y:294, width:100, height:50}, props:{text:{value:\'开始\'}}},rect2:{type:\'end\',text:{text:\'结束\'}, attr:{ x:946, y:294, width:100, height:50}, props:{text:{value:\'结束\'}}},rect3:{type:\'task\',text:{text:\'任务\'}, attr:{ x:281, y:306, width:100, height:50}, props:{text:{value:\'任务\'},hjbz:{value:\'1\'},shztlx:{value:\'1\'},shzt:{value:\'6a5ffc10493048bc881a5ab0ab6a7acd\'},btgth:{value:\'0\'}}}},paths:{path4:{from:\'rect1\',to:\'rect3\', dots:[],text:{text:\'TO 任务\'},textPos:{x:0,y:-10}, props:{text:{value:\'\'}}},path5:{from:\'rect3\',to:\'rect2\', dots:[],text:{text:\'TO 结束\'},textPos:{x:0,y:-10}, props:{text:{value:\'\'}}}},props:{props:{name:{value:\'信息公开审核流程\'},key:{value:\'2\'},desc:{value:\'2017-10-07\'}}}}', null, '2017-10-08 00:00:59', null, '2017-10-08 00:00:59', null, '1');
COMMIT;

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
--  Records of `sd_flow_history`
-- ----------------------------
BEGIN;
INSERT INTO `sd_flow_history` VALUES ('2046b7b2dc0540e9868ac54c8e006400', '740192667a9945d1ab657e7c8c2b484a', '10303', '10501', '', '1', '1', '任务', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-05-03 18:09:06', null, 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-05-03 18:09:06', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-05-03 18:09:06', null, '1'), ('3c46eaefa0dc401c8a325a2597ec413a', '5778d2ca232049dea241f359b9e34626', '10303', '10501', '', '1', '1', '任务', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-05-03 18:17:31', null, 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-05-03 18:17:31', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-05-03 18:17:31', null, '1'), ('e1705d4a94d343b283bad06b5c2e5217', 'aade823e19de4c4591fb56a4505b87c4', '10303', '10502', '不行', '1', '1', '任务', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-05-03 18:18:51', null, 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-05-03 18:18:51', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-05-03 18:18:51', null, '1'), ('f86ed6c71e404c4292307021ee674c7e', '748576695dc848398f7ec4bf135a5f95', '10303', '10501', '', '1', '1', '任务', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-05-03 18:24:12', null, 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-05-03 18:24:12', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-05-03 18:24:12', null, '1');
COMMIT;

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
--  Records of `sd_flow_job`
-- ----------------------------
BEGIN;
INSERT INTO `sd_flow_job` VALUES ('7efd627e2fe911e78c8e5865f084c654', '10303', '58ee929e110140d0a9690f0b630d01db', '991bd49703ac419e930dafeef4af52f4', '1', '任务', '0', '2', 'ccd1e2bea7fd48caa39b93a97aa09ffd', null, '1', '1', 'eaf34bcf8ba945598067b7f88fad0099', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 18:15:56', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 18:15:56', null, '1'), ('8287a16aab7811e7ad2265b663cacda3', '10303', '58ee929e110140d0a9690f0b630d01db', '043e73a022784ebb9f06482028567011', '1', '任务', '0', '2', 'ccd1e2bea7fd48caa39b93a97aa09ffd', null, '1', '1', 'eaf34bcf8ba945598067b7f88fad0099', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 23:59:33', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 23:59:33', null, '1'), ('e382d49eab7811e7ad2265b663cacda3', '10303', '1354d9ec2fcd4cc7b498154f4fdfffa0', '5080b6e60f5242c0853a0f9290e7df26', '1', '任务', '0', '1', '6a5ffc10493048bc881a5ab0ab6a7acd', null, '2', '1', 'eaf34bcf8ba945598067b7f88fad0099', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 00:02:15', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 00:02:15', null, '1');
COMMIT;

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
INSERT INTO `sd_menu` VALUES ('05d919a0acb44ad3870f86a450b713a1', '所有案件评查', 'd571f1273bce479da2c43b3068a072ca', 'views/check/all/main.jsp', 'fa fa-folder-o', '701', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 16:43:50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 16:43:50', null, '1'), ('08c50fda5959494080952a673cd286e4', '三精评选公告', '875b89e8d5824d54ae6e3f07e0b557c6', 'views/chosen/notice/main.jsp', 'fa fa-bullhorn', '301', null, null, 'badge_sjpx_gg', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:15:32', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:15:32', null, '1'), ('11ad72a65ace4f79b730061c2e80d3ad', '组织机构', '4dc94fc707ab45d584e0657f02dee603', 'setting/organization/list.do', 'fa fa-sitemap', '10', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:26:04', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:26:04', null, '1'), ('11cce286be1b425ba4516fff95ff14cc', '首页', '0', 'home.do', 'fa fa-home', '10', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:19:04', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:19:04', null, '1'), ('14036c102e4542599ac379afc3b9aafd', '操作日志', '4dc94fc707ab45d584e0657f02dee603', 'setting/log/list.do', 'fa fa-terminal', '40', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:53:19', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:53:19', null, '1'), ('168bc4244c524d2daaa6750514f231ed', '质量等级', '588ec6332235459bbcaaec44289b3977', 'views/check/configlevel/main.jsp', null, '20', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 16:11:52', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 16:11:52', null, '1'), ('17f9306193664001b53c8b2fa2caaf65', '评选配置', '875b89e8d5824d54ae6e3f07e0b557c6', null, 'fa fa-wrench', '501', null, '501', null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:07:39', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:07:39', null, '1'), ('2317882e44984ea9a51a3b4c748e52c6', '评分表模板', '588ec6332235459bbcaaec44289b3977', 'views/check/configscore/main.jsp?type=1', null, '10', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 16:11:26', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 16:11:26', null, '1'), ('24b456b326e2414f815465cdc11d6bce', '我已查看', '93d7a63ceaef49e09b25c4553b9ceedf', 'publish/watched.do', 'fa fa-history', '40', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:54:48', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:54:48', null, '1'), ('2a65d288e487479d94080e20e66f2849', '公告审核结果', 'd571f1273bce479da2c43b3068a072ca', 'views/check/reject/main.jsp', 'fa fa-mail-reply', '502', null, null, 'badge_ajpc_reject', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-18 09:42:51', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-08-18 09:42:51', null, '1'), ('3404112a7945448395b674dbc98c3b64', '填报三精案件', '875b89e8d5824d54ae6e3f07e0b557c6', 'views/chosen/join/main.jsp', 'fa fa-file-archive-o', '302', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:27:39', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:27:39', null, '1'), ('3433a7284d2a40a88d87a7b233b735cf', '案件评查公告', 'd571f1273bce479da2c43b3068a072ca', 'views/check/notice/main.jsp', 'fa fa-bell-o', '301', null, null, 'badge_ajpc_gg', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 16:31:51', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 16:31:51', null, '1'), ('3ec7f02da78244b788d763e396fcb30a', '评选三精', '875b89e8d5824d54ae6e3f07e0b557c6', 'views/chosen/work/main.jsp', 'fa fa-quote-left', '401', null, null, 'badge_sjpx_px', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:16:02', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:16:02', null, '1'), ('40118bd041334420a2614ac261a76181', '统计分析', '0', null, 'fa fa-bar-chart', '40', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:21:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:21:21', null, '1'), ('415249a0463a43cca8612bcec0becc16', '我发起的评查', 'd571f1273bce479da2c43b3068a072ca', 'views/check/my/main.jsp', 'fa fa-flag-o', '601', null, null, 'badge_ajpc_reject', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 16:43:32', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 16:43:32', null, '1'), ('474ae47f06d14743841482945c302c37', '信息审核', '93d7a63ceaef49e09b25c4553b9ceedf', 'publish/verify.do', 'fa fa-eye', '20', null, null, 'badge_xxgk_xxsh', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 11:14:49', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 11:14:49', null, '1'), ('4dc94fc707ab45d584e0657f02dee603', '系统管理', '0', null, 'fa fa-cogs', '60', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:17:59', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:17:59', null, '1'), ('50167662bd9544f3a9cefcaac3d2eedc', '发起三精评选', '875b89e8d5824d54ae6e3f07e0b557c6', 'views/chosen/start/main.jsp', 'fa fa-pencil', '101', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:14:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:14:00', null, '1'), ('506b3a3335b8430d85153646ef0016b2', '审核三精评选', '875b89e8d5824d54ae6e3f07e0b557c6', 'views/chosen/verify/main.jsp', 'fa fa-eraser', '201', null, null, 'badge_sjpx_sh', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:14:11', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:14:11', null, '1'), ('51fcd89a5bf048828fb885848d2fea65', '菜单管理', '4dc94fc707ab45d584e0657f02dee603', 'setting/menu/list.do', 'fa fa-server', '60', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:55:57', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:55:57', null, '1'), ('588ec6332235459bbcaaec44289b3977', '评查配置', 'd571f1273bce479da2c43b3068a072ca', null, 'fa fa-wrench', '501', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 16:10:10', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-15 16:10:10', null, '1'), ('6e8c6f50dfa04104b729dd60e2a1326d', '评查案件', 'd571f1273bce479da2c43b3068a072ca', 'views/check/work/main.jsp', 'fa fa-gavel', '401', null, null, 'badge_ajpc_pc', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 16:32:17', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 16:32:17', null, '1'), ('7755393ff88440848eebcd52f2baa28c', '所有信息', '93d7a63ceaef49e09b25c4553b9ceedf', 'publish/list.do', 'fa fa-info-circle', '60', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:55:42', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:55:42', null, '1'), ('7cbb69aa88f54616858b3a003947112f', '审核案件评查', 'd571f1273bce479da2c43b3068a072ca', 'views/check/verify/main.jsp', 'fa fa-filter', '201', null, null, 'badge_ajpc_sh', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 16:31:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 16:31:12', null, '1'), ('875b89e8d5824d54ae6e3f07e0b557c6', '三精评选', '0', null, 'fa fa-thumbs-o-up', '30', null, null, 'badge_sjpx_total', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:19:58', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:19:58', null, '1'), ('8af1157b7ad144a58a285942e68f59f7', '专家管理', '4dc94fc707ab45d584e0657f02dee603', 'setting/professional/list.do', 'fa fa-black-tie', '30', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:51:39', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:51:39', null, '1'), ('93d7a63ceaef49e09b25c4553b9ceedf', '信息公开', '0', null, 'fa fa-info-circle', '50', null, null, 'badge_xxgk_total', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:20:29', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:20:29', null, '1'), ('9927f1db7cae4826b6430b99ce67cfdc', '待我查看', '93d7a63ceaef49e09b25c4553b9ceedf', 'publish/unwatch.do', 'fa fa-at', '30', null, null, 'badge_xxgk_dwck', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:54:33', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:54:33', null, '1'), ('9d463430dfc14efabba6552083a8b8d5', '字典管理', '4dc94fc707ab45d584e0657f02dee603', 'setting/dict/list.do', 'fa fa-book', '70', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:56:08', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:56:08', null, '1'), ('a4929fd64ac84f7287ca58ae00014700', '用户管理', '4dc94fc707ab45d584e0657f02dee603', 'setting/user/list.do', 'fa fa-group', '20', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:26:51', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:26:51', null, '1'), ('b3f91031ebe74772b6afe9fbb66e308b', '公告审核结果', '875b89e8d5824d54ae6e3f07e0b557c6', 'views/chosen/reject/main.jsp', 'fa fa-mail-reply', '502', null, null, 'badge_sjpx_reject', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:40:50', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-08-19 20:40:50', null, '1'), ('b67cd1663b0e4d37a2cba8edc30eab71', '所有三精评选', '875b89e8d5824d54ae6e3f07e0b557c6', 'views/chosen/all/main.jsp', 'fa fa-clone', '701', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:27:07', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:27:07', null, '1'), ('b71d8d88d32d4806b1feaff611a8febc', '分配评选案件', '875b89e8d5824d54ae6e3f07e0b557c6', 'views/chosen/distribute/main.jsp', 'fa fa-random', '303', null, null, 'badge_sjpx_fp', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-18 20:21:36', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-18 20:21:36', null, '1'), ('bb43ba78612648b3b353ae6290ab8c3d', '案件评查排名', '40118bd041334420a2614ac261a76181', 'statics/checktop.do', '20', '20', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:10:48', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:10:48', null, '1'), ('bd1b7298961946c89b607ea8520ff6f1', '角色管理', '4dc94fc707ab45d584e0657f02dee603', 'setting/role/list.do', 'fa fa-user-secret', '50', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:55:03', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:55:03', null, '1'), ('c1370458ae7c4407b6346b866e7cc818', '我的发起', '93d7a63ceaef49e09b25c4553b9ceedf', 'publish/mylist.do', 'fa fa-hand-lizard-o', '11', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:55:10', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:55:10', null, '1'), ('caad87c859aa44d2902288985161d1ef', '三精评选排名', '40118bd041334420a2614ac261a76181', 'statics/chosentop.do', null, '50', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:12:39', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:12:39', null, '1'), ('cc55c3cf191e41cdbc570d36282aae3a', '三精评选报告', '40118bd041334420a2614ac261a76181', 'statics/chosenreport.do', null, '40', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:12:19', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:12:19', null, '1'), ('cf513e6a39dd45c29f94bf03c3b1fcab', '发起案件评查', 'd571f1273bce479da2c43b3068a072ca', 'views/check/start/main.jsp', 'fa fa-plus-square-o', '101', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 16:30:43', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 16:30:43', null, '1'), ('d571f1273bce479da2c43b3068a072ca', '案件评查', '0', null, 'fa fa-balance-scale', '20', null, null, 'badge_ajpc_total', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:19:32', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-04 15:19:32', null, '1'), ('e830f2a7548b49b7a21c09115e1b0d7c', '流程配置', '4dc94fc707ab45d584e0657f02dee603', 'setting/flowconfig/list.do', 'fa fa-map-signs', '61', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-09 15:20:27', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-09 15:20:27', null, '1'), ('ed90599682a746f8942f00050dcc8545', '我发起的评选', '875b89e8d5824d54ae6e3f07e0b557c6', 'views/chosen/my/main.jsp', 'fa fa-square-o', '601', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:26:55', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:26:55', null, '1'), ('f431758e9c8b44bb8d54492199f3f3d5', '案件评查统计', '40118bd041334420a2614ac261a76181', 'statics/checkdata.do', null, '30', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:11:10', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:11:10', null, '1'), ('f7bc3d3d151d4cebac94e36df1a20dd1', '评分表模板', '17f9306193664001b53c8b2fa2caaf65', 'views/check/configscore/main.jsp?type=2', null, '10', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:09:56', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:09:56', null, '1'), ('f961991ede0145b6b9a7139963f19093', '案件评查报告', '40118bd041334420a2614ac261a76181', 'statics/checkreport.do', '10', null, null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:10:20', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-21 21:10:20', null, '1'), ('ff4438a1d52940c5a5462ac17cfd3eeb', '发布信息', '93d7a63ceaef49e09b25c4553b9ceedf', 'publish/input.do', 'fa fa-edit', '10', null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:54:13', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-16 10:54:13', null, '1');
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
  `fjm` varchar(100) DEFAULT NULL,
  `fydm` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`zzjgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构表';

-- ----------------------------
--  Records of `sd_organization`
-- ----------------------------
BEGIN;
INSERT INTO `sd_organization` VALUES ('1', '安徽省高级人民法院', '0', null, null, null, null, null, '1', 'false', 'C00', '340000'), ('10', '合肥高新技术产业开发区人民法院', '2', null, null, null, null, null, '1', 'false', 'C18', '340141'), ('100', '安徽省枞阳县人民法院（安庆）', '94', null, null, null, null, null, '1', 'false', 'C86', '340823'), ('101', '安徽省潜山县人民法院', '94', null, null, null, null, null, '1', 'false', 'C87', '340824'), ('102', '安徽省太湖县人民法院', '94', null, null, null, null, null, '1', 'false', 'C88', '340825'), ('103', '安徽省宿松县人民法院', '94', null, null, null, null, null, '1', 'false', 'C89', '340826'), ('104', '安徽省望江县人民法院', '94', null, null, null, null, null, '1', 'false', 'C8A', '340827'), ('105', '安徽省岳西县人民法院', '94', null, null, null, null, null, '1', 'false', 'C8B', '340828'), ('106', '滁州市中级人民法院', '1', null, null, null, null, null, '1', 'false', 'CC0', '341100'), ('107', '滁州市琅琊区人民法院', '106', null, null, null, null, null, '1', 'false', 'CC1', '341101'), ('108', '滁州市南谯区人民法院', '106', null, null, null, null, null, '1', 'false', 'CC8', '341103'), ('109', '天长市人民法院', '106', null, null, null, null, null, '1', 'false', 'CC2', '341111'), ('11', '巢湖市人民法院', '2', null, null, null, null, null, '1', 'false', 'C19', '340192'), ('110', '明光市人民法院', '106', null, null, null, null, null, '1', 'false', 'CC7', '341112'), ('111', '安徽省来安县人民法院', '106', null, null, null, null, null, '1', 'false', 'CC3', '341121'), ('112', '安徽省全椒县人民法院', '106', null, null, null, null, null, '1', 'false', 'CC4', '341122'), ('113', '安徽省定远县人民法院', '106', null, null, null, null, null, '1', 'false', 'CC5', '341123'), ('114', '安徽省凤阳县人民法院', '106', null, null, null, null, null, '1', 'false', 'CC6', '341124'), ('115', '安徽省六安地区公检法军事管制组', '1', null, null, null, null, null, '1', 'false', 'CD0', '342400'), ('116', '六安市金安区人民法院', '115', null, null, null, null, null, '1', 'false', 'CD1', '342401'), ('117', '安徽省寿县人民法院（六安）', '115', null, null, null, null, null, '1', 'false', 'CD2', '342422'), ('118', '安徽省霍邱县人民法院', '115', null, null, null, null, null, '1', 'false', 'CD3', '342423'), ('119', '安徽省舒城县人民法院', '115', null, null, null, null, null, '1', 'false', 'CD4', '342425'), ('12', '安徽省庐江县人民法院', '2', null, null, null, null, null, '1', 'false', 'C1A', '340193'), ('120', '安徽省金寨县人民法院', '115', null, null, null, null, null, '1', 'false', 'CD5', '342426'), ('121', '安徽省霍山县人民法院', '115', null, null, null, null, null, '1', 'false', 'CD6', '342427'), ('122', '六安市裕安区人民法院', '115', null, null, null, null, null, '1', 'false', 'CD7', '342428'), ('123', '六安市叶集区人民法院', '115', null, null, null, null, null, '1', 'false', 'CD8', '342429'), ('124', '宣城市中级人民法院', '1', null, null, null, null, null, '1', 'false', 'CE0', '342500'), ('125', '宣城市宣州区人民法院', '124', null, null, null, null, null, '1', 'false', 'CE1', '342501'), ('126', '安徽省郎溪县人民法院', '124', null, null, null, null, null, '1', 'false', 'CE2', '342522'), ('127', '安徽省广德县人民法院', '124', null, null, null, null, null, '1', 'false', 'CE3', '342523'), ('128', '宁国市人民法院', '124', null, null, null, null, null, '1', 'false', 'CE4', '342524'), ('129', '安徽省绩溪县人民法院', '124', null, null, null, null, null, '1', 'false', 'CE5', '342526'), ('13', '合肥铁路运输法院', '2', null, null, null, null, null, '1', 'false', 'C1B', '340194'), ('130', '安徽省旌德县人民法院', '124', null, null, null, null, null, '1', 'false', 'CE6', '342527'), ('131', '安徽省泾县人民法院', '124', null, null, null, null, null, '1', 'false', 'CE7', '342529'), ('14', '马鞍山市中级人民法院', '1', null, null, null, null, null, '1', 'false', 'C50', '340500'), ('15', '马鞍山市博望区人民法院', '14', null, null, null, null, null, '1', 'false', 'C57', '340502'), ('16', '马鞍山市花山区人民法院', '14', null, null, null, null, null, '1', 'false', 'C52', '340503'), ('17', '马鞍山市雨山区人民法院', '14', null, null, null, null, null, '1', 'false', 'C53', '340504'), ('18', '安徽省当涂县人民法院', '14', null, null, null, null, null, '1', 'false', 'C54', '340521'), ('19', '安徽省含山县人民法院', '14', null, null, null, null, null, '1', 'false', 'C55', '340591'), ('2', '合肥市中级人民法院', '1', null, null, null, null, null, '1', 'false', 'C10', '340100'), ('20', '安徽省和县人民法院', '14', null, null, null, null, null, '1', 'false', 'C56', '340592'), ('21', '铜陵市中级人民法院', '1', null, null, null, null, null, '1', 'false', 'C70', '340700'), ('22', '铜陵市铜官山区人民法院(铜陵市）', '21', null, null, null, null, null, '1', 'false', 'C71', '340702'), ('23', '铜陵市狮子山区人民法院(铜陵市）', '21', null, null, null, null, null, '1', 'false', 'C72', '340703'), ('24', '铜陵市铜官区人民法院', '21', null, null, null, null, null, '1', 'false', 'C76', '340705'), ('25', '铜陵市义安区人民法院', '21', null, null, null, null, null, '1', 'false', 'C74', '340706'), ('26', '铜陵市郊区人民法院', '21', null, null, null, null, null, '1', 'false', 'C73', '340711'), ('27', '安徽省铜陵县人民法院(铜陵市）', '21', null, null, null, null, null, '1', 'false', 'C77', '340721'), ('28', '安徽省枞阳县人民法院', '21', null, null, null, null, null, '1', 'false', 'C75', '340722'), ('29', '黄山市中级人民法院', '1', null, null, null, null, null, '1', 'false', 'C90', '341000'), ('3', '合肥市瑶海区人民法院', '2', null, null, null, null, null, '1', 'false', 'C11', '340102'), ('30', '黄山市黄山区人民法院', '29', null, null, null, null, null, '1', 'false', 'C91', '341001'), ('31', '黄山市屯溪区人民法院', '29', null, null, null, null, null, '1', 'false', 'C92', '341002'), ('32', '黄山市徽州区人民法院', '29', null, null, null, null, null, '1', 'false', 'C93', '341003'), ('33', '安徽省歙县人民法院', '29', null, null, null, null, null, '1', 'false', 'C94', '341021'), ('34', '安徽省休宁县人民法院', '29', null, null, null, null, null, '1', 'false', 'C95', '341022'), ('35', '安徽省黟县人民法院', '29', null, null, null, null, null, '1', 'false', 'C96', '341023'), ('36', '安徽省祁门县人民法院', '29', null, null, null, null, null, '1', 'false', 'C97', '341024'), ('37', '池州市中级人民法院', '1', null, null, null, null, null, '1', 'false', 'CG0', '342800'), ('38', '池州市贵池区人民法院', '37', null, null, null, null, null, '1', 'false', 'CG1', '342811'), ('39', '安徽省东至县人民法院', '37', null, null, null, null, null, '1', 'false', 'CG2', '342821'), ('4', '合肥市庐阳区人民法院', '2', null, null, null, null, null, '1', 'false', 'C12', '340103'), ('40', '安徽省石台县人民法院', '37', null, null, null, null, null, '1', 'false', 'CG3', '342822'), ('41', '安徽省青阳县人民法院', '37', null, null, null, null, null, '1', 'false', 'CG4', '342823'), ('42', '安徽省九华山风景区人民法院', '37', null, null, null, null, null, '1', 'false', 'CG5', '342831'), ('43', '蚌埠市中级人民法院', '1', null, null, null, null, null, '1', 'false', 'C30', '340300'), ('44', '蚌埠市龙子湖区人民法院', '43', null, null, null, null, null, '1', 'false', 'C31', '340302'), ('45', '蚌埠市蚌山区人民法院', '43', null, null, null, null, null, '1', 'false', 'C32', '340303'), ('46', '蚌埠市禹会区人民法院', '43', null, null, null, null, null, '1', 'false', 'C33', '340304'), ('47', '蚌埠市淮上区人民法院', '43', null, null, null, null, null, '1', 'false', 'C34', '340311'), ('48', '安徽省怀远县人民法院', '43', null, null, null, null, null, '1', 'false', 'C35', '340321'), ('49', '安徽省五河县人民法院', '43', null, null, null, null, null, '1', 'false', 'C36', '340322'), ('5', '合肥市蜀山区人民法院', '2', null, null, null, null, null, '1', 'false', 'C13', '340104'), ('50', '安徽省固镇县人民法院', '43', null, null, null, null, null, '1', 'false', 'C37', '340323'), ('51', '淮南市中级人民法院', '1', null, null, null, null, null, '1', 'false', 'C40', '340400'), ('52', '淮南市大通区人民法院', '51', null, null, null, null, null, '1', 'false', 'C41', '340402'), ('53', '淮南市田家庵区人民法院', '51', null, null, null, null, null, '1', 'false', 'C42', '340403'), ('54', '淮南市谢家集区人民法院', '51', null, null, null, null, null, '1', 'false', 'C43', '340404'), ('55', '淮南市八公山区人民法院', '51', null, null, null, null, null, '1', 'false', 'C44', '340405'), ('56', '淮南市潘集区人民法院', '51', null, null, null, null, null, '1', 'false', 'C45', '340406'), ('57', '安徽省凤台县人民法院', '51', null, null, null, null, null, '1', 'false', 'C46', '340421'), ('58', '安徽省寿县人民法院', '51', null, null, null, null, null, '1', 'false', 'C47', '340422'), ('59', '淮北市中级人民法院', '1', null, null, null, null, null, '1', 'false', 'C60', '340600'), ('6', '合肥市包河区人民法院', '2', null, null, null, null, null, '1', 'false', 'C14', '340111'), ('60', '淮北市杜集区人民法院', '59', null, null, null, null, null, '1', 'false', 'C61', '340602'), ('61', '淮北市相山区人民法院', '59', null, null, null, null, null, '1', 'false', 'C62', '340603'), ('62', '淮北市烈山区人民法院', '59', null, null, null, null, null, '1', 'false', 'C63', '340604'), ('63', '安徽省濉溪县人民法院', '59', null, null, null, null, null, '1', 'false', 'C64', '340621'), ('64', '阜阳市中级人民法院', '1', null, null, null, null, null, '1', 'false', 'CA0', '341200'), ('65', '阜阳市颍州区人民法院', '64', null, null, null, null, null, '1', 'false', 'CA1', '341203'), ('66', '界首市人民法院', '64', null, null, null, null, null, '1', 'false', 'CA2', '341213'), ('67', '安徽省临泉县人民法院', '64', null, null, null, null, null, '1', 'false', 'CA3', '341222'), ('68', '安徽省太和县人民法院', '64', null, null, null, null, null, '1', 'false', 'CA4', '341223'), ('69', '安徽省阜南县人民法院', '64', null, null, null, null, null, '1', 'false', 'CA7', '341227'), ('7', '安徽省长丰县人民法院', '2', null, null, null, null, null, '1', 'false', 'C15', '340121'), ('70', '安徽省颍上县人民法院', '64', null, null, null, null, null, '1', 'false', 'CA8', '341228'), ('71', '阜阳市颍东区人民法院', '64', null, null, null, null, null, '1', 'false', 'CAB', '341229'), ('72', '阜阳市颍泉区人民法院', '64', null, null, null, null, null, '1', 'false', 'CAC', '341230'), ('73', '宿州市中级人民法院', '1', null, null, null, null, null, '1', 'false', 'CB0', '342200'), ('74', '宿州市埇桥区人民法院', '73', null, null, null, null, null, '1', 'false', 'CB1', '342201'), ('75', '安徽省砀山县人民法院', '73', null, null, null, null, null, '1', 'false', 'CB2', '342221'), ('76', '安徽省萧县人民法院', '73', null, null, null, null, null, '1', 'false', 'CB3', '342222'), ('77', '安徽省灵璧县人民法院', '73', null, null, null, null, null, '1', 'false', 'CB4', '342224'), ('78', '安徽省泗县人民法院', '73', null, null, null, null, null, '1', 'false', 'CB5', '342225'), ('79', '亳州市中级人民法院', '1', null, null, null, null, null, '1', 'false', 'CH0', '342900'), ('8', '安徽省肥东县人民法院', '2', null, null, null, null, null, '1', 'false', 'C16', '340122'), ('80', '亳州市谯城区人民法院', '79', null, null, null, null, null, '1', 'false', 'CH1', '342901'), ('81', '安徽省涡阳县人民法院', '79', null, null, null, null, null, '1', 'false', 'CH2', '342902'), ('82', '安徽省蒙城县人民法院', '79', null, null, null, null, null, '1', 'false', 'CH3', '342903'), ('83', '安徽省利辛县人民法院', '79', null, null, null, null, null, '1', 'false', 'CH4', '342904'), ('84', '芜湖市中级人民法院', '1', null, null, null, null, null, '1', 'false', 'C20', '340200'), ('85', '芜湖市镜湖区人民法院', '84', null, null, null, null, null, '1', 'false', 'C21', '340202'), ('86', '芜湖市弋江区人民法院', '84', null, null, null, null, null, '1', 'false', 'C22', '340203'), ('87', '芜湖市鸠江区人民法院', '84', null, null, null, null, null, '1', 'false', 'C24', '340205'), ('88', '安徽省芜湖县人民法院', '84', null, null, null, null, null, '1', 'false', 'C25', '340221'), ('89', '安徽省繁昌县人民法院', '84', null, null, null, null, null, '1', 'false', 'C26', '340222'), ('9', '安徽省肥西县人民法院', '2', null, null, null, null, null, '1', 'false', 'C17', '340123'), ('90', '安徽省南陵县人民法院', '84', null, null, null, null, null, '1', 'false', 'C27', '340223'), ('91', '芜湖市三山区人民法院', '84', null, null, null, null, null, '1', 'false', 'C28', '340224'), ('92', '安徽省芜湖经济技术开发区人民法院', '84', null, null, null, null, null, '1', 'false', 'C2A', '340231'), ('93', '安徽省无为县人民法院', '84', null, null, null, null, null, '1', 'false', 'C29', '340291'), ('94', '安庆市中级人民法院', '1', null, null, null, null, null, '1', 'false', 'C80', '340800'), ('95', '安庆市迎江区人民法院', '94', null, null, null, null, null, '1', 'false', 'C81', '340802'), ('96', '安庆市大观区人民法院', '94', null, null, null, null, null, '1', 'false', 'C82', '340803'), ('97', '安庆市宜秀区人民法院', '94', null, null, null, null, null, '1', 'false', 'C83', '340811'), ('98', '桐城市人民法院', '94', null, null, null, null, null, '1', 'false', 'C84', '340821'), ('99', '安徽省怀宁县人民法院', '94', null, null, null, null, null, '1', 'false', 'C85', '340822');
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
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
--  Records of `sd_role`
-- ----------------------------
BEGIN;
INSERT INTO `sd_role` VALUES ('04bce07d8ecb4fb9beb3fcdeae8abedb', '基础功能角色', '拥有系统的最基础功能权限。', null, '2017-08-21 10:14:36', null, '2017-08-21 10:14:36', null, null, '0'), ('33b8bf7b36554b9ba7c8841a81c33f70', '案件评查活动审核人', '对案件评查活动的审核进行决策。', null, '2017-08-21 09:37:17', null, '2017-08-21 09:37:17', null, null, '3'), ('44089ff891fe40fa85407b3bc78ca822', '统计分析模块', '拥有统计分析产生的报表查看权限。', null, '2017-08-21 10:22:00', null, '2017-08-21 10:22:00', null, null, '11'), ('45e9cbedabbb4d308428572ba84ad2f0', '系统管理员', '对系统所有模块拥有权限，包括组织机构，用户账户，专家管理，工作流程等。', null, '2016-11-15 14:05:11', null, '2016-11-15 14:05:11', null, null, '1'), ('5d54781cd28443aab04ea502be8b8495', '信息公告管理员', '信息公告的发布与管理。', null, '2017-08-21 10:00:29', null, '2017-08-21 10:00:29', null, null, '9'), ('6a5ffc10493048bc881a5ab0ab6a7acd', '信息公告审核人', '信息公告的审核决策。', null, '2017-08-21 10:01:00', null, '2017-08-21 10:01:00', null, null, '10'), ('856fbd2cc1ba460d9cf7232b7dc3608c', '三精评选活动审核人', '对三精评选活动的审核进行决策。', null, '2017-08-21 09:41:13', null, '2017-08-21 09:41:13', null, null, '6'), ('bc5133bb2a1d41d48f451a3c17248ed3', '三精评选活动管理员', '对三精评选活动的发起，公告，填报，分配，评选，统计等过程管控。', null, '2017-08-21 09:40:13', null, '2017-08-21 09:40:13', null, null, '5'), ('d1ff43ffb2f744cc9398a2a7dbdb7689', '三精选项配置管理员', '负责评分表配置、及查看所有案件评选权限。', null, '2017-08-21 10:06:01', null, '2017-08-21 10:06:01', null, null, '7'), ('d46a2980811948519d50e359bf81b61d', '案件评查活动管理员', '对案件评查活动的发起，抽案，分案，公告，评查，统计等功能进行管理', null, '2017-08-21 09:36:38', null, '2017-08-21 09:36:38', null, null, '2'), ('dcf1fae5cc914828a8417d279b70fedc', '三精案例填报人', '负责各地区三精评选案件的填报。', null, '2017-08-21 10:13:17', null, '2017-08-21 10:13:17', null, null, '8'), ('df2480728a1047cf8733daac686ded50', '案件评查配置管理员', '负责评分表配置、及查看所有案件评查权限。', null, '2017-08-21 10:05:34', null, '2017-08-21 10:05:34', null, null, '4');
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
INSERT INTO `sd_role_menu` VALUES ('11cce286be1b425ba4516fff95ff14cc', '82edfdf15b894f9b8a5c35fb302924f6', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 13:49:33', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-08 13:49:33', null, '1'), ('11cce286be1b425ba4516fff95ff14cc', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('d571f1273bce479da2c43b3068a072ca', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('126726c607984b18a07221b858127a40', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('13f7fb9a8b4a41caba4f950791aff45e', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('efec8efb775743b086afa7939ead0f32', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('309bf72e10d64b13839242e8800145be', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('d1a2fb4b84474132b171f5d2f7863334', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('450c5ed39b2f403e860b2b3f3e9dae05', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('aca6eb7d6b3b47d390f90e7cafde2c1d', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('cc1910b66fdd413eb8225045d4c0409e', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('89969121ce194ffda12c2e30e103f08c', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('056de10f22fd419882b828877361cc66', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('71f34484e71f4c98acf097c3f6c75c81', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('6307238c678e473297c2c7c200857db6', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('588ec6332235459bbcaaec44289b3977', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('2317882e44984ea9a51a3b4c748e52c6', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('168bc4244c524d2daaa6750514f231ed', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('875b89e8d5824d54ae6e3f07e0b557c6', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('7c34e9a57e954d17bbf75ee821401342', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('efe32bf653a349fbb620a01fad1e50e7', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('395dc8c5ff0241019bb005185a247975', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('91c13c44ee77442183f28d964a53d053', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('9f63254fd83c4ce2b08c2fcd4d086e3b', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('103a07e57f3741909f54e2b60e5c5be5', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('96e1b96208514ca1bc39db3523ee432c', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('135b95088ab74c098be63e68494d61f1', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('eb7a02890237472c805243a00fb32424', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('316a2a9587f74c09ae696345049a976e', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('e406a4d23cca435aa8dadb77ee33f6a8', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('e57ff83f54dc453ebaaeb13af56303e8', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('17f9306193664001b53c8b2fa2caaf65', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('f7bc3d3d151d4cebac94e36df1a20dd1', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('40118bd041334420a2614ac261a76181', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('f961991ede0145b6b9a7139963f19093', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('bb43ba78612648b3b353ae6290ab8c3d', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('f431758e9c8b44bb8d54492199f3f3d5', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('cc55c3cf191e41cdbc570d36282aae3a', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('caad87c859aa44d2902288985161d1ef', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('93d7a63ceaef49e09b25c4553b9ceedf', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('ff4438a1d52940c5a5462ac17cfd3eeb', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('c1370458ae7c4407b6346b866e7cc818', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('474ae47f06d14743841482945c302c37', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('9927f1db7cae4826b6430b99ce67cfdc', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('24b456b326e2414f815465cdc11d6bce', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('7755393ff88440848eebcd52f2baa28c', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('4dc94fc707ab45d584e0657f02dee603', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('11ad72a65ace4f79b730061c2e80d3ad', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('a4929fd64ac84f7287ca58ae00014700', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('8af1157b7ad144a58a285942e68f59f7', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('14036c102e4542599ac379afc3b9aafd', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('bd1b7298961946c89b607ea8520ff6f1', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('51fcd89a5bf048828fb885848d2fea65', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('e830f2a7548b49b7a21c09115e1b0d7c', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('9d463430dfc14efabba6552083a8b8d5', 'b43260db409c413aa7098975398f45db', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:55:21', null, '1'), ('11cce286be1b425ba4516fff95ff14cc', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('d571f1273bce479da2c43b3068a072ca', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('cf513e6a39dd45c29f94bf03c3b1fcab', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('7cbb69aa88f54616858b3a003947112f', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('3433a7284d2a40a88d87a7b233b735cf', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('6e8c6f50dfa04104b729dd60e2a1326d', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('588ec6332235459bbcaaec44289b3977', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('2317882e44984ea9a51a3b4c748e52c6', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('168bc4244c524d2daaa6750514f231ed', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('415249a0463a43cca8612bcec0becc16', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('05d919a0acb44ad3870f86a450b713a1', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('875b89e8d5824d54ae6e3f07e0b557c6', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('50167662bd9544f3a9cefcaac3d2eedc', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('506b3a3335b8430d85153646ef0016b2', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('08c50fda5959494080952a673cd286e4', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('3404112a7945448395b674dbc98c3b64', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('3ec7f02da78244b788d763e396fcb30a', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('17f9306193664001b53c8b2fa2caaf65', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('f7bc3d3d151d4cebac94e36df1a20dd1', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('ed90599682a746f8942f00050dcc8545', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('b67cd1663b0e4d37a2cba8edc30eab71', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('40118bd041334420a2614ac261a76181', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('f961991ede0145b6b9a7139963f19093', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('bb43ba78612648b3b353ae6290ab8c3d', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('f431758e9c8b44bb8d54492199f3f3d5', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('cc55c3cf191e41cdbc570d36282aae3a', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('caad87c859aa44d2902288985161d1ef', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('93d7a63ceaef49e09b25c4553b9ceedf', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('ff4438a1d52940c5a5462ac17cfd3eeb', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('c1370458ae7c4407b6346b866e7cc818', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('474ae47f06d14743841482945c302c37', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('9927f1db7cae4826b6430b99ce67cfdc', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('24b456b326e2414f815465cdc11d6bce', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('7755393ff88440848eebcd52f2baa28c', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('4dc94fc707ab45d584e0657f02dee603', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('11ad72a65ace4f79b730061c2e80d3ad', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('a4929fd64ac84f7287ca58ae00014700', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('8af1157b7ad144a58a285942e68f59f7', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('14036c102e4542599ac379afc3b9aafd', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('bd1b7298961946c89b607ea8520ff6f1', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('51fcd89a5bf048828fb885848d2fea65', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('e830f2a7548b49b7a21c09115e1b0d7c', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('9d463430dfc14efabba6552083a8b8d5', '066cd508c2c2430996085eb4bfc26db3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-16 17:28:00', null, '1'), ('11cce286be1b425ba4516fff95ff14cc', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('d571f1273bce479da2c43b3068a072ca', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('cf513e6a39dd45c29f94bf03c3b1fcab', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('7cbb69aa88f54616858b3a003947112f', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('3433a7284d2a40a88d87a7b233b735cf', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('6e8c6f50dfa04104b729dd60e2a1326d', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('588ec6332235459bbcaaec44289b3977', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('2317882e44984ea9a51a3b4c748e52c6', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('168bc4244c524d2daaa6750514f231ed', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('2a65d288e487479d94080e20e66f2849', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('415249a0463a43cca8612bcec0becc16', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('05d919a0acb44ad3870f86a450b713a1', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('875b89e8d5824d54ae6e3f07e0b557c6', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('50167662bd9544f3a9cefcaac3d2eedc', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('506b3a3335b8430d85153646ef0016b2', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('08c50fda5959494080952a673cd286e4', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('3404112a7945448395b674dbc98c3b64', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('b71d8d88d32d4806b1feaff611a8febc', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('3ec7f02da78244b788d763e396fcb30a', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('17f9306193664001b53c8b2fa2caaf65', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('f7bc3d3d151d4cebac94e36df1a20dd1', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('b3f91031ebe74772b6afe9fbb66e308b', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('ed90599682a746f8942f00050dcc8545', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('b67cd1663b0e4d37a2cba8edc30eab71', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('40118bd041334420a2614ac261a76181', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('f961991ede0145b6b9a7139963f19093', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('bb43ba78612648b3b353ae6290ab8c3d', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('f431758e9c8b44bb8d54492199f3f3d5', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('cc55c3cf191e41cdbc570d36282aae3a', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('caad87c859aa44d2902288985161d1ef', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('93d7a63ceaef49e09b25c4553b9ceedf', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('ff4438a1d52940c5a5462ac17cfd3eeb', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('c1370458ae7c4407b6346b866e7cc818', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('474ae47f06d14743841482945c302c37', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('9927f1db7cae4826b6430b99ce67cfdc', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('24b456b326e2414f815465cdc11d6bce', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('7755393ff88440848eebcd52f2baa28c', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('4dc94fc707ab45d584e0657f02dee603', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('11ad72a65ace4f79b730061c2e80d3ad', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('a4929fd64ac84f7287ca58ae00014700', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('8af1157b7ad144a58a285942e68f59f7', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('14036c102e4542599ac379afc3b9aafd', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('bd1b7298961946c89b607ea8520ff6f1', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('51fcd89a5bf048828fb885848d2fea65', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('e830f2a7548b49b7a21c09115e1b0d7c', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('9d463430dfc14efabba6552083a8b8d5', '45e9cbedabbb4d308428572ba84ad2f0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-19 20:41:12', null, '1'), ('11cce286be1b425ba4516fff95ff14cc', '04bce07d8ecb4fb9beb3fcdeae8abedb', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', null, '1'), ('d571f1273bce479da2c43b3068a072ca', '04bce07d8ecb4fb9beb3fcdeae8abedb', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', null, '1'), ('3433a7284d2a40a88d87a7b233b735cf', '04bce07d8ecb4fb9beb3fcdeae8abedb', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', null, '1'), ('6e8c6f50dfa04104b729dd60e2a1326d', '04bce07d8ecb4fb9beb3fcdeae8abedb', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', null, '1'), ('875b89e8d5824d54ae6e3f07e0b557c6', '04bce07d8ecb4fb9beb3fcdeae8abedb', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', null, '1'), ('08c50fda5959494080952a673cd286e4', '04bce07d8ecb4fb9beb3fcdeae8abedb', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', null, '1'), ('3ec7f02da78244b788d763e396fcb30a', '04bce07d8ecb4fb9beb3fcdeae8abedb', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', null, '1'), ('93d7a63ceaef49e09b25c4553b9ceedf', '04bce07d8ecb4fb9beb3fcdeae8abedb', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', null, '1'), ('9927f1db7cae4826b6430b99ce67cfdc', '04bce07d8ecb4fb9beb3fcdeae8abedb', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', null, '1'), ('24b456b326e2414f815465cdc11d6bce', '04bce07d8ecb4fb9beb3fcdeae8abedb', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:15:56', null, '1'), ('40118bd041334420a2614ac261a76181', '44089ff891fe40fa85407b3bc78ca822', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:28', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:28', null, '1'), ('f961991ede0145b6b9a7139963f19093', '44089ff891fe40fa85407b3bc78ca822', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:28', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:28', null, '1'), ('bb43ba78612648b3b353ae6290ab8c3d', '44089ff891fe40fa85407b3bc78ca822', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:28', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:28', null, '1'), ('f431758e9c8b44bb8d54492199f3f3d5', '44089ff891fe40fa85407b3bc78ca822', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:28', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:28', null, '1'), ('cc55c3cf191e41cdbc570d36282aae3a', '44089ff891fe40fa85407b3bc78ca822', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:28', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:28', null, '1'), ('caad87c859aa44d2902288985161d1ef', '44089ff891fe40fa85407b3bc78ca822', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:28', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:28', null, '1'), ('93d7a63ceaef49e09b25c4553b9ceedf', '6a5ffc10493048bc881a5ab0ab6a7acd', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:50', null, '1'), ('474ae47f06d14743841482945c302c37', '6a5ffc10493048bc881a5ab0ab6a7acd', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:50', null, '1'), ('7755393ff88440848eebcd52f2baa28c', '6a5ffc10493048bc881a5ab0ab6a7acd', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:22:50', null, '1'), ('93d7a63ceaef49e09b25c4553b9ceedf', '5d54781cd28443aab04ea502be8b8495', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:06', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:06', null, '1'), ('ff4438a1d52940c5a5462ac17cfd3eeb', '5d54781cd28443aab04ea502be8b8495', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:06', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:06', null, '1'), ('c1370458ae7c4407b6346b866e7cc818', '5d54781cd28443aab04ea502be8b8495', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:06', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:06', null, '1'), ('875b89e8d5824d54ae6e3f07e0b557c6', 'dcf1fae5cc914828a8417d279b70fedc', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:37', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:37', null, '1'), ('3404112a7945448395b674dbc98c3b64', 'dcf1fae5cc914828a8417d279b70fedc', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:37', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:37', null, '1'), ('875b89e8d5824d54ae6e3f07e0b557c6', 'd1ff43ffb2f744cc9398a2a7dbdb7689', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:49', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:49', null, '1'), ('17f9306193664001b53c8b2fa2caaf65', 'd1ff43ffb2f744cc9398a2a7dbdb7689', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:49', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:49', null, '1'), ('f7bc3d3d151d4cebac94e36df1a20dd1', 'd1ff43ffb2f744cc9398a2a7dbdb7689', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:49', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:49', null, '1'), ('b67cd1663b0e4d37a2cba8edc30eab71', 'd1ff43ffb2f744cc9398a2a7dbdb7689', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:49', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:49', null, '1'), ('875b89e8d5824d54ae6e3f07e0b557c6', '856fbd2cc1ba460d9cf7232b7dc3608c', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:55', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:55', null, '1'), ('506b3a3335b8430d85153646ef0016b2', '856fbd2cc1ba460d9cf7232b7dc3608c', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:55', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:23:55', null, '1'), ('875b89e8d5824d54ae6e3f07e0b557c6', 'bc5133bb2a1d41d48f451a3c17248ed3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:13', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:13', null, '1'), ('50167662bd9544f3a9cefcaac3d2eedc', 'bc5133bb2a1d41d48f451a3c17248ed3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:13', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:13', null, '1'), ('b71d8d88d32d4806b1feaff611a8febc', 'bc5133bb2a1d41d48f451a3c17248ed3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:13', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:13', null, '1'), ('b3f91031ebe74772b6afe9fbb66e308b', 'bc5133bb2a1d41d48f451a3c17248ed3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:13', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:13', null, '1'), ('ed90599682a746f8942f00050dcc8545', 'bc5133bb2a1d41d48f451a3c17248ed3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:13', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:13', null, '1'), ('d571f1273bce479da2c43b3068a072ca', 'df2480728a1047cf8733daac686ded50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:45', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:45', null, '1'), ('588ec6332235459bbcaaec44289b3977', 'df2480728a1047cf8733daac686ded50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:45', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:45', null, '1'), ('2317882e44984ea9a51a3b4c748e52c6', 'df2480728a1047cf8733daac686ded50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:45', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:45', null, '1'), ('168bc4244c524d2daaa6750514f231ed', 'df2480728a1047cf8733daac686ded50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:45', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:45', null, '1'), ('05d919a0acb44ad3870f86a450b713a1', 'df2480728a1047cf8733daac686ded50', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:45', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-21 10:24:45', null, '1'), ('d571f1273bce479da2c43b3068a072ca', '33b8bf7b36554b9ba7c8841a81c33f70', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-08-21 10:26:41', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-08-21 10:26:41', null, '1'), ('7cbb69aa88f54616858b3a003947112f', '33b8bf7b36554b9ba7c8841a81c33f70', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-08-21 10:26:41', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-08-21 10:26:41', null, '1'), ('d571f1273bce479da2c43b3068a072ca', 'd46a2980811948519d50e359bf81b61d', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-08-21 10:26:53', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-08-21 10:26:53', null, '1'), ('cf513e6a39dd45c29f94bf03c3b1fcab', 'd46a2980811948519d50e359bf81b61d', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-08-21 10:26:53', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-08-21 10:26:53', null, '1'), ('2a65d288e487479d94080e20e66f2849', 'd46a2980811948519d50e359bf81b61d', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-08-21 10:26:53', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-08-21 10:26:53', null, '1'), ('415249a0463a43cca8612bcec0becc16', 'd46a2980811948519d50e359bf81b61d', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-08-21 10:26:53', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-08-21 10:26:53', null, '1');
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
INSERT INTO `sd_user` VALUES ('eaf34bcf8ba945598067b7f88fad0099', 'sysadmin', 'Lvrenzhao@FY', '45e9cbedabbb4d308428572ba84ad2f0', '1', '5306735@qq.com', '152917543b3246f2a25c9b7980b2608d', null, '18156016715', '吕仁钊', '1', '', '', 'b99f97d09f364b5eb0db29fd89c10f11', '2016-10-24 17:06:52', 'b99f97d09f364b5eb0db29fd89c10f11', '2017-10-17 13:24:44', '(勿删!)超级系统管理员', '1');
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

-- ----------------------------
--  Function structure for `fn_get_sfzhyb`
-- ----------------------------
DROP FUNCTION IF EXISTS `fn_get_sfzhyb`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_sfzhyb`(`plcmk` varchar(12),`plcbb` int(5),`pbzxh` int(5)) RETURNS int(11)
BEGIN
	DECLARE a INT(1); 
SELECT if(MAX(sfc.bzxh )=pbzxh,1,0) INTO a FROM sd_flow_config sfc WHERE sfc.lcmk=plcmk AND sfc.lcbb = plcbb;
	RETURN a;
END
 ;;
delimiter ;

-- ----------------------------
--  Function structure for `fn_get_username`
-- ----------------------------
DROP FUNCTION IF EXISTS `fn_get_username`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_username`(`context` varchar(1000)) RETURNS varchar(500) CHARSET utf8
BEGIN
DECLARE groupname VARCHAR(1000) DEFAULT '';
DECLARE groupitem VARCHAR(255) DEFAULT '';
DECLARE valuetext VARCHAR(255) DEFAULT '';
DECLARE charindex int(11);

WHILE(length(context) <> length(REPLACE(context,';',''))) DO
SET charindex = LOCATE(';',context);
SET valuetext = SUBSTR(context,1,charindex-1);
SET context = SUBSTR(context,charindex+1);
SET groupitem = valuetext;
SELECT sd_user.xm INTO groupitem FROM sd_user WHERE sd_user.yhid = valuetext;
SET groupname = CONCAT(groupname,groupitem);
SET groupname = CONCAT(groupname,';');
END WHILE;

SET groupitem = context;
SELECT sd_user.xm INTO groupitem FROM sd_user WHERE sd_user.yhid = context;
SET groupname = CONCAT(groupname,groupitem);

RETURN groupname;  
END
 ;;
delimiter ;

-- ----------------------------
--  Function structure for `get_uuid`
-- ----------------------------
DROP FUNCTION IF EXISTS `get_uuid`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_uuid`() RETURNS varchar(32) CHARSET utf8
BEGIN
	RETURN REPLACE(UUID(),'-','');
END
 ;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
