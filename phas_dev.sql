/*
 Navicat Premium Dump SQL

 Source Server         : datas
 Source Server Type    : MySQL
 Source Server Version : 90200 (9.2.0)
 Source Host           : localhost:3306
 Source Schema         : phas_dev

 Target Server Type    : MySQL
 Target Server Version : 90200 (9.2.0)
 File Encoding         : 65001

 Date: 25/04/2025 22:55:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answers
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `result_id` int NOT NULL,
  `question_id` int NOT NULL,
  `selected_option_id` int DEFAULT NULL,
  `text_answer` text COLLATE utf8mb4_unicode_ci,
  `score` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `result_id` (`result_id`),
  KEY `question_id` (`question_id`),
  KEY `selected_option_id` (`selected_option_id`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`result_id`) REFERENCES `results` (`id`),
  CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `answers_ibfk_3` FOREIGN KEY (`selected_option_id`) REFERENCES `options` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of answers
-- ----------------------------
BEGIN;
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (1, 1, 1, 1, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (2, 1, 2, 5, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (3, 1, 3, 9, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (4, 1, 4, 13, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (5, 1, 5, 17, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (6, 1, 6, 21, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (7, 1, 7, 25, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (8, 1, 8, 29, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (9, 1, 9, 33, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (10, 2, 1, 1, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (11, 2, 2, 6, NULL, 1, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (12, 2, 3, 11, NULL, 2, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (13, 2, 4, 16, NULL, 3, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (14, 2, 5, 17, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (15, 2, 6, 22, NULL, 1, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (16, 2, 7, 27, NULL, 2, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (17, 2, 8, 32, NULL, 3, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (18, 2, 9, 33, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (19, 3, 10, 37, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (20, 3, 11, 41, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (21, 3, 12, 45, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (22, 3, 13, 49, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (23, 3, 14, 53, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (24, 3, 15, 57, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (25, 3, 16, 61, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (26, 4, 10, 37, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (27, 4, 11, 42, NULL, 1, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (28, 4, 12, 47, NULL, 2, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (29, 4, 13, 52, NULL, 3, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (30, 4, 14, 53, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (31, 4, 15, 58, NULL, 1, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (32, 4, 16, 63, NULL, 2, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (33, 5, 17, 65, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (34, 5, 18, 69, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (35, 5, 19, 73, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (36, 5, 20, 77, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (37, 5, 21, 81, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (38, 5, 22, 85, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (39, 5, 23, 89, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (40, 5, 24, 93, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (41, 5, 25, 97, NULL, 0, '2025-04-25 21:47:26');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (42, 5, 26, 101, NULL, 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (43, 6, 27, 105, NULL, 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (44, 6, 28, 109, NULL, 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (45, 6, 29, 113, NULL, 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (46, 6, 30, 117, NULL, 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (47, 6, 31, 121, NULL, 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (48, 6, 32, 125, NULL, 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (49, 6, 33, 129, NULL, 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (50, 6, 34, 133, NULL, 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (51, 6, 35, 137, NULL, 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (52, 6, 36, 141, NULL, 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (53, 7, 1, NULL, '这是一个文本回答的示例，用于测试系统对文本答案的处理能力。', 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (54, 8, 10, 37, NULL, 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (55, 8, 11, 42, NULL, 1, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (56, 8, 12, 47, NULL, 2, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (57, 8, 13, 49, NULL, 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (58, 8, 14, 54, NULL, 1, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (59, 8, 15, NULL, '关于\"变得容易烦恼或急躁\"的自定义回答，我觉得这取决于具体情况。', 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (60, 8, 16, NULL, '关于\"感到似乎将有可怕的事情发生而害怕\"的自定义回答，我觉得这取决于具体情况。', 0, '2025-04-25 21:47:27');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (61, 9, 1, 2, NULL, 1, '2025-04-25 21:50:23');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (62, 9, 2, 6, NULL, 1, '2025-04-25 21:50:23');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (63, 9, 3, 10, NULL, 1, '2025-04-25 21:50:23');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (64, 9, 4, 13, NULL, 0, '2025-04-25 21:50:23');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (65, 9, 5, 20, NULL, 3, '2025-04-25 21:50:23');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (66, 9, 6, 22, NULL, 1, '2025-04-25 21:50:23');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (67, 9, 7, 26, NULL, 1, '2025-04-25 21:50:23');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (68, 9, 8, 32, NULL, 3, '2025-04-25 21:50:23');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (69, 9, 9, 36, NULL, 3, '2025-04-25 21:50:23');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (70, 11, 1, 2, NULL, 1, '2025-04-25 21:55:58');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (71, 11, 2, 7, NULL, 2, '2025-04-25 21:55:58');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (72, 11, 3, 10, NULL, 1, '2025-04-25 21:55:58');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (73, 11, 4, 14, NULL, 1, '2025-04-25 21:55:58');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (74, 11, 5, 20, NULL, 3, '2025-04-25 21:55:58');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (75, 11, 6, 23, NULL, 2, '2025-04-25 21:55:58');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (76, 11, 7, 27, NULL, 2, '2025-04-25 21:55:58');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (77, 11, 8, 29, NULL, 0, '2025-04-25 21:55:58');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (78, 11, 9, 35, NULL, 2, '2025-04-25 21:55:58');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (79, 12, 27, 106, NULL, 1, '2025-04-25 21:59:24');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (80, 12, 28, 112, NULL, 3, '2025-04-25 21:59:24');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (81, 12, 29, 114, NULL, 1, '2025-04-25 21:59:24');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (82, 12, 30, 118, NULL, 1, '2025-04-25 21:59:24');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (83, 12, 31, 121, NULL, 0, '2025-04-25 21:59:24');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (84, 12, 32, 128, NULL, 3, '2025-04-25 21:59:24');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (85, 12, 33, 130, NULL, 1, '2025-04-25 21:59:24');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (86, 12, 34, 133, NULL, 0, '2025-04-25 21:59:24');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (87, 12, 35, 138, NULL, 1, '2025-04-25 21:59:24');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (88, 12, 36, 144, NULL, 3, '2025-04-25 21:59:24');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (89, 13, 1, 2, NULL, 1, '2025-04-25 22:24:06');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (90, 13, 2, 8, NULL, 3, '2025-04-25 22:24:06');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (91, 13, 3, 12, NULL, 3, '2025-04-25 22:24:06');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (92, 13, 4, 16, NULL, 3, '2025-04-25 22:24:06');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (93, 13, 5, 20, NULL, 3, '2025-04-25 22:24:06');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (94, 13, 6, 24, NULL, 3, '2025-04-25 22:24:06');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (95, 13, 7, 28, NULL, 3, '2025-04-25 22:24:06');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (96, 13, 8, 32, NULL, 3, '2025-04-25 22:24:06');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (97, 13, 9, 36, NULL, 3, '2025-04-25 22:24:06');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (98, 14, 1, 2, NULL, 1, '2025-04-25 22:25:01');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (99, 14, 2, 8, NULL, 3, '2025-04-25 22:25:01');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (100, 14, 3, 12, NULL, 3, '2025-04-25 22:25:01');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (101, 14, 4, 16, NULL, 3, '2025-04-25 22:25:01');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (102, 14, 5, 20, NULL, 3, '2025-04-25 22:25:01');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (103, 14, 6, 24, NULL, 3, '2025-04-25 22:25:01');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (104, 14, 7, 28, NULL, 3, '2025-04-25 22:25:01');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (105, 14, 8, 32, NULL, 3, '2025-04-25 22:25:01');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (106, 14, 9, 36, NULL, 3, '2025-04-25 22:25:01');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (107, 15, 1, 1, NULL, 0, '2025-04-25 22:26:17');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (108, 15, 2, 8, NULL, 3, '2025-04-25 22:26:17');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (109, 15, 3, 12, NULL, 3, '2025-04-25 22:26:17');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (110, 15, 4, 16, NULL, 3, '2025-04-25 22:26:17');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (111, 15, 5, 20, NULL, 3, '2025-04-25 22:26:17');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (112, 15, 6, 24, NULL, 3, '2025-04-25 22:26:17');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (113, 15, 7, 28, NULL, 3, '2025-04-25 22:26:17');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (114, 15, 8, 32, NULL, 3, '2025-04-25 22:26:17');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (115, 15, 9, 34, NULL, 1, '2025-04-25 22:26:17');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (116, 16, 1, 4, NULL, 3, '2025-04-25 22:44:15');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (117, 16, 2, 8, NULL, 3, '2025-04-25 22:44:15');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (118, 16, 3, 12, NULL, 3, '2025-04-25 22:44:15');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (119, 16, 4, 13, NULL, 0, '2025-04-25 22:44:15');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (120, 16, 5, 19, NULL, 2, '2025-04-25 22:44:15');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (121, 16, 6, 23, NULL, 2, '2025-04-25 22:44:15');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (122, 16, 7, 26, NULL, 1, '2025-04-25 22:44:15');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (123, 16, 8, 32, NULL, 3, '2025-04-25 22:44:15');
INSERT INTO `answers` (`id`, `result_id`, `question_id`, `selected_option_id`, `text_answer`, `score`, `created_at`) VALUES (124, 16, 9, 34, NULL, 1, '2025-04-25 22:44:15');
COMMIT;

-- ----------------------------
-- Table structure for appointments
-- ----------------------------
DROP TABLE IF EXISTS `appointments`;
CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `counselor_id` int NOT NULL,
  `appointment_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `counselor_id` (`counselor_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`counselor_id`) REFERENCES `counselors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of appointments
-- ----------------------------
BEGIN;
INSERT INTO `appointments` (`id`, `user_id`, `counselor_id`, `appointment_date`, `start_time`, `end_time`, `type`, `status`, `notes`, `created_at`, `updated_at`) VALUES (1, 3, 1, '2025-04-25', '09:00:00', '10:00:00', 'video', 'pending', '', '2025-04-25 14:20:10', '2025-04-25 14:20:10');
INSERT INTO `appointments` (`id`, `user_id`, `counselor_id`, `appointment_date`, `start_time`, `end_time`, `type`, `status`, `notes`, `created_at`, `updated_at`) VALUES (2, 3, 1, '2025-04-25', '10:00:00', '11:00:00', 'video', 'pending', '', '2025-04-25 14:26:27', '2025-04-25 14:26:27');
COMMIT;

-- ----------------------------
-- Table structure for chapters
-- ----------------------------
DROP TABLE IF EXISTS `chapters`;
CREATE TABLE `chapters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `video_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `order` int NOT NULL,
  `is_free` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `chapters_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of chapters
-- ----------------------------
BEGIN;
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (1, 1, '认识情绪', '了解情绪的种类和作用', '/static/video/1.mp4', 15, 1, 1, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (2, 1, '情绪觉察', '提高对自身情绪的觉察能力', '/static/video/1.mp4', 20, 2, 0, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (3, 1, '情绪调节技巧', '学习有效的情绪调节方法', '/static/video/1.mp4', 25, 3, 0, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (4, 1, '处理负面情绪', '如何应对焦虑、抑郁等负面情绪', '/static/video/1.mp4', 30, 4, 0, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (5, 1, '培养积极心态', '构建积极健康的心理状态', '/static/video/1.mp4', 30, 5, 0, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (6, 2, '沟通的基本要素', '了解有效沟通的关键要素', '/static/video/1.mp4', 20, 1, 1, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (7, 2, '倾听的艺术', '提高积极倾听的能力', '/static/video/1.mp4', 25, 2, 0, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (8, 2, '表达自我的技巧', '学习清晰自信地表达', '/static/video/1.mp4', 30, 3, 0, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (9, 2, '处理人际冲突', '冲突解决的方法和策略', 'a/static/video/1.mp4', 35, 4, 0, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (10, 2, '建立良好的人际关系', '如何维护和发展健康的人际关系', '/static/video/1.mp4', 30, 5, 0, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (11, 2, '职场人际沟通', '职场中的沟通技巧和策略', '/static/video/1.mp4', 40, 6, 0, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (12, 3, '认识压力', '了解压力的本质和影响', '/static/video/1.mp4', 15, 1, 1, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (13, 3, '压力源识别', '学会识别生活中的压力源', '/static/video/1.mp4', 20, 2, 0, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (14, 3, '身体减压技巧', '通过身体放松缓解压力', '/static/video/1.mp4', 25, 3, 0, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (15, 3, '思维减压方法', '调整认知方式减轻压力', '/static/video/1.mp4', 30, 4, 0, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (16, 3, '自我关怀实践', '培养自我关怀的习惯和态度', '/static/video/1.mp4', 30, 5, 0, '2025-04-25 13:47:26');
INSERT INTO `chapters` (`id`, `course_id`, `title`, `description`, `video_url`, `duration`, `order`, `is_free`, `created_at`) VALUES (17, 3, '建立支持系统', '利用社会支持缓解压力', 'https://example.com/video17.mp4', 30, 6, 0, '2025-04-25 13:47:26');
COMMIT;

-- ----------------------------
-- Table structure for consultations
-- ----------------------------
DROP TABLE IF EXISTS `consultations`;
CREATE TABLE `consultations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `counselor_id` int NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration` int NOT NULL,
  `topic` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `rating` float DEFAULT NULL,
  `feedback` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `counselor_id` (`counselor_id`),
  CONSTRAINT `consultations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `consultations_ibfk_2` FOREIGN KEY (`counselor_id`) REFERENCES `counselors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of consultations
-- ----------------------------
BEGIN;
INSERT INTO `consultations` (`id`, `user_id`, `counselor_id`, `status`, `start_time`, `end_time`, `duration`, `topic`, `description`, `rating`, `feedback`, `created_at`, `updated_at`) VALUES (1, 2, 1, 'completed', '2025-04-18 21:47:26', '2025-04-18 20:47:26', 60, '压力管理', '最近工作压力大，睡眠质量下降，寻求缓解压力的方法', 4.5, '咨询师很有耐心，提供了很多实用的建议，帮助我更好地管理压力', '2025-04-25 13:47:26', '2025-04-25 13:47:26');
INSERT INTO `consultations` (`id`, `user_id`, `counselor_id`, `status`, `start_time`, `end_time`, `duration`, `topic`, `description`, `rating`, `feedback`, `created_at`, `updated_at`) VALUES (2, 2, 2, 'in_progress', '2025-04-22 21:47:26', NULL, 45, '人际关系', '与同事相处有困难，经常感到被孤立', NULL, NULL, '2025-04-25 13:47:26', '2025-04-25 13:47:26');
INSERT INTO `consultations` (`id`, `user_id`, `counselor_id`, `status`, `start_time`, `end_time`, `duration`, `topic`, `description`, `rating`, `feedback`, `created_at`, `updated_at`) VALUES (3, 2, 1, 'scheduled', '2025-04-27 21:47:26', NULL, 60, '情绪调节', '情绪波动较大，希望学习情绪管理的方法', NULL, NULL, '2025-04-25 13:47:26', '2025-04-25 13:47:26');
COMMIT;

-- ----------------------------
-- Table structure for counselors
-- ----------------------------
DROP TABLE IF EXISTS `counselors`;
CREATE TABLE `counselors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialties` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `introduction` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience_years` int DEFAULT NULL,
  `consultation_count` int DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of counselors
-- ----------------------------
BEGIN;
INSERT INTO `counselors` (`id`, `name`, `gender`, `title`, `specialties`, `introduction`, `avatar`, `experience_years`, `consultation_count`, `rating`, `status`, `created_at`) VALUES (1, '张伟', 'male', '资深心理咨询师', '压力管理,情绪调节,人际关系', '张伟老师拥有10年心理咨询经验，擅长帮助来访者处理压力和情绪问题，构建健康的人际关系。', 'https://randomuser.me/api/portraits/men/32.jpg', 10, 122, 4.8, 'active', '2025-04-25 13:47:26');
INSERT INTO `counselors` (`id`, `name`, `gender`, `title`, `specialties`, `introduction`, `avatar`, `experience_years`, `consultation_count`, `rating`, `status`, `created_at`) VALUES (2, '李娜', 'female', '青少年心理辅导专家', '青少年心理,家庭关系,学习困扰', '李娜老师专注于青少年心理健康领域，擅长处理青春期心理问题、亲子关系和学习困扰。', 'https://randomuser.me/api/portraits/women/46.jpg', 8, 98, 4.6, 'active', '2025-04-25 13:47:26');
INSERT INTO `counselors` (`id`, `name`, `gender`, `title`, `specialties`, `introduction`, `avatar`, `experience_years`, `consultation_count`, `rating`, `status`, `created_at`) VALUES (3, '王强', 'male', '婚姻家庭咨询师', '婚姻关系,家庭冲突,情感困扰', '王强老师是婚姻家庭咨询专家，致力于帮助夫妻重建健康的沟通方式，解决婚姻中的情感困扰。', 'https://randomuser.me/api/portraits/men/56.jpg', 12, 145, 4.9, 'active', '2025-04-25 13:47:26');
COMMIT;

-- ----------------------------
-- Table structure for course_comments
-- ----------------------------
DROP TABLE IF EXISTS `course_comments`;
CREATE TABLE `course_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `course_comments_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `course_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of course_comments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int NOT NULL,
  `instructor` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of courses
-- ----------------------------
BEGIN;
INSERT INTO `courses` (`id`, `title`, `description`, `cover_image`, `level`, `duration`, `instructor`, `tags`, `views`, `rating`, `status`, `created_at`, `updated_at`) VALUES (1, '情绪管理入门', '本课程将帮助您了解情绪的本质，掌握情绪管理的基本技能，培养积极健康的心态。', 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f', 'beginner', 120, '张伟', '情绪管理,心理健康,压力缓解', 263, 4.7, 'active', '2025-04-25 13:47:26', '2025-04-25 14:41:31');
INSERT INTO `courses` (`id`, `title`, `description`, `cover_image`, `level`, `duration`, `instructor`, `tags`, `views`, `rating`, `status`, `created_at`, `updated_at`) VALUES (2, '有效的人际沟通', '提升沟通技巧，构建和谐人际关系，解决人际交往中的冲突和困扰。', 'https://images.unsplash.com/photo-1528605248644-14dd04022da1', 'intermediate', 180, '李娜', '人际沟通,社交技巧,冲突处理', 202, 4.5, 'active', '2025-04-25 13:47:26', '2025-04-25 14:35:06');
INSERT INTO `courses` (`id`, `title`, `description`, `cover_image`, `level`, `duration`, `instructor`, `tags`, `views`, `rating`, `status`, `created_at`, `updated_at`) VALUES (3, '压力管理与自我关怀', '学习识别压力源，掌握减压技巧，培养自我关怀的习惯，提高心理韧性。', 'https://images.unsplash.com/photo-1540317580384-e5d43867caa6', 'beginner', 150, '王强', '压力管理,自我关怀,心理韧性', 172, 4.8, 'active', '2025-04-25 13:47:26', '2025-04-25 13:47:26');
COMMIT;

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int NOT NULL,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `sender_id` (`sender_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of messages
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL,
  `score` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of options
-- ----------------------------
BEGIN;
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (1, 1, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (2, 1, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (3, 1, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (4, 1, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (5, 2, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (6, 2, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (7, 2, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (8, 2, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (9, 3, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (10, 3, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (11, 3, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (12, 3, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (13, 4, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (14, 4, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (15, 4, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (16, 4, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (17, 5, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (18, 5, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (19, 5, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (20, 5, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (21, 6, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (22, 6, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (23, 6, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (24, 6, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (25, 7, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (26, 7, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (27, 7, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (28, 7, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (29, 8, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (30, 8, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (31, 8, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (32, 8, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (33, 9, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (34, 9, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (35, 9, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (36, 9, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (37, 10, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (38, 10, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (39, 10, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (40, 10, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (41, 11, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (42, 11, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (43, 11, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (44, 11, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (45, 12, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (46, 12, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (47, 12, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (48, 12, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (49, 13, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (50, 13, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (51, 13, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (52, 13, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (53, 14, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (54, 14, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (55, 14, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (56, 14, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (57, 15, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (58, 15, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (59, 15, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (60, 15, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (61, 16, '完全没有', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (62, 16, '有几天', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (63, 16, '一半以上的天数', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (64, 16, '几乎每天', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (65, 17, '从不', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (66, 17, '偶尔', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (67, 17, '经常', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (68, 17, '总是', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (69, 18, '从不', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (70, 18, '偶尔', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (71, 18, '经常', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (72, 18, '总是', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (73, 19, '从不', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (74, 19, '偶尔', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (75, 19, '经常', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (76, 19, '总是', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (77, 20, '从不', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (78, 20, '偶尔', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (79, 20, '经常', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (80, 20, '总是', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (81, 21, '从不', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (82, 21, '偶尔', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (83, 21, '经常', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (84, 21, '总是', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (85, 22, '从不', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (86, 22, '偶尔', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (87, 22, '经常', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (88, 22, '总是', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (89, 23, '从不', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (90, 23, '偶尔', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (91, 23, '经常', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (92, 23, '总是', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (93, 24, '从不', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (94, 24, '偶尔', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (95, 24, '经常', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (96, 24, '总是', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (97, 25, '从不', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (98, 25, '偶尔', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (99, 25, '经常', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (100, 25, '总是', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (101, 26, '从不', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (102, 26, '偶尔', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (103, 26, '经常', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (104, 26, '总是', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (105, 27, '完全不符合', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (106, 27, '有点符合', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (107, 27, '比较符合', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (108, 27, '非常符合', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (109, 28, '完全不符合', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (110, 28, '有点符合', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (111, 28, '比较符合', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (112, 28, '非常符合', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (113, 29, '完全不符合', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (114, 29, '有点符合', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (115, 29, '比较符合', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (116, 29, '非常符合', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (117, 30, '完全不符合', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (118, 30, '有点符合', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (119, 30, '比较符合', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (120, 30, '非常符合', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (121, 31, '完全不符合', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (122, 31, '有点符合', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (123, 31, '比较符合', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (124, 31, '非常符合', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (125, 32, '完全不符合', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (126, 32, '有点符合', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (127, 32, '比较符合', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (128, 32, '非常符合', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (129, 33, '完全不符合', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (130, 33, '有点符合', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (131, 33, '比较符合', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (132, 33, '非常符合', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (133, 34, '完全不符合', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (134, 34, '有点符合', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (135, 34, '比较符合', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (136, 34, '非常符合', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (137, 35, '完全不符合', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (138, 35, '有点符合', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (139, 35, '比较符合', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (140, 35, '非常符合', 4, 3);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (141, 36, '完全不符合', 1, 0);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (142, 36, '有点符合', 2, 1);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (143, 36, '比较符合', 3, 2);
INSERT INTO `options` (`id`, `question_id`, `content`, `order`, `score`) VALUES (144, 36, '非常符合', 4, 3);
COMMIT;

-- ----------------------------
-- Table structure for questionnaires
-- ----------------------------
DROP TABLE IF EXISTS `questionnaires`;
CREATE TABLE `questionnaires` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instruction` text COLLATE utf8mb4_unicode_ci,
  `estimated_time` int DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of questionnaires
-- ----------------------------
BEGIN;
INSERT INTO `questionnaires` (`id`, `title`, `description`, `code`, `instruction`, `estimated_time`, `category`, `is_active`, `created_at`, `updated_at`) VALUES (1, 'PHQ-9抑郁症状自评量表', 'PHQ-9是一个简单有效的抑郁症状筛查工具，包含9个问题，用于评估过去两周内的抑郁症状。', 'PHQ-9', '请根据过去两周的情况，选择最符合您状态的选项。', 5, '专业量表', 1, '2025-04-25 21:47:26', '2025-04-25 21:47:26');
INSERT INTO `questionnaires` (`id`, `title`, `description`, `code`, `instruction`, `estimated_time`, `category`, `is_active`, `created_at`, `updated_at`) VALUES (2, 'GAD-7焦虑症状自评量表', 'GAD-7是一个简短的焦虑症状筛查工具，用于评估过去两周内的焦虑症状。', 'GAD-7', '请根据过去两周的情况，选择最符合您状态的选项。', 3, '专业量表', 1, '2025-04-25 21:47:26', '2025-04-25 21:47:26');
INSERT INTO `questionnaires` (`id`, `title`, `description`, `code`, `instruction`, `estimated_time`, `category`, `is_active`, `created_at`, `updated_at`) VALUES (3, '压力感知量表', '压力感知量表(PSS)用于评估个人在生活中感知到的压力水平。', 'PSS', '请根据过去一个月的情况，选择最符合您感受的选项。', 4, '专业量表', 1, '2025-04-25 21:47:26', '2025-04-25 21:47:26');
INSERT INTO `questionnaires` (`id`, `title`, `description`, `code`, `instruction`, `estimated_time`, `category`, `is_active`, `created_at`, `updated_at`) VALUES (4, '人际关系量表', '评估个人在人际交往中的表现和感受。', 'IRI', '请根据您的日常经历，选择最符合您情况的选项。', 4, '趣味测试', 1, '2025-04-25 21:47:26', '2025-04-25 21:47:26');
COMMIT;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL,
  `question_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score_weight` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of questions
-- ----------------------------
BEGIN;
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (1, 1, '做事时提不起劲或没有兴趣', 1, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (2, 1, '感到心情低落、沮丧或绝望', 2, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (3, 1, '入睡困难、睡不安稳或睡眠过多', 3, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (4, 1, '感觉疲倦或没有活力', 4, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (5, 1, '食欲不振或吃太多', 5, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (6, 1, '觉得自己很糟或觉得自己很失败，或让自己或家人失望', 6, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (7, 1, '对事物专注有困难，例如阅读报纸或看电视时', 7, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (8, 1, '行动或说话缓慢到别人已经察觉，或正好相反，烦躁或坐立不安、动来动去的情况更胜于平常', 8, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (9, 1, '有不如死掉或用某种方式伤害自己的念头', 9, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (10, 2, '感到紧张、焦虑或烦躁', 1, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (11, 2, '无法停止或控制担忧', 2, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (12, 2, '对各种各样的事情担忧过多', 3, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (13, 2, '很难放松下来', 4, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (14, 2, '由于不安而无法静坐', 5, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (15, 2, '变得容易烦恼或急躁', 6, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (16, 2, '感到似乎将有可怕的事情发生而害怕', 7, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (17, 3, '感到无法控制生活中重要的事情', 1, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (18, 3, '对处理个人问题缺乏信心', 2, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (19, 3, '感到事情不是按照自己的意愿发展', 3, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (20, 3, '发现自己在处理生活中必须做的事情时遇到困难', 4, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (21, 3, '感到自己无法处理所有必须做的事情', 5, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (22, 3, '无法控制生活中的烦恼', 6, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (23, 3, '感到自己无法处理所有必须做的事情', 7, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (24, 3, '感到自己无法控制生活中重要的事情', 8, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (25, 3, '因为一些超出自己控制的事情而感到愤怒', 9, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (26, 3, '感到困难堆积如山，无法克服', 10, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (27, 4, '我容易理解他人的感受', 1, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (28, 4, '我善于处理人际冲突', 2, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (29, 4, '我能够很好地表达自己的想法和感受', 3, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (30, 4, '我能够很好地倾听他人的意见', 4, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (31, 4, '我能够很好地处理他人的情绪', 5, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (32, 4, '我能够很好地与他人合作', 6, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (33, 4, '我能够很好地处理他人的批评', 7, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (34, 4, '我能够很好地处理他人的赞美', 8, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (35, 4, '我能够很好地处理他人的拒绝', 9, 'single_choice', 1, '2025-04-25 21:47:26');
INSERT INTO `questions` (`id`, `questionnaire_id`, `content`, `order`, `question_type`, `score_weight`, `created_at`) VALUES (36, 4, '我能够很好地处理他人的期望', 10, 'single_choice', 1, '2025-04-25 21:47:26');
COMMIT;

-- ----------------------------
-- Table structure for result_levels
-- ----------------------------
DROP TABLE IF EXISTS `result_levels`;
CREATE TABLE `result_levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int NOT NULL,
  `level_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_score` float NOT NULL,
  `max_score` float NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `recommendation` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  CONSTRAINT `result_levels_ibfk_1` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of result_levels
-- ----------------------------
BEGIN;
INSERT INTO `result_levels` (`id`, `questionnaire_id`, `level_name`, `min_score`, `max_score`, `description`, `recommendation`) VALUES (1, 1, '正常', 0, 4, '您的抑郁水平在正常范围内', '继续保持积极乐观的生活态度');
INSERT INTO `result_levels` (`id`, `questionnaire_id`, `level_name`, `min_score`, `max_score`, `description`, `recommendation`) VALUES (2, 1, '轻度', 5, 9, '您可能存在轻度抑郁症状', '建议适当调整生活方式，必要时寻求心理咨询');
INSERT INTO `result_levels` (`id`, `questionnaire_id`, `level_name`, `min_score`, `max_score`, `description`, `recommendation`) VALUES (3, 1, '中度', 10, 14, '您可能存在中度抑郁症状', '建议及时寻求专业心理咨询');
INSERT INTO `result_levels` (`id`, `questionnaire_id`, `level_name`, `min_score`, `max_score`, `description`, `recommendation`) VALUES (4, 1, '重度', 15, 27, '您可能存在重度抑郁症状', '建议立即就医，接受专业治疗');
INSERT INTO `result_levels` (`id`, `questionnaire_id`, `level_name`, `min_score`, `max_score`, `description`, `recommendation`) VALUES (5, 2, '正常', 0, 4, '您的焦虑水平在正常范围内', '继续保持良好的生活习惯，培养积极的心态');
INSERT INTO `result_levels` (`id`, `questionnaire_id`, `level_name`, `min_score`, `max_score`, `description`, `recommendation`) VALUES (6, 2, '轻度', 5, 9, '您可能存在轻度焦虑症状', '建议适当调整生活方式，学习放松技巧');
INSERT INTO `result_levels` (`id`, `questionnaire_id`, `level_name`, `min_score`, `max_score`, `description`, `recommendation`) VALUES (7, 2, '中度', 10, 14, '您可能存在中度焦虑症状', '建议及时寻求专业心理咨询');
INSERT INTO `result_levels` (`id`, `questionnaire_id`, `level_name`, `min_score`, `max_score`, `description`, `recommendation`) VALUES (8, 2, '重度', 15, 21, '您可能存在重度焦虑症状', '建议立即就医，接受专业治疗');
COMMIT;

-- ----------------------------
-- Table structure for results
-- ----------------------------
DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `questionnaire_id` int NOT NULL,
  `total_score` float DEFAULT NULL,
  `result_level` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `analysis` text COLLATE utf8mb4_unicode_ci,
  `recommendations` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  CONSTRAINT `results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `results_ibfk_2` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of results
-- ----------------------------
BEGIN;
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (1, 2, 1, 8, '轻度', '您可能存在轻度抑郁症状，建议关注自己的情绪状态。', '建议您：\n1. 保持规律的作息\n2. 适当运动\n3. 与亲朋好友多交流\n4. 必要时寻求专业帮助。', '2025-04-25 21:47:26');
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (2, 1, 1, 12, '中度', '您可能存在中度抑郁症状，建议关注情绪变化并寻求专业帮助。', '建议您：\n1. 寻求专业心理咨询\n2. 保持规律作息\n3. 避免过度工作压力\n4. 多与亲友沟通。', '2025-04-25 21:47:26');
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (3, 2, 2, 5, '正常', '您的焦虑水平在正常范围内。', '建议继续保持良好的生活习惯，培养积极的心态。', '2025-04-25 21:47:26');
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (4, 1, 2, 11, '中度', '您的焦虑水平处于中度范围，建议寻求适当帮助。', '建议您：\n1. 学习放松技巧\n2. 避免过度刺激\n3. 适当咨询专业人士\n4. 保持充足睡眠。', '2025-04-25 21:47:26');
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (5, 2, 3, 15, '中度', '您目前处于中度压力水平，需要适当调整。', '建议您：\n1. 学习压力管理技巧\n2. 合理安排时间\n3. 培养兴趣爱好\n4. 必要时寻求专业帮助。', '2025-04-25 21:47:26');
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (6, 2, 4, 20, '良好', '您的人际关系能力处于良好水平。', '建议您：\n1. 继续保持良好的人际交往\n2. 多参与社交活动\n3. 帮助他人\n4. 不断提升沟通技巧。', '2025-04-25 21:47:26');
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (7, 2, 1, 0, '其他', '这是一个文本答案的测试。', '请继续完成问卷。', '2025-04-25 21:47:27');
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (8, 1, 2, 7, '轻度', '这是一个混合答案类型的测试。', '系统能够处理选择题和文本题混合的情况。', '2025-04-25 21:47:27');
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (9, 3, 1, 14, '中度', '您可能存在中度抑郁症状', '建议及时寻求专业心理咨询', '2025-04-25 21:50:23');
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (10, 3, 1, 0, '正常', '您的抑郁水平在正常范围内', '继续保持积极乐观的生活态度', '2025-04-25 21:52:22');
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (11, 3, 1, 14, '中度', '您可能存在中度抑郁症状', '建议及时寻求专业心理咨询', '2025-04-25 21:55:58');
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (12, 3, 4, 14, NULL, NULL, NULL, '2025-04-25 21:59:24');
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (13, 3, 1, 25, '重度', '您可能存在重度抑郁症状', '建议立即就医，接受专业治疗', '2025-04-25 22:24:06');
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (14, 3, 1, 25, '重度', '您可能存在重度抑郁症状', '建议立即就医，接受专业治疗', '2025-04-25 22:25:01');
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (15, 3, 1, 22, '重度', '您可能存在重度抑郁症状', '建议立即就医，接受专业治疗', '2025-04-25 22:26:17');
INSERT INTO `results` (`id`, `user_id`, `questionnaire_id`, `total_score`, `result_level`, `analysis`, `recommendations`, `created_at`) VALUES (16, 1, 1, 18, '重度', '您可能存在重度抑郁症状', '建议立即就医，接受专业治疗', '2025-04-25 22:44:15');
COMMIT;

-- ----------------------------
-- Table structure for user_courses
-- ----------------------------
DROP TABLE IF EXISTS `user_courses`;
CREATE TABLE `user_courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `course_id` int NOT NULL,
  `progress` float DEFAULT NULL,
  `last_chapter_id` int DEFAULT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  KEY `last_chapter_id` (`last_chapter_id`),
  CONSTRAINT `user_courses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `user_courses_ibfk_3` FOREIGN KEY (`last_chapter_id`) REFERENCES `chapters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_courses
-- ----------------------------
BEGIN;
INSERT INTO `user_courses` (`id`, `user_id`, `course_id`, `progress`, `last_chapter_id`, `completed`, `started_at`, `completed_at`) VALUES (1, 3, 1, 40, 2, 0, '2025-04-25 13:50:45', NULL);
INSERT INTO `user_courses` (`id`, `user_id`, `course_id`, `progress`, `last_chapter_id`, `completed`, `started_at`, `completed_at`) VALUES (2, 1, 2, 33.3, 7, 0, '2025-04-25 14:31:27', NULL);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_users_username` (`username`),
  UNIQUE KEY `ix_users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `gender`, `age`, `is_active`) VALUES (1, 'admin', 'admin@example.com', 'scrypt:32768:8:1$OgHskTybBFfrT9au$23796590e35baae644a8c6be3f1212e64cc89b1a8341142c2eb45bae9de845772f42300941b93de30fab9fb4cbe543a639a0d46e0ef69dc14f0d125ecca7c0b3', 'male', 30, 1);
INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `gender`, `age`, `is_active`) VALUES (2, 'testuser', 'user@example.com', 'scrypt:32768:8:1$H0djOKerGxdBo1Xo$185bbee4e2ddbed7b608be40e39becd699a71e2f3969d5596d2842c1650ae03b20167408ad5224360814ae2b87f44438e18e42bb7434e388f6e50bf767e067aa', 'female', 25, 1);
INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `gender`, `age`, `is_active`) VALUES (3, 'mzq', '471642048@qq.com', 'scrypt:32768:8:1$SNmcYbCMq6c2vVAF$bd0562ce0b3be275f4b479319b1c046bdc0a4a9f27df1e7b31c79be6683b72f55a1d7b0c29ba4fbf73a23170998effd7b80a81a1995e4dcc76bb2a7ded2f3bd4', 'male', 18, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
