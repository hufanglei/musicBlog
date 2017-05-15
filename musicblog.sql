/*
Navicat MySQL Data Transfer

Source Server         : keke
Source Server Version : 50152
Source Host           : localhost:3306
Source Database       : musicblog

Target Server Type    : MYSQL
Target Server Version : 50152
File Encoding         : 65001

Date: 2016-09-17 17:46:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hfl_blog
-- ----------------------------
DROP TABLE IF EXISTS `hfl_blog`;
CREATE TABLE `hfl_blog` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `catagory_id` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `musiclink` varchar(100) DEFAULT NULL,
  `musictor` varchar(80) DEFAULT NULL,
  `musictitle` varchar(100) DEFAULT NULL,
  `musicsize` int(11) DEFAULT NULL,
  `musictime` varchar(10) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '0未发布 1发布',
  `is_delete` int(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hfl_blog
-- ----------------------------
INSERT INTO `hfl_blog` VALUES ('1', '当美好事物改变的时候1111111', '一首歌唱到最后还会剩下什么？\r\n\r\n无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。\r\n\r\n本期音乐为华语摇滚乐专题。', '1', 'resource/images/1.jpg', '2016-04-18 23:10:34', '2016-04-18 23:25:49', 'resources/blog/1/01.mp3', 'keke', '我爱你', '12', '02:57', '1', '55', '1', '0', '1');
INSERT INTO `hfl_blog` VALUES ('2', '美好随时发生', '一首歌唱到最后还会剩下什么？\r\n\r\n无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。\r\n\r\n本期音乐为华语摇滚乐专题。', '2', 'resource/images/2.jpg', '2016-04-18 23:10:34', '2016-04-18 23:25:49', 'resources/blog/1/03.mp3', 'keke', '我爱你', '12', '02:57', '0', '15', '1', '0', '1');
INSERT INTO `hfl_blog` VALUES ('3', '当美好事物改变的时候3', '一首歌唱到最后还会剩下什么？\r\n\r\n无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。\r\n\r\n本期音乐为华语摇滚乐专题。', '3', 'resource/images/3.jpg', '2016-04-18 23:10:34', '2016-04-18 23:25:49', 'resources/blog/1/01.mp3', 'keke', '我爱你', '12', '02:57', '5', '34', '1', '0', '1');
INSERT INTO `hfl_blog` VALUES ('4', '当美好事物改变的时候4', '一首歌唱到最后还会剩下什么？\r\n\r\n无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。\r\n\r\n本期音乐为华语摇滚乐专题。', '1', 'resource/images/4.jpg', '2016-04-18 23:10:34', '2016-04-18 23:25:49', 'resources/blog/1/01.mp3', 'keke', '我爱你', '12', '02:57', '6', '19', '1', '0', '1');
INSERT INTO `hfl_blog` VALUES ('5', '当美好事物改变的时候5', '一首歌唱到最后还会剩下什么？\r\n\r\n无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。\r\n\r\n本期音乐为华语摇滚乐专题。', '3', 'resource/images/5.jpg', '2016-04-18 23:10:34', '2016-04-18 23:25:49', 'resources/blog/1/01.mp3', 'keke', '我爱你', '12', '02:57', '5', '14', '1', '0', '1');
INSERT INTO `hfl_blog` VALUES ('6', '当美好事物改变的时候6', '一首歌唱到最后还会剩下什么？\r\n\r\n无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。\r\n\r\n本期音乐为华语摇滚乐专题。', '1', 'resource/images/6.jpg', '2016-04-18 23:10:34', '2016-04-18 23:25:49', 'resources/blog/1/01.mp3', 'keke', '我爱你', '12', '02:57', '15', '13', '1', '0', '1');
INSERT INTO `hfl_blog` VALUES ('7', '当美好事物改变的时候7', '一首歌唱到最后还会剩下什么？\r\n\r\n无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。\r\n\r\n本期音乐为华语摇滚乐专题。', '1', 'resource/images/7.jpg', '2016-04-18 23:10:34', '2016-04-18 23:25:49', 'resources/blog/1/01.mp3', 'keke', '我爱你', '12', '02:57', '23', '25', '1', '0', '1');
INSERT INTO `hfl_blog` VALUES ('8', '当美好事物改变的时候8', '一首歌唱到最后还会剩下什么？\r\n\r\n无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。\r\n\r\n本期音乐为华语摇滚乐专题。', '1', 'resource/images/8.jpg', '2016-04-18 23:10:34', '2016-04-18 23:25:49', 'resources/blog/1/01.mp3', 'keke', '我爱你', '12', '02:57', '58', '0', '1', '0', '1');
INSERT INTO `hfl_blog` VALUES ('9', '当美好事物改变的时候9', '一首歌唱到最后还会剩下什么？\r\n\r\n无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。\r\n\r\n本期音乐为华语摇滚乐专题。', '1', 'resource/images/9.jpg', '2016-04-18 23:10:34', '2016-04-18 23:25:49', 'resources/blog/1/01.mp3', 'keke', '我爱你', '12', '02:57', '41', '554', '1', '0', '1');
INSERT INTO `hfl_blog` VALUES ('10', '当美好事物改变的时候10', '一首歌唱到最后还会剩下什么？\r\n\r\n无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。\r\n\r\n本期音乐为华语摇滚乐专题。', '1', 'resource/images/10.jpg', '2016-04-18 23:10:34', '2016-04-18 23:25:49', 'resources/blog/1/01.mp3', 'keke', '我爱你', '12', '02:57', '554', '0', '1', '0', '1');
INSERT INTO `hfl_blog` VALUES ('11', '当美好事物改变的时候11', '一首歌唱到最后还会剩下什么？\r\n\r\n无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。\r\n\r\n本期音乐为华语摇滚乐专题。', '1', 'resource/images/1.jpg', '2016-04-18 23:10:34', '2016-04-18 23:25:49', 'resources/blog/1/01.mp3', 'keke', '我爱你', '12', '02:57', '4', '44', '1', '0', '1');
INSERT INTO `hfl_blog` VALUES ('12', '当美好事物改变的时候12', '一首歌唱到最后还会剩下什么？\r\n\r\n无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。\r\n\r\n本期音乐为华语摇滚乐专题。', '1', 'resource/images/2.jpg', '2016-04-18 23:10:34', '2016-04-18 23:25:49', 'resources/blog/1/01.mp3', 'keke', '我爱你', '12', '02:57', '9', '66', '1', '0', '1');
INSERT INTO `hfl_blog` VALUES ('13', '当美好事物改变的时候13', '一首歌唱到最后还会剩下什么？\r\n\r\n无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。\r\n\r\n本期音乐为华语摇滚乐专题。', '1', 'resource/images/3.jpg', '2016-04-18 23:10:34', '2016-04-18 23:25:49', 'resources/blog/1/01.mp3', 'keke', '我爱你', '12', '02:57', '36', '0', '1', '0', '1');

-- ----------------------------
-- Table structure for hfl_category
-- ----------------------------
DROP TABLE IF EXISTS `hfl_category`;
CREATE TABLE `hfl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '0未发布1发布',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hfl_category
-- ----------------------------
INSERT INTO `hfl_category` VALUES ('1', '摇滚', '2016-04-18 23:09:30', null, '1');
INSERT INTO `hfl_category` VALUES ('2', '流行', '2016-04-18 23:09:36', null, '1');
INSERT INTO `hfl_category` VALUES ('3', '民谣', '2016-04-18 23:09:46', null, '1');
INSERT INTO `hfl_category` VALUES ('4', '黑暗', '2016-04-18 23:09:54', null, '1');

-- ----------------------------
-- Table structure for hfl_user
-- ----------------------------
DROP TABLE IF EXISTS `hfl_user`;
CREATE TABLE `hfl_user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `email` varchar(140) DEFAULT NULL,
  `header_pic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hfl_user
-- ----------------------------
INSERT INTO `hfl_user` VALUES ('1', '胡方雷', '2cdldwr7gboW8prL9eZdsQ==', '690328661@qq.com', '1.jpg');
