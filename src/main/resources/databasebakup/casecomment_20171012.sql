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

 Date: 10/12/2017 10:42:54 AM
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
--  Records of `WS_TASK`
-- ----------------------------
BEGIN;
INSERT INTO `WS_TASK` VALUES ('0245c4dd79f34b21adf40d8d96366840', 'A1', '2017-10-11 17:02:51', null, null, null, null, null);
COMMIT;

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
--  Records of `bd_check`
-- ----------------------------
BEGIN;
INSERT INTO `bd_check` VALUES ('1', 'testbt', null, null, null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', 'dasdas', '2', null, null, null, null, null, '1'), ('137ed49dff184cb1b11b37a11c806af4', 'kkkkk', 'black', '常规评查', '案件', '1', 'xxxxxslksfmaklsm<div>asdkalsd</div><div>dsadkasl</div>', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 00:00:00', 'dasdas', '2', null, null, null, null, null, null), ('2711a44269d048d296e7a3a11ed2b12f', 'oktest1', 'red', '重点评查', '庭审', '1', 'oktest1', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', '', '0', null, null, null, null, null, null), ('3398ac2c97df4a669edeff056fea32f4', '超级公告1', 'black', '常规评查', '案件', '1', '12312', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-05 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-05 00:00:00', null, '1', null, null, null, null, null, null), ('59cbd67326604747b2ec99192182ab60', '测试x1', 'red', '常规评查', '案件', '1', 'dsadasdasd', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 00:00:00', null, '1', null, null, null, null, null, null), ('5d16c6955cbf4176ad352e0f1b3780a3', 'okokokoko1', 'black', '常规评查', '案件', '1d016423e45c450980798ec0815c0549', '213213', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', null, '1', null, null, null, null, null, null), ('8aea9f87970f427690ee374425204b75', 'mmmmm1', 'black', '常规评查', '案件', '1', '122', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', null, '1', null, null, null, null, null, null), ('ca0e590f3f3e4c33814c72a5bb94d361', 'fuck1', 'black', '重点评查', '庭审', '1', 'fuck111111', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', '', '1', null, null, null, null, null, null), ('ce2f4df79c5049a78aa4515802c46e6b', '评查公告标题test', 'red', '专项评查', '庭审', '1', '这是测试数据啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', '', '0', null, null, null, null, null, null), ('d3f4c77615f64be88194ce76023ef59d', 'sssss', 'black', '常规评查', '案件', '1', 'sssssssssss', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', null, '1', null, null, null, null, null, null), ('ebf23b0e149e46f7bbb2e2275fa2fdea', 'ssssadasdasdasdasd', 'black', '常规评查', '案件', '1', 'dsadasdasdsad', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', null, null, null, '0', null, null, null, null, null, null), ('ec926cf5a29d4dd3bae3b3c7c731deae', 'tesdfsd', 'black', '重点评查', '庭审', '1', 'dasdasd', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', 'xxxx', '2', null, null, null, null, null, null);
COMMIT;

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
--  Records of `bd_check_cases`
-- ----------------------------
BEGIN;
INSERT INTO `bd_check_cases` VALUES ('0a0bffd314ed4500afe72714b748e26b', '59cbd67326604747b2ec99192182ab60', '3', '4072ddad-c071-4da9-8bc5-4926eff14bbc', null, null, null, null, null, null, '2017-10-08 07:58:13', null, null, null, '1'), ('0d42e37b15304b5e8910f6ea09e80107', '5d16c6955cbf4176ad352e0f1b3780a3', '9', 'd85d0c05-8b9d-47b2-8cf2-5f3fee51e0e6', null, null, null, null, null, null, '2017-10-06 08:56:23', null, null, null, null), ('1b9bc7e26a9c494aab0de83d089b5e26', '59cbd67326604747b2ec99192182ab60', '13', '4072ddad-c071-4da9-8bc5-4926eff14bbc', null, null, null, null, null, null, '2017-10-08 07:58:13', null, null, null, '1'), ('22f9e15b1d084e6d85b2fd927f950ce8', '5d16c6955cbf4176ad352e0f1b3780a3', '3', 'd85d0c05-8b9d-47b2-8cf2-5f3fee51e0e6', null, null, null, null, null, null, '2017-10-06 08:56:23', null, null, null, null), ('38bfa66a3e0444e785b4ba81bd6f234a', '8aea9f87970f427690ee374425204b75', '2', '835c245f-4270-4ce4-b96a-2f5ad0edae16', '1111', null, null, null, null, null, '2017-10-06 08:59:39', null, null, null, null), ('5c7e327b824c4c74b0f3c337cc103bde', 'ebf23b0e149e46f7bbb2e2275fa2fdea', '7', '2ef0c2ee-355c-4957-a6ca-f9a6b2044adb', null, null, null, null, null, null, '2017-10-06 08:53:35', null, null, null, null), ('6c329e5faf824e54adb1f4005f9f54f7', '5d16c6955cbf4176ad352e0f1b3780a3', '6', 'd85d0c05-8b9d-47b2-8cf2-5f3fee51e0e6', '1123123', null, null, null, null, null, '2017-10-06 08:56:23', null, null, null, null), ('882dac96e1354ab5911a7e353a801991', 'ebf23b0e149e46f7bbb2e2275fa2fdea', '6', '2ef0c2ee-355c-4957-a6ca-f9a6b2044adb', null, null, null, null, null, null, '2017-10-06 08:53:35', null, null, null, null), ('ac128bee9f2940d59a1f9533a18a083c', '3398ac2c97df4a669edeff056fea32f4', '3', '853c9ed2-1495-4e7f-b1df-a50d751864ae', null, null, null, null, null, null, '2017-10-05 11:16:49', null, null, null, null), ('b58131781be4417cbd86a2a025fd9961', 'ebf23b0e149e46f7bbb2e2275fa2fdea', '3', '2ef0c2ee-355c-4957-a6ca-f9a6b2044adb', null, null, null, null, null, null, '2017-10-06 08:53:35', null, null, null, null), ('d4f028d6ad9a42fd9e7208d4149c2cdc', '8aea9f87970f427690ee374425204b75', '1', '835c245f-4270-4ce4-b96a-2f5ad0edae16', null, null, null, null, null, null, '2017-10-06 08:59:39', null, null, null, null), ('e6a60dfb0d604e209e8d43d125a37fed', '8aea9f87970f427690ee374425204b75', '4', '835c245f-4270-4ce4-b96a-2f5ad0edae16', null, null, null, null, null, null, '2017-10-06 08:59:39', null, null, null, null);
COMMIT;

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
--  Records of `bd_check_distribution`
-- ----------------------------
BEGIN;
INSERT INTO `bd_check_distribution` VALUES ('0471305fd21743b19684c902ae8dcbe7', '8aea9f87970f427690ee374425204b75', '民事 - 被抽中3条 - 占比100.00%', '2', '民事', null, null, null, null, null, null), ('0a1f752db66d49319afd3a0fb2aecfe0', '8aea9f87970f427690ee374425204b75', '安徽省高级人民法院 - 被抽中1条 - 占比33.33%', '1', '安徽省高级人民法院', null, null, null, null, null, null), ('0a792796e1184e5098e27757ff10d13d', '2711a44269d048d296e7a3a11ed2b12f', '芜湖市中级人民法院 - 被抽中2条 - 占比10.00%', '1', '芜湖市中级人民法院', null, null, null, null, null, null), ('0af227ee9b604b7a834767507b816d46', 'ca0e590f3f3e4c33814c72a5bb94d361', '安徽省高级人民法院 - 被抽中2条 - 占比33.33%', '1', '安徽省高级人民法院', null, null, null, null, null, null), ('0d3bae5e58d04af482d433043e6cc369', '137ed49dff184cb1b11b37a11c806af4', '发回改判 - 被抽中1条 - 占比10.00%', '3', '发回改判', null, null, null, null, null, null), ('0db3874561fe4ffe95b4b8b66e8a4666', '59cbd67326604747b2ec99192182ab60', '淮南市中级人员法院 - 被抽中1条 - 占比50.00%', '1', '淮南市中级人员法院', null, null, null, null, null, null), ('123da213bef849f99507f266a87c8303', 'ca0e590f3f3e4c33814c72a5bb94d361', '民事 - 被抽中3条 - 占比50.00%', '2', '民事', null, null, null, null, null, null), ('1807c63983a44744892c6300f53010fa', 'ca0e590f3f3e4c33814c72a5bb94d361', '审理周期超过一年半以上 - 被抽中2条 - 占比33.33%', '3', '审理周期超过一年半以上', null, null, null, null, null, null), ('22be497787ec44959ac856829a47c291', '137ed49dff184cb1b11b37a11c806af4', '审理周期超过一年半以上 - 被抽中1条 - 占比10.00%', '3', '审理周期超过一年半以上', null, null, null, null, null, null), ('27f6e47d9b324fd0b79458f067bdcb4e', '137ed49dff184cb1b11b37a11c806af4', '抗诉 - 被抽中3条 - 占比30.00%', '3', '抗诉', null, null, null, null, null, null), ('2dedef28091d4903a03668417faa3b85', '8aea9f87970f427690ee374425204b75', '再审 - 被抽中2条 - 占比66.67%', '3', '再审', null, null, null, null, null, null), ('2dfd85b4e3734d8fa208777fd7a28ebb', '137ed49dff184cb1b11b37a11c806af4', '刑事 - 被抽中4条 - 占比40.00%', '2', '刑事', null, null, null, null, null, null), ('2fccdc71e11a4c4699e2d24afcce17ae', '3398ac2c97df4a669edeff056fea32f4', '刑事 - 被抽中1条 - 占比100.00%', '2', '刑事', null, null, null, null, null, null), ('321670b1e251471e87e3d69160cb23d8', 'ca0e590f3f3e4c33814c72a5bb94d361', '亳州市中级人民法院 - 被抽中1条 - 占比16.67%', '1', '亳州市中级人民法院', null, null, null, null, null, null), ('36bf512cfff343b4969da3400a32af65', 'ebf23b0e149e46f7bbb2e2275fa2fdea', '再审 - 被抽中1条 - 占比33.33%', '3', '再审', null, null, null, null, null, null), ('3765cd78e878466bb0d0c9e52a930491', '59cbd67326604747b2ec99192182ab60', '审理周期超过一年半以上 - 被抽中1条 - 占比50.00%', '3', '审理周期超过一年半以上', null, null, null, null, null, null), ('3b6bff5824ab414da156b045c927ec88', '137ed49dff184cb1b11b37a11c806af4', '芜湖市中级人民法院 - 被抽中1条 - 占比10.00%', '1', '芜湖市中级人民法院', null, null, null, null, null, null), ('3bddb03e20b94a46b288bdc79038ed4e', 'ca0e590f3f3e4c33814c72a5bb94d361', '马鞍山市中级人民法院 - 被抽中1条 - 占比16.67%', '1', '马鞍山市中级人民法院', null, null, null, null, null, null), ('3d10a3f982c04df499a121022542030c', '2711a44269d048d296e7a3a11ed2b12f', '淮南市中级人员法院 - 被抽中1条 - 占比5.00%', '1', '淮南市中级人员法院', null, null, null, null, null, null), ('3f67387770aa4b46b884f8d5f6632e70', '59cbd67326604747b2ec99192182ab60', '马鞍山市中级人民法院 - 被抽中1条 - 占比50.00%', '1', '马鞍山市中级人民法院', null, null, null, null, null, null), ('402f5443593c4841ad073b537f09e67d', 'ebf23b0e149e46f7bbb2e2275fa2fdea', '安徽省高级人民法院 - 被抽中1条 - 占比33.33%', '1', '安徽省高级人民法院', null, null, null, null, null, null), ('41768a90c1604d8aa382d217c85251c6', '137ed49dff184cb1b11b37a11c806af4', '亳州市中级人民法院 - 被抽中1条 - 占比10.00%', '1', '亳州市中级人民法院', null, null, null, null, null, null), ('4177eb013ae34889849fcb0d4ee547da', 'd3f4c77615f64be88194ce76023ef59d', '再审 - 被抽中3条 - 占比75.00%', '3', '再审', null, null, null, null, null, null), ('424c636831fa4abd92610a77604c84c4', 'd3f4c77615f64be88194ce76023ef59d', '合肥市中级人民法院 - 被抽中3条 - 占比75.00%', '1', '合肥市中级人民法院', null, null, null, null, null, null), ('435b3f51afbd43e8b9710b2b88e99c9e', 'ce2f4df79c5049a78aa4515802c46e6b', '刑事 - 被抽中4条 - 占比80.00%', '2', '刑事', null, null, null, null, null, null), ('452ee7e266864f5f80736266d0c937a1', '2711a44269d048d296e7a3a11ed2b12f', '审理周期超过一年半以上 - 被抽中4条 - 占比20.00%', '3', '审理周期超过一年半以上', null, null, null, null, null, null), ('46fe42bac41f44cda9abe3b0044debb4', '2711a44269d048d296e7a3a11ed2b12f', '合肥市中级人民法院 - 被抽中3条 - 占比15.00%', '1', '合肥市中级人民法院', null, null, null, null, null, null), ('4d50752a7b064af2b7d618c64ea94b73', 'ce2f4df79c5049a78aa4515802c46e6b', '合肥市中级人民法院 - 被抽中2条 - 占比40.00%', '1', '合肥市中级人民法院', null, null, null, null, null, null), ('51ad13f8e24044e7970bd3781764f79c', '2711a44269d048d296e7a3a11ed2b12f', '发回改判 - 被抽中4条 - 占比20.00%', '3', '发回改判', null, null, null, null, null, null), ('5296fd7f5a5c47388890fe8f3583843e', 'ec926cf5a29d4dd3bae3b3c7c731deae', '马鞍山市中级人民法院 - 被抽中1条 - 占比50.00%', '1', '马鞍山市中级人民法院', null, null, null, null, null, null), ('536feb79d72748b699a956df22e2d4bb', '2711a44269d048d296e7a3a11ed2b12f', '再审 - 被抽中6条 - 占比30.00%', '3', '再审', null, null, null, null, null, null), ('546ef023778442a892350ef4b44dd50a', '59cbd67326604747b2ec99192182ab60', '刑事 - 被抽中2条 - 占比100.00%', '2', '刑事', null, null, null, null, null, null), ('54bd13bd6e42427f971f926d6e20ca55', 'ebf23b0e149e46f7bbb2e2275fa2fdea', '民事 - 被抽中1条 - 占比33.33%', '2', '民事', null, null, null, null, null, null), ('5f6cbe1c0163453e9dbbff0602e3e3b2', '137ed49dff184cb1b11b37a11c806af4', '安徽省高级人民法院 - 被抽中2条 - 占比20.00%', '1', '安徽省高级人民法院', null, null, null, null, null, null), ('6020e7f652ec4ae4b4d9daff55a4e913', 'ec926cf5a29d4dd3bae3b3c7c731deae', '民事 - 被抽中1条 - 占比50.00%', '2', '民事', null, null, null, null, null, null), ('604e546d2f0d4d9aabc94fbefe4425e5', '137ed49dff184cb1b11b37a11c806af4', '再审 - 被抽中5条 - 占比50.00%', '3', '再审', null, null, null, null, null, null), ('653c665d2ea5419e9fa06ed318369c29', '2711a44269d048d296e7a3a11ed2b12f', '马鞍山市中级人民法院 - 被抽中2条 - 占比10.00%', '1', '马鞍山市中级人民法院', null, null, null, null, null, null), ('6cdbee6bda544ec7848505d4625716dc', 'd3f4c77615f64be88194ce76023ef59d', '民事 - 被抽中4条 - 占比100.00%', '2', '民事', null, null, null, null, null, null), ('6cf8c5acf83641e78fa18c02e00ccda3', 'd3f4c77615f64be88194ce76023ef59d', '抗诉 - 被抽中1条 - 占比25.00%', '3', '抗诉', null, null, null, null, null, null), ('70e998f80aa743e896766e016e52ddb0', '2711a44269d048d296e7a3a11ed2b12f', '抗诉 - 被抽中6条 - 占比30.00%', '3', '抗诉', null, null, null, null, null, null), ('732bd5c377cd44b2960ac14735623321', '8aea9f87970f427690ee374425204b75', '合肥市中级人民法院 - 被抽中2条 - 占比66.67%', '1', '合肥市中级人民法院', null, null, null, null, null, null), ('7411015211054cb9beac1c1ae2a97beb', 'ce2f4df79c5049a78aa4515802c46e6b', '安徽省高级人民法院 - 被抽中1条 - 占比20.00%', '1', '安徽省高级人民法院', null, null, null, null, null, null), ('74d68ee5704e428cb618c30d951d398f', '3398ac2c97df4a669edeff056fea32f4', '审理周期超过一年半以上 - 被抽中1条 - 占比100.00%', '3', '审理周期超过一年半以上', null, null, null, null, null, null), ('7715181089524b54a2ec57d4d4e3f95c', 'ce2f4df79c5049a78aa4515802c46e6b', '淮南市中级人员法院 - 被抽中1条 - 占比20.00%', '1', '淮南市中级人员法院', null, null, null, null, null, null), ('82c638f800df43cb974b4a105ed3929e', 'ca0e590f3f3e4c33814c72a5bb94d361', '安徽省高级人民法院 - 被抽中2条 - 占比50.00%', '1', '安徽省高级人民法院', null, null, null, null, null, null), ('83e79c0cacad4e7da8eb310a5abb8606', '137ed49dff184cb1b11b37a11c806af4', '淮北市中级人民法院 - 被抽中1条 - 占比10.00%', '1', '淮北市中级人民法院', null, null, null, null, null, null), ('87e143e1979e44f58c0cebb2cd627a9e', '137ed49dff184cb1b11b37a11c806af4', '民事 - 被抽中6条 - 占比60.00%', '2', '民事', null, null, null, null, null, null), ('8d1e69f30c2444cfa97795e00110a26f', 'ec926cf5a29d4dd3bae3b3c7c731deae', '合肥市中级人民法院 - 被抽中1条 - 占比50.00%', '1', '合肥市中级人民法院', null, null, null, null, null, null), ('9042707de6d04d87a1fd80be172eb886', '5d16c6955cbf4176ad352e0f1b3780a3', '审理周期超过一年半以上 - 被抽中3条 - 占比100.00%', '3', '审理周期超过一年半以上', null, null, null, null, null, null), ('90ef66f6e72f42ac966d57e232a678b9', 'ce2f4df79c5049a78aa4515802c46e6b', '审理周期超过一年半以上 - 被抽中2条 - 占比40.00%', '3', '审理周期超过一年半以上', null, null, null, null, null, null), ('9117a986a4e84a4d9ff663a1ca17f906', 'ce2f4df79c5049a78aa4515802c46e6b', '民事 - 被抽中1条 - 占比20.00%', '2', '民事', null, null, null, null, null, null), ('916ecdf88c7b4cab8194a6d5ed1403ff', '2711a44269d048d296e7a3a11ed2b12f', '淮北市中级人民法院 - 被抽中1条 - 占比5.00%', '1', '淮北市中级人民法院', null, null, null, null, null, null), ('958847f559a148afb4e00c3e4dae1f77', 'ce2f4df79c5049a78aa4515802c46e6b', '马鞍山市中级人民法院 - 被抽中1条 - 占比20.00%', '1', '马鞍山市中级人民法院', null, null, null, null, null, null), ('a1cc63b509ba4c8fb85da1774574452a', '137ed49dff184cb1b11b37a11c806af4', '合肥市中级人民法院 - 被抽中3条 - 占比30.00%', '1', '合肥市中级人民法院', null, null, null, null, null, null), ('a4a241310c7f4c1ba08b300bad25087d', 'd3f4c77615f64be88194ce76023ef59d', '安徽省高级人民法院 - 被抽中1条 - 占比25.00%', '1', '安徽省高级人民法院', null, null, null, null, null, null), ('aab7842dde39436b8cd4405958f180b0', 'ca0e590f3f3e4c33814c72a5bb94d361', '抗诉 - 被抽中3条 - 占比50.00%', '3', '抗诉', null, null, null, null, null, null), ('ac58c1c241ea4e8197e7fb228bac2866', '2711a44269d048d296e7a3a11ed2b12f', '亳州市中级人民法院 - 被抽中1条 - 占比5.00%', '1', '亳州市中级人民法院', null, null, null, null, null, null), ('acec5560700d4636825369929f4011c5', 'ca0e590f3f3e4c33814c72a5bb94d361', '民事 - 被抽中2条 - 占比50.00%', '2', '民事', null, null, null, null, null, null), ('b0081f6e9e4f4eb08db13bd565e5d132', 'ec926cf5a29d4dd3bae3b3c7c731deae', '再审 - 被抽中1条 - 占比100.00%', '3', '再审', null, null, null, null, null, null), ('b1de87fbea9b4f64909f3c9100b36202', '5d16c6955cbf4176ad352e0f1b3780a3', '刑事 - 被抽中3条 - 占比100.00%', '2', '刑事', null, null, null, null, null, null), ('b3669bf75950420fb87a41bfda95bb9f', '5d16c6955cbf4176ad352e0f1b3780a3', '马鞍山市中级人民法院 - 被抽中1条 - 占比33.33%', '1', '马鞍山市中级人民法院', null, null, null, null, null, null), ('b7e64058810d4c3da32a8f0e2105520d', 'ebf23b0e149e46f7bbb2e2275fa2fdea', '马鞍山市中级人民法院 - 被抽中1条 - 占比33.33%', '1', '马鞍山市中级人民法院', null, null, null, null, null, null), ('b8c6d8d104dc43e199c3bb033af4cd41', 'ec926cf5a29d4dd3bae3b3c7c731deae', '再审 - 被抽中2条 - 占比100.00%', '3', '再审', null, null, null, null, null, null), ('bb7cd11713c849088c464e7b22b3ddcf', 'ca0e590f3f3e4c33814c72a5bb94d361', '淮南市中级人员法院 - 被抽中1条 - 占比25.00%', '1', '淮南市中级人员法院', null, null, null, null, null, null), ('c16b4b50970f490ba9cbacc7156dc75e', '2711a44269d048d296e7a3a11ed2b12f', '安庆市中级人民法院 - 被抽中2条 - 占比10.00%', '1', '安庆市中级人民法院', null, null, null, null, null, null), ('c35f524444684cc3bef59d4c7c8015a0', 'ca0e590f3f3e4c33814c72a5bb94d361', '刑事 - 被抽中3条 - 占比50.00%', '2', '刑事', null, null, null, null, null, null), ('c41971c2628244c1a12e68f95f15b01b', 'ebf23b0e149e46f7bbb2e2275fa2fdea', '刑事 - 被抽中2条 - 占比66.67%', '2', '刑事', null, null, null, null, null, null), ('c64c4bb9e8154d37a81e872743c3d752', 'ec926cf5a29d4dd3bae3b3c7c731deae', '合肥市中级人民法院 - 被抽中1条 - 占比100.00%', '1', '合肥市中级人民法院', null, null, null, null, null, null), ('c9103d3ca15c47a182e40f23eb8a3179', 'ca0e590f3f3e4c33814c72a5bb94d361', '刑事 - 被抽中2条 - 占比50.00%', '2', '刑事', null, null, null, null, null, null), ('cba5541a6d8549a89da9a64b60bc50b5', 'ce2f4df79c5049a78aa4515802c46e6b', '再审 - 被抽中2条 - 占比40.00%', '3', '再审', null, null, null, null, null, null), ('cd515837012a4bbda24ae38fa1063e10', '2711a44269d048d296e7a3a11ed2b12f', '安徽省高级人民法院 - 被抽中5条 - 占比25.00%', '1', '安徽省高级人民法院', null, null, null, null, null, null), ('cf2a001d847249d1b62914cfeaf73a2e', '137ed49dff184cb1b11b37a11c806af4', '阜阳市中级人民法院 - 被抽中1条 - 占比10.00%', '1', '阜阳市中级人民法院', null, null, null, null, null, null), ('cf83c04f592c436b91936a0d8ca87cf7', 'ca0e590f3f3e4c33814c72a5bb94d361', '合肥市中级人民法院 - 被抽中1条 - 占比16.67%', '1', '合肥市中级人民法院', null, null, null, null, null, null), ('d2ef2b692b0b4316ad9bb2dd1911e849', 'ebf23b0e149e46f7bbb2e2275fa2fdea', '审理周期超过一年半以上 - 被抽中2条 - 占比66.67%', '3', '审理周期超过一年半以上', null, null, null, null, null, null), ('d462e5904722402f9026a3024eda1bc7', '2711a44269d048d296e7a3a11ed2b12f', '刑事 - 被抽中8条 - 占比40.00%', '2', '刑事', null, null, null, null, null, null), ('d63736bc3b27429d9d692cb9eecafe6f', 'ca0e590f3f3e4c33814c72a5bb94d361', '抗诉 - 被抽中2条 - 占比50.00%', '3', '抗诉', null, null, null, null, null, null), ('d6962a8f43074c2c9431e074c1ebaa8a', 'ca0e590f3f3e4c33814c72a5bb94d361', '再审 - 被抽中1条 - 占比16.67%', '3', '再审', null, null, null, null, null, null), ('d80d7601e29742f2aa15cd26690ef92f', 'ebf23b0e149e46f7bbb2e2275fa2fdea', '合肥市中级人民法院 - 被抽中1条 - 占比33.33%', '1', '合肥市中级人民法院', null, null, null, null, null, null), ('d8292368aa9b41b3a2bf65e2cbda5794', '59cbd67326604747b2ec99192182ab60', '抗诉 - 被抽中1条 - 占比50.00%', '3', '抗诉', null, null, null, null, null, null), ('d97eea0b7edf4bcea037280a861bc321', '2711a44269d048d296e7a3a11ed2b12f', '阜阳市中级人民法院 - 被抽中2条 - 占比10.00%', '1', '阜阳市中级人民法院', null, null, null, null, null, null), ('da888ff103514848b62a044b1c33e8d5', '8aea9f87970f427690ee374425204b75', '抗诉 - 被抽中1条 - 占比33.33%', '3', '抗诉', null, null, null, null, null, null), ('debae5337af2438292cca217f06cb4d5', 'ec926cf5a29d4dd3bae3b3c7c731deae', '刑事 - 被抽中1条 - 占比50.00%', '2', '刑事', null, null, null, null, null, null), ('e21f26d335b2452ca18e64e066361e08', '3398ac2c97df4a669edeff056fea32f4', '马鞍山市中级人民法院 - 被抽中1条 - 占比100.00%', '1', '马鞍山市中级人民法院', null, null, null, null, null, null), ('e3b10cf282c149bcbe0f24d6a68b430d', 'ec926cf5a29d4dd3bae3b3c7c731deae', '民事 - 被抽中1条 - 占比100.00%', '2', '民事', null, null, null, null, null, null), ('e6e7ad70835c4e778981fef5137b9a96', 'ca0e590f3f3e4c33814c72a5bb94d361', '再审 - 被抽中1条 - 占比25.00%', '3', '再审', null, null, null, null, null, null), ('f19236b6699a4731a8afdff53c42e8a5', '5d16c6955cbf4176ad352e0f1b3780a3', '安徽省高级人民法院 - 被抽中2条 - 占比66.67%', '1', '安徽省高级人民法院', null, null, null, null, null, null), ('f2f7ab0682ee43eaba562af5a4f3a03d', '2711a44269d048d296e7a3a11ed2b12f', '六安市中级人民法院 - 被抽中1条 - 占比5.00%', '1', '六安市中级人民法院', null, null, null, null, null, null), ('f306f6413f99477c9622fe3f868a56f1', 'ca0e590f3f3e4c33814c72a5bb94d361', '合肥市中级人民法院 - 被抽中1条 - 占比25.00%', '1', '合肥市中级人民法院', null, null, null, null, null, null), ('f5e77453c9204f01ba02a3683fa0dfe0', 'ca0e590f3f3e4c33814c72a5bb94d361', '淮南市中级人员法院 - 被抽中1条 - 占比16.67%', '1', '淮南市中级人员法院', null, null, null, null, null, null), ('f61daaa5ccca418cb840083bd31bc0bb', '137ed49dff184cb1b11b37a11c806af4', '马鞍山市中级人民法院 - 被抽中1条 - 占比10.00%', '1', '马鞍山市中级人民法院', null, null, null, null, null, null), ('f7d9b63c78cd41aca0df0aeaed1a8ec3', 'ca0e590f3f3e4c33814c72a5bb94d361', '审理周期超过一年半以上 - 被抽中1条 - 占比25.00%', '3', '审理周期超过一年半以上', null, null, null, null, null, null), ('f867fca971d94f0198b313bd0c740749', 'ce2f4df79c5049a78aa4515802c46e6b', '抗诉 - 被抽中1条 - 占比20.00%', '3', '抗诉', null, null, null, null, null, null), ('fcddea1e68fa41efbd1295822f97d674', '2711a44269d048d296e7a3a11ed2b12f', '民事 - 被抽中12条 - 占比60.00%', '2', '民事', null, null, null, null, null, null);
COMMIT;

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
--  Records of `bd_check_groups`
-- ----------------------------
BEGIN;
INSERT INTO `bd_check_groups` VALUES ('195aa121-adba-4539-ae62-3471eb25d18e', 'ca0e590f3f3e4c33814c72a5bb94d361', '民事一组fuck1', '3', '50%', null, '2017-10-02 10:59:35', null, null, null, null, 'd'), ('2ef0c2ee-355c-4957-a6ca-f9a6b2044adb', 'ebf23b0e149e46f7bbb2e2275fa2fdea', '所属', '3', '100%', null, '2017-10-06 08:53:35', null, null, null, null, '程晨;宋佳卿;张晋鑫;'), ('4072ddad-c071-4da9-8bc5-4926eff14bbc', '59cbd67326604747b2ec99192182ab60', '213', '2', '100%', null, '2017-10-08 07:58:13', null, null, null, null, '宋佳卿;张晋鑫;'), ('44d05b4a-824b-4706-8980-641d9c83bc6b', 'ce2f4df79c5049a78aa4515802c46e6b', '刑事一组test', '4', '80%', null, null, null, null, null, null, 'd'), ('60b12ed8-78c0-479c-87b2-fc0c89717bd0', '137ed49dff184cb1b11b37a11c806af4', '民事1', '4', '40%', null, '2017-10-02 21:12:32', null, null, null, null, '宋佳卿;张晋鑫;吴佐明;'), ('672451bb-6e07-4dd6-863d-ab5ffd17b158', 'ec926cf5a29d4dd3bae3b3c7c731deae', '312', '2', '100%', null, null, null, null, null, null, null), ('835c245f-4270-4ce4-b96a-2f5ad0edae16', '8aea9f87970f427690ee374425204b75', 'fuckaaaa1', '3', '100%', null, '2017-10-06 08:59:39', null, null, null, null, '宋佳卿;程晨;'), ('853c9ed2-1495-4e7f-b1df-a50d751864ae', '3398ac2c97df4a669edeff056fea32f4', '刑事超级组', '1', '100%', null, '2017-10-05 11:16:49', null, null, null, null, '宋佳卿;张晋鑫;吴佐明;'), ('9705b945-18ae-444e-a165-6d6821a665ec', 'd3f4c77615f64be88194ce76023ef59d', '所属2', '2', '50%', null, '2017-10-02 21:09:04', null, null, null, null, null), ('a9175a7f-aaae-4f2e-8572-0af9b470fa8a', 'd3f4c77615f64be88194ce76023ef59d', '想1', '2', '50%', null, '2017-10-02 21:09:35', null, null, null, null, null), ('b201b30b-6bd3-4013-93e9-97bd388370f1', '137ed49dff184cb1b11b37a11c806af4', '刑事1', '6', '60%', null, '2017-10-02 21:12:32', null, null, null, null, '吴佐明;钟鹏远;程晨;'), ('b70e9445-c4a2-4845-b568-dc74b26d5159', '2711a44269d048d296e7a3a11ed2b12f', '刑事一组oktest1', '8', '40%', null, null, null, null, null, null, 'd'), ('d85d0c05-8b9d-47b2-8cf2-5f3fee51e0e6', '5d16c6955cbf4176ad352e0f1b3780a3', '212121', '3', '100%', null, '2017-10-06 08:56:23', null, null, null, null, '程晨;张晋鑫;吴佐明;'), ('dc538485-0d2a-47d0-8cc8-0e637a2f5f02', 'ca0e590f3f3e4c33814c72a5bb94d361', '刑事一组fuck1', '3', '50%', null, '2017-10-02 10:59:35', null, null, null, null, null);
COMMIT;

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
INSERT INTO `bd_check_levels` VALUES ('2', '一般', '21', '30', '2', null, null, null, null, null, null);
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
--  Records of `bd_check_pros`
-- ----------------------------
BEGIN;
INSERT INTO `bd_check_pros` VALUES ('08299ea7a4cc4dfcbb2f8f5f1a4de830', 'ca0e590f3f3e4c33814c72a5bb94d361', '195aa121-adba-4539-ae62-3471eb25d18e', 'a1f9e991c29a4479ac11f7b17f1c9ed4', '0', null, null, null, null, null, null), ('1', '1', '1', 'eaf34bcf8ba945598067b7f88fad0099', '1', null, null, null, null, null, '1'), ('112987148ca24533928b8af2eb71e08f', '59cbd67326604747b2ec99192182ab60', '4072ddad-c071-4da9-8bc5-4926eff14bbc', '8b85c73c8a7b4bb48fdd19448ef01c6d', '1', null, '2017-10-08 07:58:13', null, null, null, null), ('2', '1', '1', 'baea30f17bb247758b4ec121a35d589a', '0', null, null, null, null, null, '1'), ('25b0be4dd9f34368b77b04c540283036', 'ca0e590f3f3e4c33814c72a5bb94d361', 'dc538485-0d2a-47d0-8cc8-0e637a2f5f02', 'eaf34bcf8ba945598067b7f88fad0099', '0', null, null, null, null, null, null), ('3', '1', '1', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '0', null, null, null, null, null, '1'), ('394a3c10799645e5ad6d19fb11eeb962', 'ec926cf5a29d4dd3bae3b3c7c731deae', '672451bb-6e07-4dd6-863d-ab5ffd17b158', 'a1f9e991c29a4479ac11f7b17f1c9ed4', '1', null, null, null, null, null, null), ('63cfb5e4817949308d09187931f88c12', 'ce2f4df79c5049a78aa4515802c46e6b', '44d05b4a-824b-4706-8980-641d9c83bc6b', 'baea30f17bb247758b4ec121a35d589a', '1', null, null, null, null, null, null), ('67d08a3a2d4c4f77b0c9b59949d3e85e', 'ebf23b0e149e46f7bbb2e2275fa2fdea', '2ef0c2ee-355c-4957-a6ca-f9a6b2044adb', 'eaf34bcf8ba945598067b7f88fad0099', '1', null, '2017-10-06 08:53:35', null, null, null, null), ('6bb83b026886401da1b7ed28c92cc2c6', '2711a44269d048d296e7a3a11ed2b12f', 'b70e9445-c4a2-4845-b568-dc74b26d5159', 'baea30f17bb247758b4ec121a35d589a', '1', null, null, null, null, null, null), ('6e13854638d84d398d13291e5f4b0fa8', '3398ac2c97df4a669edeff056fea32f4', '853c9ed2-1495-4e7f-b1df-a50d751864ae', 'a1f9e991c29a4479ac11f7b17f1c9ed4', '0', null, '2017-10-05 11:16:49', null, null, null, null), ('70357824dd924ce8bdc7a765ae11a927', 'd3f4c77615f64be88194ce76023ef59d', '9705b945-18ae-444e-a165-6d6821a665ec', 'a1f9e991c29a4479ac11f7b17f1c9ed4', '1', null, '2017-10-02 21:09:11', null, null, null, null), ('7db42c36debc4cec9c3618205b798106', '137ed49dff184cb1b11b37a11c806af4', 'b201b30b-6bd3-4013-93e9-97bd388370f1', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '0', null, '2017-10-02 21:12:32', null, null, null, null), ('874c38cc3fad48e689d4a7316b87fa12', 'd3f4c77615f64be88194ce76023ef59d', 'a9175a7f-aaae-4f2e-8572-0af9b470fa8a', '8b85c73c8a7b4bb48fdd19448ef01c6d', '1', null, '2017-10-02 21:09:35', null, null, null, null), ('8cd8337d10844d718c5980cbfd343658', '137ed49dff184cb1b11b37a11c806af4', '60b12ed8-78c0-479c-87b2-fc0c89717bd0', 'baea30f17bb247758b4ec121a35d589a', '0', null, '2017-10-02 21:12:32', null, null, null, null), ('8fd82e4ae83a42f1a416d3a56ffc8dd6', 'ca0e590f3f3e4c33814c72a5bb94d361', 'dc538485-0d2a-47d0-8cc8-0e637a2f5f02', 'baea30f17bb247758b4ec121a35d589a', '1', null, null, null, null, null, null), ('96065f7da98b4713a43eb8e30c79d9c6', 'ca0e590f3f3e4c33814c72a5bb94d361', 'dc538485-0d2a-47d0-8cc8-0e637a2f5f02', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '0', null, null, null, null, null, null), ('96083f68788a4be4be484370578f8e04', '137ed49dff184cb1b11b37a11c806af4', '60b12ed8-78c0-479c-87b2-fc0c89717bd0', '8b85c73c8a7b4bb48fdd19448ef01c6d', '1', null, '2017-10-02 21:12:32', null, null, null, null), ('aac6aae1520a459792e55b65cbc0d16b', '8aea9f87970f427690ee374425204b75', '835c245f-4270-4ce4-b96a-2f5ad0edae16', '8b85c73c8a7b4bb48fdd19448ef01c6d', '1', null, '2017-10-06 08:59:39', null, null, null, null), ('bdee1b7bd3144e2ea10c4ef721185b16', 'ca0e590f3f3e4c33814c72a5bb94d361', '195aa121-adba-4539-ae62-3471eb25d18e', 'baea30f17bb247758b4ec121a35d589a', '0', null, null, null, null, null, null), ('c3b404add2334f9cb1438532a02490b7', '5d16c6955cbf4176ad352e0f1b3780a3', 'd85d0c05-8b9d-47b2-8cf2-5f3fee51e0e6', 'baea30f17bb247758b4ec121a35d589a', '0', null, '2017-10-06 08:56:23', null, null, null, null), ('c72ec865785c41fe9e6885541b7f1ac7', '137ed49dff184cb1b11b37a11c806af4', 'b201b30b-6bd3-4013-93e9-97bd388370f1', 'baea30f17bb247758b4ec121a35d589a', '1', null, '2017-10-02 21:12:32', null, null, null, null), ('cebcbcaf17af47568f3f35d207b7e46a', '137ed49dff184cb1b11b37a11c806af4', '60b12ed8-78c0-479c-87b2-fc0c89717bd0', 'a1f9e991c29a4479ac11f7b17f1c9ed4', '0', null, '2017-10-02 21:12:32', null, null, null, null), ('ceca4b90593e465db3bb9a6f42578e25', '8aea9f87970f427690ee374425204b75', '835c245f-4270-4ce4-b96a-2f5ad0edae16', 'eaf34bcf8ba945598067b7f88fad0099', '0', null, '2017-10-06 08:59:39', null, null, null, null), ('d306282b58dd42cfaa831404bd661c85', 'd3f4c77615f64be88194ce76023ef59d', 'a9175a7f-aaae-4f2e-8572-0af9b470fa8a', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '0', null, '2017-10-02 21:09:35', null, null, null, null), ('d55e7554c55b410f92ec017559e459ca', '5d16c6955cbf4176ad352e0f1b3780a3', 'd85d0c05-8b9d-47b2-8cf2-5f3fee51e0e6', 'a1f9e991c29a4479ac11f7b17f1c9ed4', '0', null, '2017-10-06 08:56:23', null, null, null, null), ('d91e826523f54291b23eb2b64ca5747e', '137ed49dff184cb1b11b37a11c806af4', 'b201b30b-6bd3-4013-93e9-97bd388370f1', 'eaf34bcf8ba945598067b7f88fad0099', '0', null, '2017-10-02 21:12:32', null, null, null, null), ('dc0f7ffa5fc34d45b0d595ae4d103057', 'ebf23b0e149e46f7bbb2e2275fa2fdea', '2ef0c2ee-355c-4957-a6ca-f9a6b2044adb', 'a1f9e991c29a4479ac11f7b17f1c9ed4', '0', null, '2017-10-06 08:53:35', null, null, null, null), ('e18e00bafa544abfb1a1a06f1c280865', '3398ac2c97df4a669edeff056fea32f4', '853c9ed2-1495-4e7f-b1df-a50d751864ae', 'baea30f17bb247758b4ec121a35d589a', '0', null, '2017-10-05 11:16:49', null, null, null, null), ('e60d822e79e64e149964b3859f64277e', 'ca0e590f3f3e4c33814c72a5bb94d361', '195aa121-adba-4539-ae62-3471eb25d18e', '8b85c73c8a7b4bb48fdd19448ef01c6d', '1', null, null, null, null, null, null), ('e878f8740d324a4da5e413d3d1d834b6', 'd3f4c77615f64be88194ce76023ef59d', 'a9175a7f-aaae-4f2e-8572-0af9b470fa8a', 'baea30f17bb247758b4ec121a35d589a', '0', null, '2017-10-02 21:09:35', null, null, null, null), ('f6b52a62520041c3959f1e3aa65f0b64', '3398ac2c97df4a669edeff056fea32f4', '853c9ed2-1495-4e7f-b1df-a50d751864ae', '8b85c73c8a7b4bb48fdd19448ef01c6d', '1', null, '2017-10-05 11:16:49', null, null, null, null), ('f974c449a1624e00b0f02da48e713f83', 'ebf23b0e149e46f7bbb2e2275fa2fdea', '2ef0c2ee-355c-4957-a6ca-f9a6b2044adb', '8b85c73c8a7b4bb48fdd19448ef01c6d', '0', null, '2017-10-06 08:53:35', null, null, null, null), ('fbfaa9f9f5764779aa241217a3bd895d', '5d16c6955cbf4176ad352e0f1b3780a3', 'd85d0c05-8b9d-47b2-8cf2-5f3fee51e0e6', 'eaf34bcf8ba945598067b7f88fad0099', '1', null, '2017-10-06 08:56:23', null, null, null, null), ('fe21d5260e8b43e0aed7993d5a831a63', '59cbd67326604747b2ec99192182ab60', '4072ddad-c071-4da9-8bc5-4926eff14bbc', 'a1f9e991c29a4479ac11f7b17f1c9ed4', '0', null, '2017-10-08 07:58:13', null, null, null, null);
COMMIT;

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
--  Records of `bd_check_read`
-- ----------------------------
BEGIN;
INSERT INTO `bd_check_read` VALUES ('0b5460a879994ba2b4b89c4b1172e696', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 00:00:00', '5d16c6955cbf4176ad352e0f1b3780a3', null, '2017-10-08 00:00:00', null, null, null, null), ('37a302cc59ff492b96e902830bf58faf', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', 'ce2f4df79c5049a78aa4515802c46e6b', null, '2017-10-02 00:00:00', null, null, null, null), ('4ad6cd3cb2454cca902e83567a959b1d', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', '2711a44269d048d296e7a3a11ed2b12f', null, '2017-10-02 00:00:00', null, null, null, null), ('58c4a68ad89a4611a141273582ab177a', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 00:00:00', '59cbd67326604747b2ec99192182ab60', null, '2017-10-08 00:00:00', null, null, null, null), ('9c99e13f244a4980803d6ac6ad6a6512', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-09 00:00:00', '137ed49dff184cb1b11b37a11c806af4', null, '2017-10-09 00:00:00', null, null, null, null), ('9d3865e5f16b40b1b22e84256ed33773', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', 'undefined', null, '2017-10-02 00:00:00', null, null, null, null), ('c2b4f58ac7c34e1da33df559b0cd3646', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 00:00:00', '3398ac2c97df4a669edeff056fea32f4', null, '2017-10-07 00:00:00', null, null, null, null), ('dad765c98f14410e8dc3afe66eec4e0b', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', 'ca0e590f3f3e4c33814c72a5bb94d361', null, '2017-10-02 00:00:00', null, null, null, null);
COMMIT;

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
--  Records of `bd_check_records`
-- ----------------------------
BEGIN;
INSERT INTO `bd_check_records` VALUES ('1', '8aea9f87970f427690ee374425204b75', '2', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 09:04:52', '90', '2', '合格', null, null, null, null, null, '1');
COMMIT;

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
--  Records of `bd_check_reject_read`
-- ----------------------------
BEGIN;
INSERT INTO `bd_check_reject_read` VALUES ('8593454ba2bc4f2a9e2ad6f522d5de9b', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', 'ec926cf5a29d4dd3bae3b3c7c731deae', null, '2017-10-02 00:00:00', null, null, null, null), ('9c97660fa54f464f9abd5fb31ea99810', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-02 00:00:00', '1', null, '2017-10-02 00:00:00', null, null, null, null);
COMMIT;

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
--  Records of `bd_chosen`
-- ----------------------------
BEGIN;
INSERT INTO `bd_chosen` VALUES ('1b69546c7fbb4de0bd4afe770a82c48e', 'dsafdasfas', 'red', '案件评选', '0e85e49d00954e12864253e6ce9bf657', 'fsdafsadfasdfasdf', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', null, '1', '2017-10-09 00:00:00', null, null, null, null, null, null, '0'), ('6c0b5f5df0814da9bc1a5203a2667f63', 'dsdsaf', 'black', '案件评选', '0e85e49d00954e12864253e6ce9bf657', 'fdsafasf', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', 'fafasfad', '1', '2017-09-13 00:00:00', null, null, null, null, null, null, '0'), ('6c60d3fec01045d8bfbfd6d49cb3e30c', 'dasdasd', 'black', '案件评选', '0e85e49d00954e12864253e6ce9bf657', '', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', 'dasdas', '1', '2017-10-07 00:00:00', null, null, null, null, null, null, '0'), ('7fb8c00d529e41fba9f52ff552dbc304', 'mytest1111', 'red', '案件评选', '0e85e49d00954e12864253e6ce9bf657', 'dasdsada', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 00:00:00', null, '1', '2017-10-05 00:00:00', null, null, null, null, null, null, '1'), ('bac538605f45472eb81fe2936ea5dfa5', 'dsafasdf', 'black', '案件评选', '0e85e49d00954e12864253e6ce9bf657', 'fsafasdfasdf', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', 'fuck', '1', '2017-10-07 00:00:00', null, null, null, null, null, null, '1'), ('ed51bee6f47445c180b65e1cd793a854', '3213123', 'red', '案件评选', '0e85e49d00954e12864253e6ce9bf657', '3123123123', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', null, '1', '2017-10-05 00:00:00', null, null, null, null, null, null, '0');
COMMIT;

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
--  Records of `bd_chosen_cases`
-- ----------------------------
BEGIN;
INSERT INTO `bd_chosen_cases` VALUES ('0ca2834d41d44c91aa80104f7a5c0b7e', '7fb8c00d529e41fba9f52ff552dbc304', '9', '69d844b423484863a0145b2244e1d6fc', null, null, null, null, '2131231', '2017-10-07 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 00:00:00', null, null, null, null), ('1', 'ed51bee6f47445c180b65e1cd793a854', '1', '1', '2', '90', '8b85c73c8a7b4bb48fdd19448ef01c6d', '2017-10-06 00:00:00', '12312', '2017-10-06 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', null, null, null, null, '1'), ('1269fec400244e3087d3dc51e1712fd7', '7fb8c00d529e41fba9f52ff552dbc304', '1', '69d844b423484863a0145b2244e1d6fc', null, null, null, null, '12312321', '2017-10-07 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 00:00:00', null, null, null, null), ('2', 'ed51bee6f47445c180b65e1cd793a854', '2', '69d844b423484863a0145b2244e1d6fc', '3', '91', '8b85c73c8a7b4bb48fdd19448ef01c6d', '2017-10-06 00:00:00', '3241423d', '2017-10-06 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', null, null, null, null, '1'), ('c3809e198d2b468cb444323248f6ec61', '7fb8c00d529e41fba9f52ff552dbc304', '12', '69d844b423484863a0145b2244e1d6fc', null, null, null, null, '12321231', '2017-10-07 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 00:00:00', null, null, null, null), ('cd76f290b9d44d828d51a263e5d0b198', '7fb8c00d529e41fba9f52ff552dbc304', '3', '29c681683b0c42609071d5167f0207a4', null, null, null, null, 'dasdas', '2017-10-07 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 00:00:00', null, null, null, null), ('dade42856cdf4dacbd44fbe29e456bba', '7fb8c00d529e41fba9f52ff552dbc304', '10', '29c681683b0c42609071d5167f0207a4', null, null, null, null, '12', '2017-10-07 00:00:00', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 00:00:00', null, null, null, null);
COMMIT;

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
--  Records of `bd_chosen_groups`
-- ----------------------------
BEGIN;
INSERT INTO `bd_chosen_groups` VALUES ('1', 'ed51bee6f47445c180b65e1cd793a854', '测试组1', '3', '100%', null, null, null, null, null, null, '张晋鑫;吴佐明;钟鹏远;'), ('29c681683b0c42609071d5167f0207a4', '7fb8c00d529e41fba9f52ff552dbc304', 'fdsafds', '2', '40.0000%', null, null, null, null, null, null, '张晋鑫;钟鹏远;程晨;'), ('69d844b423484863a0145b2244e1d6fc', '7fb8c00d529e41fba9f52ff552dbc304', '民事一组', '3', '60.0000%', null, null, null, null, null, null, '宋佳卿;张晋鑫;吴佐明;'), ('fe9f832d434f4eba8600af65cb8df846', 'ed51bee6f47445c180b65e1cd793a854', 'dasdasd', '0', '0%', null, null, null, null, null, null, '吴佐明;');
COMMIT;

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
--  Records of `bd_chosen_msgto`
-- ----------------------------
BEGIN;
INSERT INTO `bd_chosen_msgto` VALUES ('0065719eb60b4617929dd389273af33a', 'df0860748e5143cd8a06aaa43d96066e', 'eaf34bcf8ba945598067b7f88fad0099', null, null, null, null, null, null, '程晨'), ('0740d38199794709952b57b84d1d3d9d', 'df0860748e5143cd8a06aaa43d96066e', 'ccd1e2bea7fd48caa39b93a97aa09ffd', null, null, null, null, null, null, '钟鹏远'), ('1ccebfdc9dd9411ba3b47964651b6778', '7fb8c00d529e41fba9f52ff552dbc304', 'eaf34bcf8ba945598067b7f88fad0099', null, null, null, null, null, null, '程晨'), ('1e67f611c6d7488f962aedfcf9c6ace1', 'ed51bee6f47445c180b65e1cd793a854', 'ccd1e2bea7fd48caa39b93a97aa09ffd', null, null, null, null, null, null, '钟鹏远'), ('31e4166cc1ca44fe9a151ce0a5300031', '1b69546c7fbb4de0bd4afe770a82c48e', '8b85c73c8a7b4bb48fdd19448ef01c6d', null, null, null, null, null, null, '宋佳卿'), ('736e7336314841ef9f4914ba000a6a6f', '1b69546c7fbb4de0bd4afe770a82c48e', 'baea30f17bb247758b4ec121a35d589a', null, null, null, null, null, null, '吴佐明'), ('8fdf1b881c2d487fb30202342ea2e137', '1b69546c7fbb4de0bd4afe770a82c48e', 'eaf34bcf8ba945598067b7f88fad0099', null, null, null, null, null, null, '程晨'), ('d62e33db80c440cd9465a064f414c71c', 'df0860748e5143cd8a06aaa43d96066e', 'baea30f17bb247758b4ec121a35d589a', null, null, null, null, null, null, '吴佐明'), ('e2fc44cac06040f0998f768969a7c0c2', 'ed51bee6f47445c180b65e1cd793a854', 'a1f9e991c29a4479ac11f7b17f1c9ed4', null, null, null, null, null, null, '张晋鑫'), ('eba117b4198843b5bf34056cb3cea8d0', 'ed51bee6f47445c180b65e1cd793a854', 'baea30f17bb247758b4ec121a35d589a', null, null, null, null, null, null, '吴佐明');
COMMIT;

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
--  Records of `bd_chosen_pros`
-- ----------------------------
BEGIN;
INSERT INTO `bd_chosen_pros` VALUES ('01f32151dc514979a04ac5df5d7a8e48', '7fb8c00d529e41fba9f52ff552dbc304', '69d844b423484863a0145b2244e1d6fc', '8b85c73c8a7b4bb48fdd19448ef01c6d', '1', null, null, null, null, null, null), ('0beeecc634e94c59aa5c2d69bcb8f3b6', 'ed51bee6f47445c180b65e1cd793a854', 'fe9f832d434f4eba8600af65cb8df846', 'baea30f17bb247758b4ec121a35d589a', '1', null, null, null, null, null, null), ('7840691c0d004208b3dffe2bc9caf809', '7fb8c00d529e41fba9f52ff552dbc304', '29c681683b0c42609071d5167f0207a4', 'eaf34bcf8ba945598067b7f88fad0099', '0', null, null, null, null, null, null), ('7abf6c545ec84b3dba6561f13cdb3742', '7fb8c00d529e41fba9f52ff552dbc304', '29c681683b0c42609071d5167f0207a4', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '0', null, null, null, null, null, null), ('9d38da03a60f4456b2bd1297184de89e', 'ed51bee6f47445c180b65e1cd793a854', '1', 'baea30f17bb247758b4ec121a35d589a', '0', null, null, null, null, null, null), ('afd5e74b275b4c7fbbca75e2a8328f2c', 'ed51bee6f47445c180b65e1cd793a854', '1', 'a1f9e991c29a4479ac11f7b17f1c9ed4', '1', null, null, null, null, null, null), ('dd9a92395de2443bb3158d15991d7bfe', 'ed51bee6f47445c180b65e1cd793a854', '1', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '0', null, null, null, null, null, null), ('ece6fecf2f194c71a2b6f2799581218c', '7fb8c00d529e41fba9f52ff552dbc304', '69d844b423484863a0145b2244e1d6fc', 'baea30f17bb247758b4ec121a35d589a', '0', null, null, null, null, null, null), ('fcc0c3d5611b4b18aaa18daa202b994b', '7fb8c00d529e41fba9f52ff552dbc304', '69d844b423484863a0145b2244e1d6fc', 'a1f9e991c29a4479ac11f7b17f1c9ed4', '0', null, null, null, null, null, null), ('fce067433de2418c9130153e8d9422f8', '7fb8c00d529e41fba9f52ff552dbc304', '29c681683b0c42609071d5167f0207a4', 'a1f9e991c29a4479ac11f7b17f1c9ed4', '1', null, null, null, null, null, null);
COMMIT;

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
--  Records of `bd_chosen_read`
-- ----------------------------
BEGIN;
INSERT INTO `bd_chosen_read` VALUES ('27f1d688a9f84cb6b7083fac75d5a2c4', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', 'ed51bee6f47445c180b65e1cd793a854', null, '2017-10-06 00:00:00', null, null, null, null), ('2e8951af0b79437da75c4c39a2e23b3a', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 00:00:00', 'bac538605f45472eb81fe2936ea5dfa5', null, '2017-10-08 00:00:00', null, null, null, null), ('7b2ad3bc0c04411cbc648f1c0f94f396', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 00:00:00', '7fb8c00d529e41fba9f52ff552dbc304', null, '2017-10-07 00:00:00', null, null, null, null), ('9f0263c0995a4735829cd8e8ee6d5a1f', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', 'ed51bee6f47445c180b65e1cd793a854', null, '2017-10-06 00:00:00', null, null, null, null), ('b82b8e852f5e4461a82f1776bf35dc85', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 00:00:00', '7fb8c00d529e41fba9f52ff552dbc304', null, '2017-10-07 00:00:00', null, null, null, null), ('c63bc4c2fcba47488684cfb6b99c2df4', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 00:00:00', '6c0b5f5df0814da9bc1a5203a2667f63', null, '2017-10-08 00:00:00', null, null, null, null), ('def7dfeb52ef44cab1dba6ea8d0ff22a', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', '1b69546c7fbb4de0bd4afe770a82c48e', null, '2017-10-06 00:00:00', null, null, null, null);
COMMIT;

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
--  Records of `bd_chosen_reject_read`
-- ----------------------------
BEGIN;
INSERT INTO `bd_chosen_reject_read` VALUES ('5259ecc7c1cc419682b7b82e097ed0a7', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', '6c60d3fec01045d8bfbfd6d49cb3e30c', null, '2017-10-06 00:00:00', null, null, null, null), ('f07d550d4dd247e68c0f832333abc7ce', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', '6c0b5f5df0814da9bc1a5203a2667f63', null, '2017-10-06 00:00:00', null, null, null, null), ('fb995aeb8a2243d0ac3f886f4c372214', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', 'bac538605f45472eb81fe2936ea5dfa5', null, '2017-10-06 00:00:00', null, null, null, null);
COMMIT;

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
--  Records of `bd_middle_case`
-- ----------------------------
BEGIN;
INSERT INTO `bd_middle_case` VALUES ('1', '(2016)皖民再90号', '合肥市中级人民法院', '立案一庭', '朱道林', '民事', '土地使用权纠纷', '发回重审', '2017-05-01 11:50:42', '再审', '1', '1', '10;', '1', null, null, null, null, null, '1', null, null), ('10', '(2012)皖民抗26号', '亳州市中级人民法院', '立案一庭', '王芸', '民事', '土地使用权纠纷', '发回重审', '2017-05-01 11:50:42', '抗诉', '2', null, null, '0', null, null, null, null, null, '1', null, null), ('11', '(2013)皖民抗27号', '淮北市中级人民法院', '立案二庭', '刘海洋', '民事', '买卖合同纠纷', '指令原神法院再审', '2017-05-01 11:50:42', '抗诉', '3', null, null, '0', null, null, null, null, null, '1', null, null), ('12', '(2013)皖刑他28号', '阜阳市中级人民法院', '立案一庭', '袁玉清', '刑事', '组织、利用邪教组织破坏法律', '其他', '2017-05-01 11:50:42', '审理周期超过一年半以上', '4', null, null, '0', null, null, null, null, null, '1', null, null), ('13', '(2015)皖刑他113号', '淮南市中级人员法院', '立案二庭', '李飞', '刑事', '组织、利用邪教组织破坏法律', '其他', '2017-05-01 11:50:42', '抗诉', '13', '2', '1;2', '1', null, null, null, null, null, '1', null, null), ('14', '(2011)皖刑他229号', '合肥市中级人民法院', '立案一庭', '李铭', '刑事', '组织、利用邪教组织破坏法律', '其他', '2017-05-01 11:50:42', '再审', '14', null, null, null, null, null, null, null, null, '1', null, null), ('15', '(2012)皖民抗511号', '六安市中级人民法院', '立案二庭', '卢再举', '民事', '买卖合同纠纷', '其他', '2017-05-01 11:50:42', '发回改判', '15', null, null, null, null, null, null, null, null, '1', null, null), ('16', '(2015)皖民抗59号', '安庆市中级人民法院', '立案二庭', '张倩倩', '民事', '土地使用权纠纷', '其他', '2017-05-01 11:50:42', '发回改判', '16', null, null, null, null, null, null, null, null, '1', null, null), ('17', '(2015)皖民抗15号', '安庆市中级人民法院', '立案一庭', '胡美桦', '民事', '买卖合同纠纷', '其他', '2017-05-01 11:50:42', '发回改判', '17', null, null, null, null, null, null, null, null, '1', null, null), ('18', '(2014)皖刑他332号', '阜阳市中级人民法院', '立案二庭', '宋菲菲', '刑事', '组织、利用邪教组织破坏法律', '其他', '2017-05-01 11:50:42', '发回改判', '18', null, null, null, null, null, null, null, null, '1', null, null), ('19', '(2014)皖民抗192号', '芜湖市中级人民法院', '立案二庭', '洪天爱', '民事', '买卖合同纠纷', '其他', '2017-05-01 11:50:42', '再审', '19', null, null, null, null, null, null, null, null, '1', null, null), ('2', '(2016)皖民抗113号', '安徽省高级人民法院', '立案二庭', '张德林', '民事', '买卖合同纠纷', '指令原神法院再审', '2017-05-01 11:50:42', '抗诉', '5', null, null, null, null, null, null, null, null, '1', null, null), ('20', '(2009)皖民抗53号', '芜湖市中级人民法院', '立案一庭', '徐义勇', '民事', '买卖合同纠纷', '其他', '2017-05-01 11:50:42', '再审', '20', null, null, null, null, null, null, null, null, '1', null, null), ('21', '(2007)皖刑他9号', '马鞍山市中级人民法院', '立案二庭', '程磊', '刑事', '组织、利用邪教组织破坏法律', '其他', '2017-05-01 11:50:42', '再审', '21', null, null, null, null, null, null, null, null, '1', null, null), ('22', '(2005)皖刑他1112号', '马鞍山市中级人民法院', '立案一庭', '刘星', '刑事', '组织、利用邪教组织破坏法律', '其他', '2017-05-01 11:50:42', '再审', '22', null, null, null, null, null, null, null, null, '1', null, null), ('3', '(2013)皖刑他330号', '马鞍山市中级人民法院', '立案一庭', '袁玉清', '刑事', '组织、利用邪教组织破坏法律', '其他', '2017-05-01 11:50:42', '审理周期超过一年半以上', '6', null, null, null, null, null, null, null, null, '1', null, null), ('4', '(2016)皖民再19号', '合肥市中级人民法院', '立案一庭', '胡明劲', '民事', '土地使用权纠纷', '发回重审', '2017-05-01 11:50:42', '再审', '7', null, null, null, null, null, null, null, null, '1', null, null), ('5', '(2013)皖民抗23号', '安徽省高级人民法院', '立案二庭', '张华春', '民事', '买卖合同纠纷', '指令原神法院再审', '2017-05-01 11:50:42', '抗诉', '8', null, null, null, null, null, null, null, null, '1', null, null), ('6', '(2016)皖刑他330号', '安徽省高级人民法院', '立案一庭', '方圆', '刑事', '组织、利用邪教组织破坏法律', '其他', '2017-05-01 11:50:42', '审理周期超过一年半以上', '9', null, null, null, null, null, null, null, null, '1', null, null), ('7', '(2016)皖民再23号', '合肥市中级人民法院', '立案一庭', '邓中明', '民事', '土地使用权纠纷', '发回重审', '2017-05-01 11:50:42', '再审', '10', null, null, null, null, null, null, null, null, '1', null, null), ('8', '(2017)皖民抗24号', '安徽省高级人民法院', '立案二庭', '李全友', '民事', '买卖合同纠纷', '指令原神法院再审', '2017-05-01 11:50:42', '抗诉', '11', null, null, null, null, null, null, null, null, '1', null, null), ('9', '(2016)皖刑他25号', '安徽省高级人民法院', '立案一庭', '汪中飞', '刑事', '组织、利用邪教组织破坏法律', '其他', '2017-05-01 11:50:42', '审理周期超过一年半以上', '12', null, null, null, null, null, null, null, null, '1', null, null);
COMMIT;

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
  `ajid` int(11) DEFAULT NULL COMMENT '案件id',
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
--  Records of `bd_publish`
-- ----------------------------
BEGIN;
INSERT INTO `bd_publish` VALUES ('043e73a022784ebb9f06482028567011', 'fasdfasdfsadf', '#000000', '80201', 'fdsafsdafsdf', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 23:59:33', null, null, '10601', null), ('2047f137d39248b9be48771c4ca7ddc3', '21312', '#000000', '80201', '31232133213123', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-02 18:26:21', null, null, '80301', null), ('33404277b46c4689837cedd9c41f8829', '3123', '#000000', '80201', '', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-02 18:25:18', null, null, '80301', null), ('5080b6e60f5242c0853a0f9290e7df26', 'dasdasd', '#000000', '80201', 'dsadasdsaddasdasdasdas', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 00:02:15', null, null, '10601', null), ('5778d2ca232049dea241f359b9e34626', '测试工作流5555', '#000000', '80201', '555555555555555', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 18:16:29', 'ccd1e2bea7fd48caa39b93a97aa09ffd', null, '10501', null), ('740192667a9945d1ab657e7c8c2b484a', '测试工作流1', '#000000', '80201', 'workflow test1', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 16:53:08', 'ccd1e2bea7fd48caa39b93a97aa09ffd', null, '10603', null), ('748576695dc848398f7ec4bf135a5f95', '测试老吕发布', '#000000', '80201', '12321312321', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '2017-05-03 18:23:48', 'ccd1e2bea7fd48caa39b93a97aa09ffd', null, '10501', null), ('820bd0b7b7ce46f7a0458692217991a8', '12321321312', '#a94442', '80201', '213123213', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-02 18:22:08', null, null, '80301', null), ('991bd49703ac419e930dafeef4af52f4', '测试工作流2', '#a94442', '80201', '2', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 18:15:56', null, null, '10601', null), ('a0b8957a85854809becf84bf3ca0f764', 'test', '#a94442', '80201', 'testcontent', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-02 18:20:27', null, null, '80301', null), ('a2edd76cfe454c5d8e57f11d23d55cb9', '5f', '#000000', '80201', '5ffffggggggg', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-02 18:50:02', null, null, '80301', null), ('aade823e19de4c4591fb56a4505b87c4', '测试工作流3', '#000000', '80201', '3差错差错错错错错错错错错', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 18:16:15', 'ccd1e2bea7fd48caa39b93a97aa09ffd', null, '10502', null), ('abcb434495114650aeacc70b950fa501', '12312312', '#000000', '80201', '', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-02 18:24:40', null, null, '80301', null), ('cbcf2dbac8354e0aacaef05dff6d7ea9', null, null, null, null, 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-02 18:15:42', null, null, '80301', null), ('d2ffb6c18cd24004b877627465d45188', '我们来测试一下', '#a94442', '80201', '213123123fsdfsdfs', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-02 20:19:36', null, null, '80301', null), ('d74d95dae733407bb01546cb92614a84', '21312', '#000000', '80201', '', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-02 18:23:52', null, null, '80301', null), ('e704fe5ef5bd4386ae30e9876463b05c', '123', null, '80201', '', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-02 18:19:19', null, null, '80301', null), ('f41ac1c85bf74e4a8d0b9363b6550a4f', 'test5', '#000000', '80201', '5', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-02 18:46:40', null, null, '80301', null);
COMMIT;

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
--  Records of `bd_publish_read`
-- ----------------------------
BEGIN;
INSERT INTO `bd_publish_read` VALUES ('1d51b5d1af514823ba4c2e4bc49f8014', 'undefined', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-20 09:08:36'), ('38c1403a463a4782809c06947281daa1', '5080b6e60f5242c0853a0f9290e7df26', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 17:12:15'), ('3dbac90fc6bd447ba536d3e86c6c3313', '991bd49703ac419e930dafeef4af52f4', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 17:14:46'), ('50d2da98ae6b4c408265842615a3e7c1', '740192667a9945d1ab657e7c8c2b484a', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 23:57:50'), ('589be6c4a99441ffb7f9ef9066ab913a', 'abcb434495114650aeacc70b950fa501', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 17:20:00'), ('6bbeb77778f445bda28712e5fdc91a77', 'f41ac1c85bf74e4a8d0b9363b6550a4f', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 17:14:52'), ('808948737d6b45a48cd4e7c5f4c6ab5a', '2047f137d39248b9be48771c4ca7ddc3', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 17:19:52'), ('94c313bc1e1644f7820eb1c7971ea5b6', '5778d2ca232049dea241f359b9e34626', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 21:11:43'), ('a12d41e7460c487d8c05a6bfd0652b6f', '748576695dc848398f7ec4bf135a5f95', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 21:04:10'), ('ca24525d74384ae48956315dee8c0753', '33404277b46c4689837cedd9c41f8829', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 17:19:57'), ('cadbdfa22bb744c3a9607da2f7bcb0c9', 'd2ffb6c18cd24004b877627465d45188', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-03 21:14:07'), ('e487aa6601c94636b06a56407151b82c', 'a2edd76cfe454c5d8e57f11d23d55cb9', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 17:14:49'), ('ed6f66705018463793b08ff1a5942187', 'aade823e19de4c4591fb56a4505b87c4', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-07 23:57:27'), ('f453927fa006407a813331cd35577d20', '043e73a022784ebb9f06482028567011', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-08 17:13:11');
COMMIT;

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
--  Records of `bd_scoretable_items`
-- ----------------------------
BEGIN;
INSERT INTO `bd_scoretable_items` VALUES ('03f537a90f5d44b7bfc81edca8ff33c3', '审理程序', '是否充分保障诉讼参与人行使诉讼权利', '5', '7', null, null, null, null, null, null), ('08e4bed4cfbe4a5c83944505ad2ede4a', '12', '12', '12', '12', null, null, null, null, '1d016423e45c450980798ec0815c0549', null), ('1', '事实证据与实体处理', '审理查明的事实是否全面、客观、清楚', '8', '1', null, null, null, null, '2', '1'), ('1087724430b94de9a06336fcee5ec0bd', 'cszcxz', 'czxcz', '1', '5', null, null, null, null, null, null), ('3', '事实证据与实体处理', '使用法律是否正确', '3', '3', null, null, null, null, '2', '1'), ('30dd1da1b5dc40119d60aa84af588591', '2222', '233', '12', '3', null, null, null, null, '971099537c794a35b1c5386b4621faef', null), ('4', '事实证据与实体处理', '处理结果是否适当', '6', '4', null, null, null, null, '2', '1'), ('48e4b11c8fe5452ca8c2326d89bac002', '2csddf', 'fsdvsd', '1', '1', null, null, null, null, null, null), ('5', '审理程序', '庭审是否规范严谨，能否有序组织举证，质证，认证和辩论。', '4', '5', null, null, null, null, '2', '1'), ('6', '审理程序', '是否严格遵守规定', '5', '6', null, null, null, null, '2', '1'), ('6394088214f04558b05f40cfb0bfc9ca', '审理程序', '是否严格遵守规定', '5', '6', null, null, null, null, null, null), ('6e4a6626cea24b4687bf737f7d2a9cd4', '事实证据与实体处理', '是否有其他不规范情形', '2', '1', null, null, null, null, null, null), ('7', '审理程序', '是否充分保障诉讼参与人行使诉讼权利', '5', '7', null, null, null, null, '2', '1'), ('78df36381b8a4505862b9b266663907e', '审理程序', '庭审是否规范严谨，能否有序组织举证，质证，认证和辩论。', '4', '5', null, null, null, null, null, null), ('927112ac9309480e837f3b8e2f13ae96', '事实证据与实体处理', '使用法律是否正确', '3', '3', null, null, null, null, null, null), ('a6133a5c25414f629b63d59632ae909a', '2222', '333', '44', '1', null, null, null, null, '971099537c794a35b1c5386b4621faef', null), ('c103029b50e7485a8c87c80004cbd3a0', '事实证据与实体处理', '处理结果是否适当', '6', '4', null, null, null, null, null, null), ('cb7418e778aa466db6c60fe9d4d0f537', 'dszcsd', 'dasdas', '3', '2', null, null, null, null, null, null), ('e1598c0ac2164ba7abfcb25bc2a8ca75', '222', '222', '22', '2', null, null, null, null, '1d016423e45c450980798ec0815c0549', null), ('ffc82f3b2df94c3d9b8a6239faec8254', '事实证据与实体处理', '审理查明的事实是否全面、客观、清楚', '18', '1', null, null, null, null, null, null);
COMMIT;

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
--  Records of `bd_scoretables`
-- ----------------------------
BEGIN;
INSERT INTO `bd_scoretables` VALUES ('0e85e49d00954e12864253e6ce9bf657', 'test', '111', '1', '2', '', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-06 00:00:00', null, null, null, null), ('1', '测试模板1', '这是测试数据', '1', '1', '100', '8b85c73c8a7b4bb48fdd19448ef01c6d', '2017-10-03 00:00:00', null, null, null, '1'), ('1d016423e45c450980798ec0815c0549', 'testmaf', '1', '1', '1', '34', 'eaf34bcf8ba945598067b7f88fad0099', '2017-10-05 00:00:00', null, null, null, null), ('2', 'sssss模板2', 'e214234', '1', '1', '', null, null, null, null, null, null), ('5d647d383c2e41ed907a15cbf1d45112', 'fuckiutem', 'fasdf', '1', '1', '', null, null, null, null, null, null), ('67c9156c95b34c40adf7f69e15d16705', 'no.4', 'this is sparders.', '1', '1', '', null, null, null, null, null, null), ('693040ffbd344b4196104a7f9e832c04', 'no.5', '5', '1', '1', '', null, null, null, null, null, null), ('971099537c794a35b1c5386b4621faef', 'xxxxx', '11111', '1', '1', '', null, null, null, null, null, null);
COMMIT;

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
--  Records of `sd_logs`
-- ----------------------------
BEGIN;
INSERT INTO `sd_logs` VALUES ('1', '案件抽取', 'eaf34bcf8ba945598067b7f88fad0099', '80101', '2017-05-02 16:07:41', 'test');
COMMIT;

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
  PRIMARY KEY (`zzjgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构表';

-- ----------------------------
--  Records of `sd_organization`
-- ----------------------------
BEGIN;
INSERT INTO `sd_organization` VALUES ('133c0a6240db4f53b0ce4ecb046e7fa8', '芜湖市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:59:34', 'eaf34bcf8ba945598067b7f88fad0099', '2017-09-29 10:16:59', null, '1', 'true'), ('19b0d396d77645c39e7ec0c1a86106c6', '六安市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 18:00:21', 'eaf34bcf8ba945598067b7f88fad0099', '2017-09-29 10:17:04', null, '1', 'true'), ('1b296cf0cc8a4d2eb248a5cec1caf626', '宿州市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 18:01:55', 'eaf34bcf8ba945598067b7f88fad0099', '2017-09-29 10:17:09', null, '1', 'true'), ('1b696581d23a4aeca9611645b8b7ebfa', '滁州市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 18:02:20', 'eaf34bcf8ba945598067b7f88fad0099', '2017-09-29 10:17:13', null, '1', 'true'), ('1ca40efde4c14912a0abbc8e4f9ccf75', '安徽省高级人民法院', '0', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-07 12:58:30', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-07 13:13:00', null, '1', 'true'), ('2728cd2f6aa042a99a9dc429fa59e866', '铜陵市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 18:01:13', 'eaf34bcf8ba945598067b7f88fad0099', '2017-09-29 10:17:17', null, '1', 'true'), ('2998e3678a9f474ebc3a07c8ac8374ec', '庐阳区人民法院', '912f33fa894f44b5813350ba04c9f343', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:59:13', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:59:13', null, '1', 'true'), ('34328e0864c24e2bb33a0245d7b00367', '肥西县人民法院', '912f33fa894f44b5813350ba04c9f343', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:58:28', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:58:28', null, '1', 'true'), ('3ce1051a8b9e44a3a16164d7b5a0524f', '马鞍山市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:59:41', 'eaf34bcf8ba945598067b7f88fad0099', '2017-09-29 10:17:22', null, '1', 'true'), ('4c4091176a094a7399c9f4aa97a63f55', '黄山市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 18:00:57', 'eaf34bcf8ba945598067b7f88fad0099', '2017-09-29 10:17:26', null, '1', 'true'), ('57cb7e4bc88d46b3b2a07ecc06f9dd4c', '池州市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 18:01:05', 'eaf34bcf8ba945598067b7f88fad0099', '2017-09-29 10:17:31', null, '1', 'true'), ('596734db2f44448e9f974cc3d33f52dd', '安庆市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 18:00:31', 'eaf34bcf8ba945598067b7f88fad0099', '2017-09-29 10:17:35', null, '1', 'true'), ('5c9db6adb79943c1b4a213211952f7fc', '淮北市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:59:58', 'eaf34bcf8ba945598067b7f88fad0099', '2017-09-29 10:17:40', null, '1', 'true'), ('5d1c03b99b48455a8fad9026b5da7e95', '瑶海区人民法院', '912f33fa894f44b5813350ba04c9f343', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:58:56', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:58:56', null, '1', 'true'), ('66c310e9dff442ce9f6ec83949a8b60d', '肥东县人民法院', '912f33fa894f44b5813350ba04c9f343', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-25 10:57:32', 'eaf34bcf8ba945598067b7f88fad0099', '2017-05-25 10:57:32', null, '1', 'true'), ('6bbb6f7916a1481092dfc9b644cf697f', '蜀山区人民法院', '912f33fa894f44b5813350ba04c9f343', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:58:47', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:58:47', null, '1', 'true'), ('6ddb9c80a96642c5afdffe2a01ca41ba', '蚌埠市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 18:00:07', 'eaf34bcf8ba945598067b7f88fad0099', '2017-09-29 10:17:49', null, '1', 'true'), ('86a841c55e7945e3976db3d39f227ad1', '包河区人民法院', '912f33fa894f44b5813350ba04c9f343', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:59:04', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:59:04', null, '1', 'true'), ('8ba26a627025446c88eee639cedc8720', '长丰县人民法院', '912f33fa894f44b5813350ba04c9f343', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:58:39', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:58:39', null, '1', 'true'), ('912f33fa894f44b5813350ba04c9f343', '合肥市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-07 13:12:48', 'eaf34bcf8ba945598067b7f88fad0099', '2017-04-07 13:12:48', null, '1', 'true'), ('c876e282ad8040cd84b1f7607407dc82', '淮南市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:59:23', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:59:23', null, '1', 'true'), ('d44cf93b52ef42fb83eac0062b0c1571', '亳州市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:59:53', 'eaf34bcf8ba945598067b7f88fad0099', '2017-09-29 10:17:57', null, '1', 'true'), ('e46c3b46ef114242aaebb1826a2d02d1', '宣城市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 18:00:51', 'eaf34bcf8ba945598067b7f88fad0099', '2017-09-29 10:18:01', null, '1', 'true'), ('e5ebfe18e53445f7b54f610d6a7ee037', '阜阳市中级人民法院', '1ca40efde4c14912a0abbc8e4f9ccf75', 'eaf34bcf8ba945598067b7f88fad0099', '2017-08-24 17:59:48', 'eaf34bcf8ba945598067b7f88fad0099', '2017-09-29 10:18:05', null, '1', 'true');
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
--  Records of `sd_professional`
-- ----------------------------
BEGIN;
INSERT INTO `sd_professional` VALUES ('234c299a094040d4886c94878300d0bf', '80401;80402;80403;', '80501;', '人大代表', 'a1f9e991c29a4479ac11f7b17f1c9ed4', '21321'), ('3880f477160c404ba4530f5208bc65a0', '80403;', '80502;', '资深检察官', 'eaf34bcf8ba945598067b7f88fad0099', '12'), ('8114b72765b4455c816b170de4786026', '80403;', '80501;', '资深律师', 'baea30f17bb247758b4ec121a35d589a', '12'), ('ef1e6f3d5e8640219f6083714a65e61b', '80401;80402;80403;80404;80405;80406;', '80501;', '资深法官', '8b85c73c8a7b4bb48fdd19448ef01c6d', 'pretty good.'), ('f20266fe18d2431aab25a792b20a7651', '80401;80404;80405;', '', '政协委员', 'ccd1e2bea7fd48caa39b93a97aa09ffd', '');
COMMIT;

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
INSERT INTO `sd_user` VALUES ('8b85c73c8a7b4bb48fdd19448ef01c6d', 'join', '1', '04bce07d8ecb4fb9beb3fcdeae8abedb;dcf1fae5cc914828a8417d279b70fedc', '912f33fa894f44b5813350ba04c9f343', '1', null, null, '1', '宋佳卿', '1', '', null, 'b99f97d09f364b5eb0db29fd89c10f11', '2017-08-21 10:57:30', 'b99f97d09f364b5eb0db29fd89c10f11', '2017-08-24 18:05:16', null, '1'), ('a1f9e991c29a4479ac11f7b17f1c9ed4', 'verify', '1', '04bce07d8ecb4fb9beb3fcdeae8abedb;d46a2980811948519d50e359bf81b61d;33b8bf7b36554b9ba7c8841a81c33f70;df2480728a1047cf8733daac686ded50;bc5133bb2a1d41d48f451a3c17248ed3;856fbd2cc1ba460d9cf7232b7dc3608c;d1ff43ffb2f744cc9398a2a7dbdb7689;5d54781cd28443aab04ea502be8b8495;6a5ffc10493048bc881a5ab0ab6a7acd;44089ff891fe40fa85407b3bc78ca822', '1ca40efde4c14912a0abbc8e4f9ccf75', '1', null, null, '2', '张晋鑫', '1', '', null, 'b99f97d09f364b5eb0db29fd89c10f11', '2017-08-21 10:45:01', 'b99f97d09f364b5eb0db29fd89c10f11', '2017-08-24 18:05:08', null, '1'), ('baea30f17bb247758b4ec121a35d589a', 'professional', '1', '04bce07d8ecb4fb9beb3fcdeae8abedb', '912f33fa894f44b5813350ba04c9f343', '1', null, '1', '1', '吴佐明', '1', '', null, 'b99f97d09f364b5eb0db29fd89c10f11', '2017-08-21 14:06:41', 'b99f97d09f364b5eb0db29fd89c10f11', '2017-08-24 18:05:31', null, '1'), ('ccd1e2bea7fd48caa39b93a97aa09ffd', 'admin', '1', '04bce07d8ecb4fb9beb3fcdeae8abedb;d46a2980811948519d50e359bf81b61d;df2480728a1047cf8733daac686ded50;bc5133bb2a1d41d48f451a3c17248ed3;d1ff43ffb2f744cc9398a2a7dbdb7689;5d54781cd28443aab04ea502be8b8495', '1ca40efde4c14912a0abbc8e4f9ccf75', 'lv@lv.com', null, '1', '1', '钟鹏远', '1', '', null, 'b99f97d09f364b5eb0db29fd89c10f11', '2017-05-02 11:24:01', 'b99f97d09f364b5eb0db29fd89c10f11', '2017-08-24 18:06:00', null, '1'), ('eaf34bcf8ba945598067b7f88fad0099', 'sysadmin', '1', '45e9cbedabbb4d308428572ba84ad2f0;6a5ffc10493048bc881a5ab0ab6a7acd', '1ca40efde4c14912a0abbc8e4f9ccf75', '123@123.com', '152917543b3246f2a25c9b7980b2608d', null, '18855150306', '程晨', '1', 'b99f97d09f364b5eb0db29fd89c10f11', '刘韦', 'b99f97d09f364b5eb0db29fd89c10f11', '2016-10-24 17:06:52', 'b99f97d09f364b5eb0db29fd89c10f11', '2017-10-08 00:01:59', null, '1');
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
