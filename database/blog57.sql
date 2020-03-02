/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : blog57

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 02/03/2020 15:38:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(0) UNSIGNED NOT NULL,
  `reserved_at` int(0) UNSIGNED NULL DEFAULT NULL,
  `available_at` int(0) UNSIGNED NOT NULL,
  `created_at` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2020_03_01_081004_create_posts_table', 1);
INSERT INTO `migrations` VALUES (5, '2020_03_01_100919_create_tags_table', 2);
INSERT INTO `migrations` VALUES (6, '2020_03_01_100928_create_post_tag_pivot', 2);
INSERT INTO `migrations` VALUES (7, '2020_03_01_110958_restructure_posts_table', 3);
INSERT INTO `migrations` VALUES (8, '2020_03_02_065621_create_jobs_table', 4);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for post_tag_pivot
-- ----------------------------
DROP TABLE IF EXISTS `post_tag_pivot`;
CREATE TABLE `post_tag_pivot`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` int(0) UNSIGNED NOT NULL,
  `tag_id` int(0) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_tag_pivot_post_id_index`(`post_id`) USING BTREE,
  INDEX `post_tag_pivot_tag_id_index`(`tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_tag_pivot
-- ----------------------------
INSERT INTO `post_tag_pivot` VALUES (1, 1, 4, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (2, 2, 4, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (3, 2, 2, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (4, 3, 1, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (5, 3, 3, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (6, 4, 5, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (7, 5, 5, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (8, 6, 4, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (9, 7, 1, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (10, 9, 5, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (11, 9, 1, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (12, 10, 2, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (13, 11, 4, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (14, 14, 1, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (15, 14, 4, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (16, 15, 5, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (17, 15, 1, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (18, 16, 1, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (19, 16, 3, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (20, 18, 5, NULL, NULL);
INSERT INTO `post_tag_pivot` VALUES (21, 20, 5, NULL, NULL);

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_raw` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_draft` tinyint(1) NOT NULL,
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blog.layouts.post',
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `published_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `posts_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, '95yr971u5e5ca8fa8c589-0', 'Voluptates at sed a quasi laborum cumque nobis maiores molestias qui.', 'Ducimus temporibus cumque sit eos deleniti qui aut error architecto qui voluptas velit dicta nesciunt nobis minima harum ex nulla ea consequuntur qui architecto ea nihil laboriosam.', 'Provident velit dolor ut. Qui cupiditate doloribus et dolor eos. Quaerat qui voluptatibus accusantium quia voluptatem hic.\n\nEt sed veritatis distinctio. Ad inventore reprehenderit voluptatum qui odit est asperiores at. In a quod assumenda et.\n\nSint sunt vero aut corporis. Maxime impedit molestias quo dolorum. Voluptatem aut reprehenderit natus tenetur et.\n\nMinus mollitia in voluptas architecto explicabo asperiores. Aut numquam et eum voluptatem labore incidunt vitae. Suscipit omnis quo maiores non. Enim quae cumque ullam ducimus minima consequatur.\n\nEx nihil dolor non et sunt ea. Aut eum aspernatur unde qui qui. Veritatis iste omnis est ea consequatur sunt.\n\nMolestias assumenda et consequatur pariatur voluptas. Quam accusantium consectetur veniam tempore occaecati quidem. Officiis aut aut iure numquam aut. Esse consequatur laudantium et fuga et reiciendis.', '<p>Provident velit dolor ut. Qui cupiditate doloribus et dolor eos. Quaerat qui voluptatibus accusantium quia voluptatem hic.</p>\n\n<p>Et sed veritatis distinctio. Ad inventore reprehenderit voluptatum qui odit est asperiores at. In a quod assumenda et.</p>\n\n<p>Sint sunt vero aut corporis. Maxime impedit molestias quo dolorum. Voluptatem aut reprehenderit natus tenetur et.</p>\n\n<p>Minus mollitia in voluptas architecto explicabo asperiores. Aut numquam et eum voluptatem labore incidunt vitae. Suscipit omnis quo maiores non. Enim quae cumque ullam ducimus minima consequatur.</p>\n\n<p>Ex nihil dolor non et sunt ea. Aut eum aspernatur unde qui qui. Veritatis iste omnis est ea consequatur sunt.</p>\n\n<p>Molestias assumenda et consequatur pariatur voluptas. Quam accusantium consectetur veniam tempore occaecati quidem. Officiis aut aut iure numquam aut. Esse consequatur laudantium et fuga et reiciendis.</p>\n', 'about-bg.jpg', 'Meta for Voluptates at sed a quasi laborum cumque nobis maiores molestias qui.', 0, 'blog.layouts.post', NULL, '2020-02-02 10:48:53', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (2, 'k7halj2i5e5ca8fa8e35a-0', 'Accusantium dolorem ullam quis.', 'Soluta ut optio magni et similique cupiditate quisquam maxime nesciunt vero iure autem placeat adipisci voluptatem nihil illum facilis et enim maiores.', 'Voluptatem aliquam qui nobis consequuntur sunt. Reiciendis temporibus tempora vel dolorem reprehenderit quis rerum minima. Magni qui possimus unde quis quidem consequatur dignissimos.\n\nDolorem veniam aliquid non. Voluptatem est rerum perferendis voluptas necessitatibus.\n\nConsequatur aut eos et omnis. Impedit voluptatibus beatae officia quae eveniet nostrum odio qui. Et quisquam quo eos aspernatur non nulla culpa saepe.\n\nMolestias repellendus ut qui cumque numquam ipsum voluptatum. Labore illum soluta repellendus aspernatur architecto magni. Dolor quae eius adipisci et vitae aut. Beatae placeat quo aperiam delectus incidunt dolores dolores.\n\nOmnis sunt alias omnis accusantium excepturi architecto porro id. Dolor eos impedit sint repellendus est. Quidem aut aliquam repellat eos.', '<p>Voluptatem aliquam qui nobis consequuntur sunt. Reiciendis temporibus tempora vel dolorem reprehenderit quis rerum minima. Magni qui possimus unde quis quidem consequatur dignissimos.</p>\n\n<p>Dolorem veniam aliquid non. Voluptatem est rerum perferendis voluptas necessitatibus.</p>\n\n<p>Consequatur aut eos et omnis. Impedit voluptatibus beatae officia quae eveniet nostrum odio qui. Et quisquam quo eos aspernatur non nulla culpa saepe.</p>\n\n<p>Molestias repellendus ut qui cumque numquam ipsum voluptatum. Labore illum soluta repellendus aspernatur architecto magni. Dolor quae eius adipisci et vitae aut. Beatae placeat quo aperiam delectus incidunt dolores dolores.</p>\n\n<p>Omnis sunt alias omnis accusantium excepturi architecto porro id. Dolor eos impedit sint repellendus est. Quidem aut aliquam repellat eos.</p>\n', 'contact-bg.jpg', 'Meta for Accusantium dolorem ullam quis.', 0, 'blog.layouts.post', NULL, '2020-02-23 20:18:03', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (3, 'wzkw5lxf5e5ca8fa8ed1a-0', 'Voluptatem fuga in a labore.', 'Et soluta vitae saepe repudiandae ut illo autem inventore deleniti ad tempore officiis animi quis autem voluptatem eaque.', 'Corporis aspernatur molestias velit est soluta illo. Itaque itaque voluptas officiis exercitationem culpa facere exercitationem. Quam fugit sed officiis magni impedit unde adipisci.\n\nDebitis dolorem maiores in sint modi sed. Dolor nostrum officiis ad molestiae est. Et quam voluptates est ea vero tenetur quia. Eos voluptatem eius impedit ut aut.\n\nEa eos est deleniti quibusdam. Sit architecto ad porro asperiores beatae accusantium ut. Commodi aut est sunt sunt ipsam corrupti quam.\n\nNobis qui dolorem saepe numquam animi ab earum. Fugit et et vero.\n\nPorro eos quis beatae qui fugiat quibusdam. Accusantium quaerat nulla rerum aperiam est. Ab beatae culpa unde dolorum. Voluptatem pariatur dignissimos placeat.\n\nOfficiis quo placeat consequuntur eligendi quasi enim. Eligendi dignissimos impedit qui vitae architecto quia. Voluptas consequuntur dolore voluptatem et repellendus officia. Incidunt sed exercitationem qui culpa voluptas atque.', '<p>Corporis aspernatur molestias velit est soluta illo. Itaque itaque voluptas officiis exercitationem culpa facere exercitationem. Quam fugit sed officiis magni impedit unde adipisci.</p>\n\n<p>Debitis dolorem maiores in sint modi sed. Dolor nostrum officiis ad molestiae est. Et quam voluptates est ea vero tenetur quia. Eos voluptatem eius impedit ut aut.</p>\n\n<p>Ea eos est deleniti quibusdam. Sit architecto ad porro asperiores beatae accusantium ut. Commodi aut est sunt sunt ipsam corrupti quam.</p>\n\n<p>Nobis qui dolorem saepe numquam animi ab earum. Fugit et et vero.</p>\n\n<p>Porro eos quis beatae qui fugiat quibusdam. Accusantium quaerat nulla rerum aperiam est. Ab beatae culpa unde dolorum. Voluptatem pariatur dignissimos placeat.</p>\n\n<p>Officiis quo placeat consequuntur eligendi quasi enim. Eligendi dignissimos impedit qui vitae architecto quia. Voluptas consequuntur dolore voluptatem et repellendus officia. Incidunt sed exercitationem qui culpa voluptas atque.</p>\n', 'contact-bg.jpg', 'Meta for Voluptatem fuga in a labore.', 0, 'blog.layouts.post', NULL, '2020-02-04 13:59:29', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (4, 'f18cc3xs5e5ca8fa8f49c-0', 'Voluptatum aut et maxime at voluptatem expedita molestiae cupiditate quisquam.', 'Facere ut impedit rem temporibus repudiandae rem consequatur dolor omnis veritatis voluptas sunt officiis rerum et provident libero aspernatur quasi blanditiis est quidem dolorum culpa soluta dolores est.', 'Voluptas totam qui voluptatibus tempore est laboriosam. Neque soluta quis ab ex.\n\nQuia suscipit fugiat quia quo placeat quia voluptas. Quis voluptas qui voluptatem exercitationem adipisci in aut. Rem magni et consequuntur perspiciatis.\n\nAlias officiis maiores ea rerum error. Ut cumque quos ratione aut quibusdam. Et adipisci neque natus dolorum occaecati. Impedit dolor nemo repellat sunt pariatur ut nemo.\n\nLibero tempore ut deleniti consequuntur earum expedita. Dignissimos corporis similique est quos. Ut consequatur sed corrupti nihil aut perferendis et.', '<p>Voluptas totam qui voluptatibus tempore est laboriosam. Neque soluta quis ab ex.</p>\n\n<p>Quia suscipit fugiat quia quo placeat quia voluptas. Quis voluptas qui voluptatem exercitationem adipisci in aut. Rem magni et consequuntur perspiciatis.</p>\n\n<p>Alias officiis maiores ea rerum error. Ut cumque quos ratione aut quibusdam. Et adipisci neque natus dolorum occaecati. Impedit dolor nemo repellat sunt pariatur ut nemo.</p>\n\n<p>Libero tempore ut deleniti consequuntur earum expedita. Dignissimos corporis similique est quos. Ut consequatur sed corrupti nihil aut perferendis et.</p>\n', 'about-bg.jpg', 'Meta for Voluptatum aut et maxime at voluptatem expedita molestiae cupiditate quisquam.', 0, 'blog.layouts.post', NULL, '2020-03-03 12:14:50', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (5, 'hkp29nt95e5ca8fa8fbfd-0', 'Voluptates vitae.', 'Occaecati reiciendis adipisci pariatur qui id nihil voluptatem minus iusto quae deserunt expedita quia et sed iusto labore et aut minima eum voluptatum impedit sapiente nam laboriosam.', 'Veniam saepe voluptatibus provident quia minima. Iure corrupti sint ut repellendus est. Esse error qui est est tempora officia.\n\nAliquid sit id rerum dicta ea tempora. Ex nesciunt autem inventore. Doloribus officia rem id ea aliquam.\n\nEt molestiae eos ex et dolor velit. Incidunt asperiores quod illo voluptatem maiores. Quae excepturi quibusdam officiis mollitia rerum consequuntur voluptas. Facilis tenetur et eos eos sit aut.\n\nDoloremque eos aliquid earum sit. Fuga exercitationem iste commodi harum. Est corrupti natus voluptatem animi magni expedita quo repudiandae.\n\nNon non repudiandae cumque magni qui. Est sint explicabo et mollitia. Odit ut est quasi quaerat qui. Aut veniam alias modi quis. Harum velit quos aliquid rem aut rerum tempore voluptatibus.', '<p>Veniam saepe voluptatibus provident quia minima. Iure corrupti sint ut repellendus est. Esse error qui est est tempora officia.</p>\n\n<p>Aliquid sit id rerum dicta ea tempora. Ex nesciunt autem inventore. Doloribus officia rem id ea aliquam.</p>\n\n<p>Et molestiae eos ex et dolor velit. Incidunt asperiores quod illo voluptatem maiores. Quae excepturi quibusdam officiis mollitia rerum consequuntur voluptas. Facilis tenetur et eos eos sit aut.</p>\n\n<p>Doloremque eos aliquid earum sit. Fuga exercitationem iste commodi harum. Est corrupti natus voluptatem animi magni expedita quo repudiandae.</p>\n\n<p>Non non repudiandae cumque magni qui. Est sint explicabo et mollitia. Odit ut est quasi quaerat qui. Aut veniam alias modi quis. Harum velit quos aliquid rem aut rerum tempore voluptatibus.</p>\n', 'contact-bg.jpg', 'Meta for Voluptates vitae.', 0, 'blog.layouts.post', NULL, '2020-02-18 08:50:04', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (6, 'x7e310ec5e5ca8fa90389-0', 'Exercitationem sit minima qui officiis.', 'Nihil ipsum aliquid et cumque totam aspernatur animi hic quis odio.', 'Necessitatibus ut odio ipsum animi corporis iste porro. Quis accusamus porro velit non consequatur fuga. Atque minus dolorum voluptatem.\n\nDignissimos deleniti sit molestias. Voluptatem expedita autem tenetur vel. Architecto facere quia dolore qui tenetur.\n\nQuasi optio nemo quia omnis nostrum quibusdam. Ea quasi ea labore optio. Unde sint ratione beatae ipsa et dicta sunt.\n\nSoluta similique et impedit quidem voluptatem et. Repellendus maiores et magnam et quod repellat minus. Adipisci rerum aut minus voluptas placeat porro quidem.\n\nNobis culpa sed accusantium provident omnis. Ut eligendi nihil dolorem beatae. Ut aut quo error asperiores quas.\n\nNisi illum eum architecto ea quisquam autem. Qui corrupti corporis necessitatibus accusantium.', '<p>Necessitatibus ut odio ipsum animi corporis iste porro. Quis accusamus porro velit non consequatur fuga. Atque minus dolorum voluptatem.</p>\n\n<p>Dignissimos deleniti sit molestias. Voluptatem expedita autem tenetur vel. Architecto facere quia dolore qui tenetur.</p>\n\n<p>Quasi optio nemo quia omnis nostrum quibusdam. Ea quasi ea labore optio. Unde sint ratione beatae ipsa et dicta sunt.</p>\n\n<p>Soluta similique et impedit quidem voluptatem et. Repellendus maiores et magnam et quod repellat minus. Adipisci rerum aut minus voluptas placeat porro quidem.</p>\n\n<p>Nobis culpa sed accusantium provident omnis. Ut eligendi nihil dolorem beatae. Ut aut quo error asperiores quas.</p>\n\n<p>Nisi illum eum architecto ea quisquam autem. Qui corrupti corporis necessitatibus accusantium.</p>\n', 'contact-bg.jpg', 'Meta for Exercitationem sit minima qui officiis.', 0, 'blog.layouts.post', NULL, '2020-02-06 02:53:59', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (7, 'pmhxa5nv5e5ca8fa90b2c-0', 'In sed non in quis vero cumque eum.', 'Et aliquam nisi quo tenetur excepturi eius et provident temporibus eveniet.', 'Sit dolor non voluptatibus earum suscipit ad. Ut perferendis nesciunt laudantium et ad ipsa. Molestias quo rerum autem quo at dolor nostrum. Exercitationem itaque omnis est magni sunt occaecati.\n\nVeniam vitae reiciendis adipisci voluptatem fuga ad illum. At et quis nobis qui. Quis saepe ex consequatur ratione. Dolor ut praesentium magnam consequatur nulla sequi.\n\nLaborum dolorem voluptates molestiae incidunt labore consectetur. Saepe ab sit earum dicta. Consectetur dolores rerum earum qui.\n\nQuae libero nesciunt minima qui aliquam. Quaerat doloremque enim dignissimos amet veniam commodi quis est. Reiciendis dolores ab laborum qui et qui.\n\nVelit ducimus praesentium sapiente et est. Cumque voluptatibus molestiae consequatur voluptatem est eveniet. Maiores autem ut quo commodi voluptatem quibusdam similique. Beatae qui vero in est iure qui.', '<p>Sit dolor non voluptatibus earum suscipit ad. Ut perferendis nesciunt laudantium et ad ipsa. Molestias quo rerum autem quo at dolor nostrum. Exercitationem itaque omnis est magni sunt occaecati.</p>\n\n<p>Veniam vitae reiciendis adipisci voluptatem fuga ad illum. At et quis nobis qui. Quis saepe ex consequatur ratione. Dolor ut praesentium magnam consequatur nulla sequi.</p>\n\n<p>Laborum dolorem voluptates molestiae incidunt labore consectetur. Saepe ab sit earum dicta. Consectetur dolores rerum earum qui.</p>\n\n<p>Quae libero nesciunt minima qui aliquam. Quaerat doloremque enim dignissimos amet veniam commodi quis est. Reiciendis dolores ab laborum qui et qui.</p>\n\n<p>Velit ducimus praesentium sapiente et est. Cumque voluptatibus molestiae consequatur voluptatem est eveniet. Maiores autem ut quo commodi voluptatem quibusdam similique. Beatae qui vero in est iure qui.</p>\n', 'about-bg.jpg', 'Meta for In sed non in quis vero cumque eum.', 0, 'blog.layouts.post', NULL, '2020-02-26 02:13:42', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (8, 'sjvrq24j5e5ca8fa912d5-0', 'Voluptatum tenetur quis voluptates rerum laboriosam.', 'Voluptatem velit rerum adipisci alias neque officiis est pariatur assumenda rerum quo facere quidem molestias omnis velit.', 'Vel voluptatum iusto dolorem qui. Quia animi tempora soluta voluptatem. Iusto eum explicabo eveniet necessitatibus recusandae.\n\nQuia a nemo aliquam temporibus. Expedita nostrum asperiores aliquid dolores fuga perspiciatis. Dolore nulla eius ea ipsam molestiae cum earum eos.\n\nAliquam officiis reiciendis voluptatem et. Officiis ut animi animi nostrum aut et est. Voluptatibus doloremque qui voluptatem aut labore.\n\nFugit minus iste at ab. Tempora corrupti quasi ea itaque rerum similique. Quisquam quo non voluptatem dolor. Fugiat ad id ipsa voluptatem quia atque rerum.\n\nNostrum optio non fugiat dolore et eos. Nihil a at magni ea illo dolor non. Voluptas labore suscipit temporibus quia.\n\nRem voluptates aut deleniti dicta alias et. Eveniet nesciunt occaecati saepe voluptatibus id debitis accusantium. Id occaecati nam qui voluptatem. Ex et porro est dignissimos sapiente. Consequuntur minus impedit fuga non.', '<p>Vel voluptatum iusto dolorem qui. Quia animi tempora soluta voluptatem. Iusto eum explicabo eveniet necessitatibus recusandae.</p>\n\n<p>Quia a nemo aliquam temporibus. Expedita nostrum asperiores aliquid dolores fuga perspiciatis. Dolore nulla eius ea ipsam molestiae cum earum eos.</p>\n\n<p>Aliquam officiis reiciendis voluptatem et. Officiis ut animi animi nostrum aut et est. Voluptatibus doloremque qui voluptatem aut labore.</p>\n\n<p>Fugit minus iste at ab. Tempora corrupti quasi ea itaque rerum similique. Quisquam quo non voluptatem dolor. Fugiat ad id ipsa voluptatem quia atque rerum.</p>\n\n<p>Nostrum optio non fugiat dolore et eos. Nihil a at magni ea illo dolor non. Voluptas labore suscipit temporibus quia.</p>\n\n<p>Rem voluptates aut deleniti dicta alias et. Eveniet nesciunt occaecati saepe voluptatibus id debitis accusantium. Id occaecati nam qui voluptatem. Ex et porro est dignissimos sapiente. Consequuntur minus impedit fuga non.</p>\n', 'about-bg.jpg', 'Meta for Voluptatum tenetur quis voluptates rerum laboriosam.', 0, 'blog.layouts.post', NULL, '2020-02-29 21:37:01', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (9, 'ham66eph5e5ca8fa91a28-0', 'Autem voluptatem ut et.', 'Repellendus iste ex nihil autem mollitia voluptas tenetur reiciendis qui reprehenderit distinctio qui quis blanditiis est nisi impedit nihil omnis aliquam quaerat impedit placeat.', 'Iusto veniam qui aut ut nam. Odio cumque dolor et consequatur ducimus. Ipsa sed animi voluptas.\n\nConsequatur voluptas doloremque voluptates. Corporis ut illum ea. Est ex aut voluptatum impedit qui numquam. Est illum est asperiores aut.\n\nQui dolore quidem amet ab placeat. Reprehenderit repudiandae voluptatem recusandae. Error occaecati autem perferendis repudiandae. Non eum consectetur perspiciatis.', '<p>Iusto veniam qui aut ut nam. Odio cumque dolor et consequatur ducimus. Ipsa sed animi voluptas.</p>\n\n<p>Consequatur voluptas doloremque voluptates. Corporis ut illum ea. Est ex aut voluptatum impedit qui numquam. Est illum est asperiores aut.</p>\n\n<p>Qui dolore quidem amet ab placeat. Reprehenderit repudiandae voluptatem recusandae. Error occaecati autem perferendis repudiandae. Non eum consectetur perspiciatis.</p>\n', 'post-bg.jpg', 'Meta for Autem voluptatem ut et.', 0, 'blog.layouts.post', NULL, '2020-02-29 10:36:38', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (10, 'xydgfwwv5e5ca8fa921c4-0', 'Laudantium sit numquam illo quis blanditiis aut nulla.', 'Quisquam commodi ad amet quod ut possimus assumenda aut dolorum inventore asperiores voluptatem dicta eligendi quo voluptate molestiae minima ea praesentium placeat expedita qui sed dolorem aut.', 'Debitis tempore aperiam est. Vel qui numquam corrupti voluptate. Et sunt eos quo aut veritatis. Voluptas autem ut nostrum nam ipsa.\n\nAsperiores omnis ullam ut non sed ea. Commodi quae voluptate aliquid officiis accusantium iure nesciunt minus. Esse qui perferendis officia exercitationem. Sapiente fugiat nisi accusantium voluptas quam fugiat.\n\nEst totam suscipit laboriosam explicabo rerum unde nesciunt. Et incidunt ut dicta ullam cum suscipit iste.', '<p>Debitis tempore aperiam est. Vel qui numquam corrupti voluptate. Et sunt eos quo aut veritatis. Voluptas autem ut nostrum nam ipsa.</p>\n\n<p>Asperiores omnis ullam ut non sed ea. Commodi quae voluptate aliquid officiis accusantium iure nesciunt minus. Esse qui perferendis officia exercitationem. Sapiente fugiat nisi accusantium voluptas quam fugiat.</p>\n\n<p>Est totam suscipit laboriosam explicabo rerum unde nesciunt. Et incidunt ut dicta ullam cum suscipit iste.</p>\n', 'contact-bg.jpg', 'Meta for Laudantium sit numquam illo quis blanditiis aut nulla.', 0, 'blog.layouts.post', NULL, '2020-02-27 12:32:18', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (11, 'e8wmswy55e5ca8fa9295b-0', 'Adipisci maxime asperiores occaecati veritatis itaque qui provident.', 'Ipsa perferendis cupiditate totam exercitationem ut commodi harum voluptates repellendus sit distinctio est ratione enim aut accusantium sapiente.', 'Vel commodi dolorum voluptatibus aperiam dolores qui. Dolores officia velit commodi officia officiis sed id nostrum. Aspernatur ut natus cum dolor nobis explicabo.\n\nQui dolorum iure consequatur cupiditate ratione voluptatibus. Ullam voluptate non facere. Nemo et eveniet eum numquam.\n\nSed et ullam voluptatem aliquid libero. Expedita consequatur occaecati tempore nesciunt. Perferendis eligendi minima incidunt eaque repellat repellendus.', '<p>Vel commodi dolorum voluptatibus aperiam dolores qui. Dolores officia velit commodi officia officiis sed id nostrum. Aspernatur ut natus cum dolor nobis explicabo.</p>\n\n<p>Qui dolorum iure consequatur cupiditate ratione voluptatibus. Ullam voluptate non facere. Nemo et eveniet eum numquam.</p>\n\n<p>Sed et ullam voluptatem aliquid libero. Expedita consequatur occaecati tempore nesciunt. Perferendis eligendi minima incidunt eaque repellat repellendus.</p>\n', 'home-bg.jpg', 'Meta for Adipisci maxime asperiores occaecati veritatis itaque qui provident.', 0, 'blog.layouts.post', NULL, '2020-02-20 05:24:20', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (12, 'vu6ryvjf5e5ca8fa930bc-0', 'Optio rem occaecati perferendis id aspernatur delectus deserunt esse.', 'Sed sunt similique omnis mollitia sunt deserunt facilis quae fugit unde nesciunt autem pariatur veritatis minima doloribus laborum voluptates.', 'Accusantium vel incidunt fugit a. Voluptatem quasi tempore sed sed recusandae hic praesentium. Deserunt placeat animi repellendus rerum amet eius. Eligendi alias nostrum et molestiae tenetur.\n\nUt inventore voluptas molestiae animi. Explicabo atque sunt ut fuga consequatur. Explicabo tempore aliquid corporis alias aliquam quisquam fuga porro.\n\nAut omnis sit omnis neque blanditiis aliquam officia. Inventore qui et delectus eum ut nobis. Ea iste tempora qui eos dolorum voluptatem inventore placeat.', '<p>Accusantium vel incidunt fugit a. Voluptatem quasi tempore sed sed recusandae hic praesentium. Deserunt placeat animi repellendus rerum amet eius. Eligendi alias nostrum et molestiae tenetur.</p>\n\n<p>Ut inventore voluptas molestiae animi. Explicabo atque sunt ut fuga consequatur. Explicabo tempore aliquid corporis alias aliquam quisquam fuga porro.</p>\n\n<p>Aut omnis sit omnis neque blanditiis aliquam officia. Inventore qui et delectus eum ut nobis. Ea iste tempora qui eos dolorum voluptatem inventore placeat.</p>\n', 'post-bg.jpg', 'Meta for Optio rem occaecati perferendis id aspernatur delectus deserunt esse.', 0, 'blog.layouts.post', NULL, '2020-02-11 09:55:53', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (13, '2lbjhrgj5e5ca8fa93840-0', 'Et et perferendis aliquid.', 'Ab ut dolores expedita qui enim ut et voluptatem optio.', 'Corrupti sed ipsum aut minus saepe rem exercitationem aliquam. Debitis nulla impedit officia ut. Tenetur nesciunt similique sapiente corporis delectus neque. Consequatur ea quia facilis harum esse est.\n\nRepudiandae laborum voluptatem blanditiis iste quas accusantium qui. Velit ut vel quam dolorum quasi. Qui possimus tempore ut corrupti quos et non.\n\nAd quibusdam consectetur iusto nesciunt. Natus laboriosam suscipit quis. Minima magni non qui nihil consequatur perspiciatis expedita.\n\nEt iste natus qui ea. Omnis omnis omnis et delectus. Voluptatibus dignissimos eligendi saepe dignissimos voluptatum cumque. At odit nihil voluptatem ut excepturi molestiae necessitatibus.', '<p>Corrupti sed ipsum aut minus saepe rem exercitationem aliquam. Debitis nulla impedit officia ut. Tenetur nesciunt similique sapiente corporis delectus neque. Consequatur ea quia facilis harum esse est.</p>\n\n<p>Repudiandae laborum voluptatem blanditiis iste quas accusantium qui. Velit ut vel quam dolorum quasi. Qui possimus tempore ut corrupti quos et non.</p>\n\n<p>Ad quibusdam consectetur iusto nesciunt. Natus laboriosam suscipit quis. Minima magni non qui nihil consequatur perspiciatis expedita.</p>\n\n<p>Et iste natus qui ea. Omnis omnis omnis et delectus. Voluptatibus dignissimos eligendi saepe dignissimos voluptatum cumque. At odit nihil voluptatem ut excepturi molestiae necessitatibus.</p>\n', 'post-bg.jpg', 'Meta for Et et perferendis aliquid.', 0, 'blog.layouts.post', NULL, '2020-02-11 01:51:54', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (14, 'pna4nczc5e5ca8fa93fbf-0', 'Sunt ab aut nulla maiores laudantium accusamus.', 'Voluptates fugiat odio officiis perferendis unde voluptatem quas laudantium repellat ex nulla modi magni aut sint sit odio provident quis vitae voluptatibus pariatur quaerat possimus.', 'Adipisci non eos mollitia quaerat quae perspiciatis totam eligendi. Animi quis non soluta. Sapiente quas deserunt repudiandae ut. Consectetur iste sit minus rerum sed.\n\nError et veritatis dolor nam. Et aut sed assumenda voluptates.\n\nQuibusdam incidunt quibusdam distinctio. Neque voluptas sequi molestiae vero dignissimos saepe officiis voluptas. Animi consequatur aut qui esse sed non ratione.\n\nQuasi adipisci quidem fuga. Eaque molestias delectus vel id. Nihil eaque quaerat recusandae numquam fugiat.\n\nSed at qui ab recusandae. Veniam nam asperiores adipisci qui quia illo exercitationem. Voluptatem iusto iste sed nam.', '<p>Adipisci non eos mollitia quaerat quae perspiciatis totam eligendi. Animi quis non soluta. Sapiente quas deserunt repudiandae ut. Consectetur iste sit minus rerum sed.</p>\n\n<p>Error et veritatis dolor nam. Et aut sed assumenda voluptates.</p>\n\n<p>Quibusdam incidunt quibusdam distinctio. Neque voluptas sequi molestiae vero dignissimos saepe officiis voluptas. Animi consequatur aut qui esse sed non ratione.</p>\n\n<p>Quasi adipisci quidem fuga. Eaque molestias delectus vel id. Nihil eaque quaerat recusandae numquam fugiat.</p>\n\n<p>Sed at qui ab recusandae. Veniam nam asperiores adipisci qui quia illo exercitationem. Voluptatem iusto iste sed nam.</p>\n', 'post-bg.jpg', 'Meta for Sunt ab aut nulla maiores laudantium accusamus.', 0, 'blog.layouts.post', NULL, '2020-02-20 20:10:26', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (15, 'hpbntfdg5e5ca8fa94718-0', 'Et distinctio odit ratione voluptates odit optio aut.', 'Nisi consequuntur sapiente non iure atque aut sint alias autem totam velit quos quis sapiente minus numquam deserunt aut suscipit.', 'Eum nisi error placeat dolor quo corrupti. Voluptates fugiat ex fugiat eum. Voluptatem quia odit sunt omnis quos vero ut veniam. Rerum sit optio ab.\n\nQuod qui saepe qui sint similique quasi voluptas. Rerum doloremque illo earum et quisquam.\n\nTenetur veniam laboriosam cumque. Suscipit vero mollitia beatae nihil qui. Voluptatem omnis culpa perspiciatis est. Et facere sapiente ipsam beatae.\n\nOccaecati esse dolorum placeat. Debitis voluptatem vel odit sit aut. Molestias fugiat voluptate corporis et deleniti non. At perspiciatis at inventore quae.', '<p>Eum nisi error placeat dolor quo corrupti. Voluptates fugiat ex fugiat eum. Voluptatem quia odit sunt omnis quos vero ut veniam. Rerum sit optio ab.</p>\n\n<p>Quod qui saepe qui sint similique quasi voluptas. Rerum doloremque illo earum et quisquam.</p>\n\n<p>Tenetur veniam laboriosam cumque. Suscipit vero mollitia beatae nihil qui. Voluptatem omnis culpa perspiciatis est. Et facere sapiente ipsam beatae.</p>\n\n<p>Occaecati esse dolorum placeat. Debitis voluptatem vel odit sit aut. Molestias fugiat voluptate corporis et deleniti non. At perspiciatis at inventore quae.</p>\n', 'home-bg.jpg', 'Meta for Et distinctio odit ratione voluptates odit optio aut.', 0, 'blog.layouts.post', NULL, '2020-02-23 06:00:50', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (16, 'o5hgagov5e5ca8fa94e66-0', 'Eveniet facere exercitationem illo eum cum voluptatibus veniam distinctio consequatur.', 'Error ducimus laboriosam dolor incidunt sint sit repellendus vel earum aut natus quasi commodi.', 'Dolorum hic quibusdam eius. Molestias animi vel reprehenderit tempora odio rerum ut. Quos consequuntur quo eum est enim beatae facere. Est in eum nobis non porro sunt.\n\nSit voluptatem qui molestiae et est enim accusantium. Qui laboriosam illum debitis repudiandae. Ut expedita porro qui id et. Veritatis ut aut eligendi cupiditate doloremque est rerum.\n\nQuas sapiente fugiat voluptatibus quia amet. Veritatis et tempora voluptatum. Sit quibusdam molestias similique deserunt.\n\nSit cumque eum fugit qui dolore rerum. Aliquid tempora laborum rerum vel esse a. Officiis dolorem voluptates expedita cumque.', '<p>Dolorum hic quibusdam eius. Molestias animi vel reprehenderit tempora odio rerum ut. Quos consequuntur quo eum est enim beatae facere. Est in eum nobis non porro sunt.</p>\n\n<p>Sit voluptatem qui molestiae et est enim accusantium. Qui laboriosam illum debitis repudiandae. Ut expedita porro qui id et. Veritatis ut aut eligendi cupiditate doloremque est rerum.</p>\n\n<p>Quas sapiente fugiat voluptatibus quia amet. Veritatis et tempora voluptatum. Sit quibusdam molestias similique deserunt.</p>\n\n<p>Sit cumque eum fugit qui dolore rerum. Aliquid tempora laborum rerum vel esse a. Officiis dolorem voluptates expedita cumque.</p>\n', 'contact-bg.jpg', 'Meta for Eveniet facere exercitationem illo eum cum voluptatibus veniam distinctio consequatur.', 0, 'blog.layouts.post', NULL, '2020-02-29 03:03:14', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (17, 'sxntk9cv5e5ca8fa955c8-0', 'Eaque sunt eum possimus.', 'Velit consequatur exercitationem sint commodi laudantium repudiandae quia officiis deserunt quis maiores odit autem.', 'Quis id maiores molestiae voluptas. Dolores amet possimus velit. Velit ut harum impedit quisquam asperiores error consequatur. Aliquid vel soluta eaque quibusdam. Repudiandae odit exercitationem tenetur aut sapiente.\n\nConsequatur cum hic dolorum dolorum quia voluptatem suscipit voluptatibus. Omnis recusandae enim voluptas aspernatur molestias rem aut. Nobis iusto ab ea et non sit. Rerum atque aperiam quis libero ut.\n\nNecessitatibus dolore explicabo et ut asperiores. Ipsa et est maiores et.\n\nNemo laudantium iusto eligendi quos et. Mollitia quo dolor voluptas exercitationem et est illo.', '<p>Quis id maiores molestiae voluptas. Dolores amet possimus velit. Velit ut harum impedit quisquam asperiores error consequatur. Aliquid vel soluta eaque quibusdam. Repudiandae odit exercitationem tenetur aut sapiente.</p>\n\n<p>Consequatur cum hic dolorum dolorum quia voluptatem suscipit voluptatibus. Omnis recusandae enim voluptas aspernatur molestias rem aut. Nobis iusto ab ea et non sit. Rerum atque aperiam quis libero ut.</p>\n\n<p>Necessitatibus dolore explicabo et ut asperiores. Ipsa et est maiores et.</p>\n\n<p>Nemo laudantium iusto eligendi quos et. Mollitia quo dolor voluptas exercitationem et est illo.</p>\n', 'post-bg.jpg', 'Meta for Eaque sunt eum possimus.', 0, 'blog.layouts.post', NULL, '2020-02-12 21:48:09', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (18, 'javcxx525e5ca8fa95d17-0', 'Voluptatem eius quibusdam repellat culpa.', 'Itaque nulla eligendi itaque eum est sint et necessitatibus et assumenda a et.', 'Voluptatem quia enim non qui sed assumenda eum. Voluptas iure perspiciatis quis magnam. Velit nobis voluptas sint. Facilis numquam minima necessitatibus blanditiis.\n\nSit fugit asperiores dolore quis. Omnis tenetur accusantium rem nesciunt et. Temporibus dolores doloremque nobis sapiente. Rerum libero cum corporis eos sunt sunt magni.\n\nRatione odio error non corporis exercitationem. Ipsam voluptas velit est vitae. Hic voluptatem incidunt quo unde tempore.', '<p>Voluptatem quia enim non qui sed assumenda eum. Voluptas iure perspiciatis quis magnam. Velit nobis voluptas sint. Facilis numquam minima necessitatibus blanditiis.</p>\n\n<p>Sit fugit asperiores dolore quis. Omnis tenetur accusantium rem nesciunt et. Temporibus dolores doloremque nobis sapiente. Rerum libero cum corporis eos sunt sunt magni.</p>\n\n<p>Ratione odio error non corporis exercitationem. Ipsam voluptas velit est vitae. Hic voluptatem incidunt quo unde tempore.</p>\n', 'about-bg.jpg', 'Meta for Voluptatem eius quibusdam repellat culpa.', 0, 'blog.layouts.post', NULL, '2020-02-27 22:39:27', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (19, 'voo7ey4i5e5ca8fa964c7-0', 'Officiis ut et unde officia qui voluptates voluptatum unde.', 'Iure culpa nam laboriosam dolorum blanditiis ut in rerum ducimus ab dignissimos eum quis rerum neque laudantium at consectetur.', 'Ipsum et at sint amet. Sed debitis consequatur a. Ratione sed nulla quaerat expedita nulla voluptatem libero. Dolorem neque non et ipsa.\n\nEsse voluptas accusamus itaque totam sint. Eveniet necessitatibus architecto voluptatum nihil debitis alias. Beatae reprehenderit sit cumque laboriosam illum facere impedit.\n\nNesciunt ut omnis id delectus odio omnis ipsa. Tempora est et veritatis exercitationem. Voluptatem illo modi quo culpa.\n\nEsse tempora temporibus pariatur harum. Ut est corporis deleniti id. Consectetur est sed ut sit illo magnam.\n\nTempore deserunt voluptatem possimus omnis. Laborum et magnam voluptatem ut. Ratione quia aliquam velit et tempora. Doloremque quia rerum optio.', '<p>Ipsum et at sint amet. Sed debitis consequatur a. Ratione sed nulla quaerat expedita nulla voluptatem libero. Dolorem neque non et ipsa.</p>\n\n<p>Esse voluptas accusamus itaque totam sint. Eveniet necessitatibus architecto voluptatum nihil debitis alias. Beatae reprehenderit sit cumque laboriosam illum facere impedit.</p>\n\n<p>Nesciunt ut omnis id delectus odio omnis ipsa. Tempora est et veritatis exercitationem. Voluptatem illo modi quo culpa.</p>\n\n<p>Esse tempora temporibus pariatur harum. Ut est corporis deleniti id. Consectetur est sed ut sit illo magnam.</p>\n\n<p>Tempore deserunt voluptatem possimus omnis. Laborum et magnam voluptatem ut. Ratione quia aliquam velit et tempora. Doloremque quia rerum optio.</p>\n', 'about-bg.jpg', 'Meta for Officiis ut et unde officia qui voluptates voluptatum unde.', 0, 'blog.layouts.post', NULL, '2020-02-07 11:28:12', '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `posts` VALUES (20, 'iq26frfx5e5ca8fa96c33-0', 'Dolor ipsa voluptatum vel totam sed.', 'Quis consequatur laudantium neque sit sint velit quibusdam sunt ut eos natus rem pariatur et et laborum ab architecto rerum.', 'Repellat similique ipsam eveniet fugiat quo aliquid sit quasi. Hic perferendis ut ducimus non. Distinctio ipsa et omnis aut sed eligendi. Repellendus et tenetur odio sed enim quia velit.\n\nSuscipit ipsum repudiandae error quae laborum molestiae. Vel distinctio dolorem impedit quam totam aspernatur. Ad in voluptatibus fugiat. Et asperiores nam possimus aliquam fugiat laborum magni.\n\nEaque at id architecto. Suscipit perferendis inventore ut minus ut sint fugiat.', '<p>Repellat similique ipsam eveniet fugiat quo aliquid sit quasi. Hic perferendis ut ducimus non. Distinctio ipsa et omnis aut sed eligendi. Repellendus et tenetur odio sed enim quia velit.</p>\n\n<p>Suscipit ipsum repudiandae error quae laborum molestiae. Vel distinctio dolorem impedit quam totam aspernatur. Ad in voluptatibus fugiat. Et asperiores nam possimus aliquam fugiat laborum magni.</p>\n\n<p>Eaque at id architecto. Suscipit perferendis inventore ut minus ut sint fugiat.</p>\n', 'post-bg.jpg', 'Meta for Dolor ipsa voluptatum vel totam sed.', 0, 'blog.layouts.post', NULL, '2020-02-17 20:24:58', '2020-03-02 06:34:34', '2020-03-02 06:34:34');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blog.layouts.index',
  `reverse_direction` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tags_tag_unique`(`tag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES (1, 'doloribus', 'Doloribus', 'Numquam eius est ea et.', 'post-bg.jpg', 'Meta for doloribus', 'blog.layouts.index', 0, '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `tags` VALUES (2, 'quis', 'Quis', 'Ab est est aut architecto.', 'home-bg.jpg', 'Meta for quis', 'blog.layouts.index', 0, '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `tags` VALUES (3, 'rerum', 'Rerum', 'Magni modi perferendis voluptates aut.', 'contact-bg.jpg', 'Meta for rerum', 'blog.layouts.index', 0, '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `tags` VALUES (4, 'omnis', 'Omnis', 'Enim aspernatur adipisci sunt dolorum quae dicta sit.', 'about-bg.jpg', 'Meta for omnis', 'blog.layouts.index', 0, '2020-03-02 06:34:34', '2020-03-02 06:34:34');
INSERT INTO `tags` VALUES (5, 'corrupti', 'Corrupti', 'Dolores rem non vel.', 'about-bg.jpg', 'Meta for corrupti', 'blog.layouts.index', 0, '2020-03-02 06:34:34', '2020-03-02 06:34:34');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Robin', 'Robin@hotmail.com', NULL, '$2y$10$3hC8e.Fu39cS6IlmYvJLa.YXu4QK7cPNCXDL8TroccwrTrduHqQuq', NULL, '2020-03-01 09:33:49', '2020-03-01 09:33:49');

SET FOREIGN_KEY_CHECKS = 1;
