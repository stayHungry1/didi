/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : dache

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-05-08 21:37:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dache_drivers
-- ----------------------------
DROP TABLE IF EXISTS `dache_drivers`;
CREATE TABLE `dache_drivers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '司机用户名',
  `password` varchar(255) NOT NULL,
  `rel_name` varchar(255) NOT NULL COMMENT '司机姓名',
  `telephone` varchar(255) NOT NULL COMMENT '手机号',
  `car` varchar(255) NOT NULL COMMENT '车型',
  `car_no` varchar(255) NOT NULL,
  `vin` varchar(255) NOT NULL COMMENT '汽车vin码',
  `logo` varchar(255) NOT NULL COMMENT '司机头像',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '司机状态 0未申请 1申请未审核 2 审核通过 3审核拒绝',
  `reason` varchar(255) NOT NULL COMMENT '审核意见',
  `is_free` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否处于忙碌状态 0否 1是',
  `lat` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL,
  `card_no` varchar(255) NOT NULL COMMENT '身份证号',
  `carModels` varchar(255) NOT NULL COMMENT '准驾车型',
  `firstGetDocDate` date NOT NULL COMMENT '首次领证时间',
  `archviesNo` varchar(255) NOT NULL COMMENT '备案号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dache_order
-- ----------------------------
DROP TABLE IF EXISTS `dache_order`;
CREATE TABLE `dache_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` varchar(255) NOT NULL COMMENT '订单编号',
  `createtime` int(11) NOT NULL COMMENT '订单生成时间',
  `starttime` int(11) NOT NULL COMMENT '订单开始时间',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `driver_id` int(11) NOT NULL COMMENT '司机id',
  `start_lat` varchar(255) NOT NULL COMMENT '行程开始地点',
  `end_lat` varchar(255) NOT NULL COMMENT '行程结束地点',
  `start_lng` varchar(255) NOT NULL,
  `end_lng` varchar(255) NOT NULL,
  `endtime` int(11) NOT NULL COMMENT '行程结束时间',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `user_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态 发起叫车0  确认上车 1',
  `driver_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '司机状态 未接单0 接单 1 客户上车 2',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态 0 未开始 1 已开始 2 已结束',
  `point` int(11) NOT NULL COMMENT '评分',
  `pingjia` varchar(255) NOT NULL COMMENT '评价内容',
  `start_location` varchar(255) NOT NULL COMMENT '开始地点',
  `end_location` varchar(255) NOT NULL COMMENT '结束地点',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dache_user
-- ----------------------------
DROP TABLE IF EXISTS `dache_user`;
CREATE TABLE `dache_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `lat` varchar(255) NOT NULL COMMENT '纬度',
  `lng` varchar(255) NOT NULL COMMENT '经度',
  `remain_cost` decimal(10,2) NOT NULL DEFAULT '100.00' COMMENT '账户余额',
  `logo` varchar(255) NOT NULL COMMENT '用户头像',
  `telephone` varchar(255) NOT NULL COMMENT '手机号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
