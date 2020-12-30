/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : property_app

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 30/12/2020 14:51:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_asset
-- ----------------------------
DROP TABLE IF EXISTS `admin_asset`;
CREATE TABLE `admin_asset`  (
  `usr_id` int NOT NULL AUTO_INCREMENT COMMENT '默认递增id',
  `usr_account` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `usr_email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户邮箱(用于找回密码)',
  `usr_password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `usr_permission` tinyint NOT NULL COMMENT '用户权限/身份(0,1,2)',
  PRIMARY KEY (`usr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_asset
-- ----------------------------

-- ----------------------------
-- Table structure for admin_system
-- ----------------------------
DROP TABLE IF EXISTS `admin_system`;
CREATE TABLE `admin_system`  (
  `usr_id` int NOT NULL AUTO_INCREMENT COMMENT '默认递增id',
  `usr_account` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `usr_email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户邮箱(用于找回密码)',
  `usr_password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `usr_permission` tinyint NOT NULL COMMENT '用户权限/身份(0,1,2)',
  PRIMARY KEY (`usr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_system
-- ----------------------------

-- ----------------------------
-- Table structure for asset_detail
-- ----------------------------
DROP TABLE IF EXISTS `asset_detail`;
CREATE TABLE `asset_detail`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '资产编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '资产名称',
  `number` int NULL DEFAULT NULL COMMENT '资产数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '资产单价',
  `id_company` int NULL DEFAULT NULL COMMENT '外码，所属公司',
  `id_subsi_asset` int NULL DEFAULT NULL COMMENT '外码，所属资产小类',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `asset_detail_ibfk_1`(`id_subsi_asset`) USING BTREE,
  INDEX `id_company`(`id_company`) USING BTREE,
  CONSTRAINT `asset_detail_ibfk_1` FOREIGN KEY (`id_subsi_asset`) REFERENCES `asset_subsi` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `asset_detail_ibfk_2` FOREIGN KEY (`id_company`) REFERENCES `company` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_detail
-- ----------------------------

-- ----------------------------
-- Table structure for asset_major
-- ----------------------------
DROP TABLE IF EXISTS `asset_major`;
CREATE TABLE `asset_major`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '大类资产的编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '大类资产的名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_major
-- ----------------------------

-- ----------------------------
-- Table structure for asset_subsi
-- ----------------------------
DROP TABLE IF EXISTS `asset_subsi`;
CREATE TABLE `asset_subsi`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id_big_asset` int NOT NULL COMMENT '外码，大类资产id',
  `id_unit_measure` int NULL DEFAULT NULL COMMENT '外码，计量单位id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_unit_measure`(`id_unit_measure`) USING BTREE,
  CONSTRAINT `asset_subsi_ibfk_1` FOREIGN KEY (`id_unit_measure`) REFERENCES `unit_measure` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of asset_subsi
-- ----------------------------

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公司编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司名称',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司联系电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for senior_user
-- ----------------------------
DROP TABLE IF EXISTS `senior_user`;
CREATE TABLE `senior_user`  (
  `usr_id` int NOT NULL AUTO_INCREMENT COMMENT '默认递增id',
  `usr_account` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `usr_email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户邮箱(用于找回密码)',
  `usr_password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `usr_permission` tinyint NOT NULL COMMENT '用户权限/身份(0,1,2)',
  `usr_company` int NULL DEFAULT NULL COMMENT '外码，用户所属公司',
  PRIMARY KEY (`usr_id`) USING BTREE,
  INDEX `usr_company`(`usr_company`) USING BTREE,
  CONSTRAINT `senior_user_ibfk_1` FOREIGN KEY (`usr_company`) REFERENCES `company` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of senior_user
-- ----------------------------

-- ----------------------------
-- Table structure for unit_measure
-- ----------------------------
DROP TABLE IF EXISTS `unit_measure`;
CREATE TABLE `unit_measure`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '计量单位编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计量单位名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of unit_measure
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
