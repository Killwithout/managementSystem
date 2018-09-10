
/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : cjk_ssm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-09-10 16:16:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cjk_content
-- ----------------------------
DROP TABLE IF EXISTS `cjk_content`;
CREATE TABLE `cjk_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_name` varchar(50) NOT NULL COMMENT '内容名称',
  `content_image` varchar(100) NOT NULL COMMENT '图片',
  `content_type` varchar(20) DEFAULT NULL COMMENT '属性',
  `content_typeName` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `status` int(11) NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='内容管理表';

-- ----------------------------
-- Records of cjk_content
-- ----------------------------
INSERT INTO `cjk_content` VALUES ('1', '手机数码产品测试', 'http://localhost:8080/downFile/20180829115450.png', '首页测试', '产品分类', '1', '2018-08-29 11:55:05');
INSERT INTO `cjk_content` VALUES ('2', '测试内容', '/images/content-2.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('3', '测试内容', '/images/content-3.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('4', '测试内容', '/images/content-4.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('5', '项链广告测试', 'http://localhost:8080/downFile/20180829143416.jpg', '首页测试', '售后分类', '1', '2018-08-29 14:34:34');
INSERT INTO `cjk_content` VALUES ('6', '测试内容', '/images/content-1.png', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('7', '2222222', 'http://localhost:8080/downFile/20180905113250.png', '首页测试', '售后分类', '1', '2018-09-05 11:32:59');
INSERT INTO `cjk_content` VALUES ('8', '测试内容', '/images/content-3.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('9', '测试内容', '/images/content-4.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('10', '测试内容', '/images/11.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('11', '测试内容', '/images/content-1.png', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('12', '测试内容', '/images/content-2.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('13', '测试内容', '/images/content-3.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('14', '测试内容', '/images/content-4.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('15', '测试内容', '/images/11.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('16', '测试内容', '/images/content-1.png', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('17', '测试内容', '/images/content-2.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('18', '测试内容', '/images/content-3.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('19', '测试内容', '/images/content-4.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('20', '测试内容', '/images/11.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('21', '测试内容', '/images/content-1.png', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('22', '测试内容', '/images/content-2.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('23', '测试内容', '/images/content-3.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('24', '测试内容', '/images/content-4.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('25', '测试内容', '/images/11.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('26', '测试内容', '/images/content-1.png', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('27', '测试内容', '/images/content-2.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('28', '测试内容', '/images/content-3.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('29', '测试内容', '/images/content-4.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('30', '测试内容', '/images/11.jpg', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('31', '测试内容', '/images/content-1.png', '首页测试', '测试cjk', '1', '2018-08-21 14:41:29');
INSERT INTO `cjk_content` VALUES ('32', '瑜伽服测试', 'http://localhost:8080/downFile/20180829115526.jpg', '首页测试', '产品分类', '1', '2018-08-29 11:55:38');

-- ----------------------------
-- Table structure for user_mail
-- ----------------------------
DROP TABLE IF EXISTS `user_mail`;
CREATE TABLE `user_mail` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_mail
-- ----------------------------
INSERT INTO `user_mail` VALUES ('7', 'admin', 'admin', 'Kill', '351285143@qq.com', '0', '5c6c44a455fd4d86a9f9388e7aac2a6f');
INSERT INTO `user_mail` VALUES ('8', 'admin', 'admin', 'Kill', '351285143@qq.com', '0', '18767a5064e543728e74266e4cec3efd');
INSERT INTO `user_mail` VALUES ('9', 'admin', 'admin', 'Kill', '351285143@qq.com', '0', '87b6af19192d423d814cd35070969bca');
INSERT INTO `user_mail` VALUES ('10', 'admin', 'admin', 'Kill', '1741423063@qq.com', '1', '');
INSERT INTO `user_mail` VALUES ('11', 'admin', 'admin', 'Kill', '351285143@qq.com', '0', '982bfaa83be74533a3f2a2f3f4a37322');
INSERT INTO `user_mail` VALUES ('12', 'admin', 'admin', 'Kill', '351285143@qq.com', '0', 'ef6bf6f9a9e94a7c8434a2c25f93812a');
INSERT INTO `user_mail` VALUES ('13', 'admin', 'admin', 'Kill', '351285143@qq.com', '0', '1ee7bab933f54e19bd92fcf5cfa2d180');
INSERT INTO `user_mail` VALUES ('14', 'admin', 'admin', 'Kill', '351285143@qq.com', '0', '3566e00b12fe4def8b60afcae1365b9d');
INSERT INTO `user_mail` VALUES ('15', 'admin', 'admin', 'Kill', '351285143@qq.com', '0', '66f3580aedc34392b3219ceacaf2e037');
INSERT INTO `user_mail` VALUES ('16', 'admin', 'admin', 'Kill', '351285143@qq.com', '0', 'e9c70095c75e44e48374473263ca011d');

-- ----------------------------
-- Table structure for user_t
-- ----------------------------
DROP TABLE IF EXISTS `user_t`;
CREATE TABLE `user_t` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码，加密存储',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `phonenumber` varchar(50) DEFAULT NULL COMMENT '电话',
  `status` int(11) NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL,
  `create_time_ip` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user_t
-- ----------------------------
INSERT INTO `user_t` VALUES ('5', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1741423063@qq.com', '18153799876', '1', '2018-06-04 14:36:42', '192.168.174.1');
