/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 001
Source Host           : localhost:3306
Source Database       : reggie

Target Server Type    : MYSQL
Target Server Version : 001
File Encoding         : 65001

Date: 2023-05-08 10:41:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book` (
  `id` bigint(20) NOT NULL COMMENT 'PRIMARY KEY',
  `user_id` bigint(20) NOT NULL COMMENT 'user id',
  `consignee` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'consignee',
  `gender` tinyint(4) NOT NULL COMMENT 'gender 0 famale, 1 male',
  `phone` varchar(11) COLLATE utf8_bin NOT NULL COMMENT 'phone number',
  `province_code` varchar(12) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'province code',
  `province_name` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'province name',
  `city_code` varchar(12) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'city code',
  `city_name` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '`city name`',
  `district_code` varchar(12) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'district code',
  `district_name` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '`district name`',
  `detail` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'detail address',
  `label` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'label',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'default 0 no ,1yes',
  `create_time` datetime NOT NULL COMMENT 'create time',
  `update_time` datetime NOT NULL COMMENT 'update time',
  `create_user` bigint(20) NOT NULL COMMENT 'create user',
  `update_user` bigint(20) NOT NULL COMMENT 'update user',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT 'deleted',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='address management';

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES ('1417414526093082626', '1417012167126876162', 'Mike', '1', '13812345678', null, null, null, null, null, null, 'Montreal office', 'company', '1', '2021-07-20 17:22:12', '2021-07-20 17:26:33', '1417012167126876162', '1417012167126876162', '0');
INSERT INTO `address_book` VALUES ('1417414926166769666', '1417012167126876162', 'Leonardo', '1', '13512345678', null, null, null, null, null, null, 'test', 'home', '0', '2021-07-20 17:23:47', '2021-07-20 17:23:47', '1417012167126876162', '1417012167126876162', '0');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL COMMENT 'PRIMARY KEY',
  `type` int(11) DEFAULT NULL COMMENT 'type   1 dish type, 2 set meal type',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'type name',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT 'sort',
  `create_time` datetime NOT NULL COMMENT 'create time',
  `update_time` datetime NOT NULL COMMENT 'update time',
  `create_user` bigint(20) NOT NULL COMMENT 'create user',
  `update_user` bigint(20) NOT NULL COMMENT 'update user',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='type of dish and set meal';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1397844263642378242', '1', 'Chinese food', '1', '2021-05-27 09:16:58', '2021-07-15 20:25:23', '1', '1');
INSERT INTO `category` VALUES ('1397844303408574465', '1', 'Mexican food', '2', '2021-05-27 09:17:07', '2021-06-02 14:27:22', '1', '1');
INSERT INTO `category` VALUES ('1397844391040167938', '1', 'French food', '3', '2021-05-27 09:17:28', '2021-07-09 14:37:13', '1', '1');
INSERT INTO `category` VALUES ('1413341197421846529', '1', 'drink', '11', '2021-07-09 11:36:15', '2021-07-09 14:39:15', '1', '1');
INSERT INTO `category` VALUES ('1413342269393674242', '2', 'business meal', '5', '2021-07-09 11:40:30', '2021-07-09 14:43:45', '1', '1');
INSERT INTO `category` VALUES ('1413384954989060097', '1', 'staple food', '12', '2021-07-09 14:30:07', '2021-07-09 14:39:19', '1', '1');
INSERT INTO `category` VALUES ('1413386191767674881', '2', 'children meal', '6', '2021-07-09 14:35:02', '2021-07-09 14:39:05', '1', '1');

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish` (
  `id` bigint(20) NOT NULL COMMENT 'PRIMARY KEY',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'dish name',
  `category_id` bigint(20) NOT NULL COMMENT 'category id',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'price',
  `code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'dish code',
  `image` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'image',
  `description` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT 'description',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0 stop selling, 1 selling',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT 'sort',
  `create_time` datetime NOT NULL COMMENT 'create time',
  `update_time` datetime NOT NULL COMMENT 'update time',
  `create_user` bigint(20) NOT NULL COMMENT 'create user',
  `update_user` bigint(20) NOT NULL COMMENT 'update user',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT 'deleted',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_dish_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='dish management';

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES ('1397849739276890114', 'Chicken with Chili Pepper', '1397844263642378242', '7800.00', '222222222', 'f966a38e-0780-40be-bb52-5699d13cb3d9.jpg', 'From the tender and delicious chicken, worth a try.', '1', '0', '2021-05-27 09:38:43', '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397850140982161409', 'Braised Pork', '1397844263642378242', '6800.00', '123412341234', '0a3b3288-3446-4420-bbff-f263d0c02d8e.jpg', 'It is a very delicious piece of pork.', '1', '0', '2021-05-27 09:40:19', '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397853890262118402', 'Shredded pork with fish flavor', '1397844303408574465', '3800.00', '1234212321234', '8dcfda14-5712-4d28-82f7-ae905b3c2308.jpg', 'This is a classic dish in our childhood memories.', '1', '0', '2021-05-27 09:55:13', '2021-05-27 09:55:13', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397854652581064706', 'Spicy boiled fish', '1397844303408574465', '14800.00', '2345312·345321', '1fdbfbf3-1d86-4b29-a3fc-46345852f2f8.jpg', 'Fillets are bought fillets cut and a few prawns are added for extra flavour.', '1', '0', '2021-05-27 09:58:15', '2021-05-27 09:58:15', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397854865672679425', 'Scrambled eggs', '1397844303408574465', '2000.00', '23456431·23456', '0f252364-a561-4e8d-8065-9a6797a6b1d3.jpg', 'Saute with no less than 6 eggs and vegetable oil.', '1', '0', '2021-05-27 09:59:06', '2021-05-27 09:59:06', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397861683434139649', 'Steamed seafood', '1397844391040167938', '38800.00', '1234567876543213456', '1405081e-f545-42e1-86a2-f7559ae2e276.jpeg', 'For fresh seafood, steaming is the best way to handle it.', '1', '0', '2021-05-27 10:26:11', '2021-05-27 10:26:11', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397862198033297410', 'Green salad', '1397844391040167938', '49800.00', '123456786532455', '583df4b7-a159-4cfc-9543-4f666120b25f.jpeg', 'Contains lettuce, Onions and croutons.', '1', '0', '2021-05-27 10:28:14', '2021-05-27 10:28:14', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397862477831122945', 'Baked lobster', '1397844391040167938', '108800.00', '1234567865432', '5b8d2da3-3744-4bb3-acdc-329056b8259d.jpeg', 'Baked lobster is a traditional famous dish with perfect flavor and taste.', '1', '0', '2021-05-27 10:29:20', '2021-05-27 10:29:20', '1', '1', '0');
INSERT INTO `dish` VALUES ('1413342036832100354', 'Pepsi', '1413341197421846529', '500.00', '', 'c99e0aab-3cb7-4eaa-80fd-f47d4ffea694.png', '', '1', '0', '2021-07-09 11:39:35', '2021-07-09 15:12:18', '1', '1', '0');
INSERT INTO `dish` VALUES ('1413384757047271425', 'coffee', '1413341197421846529', '500.00', '', '00874a5e-0df2-446b-8f69-a30eb7d88ee8.png', '', '1', '0', '2021-07-09 14:29:20', '2021-07-12 09:09:16', '1', '1', '0');
INSERT INTO `dish` VALUES ('1413385247889891330', 'rice', '1413384954989060097', '200.00', '', 'ee04a05a-1230-46b6-8ad5-1a95b140fff3.png', '', '1', '0', '2021-07-09 14:31:17', '2021-07-11 16:35:26', '1', '1', '0');

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor` (
  `id` bigint(20) NOT NULL COMMENT 'PRIMARY KEY',
  `dish_id` bigint(20) NOT NULL COMMENT 'dish id',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'taste name',
  `value` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'taste data list',
  `create_time` datetime NOT NULL COMMENT 'create time',
  `update_time` datetime NOT NULL COMMENT 'update time',
  `create_user` bigint(20) NOT NULL COMMENT 'create user',
  `update_user` bigint(20) NOT NULL COMMENT 'update user',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT 'deleted',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='dish taste relationship table';

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES ('1397849417888346113', '1397849417854791681', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 09:37:27', '2021-05-27 09:37:27', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397849739297861633', '1397849739276890114', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-27 09:38:43', '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397849739323027458', '1397849739276890114', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 09:38:43', '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397849936421761025', '1397849936404983809', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397849936438538241', '1397849936404983809', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850141015715841', '1397850140982161409', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850141040881665', '1397850140982161409', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850392120307713', '1397850392090947585', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850392137084929', '1397850392090947585', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850630734262274', '1397850630700707841', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850630755233794', '1397850630700707841', 'spiciness', '[\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850851274960898', '1397850851245600769', 'Forbidden food', '[\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850851283349505', '1397850851245600769', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851099523231745', '1397851099502260226', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851099527426050', '1397851099502260226', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851370483658754', '1397851370462687234', 'temperature', '[\"Hot drink\",\"Normal\",\"No ice\",\"Less ice\",\"More ice\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851370483658755', '1397851370462687234', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851370483658756', '1397851370462687234', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851668283437058', '1397851668262465537', 'temperature', '[\"Hot drink\",\"Normal\",\"No ice\",\"Less ice\",\"More ice\"]', '2021-05-27 09:46:23', '2021-05-27 09:46:23', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397852391180120065', '1397852391150759938', 'Forbidden food', '[\"No scallion\",\"No cilantro\",\"No chili\"]', '2021-05-27 09:49:16', '2021-05-27 09:49:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397852391196897281', '1397852391150759938', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Heavy spicy\"]', '2021-05-27 09:49:16', '2021-05-27 09:49:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397853183307984898', '1397853183287013378', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 09:52:24', '2021-05-27 09:52:24', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397853423486414850', '1397853423461249026', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 09:53:22', '2021-05-27 09:53:22', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397853709126905857', '1397853709101740034', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-27 09:54:30', '2021-05-27 09:54:30', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397853890283089922', '1397853890262118402', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 09:55:13', '2021-05-27 09:55:13', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397854133632413697', '1397854133603053569', 'temperature', '[\"Hot drink\",\"Normal\",\"No ice\",\"Less ice\",\"More ice\"]', '2021-05-27 09:56:11', '2021-05-27 09:56:11', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397854652623007745', '1397854652581064706', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-27 09:58:15', '2021-05-27 09:58:15', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397854652635590658', '1397854652581064706', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 09:58:15', '2021-05-27 09:58:15', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397854865735593986', '1397854865672679425', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 09:59:06', '2021-05-27 09:59:06', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397855742303186946', '1397855742273826817', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 10:02:35', '2021-05-27 10:02:35', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397855906497605633', '1397855906468245506', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-27 10:03:14', '2021-05-27 10:03:14', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397856190573621250', '1397856190540066818', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 10:04:21', '2021-05-27 10:04:21', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397859056709316609', '1397859056684150785', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 10:15:45', '2021-05-27 10:15:45', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397859277837217794', '1397859277812051969', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 10:16:37', '2021-05-27 10:16:37', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397859487502086146', '1397859487476920321', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 10:17:27', '2021-05-27 10:17:27', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397859757061615618', '1397859757036449794', 'Sweet taste', '[\"sugar-free\",\"Low sugar\",\"semi-sugar\",\"High sugar\",\"Whole sugar\"]', '2021-05-27 10:18:32', '2021-05-27 10:18:32', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397860242086735874', '1397860242057375745', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 10:20:27', '2021-05-27 10:20:27', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397860963918065665', '1397860963880316929', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 10:23:19', '2021-05-27 10:23:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397861135754506242', '1397861135733534722', 'Sweet taste', '[\"sugar-free\",\"Low sugar\",\"semi-sugar\",\"High sugar\",\"Whole sugar\"]', '2021-05-27 10:24:00', '2021-05-27 10:24:00', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397861370035744769', '1397861370010578945', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-27 10:24:56', '2021-05-27 10:24:56', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397861683459305474', '1397861683434139649', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-27 10:26:11', '2021-05-27 10:26:11', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397861898467717121', '1397861898438356993', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-27 10:27:02', '2021-05-27 10:27:02', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397862198054268929', '1397862198033297410', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-27 10:28:14', '2021-05-27 10:28:14', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397862477835317250', '1397862477831122945', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\"]', '2021-05-27 10:29:20', '2021-05-27 10:29:20', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398089545865015297', '1398089545676271617', 'temperature', '[\"Hot drink\",\"Normal\",\"No ice\",\"Less ice\",\"More ice\"]', '2021-05-28 01:31:38', '2021-05-28 01:31:38', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398089782323097601', '1398089782285348866', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-28 01:32:34', '2021-05-28 01:32:34', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398090003262255106', '1398090003228700673', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-28 01:33:27', '2021-05-28 01:33:27', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398090264554811394', '1398090264517062657', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-28 01:34:29', '2021-05-28 01:34:29', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398090455399837698', '1398090455324340225', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-28 01:35:14', '2021-05-28 01:35:14', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398090685449023490', '1398090685419663362', 'temperature', '[\"Hot drink\",\"Normal\",\"No ice\",\"Less ice\",\"More ice\"]', '2021-05-28 01:36:09', '2021-05-28 01:36:09', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398090825358422017', '1398090825329061889', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-28 01:36:43', '2021-05-28 01:36:43', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398091007051476993', '1398091007017922561', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-28 01:37:26', '2021-05-28 01:37:26', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398091296164851713', '1398091296131297281', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-28 01:38:35', '2021-05-28 01:38:35', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398091546531246081', '1398091546480914433', 'Forbidden food', '[\"No scallion\",\"No garlic\",\"No cilantro\",\"No chili\"]', '2021-05-28 01:39:35', '2021-05-28 01:39:35', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398091729809747969', '1398091729788776450', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-28 01:40:18', '2021-05-28 01:40:18', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398091889499484161', '1398091889449152513', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-28 01:40:56', '2021-05-28 01:40:56', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398092095179763713', '1398092095142014978', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-28 01:41:45', '2021-05-28 01:41:45', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398092283877306370', '1398092283847946241', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-28 01:42:30', '2021-05-28 01:42:30', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398094018939236354', '1398094018893099009', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-28 01:49:24', '2021-05-28 01:49:24', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398094391494094850', '1398094391456346113', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-05-28 01:50:53', '2021-05-28 01:50:53', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1399574026165727233', '1399305325713600514', 'spiciness', '[\"Not spicy\",\"Mild spicy\",\"Medium spicy\",\"Heavy spicy\"]', '2021-06-01 03:50:25', '2021-06-01 03:50:25', '1399309715396669441', '1399309715396669441', '0');
INSERT INTO `dish_flavor` VALUES ('1413389540592263169', '1413384757047271425', 'temperature', '[\"Normal\",\"refrigerated\"]', '2021-07-12 09:09:16', '2021-07-12 09:09:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1413389684020682754', '1413342036832100354', 'temperature', '[\"Normal\",\"refrigerated\"]', '2021-07-09 15:12:18', '2021-07-09 15:12:18', '1', '1', '0');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL COMMENT 'PRIMARY KEY',
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'name',
  `username` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'user name',
  `password` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'password',
  `phone` varchar(11) COLLATE utf8_bin NOT NULL COMMENT 'phone number',
  `gender` varchar(2) COLLATE utf8_bin NOT NULL COMMENT 'gender',
  `id_number` varchar(18) COLLATE utf8_bin NOT NULL COMMENT 'id number',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'status 0:disable，1:normal',
  `create_time` datetime NOT NULL COMMENT 'create time',
  `update_time` datetime NOT NULL COMMENT 'update time',
  `create_user` bigint(20) NOT NULL COMMENT 'create user',
  `update_user` bigint(20) NOT NULL COMMENT 'update user',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='employee information';

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', 'administrator', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', '1', '2021-05-06 17:20:07', '2021-05-10 02:24:09', '1', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL COMMENT 'PRIMARY KEY',
  `number` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'order number',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'order status: 1 To be paid，2 To be delivered，3 delivered，4 finished，5 cancelled',
  `user_id` bigint(20) NOT NULL COMMENT 'Order user',
  `address_book_id` bigint(20) NOT NULL COMMENT 'address id',
  `order_time` datetime NOT NULL COMMENT 'order time',
  `checkout_time` datetime NOT NULL COMMENT '结账时间',
  `pay_method` int(11) NOT NULL DEFAULT '1' COMMENT 'pay_method: 1 wechat,2 Alipay',
  `amount` decimal(10,2) NOT NULL COMMENT 'amount',
  `remark` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'remark',
  `phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `consignee` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='order table';

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL COMMENT 'PRIMARY KEY',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'name',
  `image` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'image',
  `order_id` bigint(20) NOT NULL COMMENT 'order id',
  `dish_id` bigint(20) DEFAULT NULL COMMENT 'dish id',
  `setmeal_id` bigint(20) DEFAULT NULL COMMENT 'set meal id',
  `dish_flavor` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'dish flavor',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT 'number',
  `amount` decimal(10,2) NOT NULL COMMENT 'amount',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Order details table';

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal` (
  `id` bigint(20) NOT NULL COMMENT 'PRIMARY KEY',
  `category_id` bigint(20) NOT NULL COMMENT 'category id',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'set meal name',
  `price` decimal(10,2) NOT NULL COMMENT 'set meal price',
  `status` int(11) DEFAULT NULL COMMENT 'status 0:disable，1:enable',
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'code',
  `description` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT 'description',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'image',
  `create_time` datetime NOT NULL COMMENT 'create time',
  `update_time` datetime NOT NULL COMMENT 'update time',
  `create_user` bigint(20) NOT NULL COMMENT 'create user',
  `update_user` bigint(20) NOT NULL COMMENT 'update user',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT 'deleted',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_setmeal_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='set meal';

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES ('1415580119015145474', '1413386191767674881', 'Kids Meal Plan A', '4000.00', '1', '', '', '61d20592-b37f-4d72-a864-07ad5bb8f3bb.jpg', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish` (
  `id` bigint(20) NOT NULL COMMENT 'PRIMARY KEY',
  `setmeal_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'set meal id ',
  `dish_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'dish id',
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'dish name(Redundant field)',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'dish price(Redundant field)',
  `copies` int(11) NOT NULL COMMENT 'copies',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT 'sort',
  `create_time` datetime NOT NULL COMMENT 'create time',
  `update_time` datetime NOT NULL COMMENT 'update time',
  `create_user` bigint(20) NOT NULL COMMENT 'create user',
  `update_user` bigint(20) NOT NULL COMMENT 'update user',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT 'deleted',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='set meal and dish relationship';

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES ('1415580119052894209', '1415580119015145474', '1397862198033297410', 'Green salad', '49800.00', '1', '0', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');
INSERT INTO `setmeal_dish` VALUES ('1415580119061282817', '1415580119015145474', '1413342036832100354', 'Pepsi', '500.00', '1', '0', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');
INSERT INTO `setmeal_dish` VALUES ('1415580119069671426', '1415580119015145474', '1413385247889891330', 'rice', '200.00', '1', '0', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `id` bigint(20) NOT NULL COMMENT 'PRIMARY KEY',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'name',
  `image` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'image',
  `user_id` bigint(20) NOT NULL COMMENT 'user id',
  `dish_id` bigint(20) DEFAULT NULL COMMENT 'dish id',
  `setmeal_id` bigint(20) DEFAULT NULL COMMENT 'set meal id',
  `dish_flavor` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'flavor',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT 'number',
  `amount` decimal(10,2) NOT NULL COMMENT 'amount',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Shopping cart';

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL COMMENT 'PRIMARY KEY',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'name',
  `phone` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'phone number',
  `gender` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT 'gender',
  `id_number` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT 'id number',
  `avatar` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'Head picture',
  `status` int(11) DEFAULT '0' COMMENT 'status 0:disable，1:normal',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='user information';
