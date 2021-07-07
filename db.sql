-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: instagrem
-- ------------------------------------------------------
-- Server version	5.6.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (7,'2014_10_12_000000_create_users_table',1),(8,'2014_10_12_100000_create_password_resets_table',1),(9,'2018_08_08_100000_create_telescope_entries_table',1),(10,'2021_06_15_160249_create_profiles_table',1),(11,'2021_06_16_152653_create_posts_table',1),(12,'2021_06_27_170308_create_profile_user_pivot_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `caption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_index` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_user`
--

DROP TABLE IF EXISTS `profile_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_user_profile_id_foreign` (`profile_id`),
  KEY `profile_user_user_id_foreign` (`user_id`),
  CONSTRAINT `profile_user_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`),
  CONSTRAINT `profile_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_user`
--

LOCK TABLES `profile_user` WRITE;
/*!40000 ALTER TABLE `profile_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_user_id_index` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_entries`
--

DROP TABLE IF EXISTS `telescope_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_family_hash_index` (`family_hash`),
  KEY `telescope_entries_created_at_index` (`created_at`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_entries`
--

LOCK TABLES `telescope_entries` WRITE;
/*!40000 ALTER TABLE `telescope_entries` DISABLE KEYS */;
INSERT INTO `telescope_entries` VALUES (1,'93d9e09b-0cc8-4bcc-9c66-4848d564d329','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from information_schema.tables where table_schema = \'instagrem\' and table_name = \'migrations\' and table_type = \'BASE TABLE\'\",\"time\":\"2.20\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"ad7d07e5104cadcc6e9623dfc5fefdd8\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(2,'93d9e09b-1084-4aad-b41c-b9915a0ba1b3','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"0.43\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"ed08a59c7f0b8851f0fd2291ca94d5c7\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(3,'93d9e09b-1432-4a1b-ba43-ea47a519877f','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `telescope_entries_tags`\",\"time\":\"4.01\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"48c7503ca003260b5d7b49b69c32e629\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(4,'93d9e09b-152a-4b30-821e-04928e7ade3c','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `telescope_entries`\",\"time\":\"2.04\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"3099636654c39794818dc5406e9671de\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(5,'93d9e09b-1685-45f9-8e91-2b026223a8f3','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `telescope_monitoring`\",\"time\":\"3.02\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"ff4b292b483cb388d75b5b85e3cd0ce6\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(6,'93d9e09b-1700-41bb-8c89-f3a292c52819','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"delete from `migrations` where `migration` = \'2018_08_08_100000_create_telescope_entries_table\'\",\"time\":\"0.56\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"dfbd60cce18ac64c66053ed47bfa86b6\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(7,'93d9e09b-183c-438b-9e64-b3d73c405279','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `profile_user`\",\"time\":\"2.41\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2021_06_27_170308_create_profile_user_pivot_table.php\",\"line\":33,\"hash\":\"cf8e80da77dacac8094c7d3b5ab7202d\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(8,'93d9e09b-1892-472a-8e62-1e56f67b29c2','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"delete from `migrations` where `migration` = \'2021_06_27_170308_create_profile_user_pivot_table\'\",\"time\":\"0.37\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"dfbd60cce18ac64c66053ed47bfa86b6\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(9,'93d9e09b-19da-4062-ba39-a25033761d10','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `posts`\",\"time\":\"2.45\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2021_06_16_152653_create_posts_table.php\",\"line\":34,\"hash\":\"5090d2c1db476a269261e3cea85a2b04\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(10,'93d9e09b-1a38-4960-9afe-cdc0300655c7','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"delete from `migrations` where `migration` = \'2021_06_16_152653_create_posts_table\'\",\"time\":\"0.40\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"dfbd60cce18ac64c66053ed47bfa86b6\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(11,'93d9e09b-1b83-4a6a-86ed-9ebecfd049be','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `profiles`\",\"time\":\"2.56\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2021_06_15_160249_create_profiles_table.php\",\"line\":36,\"hash\":\"5575767602a1cf5de3447d446c8ffa27\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(12,'93d9e09b-1bd5-41ce-8129-935942be8f5d','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"delete from `migrations` where `migration` = \'2021_06_15_160249_create_profiles_table\'\",\"time\":\"0.36\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"dfbd60cce18ac64c66053ed47bfa86b6\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(13,'93d9e09b-1d61-4346-899b-3d46a7653c7c','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `password_resets`\",\"time\":\"3.26\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2014_10_12_100000_create_password_resets_table.php\",\"line\":30,\"hash\":\"0f19d2481474dbc2d5789e7ff4e6fc77\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(14,'93d9e09b-1da0-4a62-a92c-9a3433719b99','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"delete from `migrations` where `migration` = \'2014_10_12_100000_create_password_resets_table\'\",\"time\":\"0.23\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"dfbd60cce18ac64c66053ed47bfa86b6\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(15,'93d9e09b-1ed8-4925-80ad-6f78f7187a38','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"drop table if exists `users`\",\"time\":\"2.44\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2014_10_12_000000_create_users_table.php\",\"line\":35,\"hash\":\"f6ddcf4de1eb548a5650c082714b7223\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(16,'93d9e09b-1f25-4b6f-b115-982bf2f6f49a','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"delete from `migrations` where `migration` = \'2014_10_12_000000_create_users_table\'\",\"time\":\"0.33\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"dfbd60cce18ac64c66053ed47bfa86b6\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(17,'93d9e09b-1fb1-43d8-a854-f976c44cd2d9','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from information_schema.tables where table_schema = \'instagrem\' and table_name = \'migrations\' and table_type = \'BASE TABLE\'\",\"time\":\"0.58\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"ad7d07e5104cadcc6e9623dfc5fefdd8\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(18,'93d9e09b-2005-420d-8924-4bbb7352a856','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from information_schema.tables where table_schema = \'instagrem\' and table_name = \'migrations\' and table_type = \'BASE TABLE\'\",\"time\":\"0.48\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"ad7d07e5104cadcc6e9623dfc5fefdd8\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(19,'93d9e09b-2047-4733-ba6e-59d86fb47976','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"0.32\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"ed08a59c7f0b8851f0fd2291ca94d5c7\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(20,'93d9e09b-20b0-47b8-888e-91fb13d5b0f9','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"0.22\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"ed08a59c7f0b8851f0fd2291ca94d5c7\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(21,'93d9e09b-2140-4660-9cf0-cb3f5aa7951c','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`batch`) as aggregate from `migrations`\",\"time\":\"0.84\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"06e60d7b3d1a0c2de504de4e6f27735e\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(22,'93d9e09b-2435-4979-bab9-7c0cf1b05d20','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `users` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `username` varchar(191) not null, `email` varchar(191) not null, `email_verified_at` timestamp null, `password` varchar(191) not null, `remember_token` varchar(100) null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"6.66\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2014_10_12_000000_create_users_table.php\",\"line\":25,\"hash\":\"4e9b20b0436c8c9338a0de99732586c6\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(23,'93d9e09b-26ae-44e8-9967-e514a9078951','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `users_username_unique`(`username`)\",\"time\":\"5.94\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2014_10_12_000000_create_users_table.php\",\"line\":25,\"hash\":\"d9d8675342e514e22d4b25a58193a2f1\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(24,'93d9e09b-283c-4012-9710-e5b78ac38acd','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `users_email_unique`(`email`)\",\"time\":\"3.59\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2014_10_12_000000_create_users_table.php\",\"line\":25,\"hash\":\"0648806a3d18c0f5b81e2257de64675e\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(25,'93d9e09b-288d-400a-acbf-7810159e4f76','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2014_10_12_000000_create_users_table\', 1)\",\"time\":\"0.34\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(26,'93d9e09b-2ab7-4cf3-a89b-21cb0107f15c','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `password_resets` (`email` varchar(191) not null, `token` varchar(191) not null, `created_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.61\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2014_10_12_100000_create_password_resets_table.php\",\"line\":20,\"hash\":\"68731db34acd59ac6f47053016159dcb\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(27,'93d9e09b-2c91-494d-92ab-0ffd6d0c4e47','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `password_resets` add index `password_resets_email_index`(`email`)\",\"time\":\"4.33\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2014_10_12_100000_create_password_resets_table.php\",\"line\":20,\"hash\":\"e47bfd004ad9142afc1b2460960fbe08\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(28,'93d9e09b-2cd9-4ec6-80a2-33e1347e2b08','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2014_10_12_100000_create_password_resets_table\', 1)\",\"time\":\"0.30\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(29,'93d9e09b-2f1c-4193-ba4e-3d7e06eb582a','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries` (`sequence` bigint unsigned not null auto_increment primary key, `uuid` char(36) not null, `batch_id` char(36) not null, `family_hash` varchar(191) null, `should_display_on_index` tinyint(1) not null default \'1\', `type` varchar(20) not null, `content` longtext not null, `created_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.82\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"8d1ffbefc0996658c0af05e275ad250b\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(30,'93d9e09b-30f7-4779-bb27-7bf636dca66a','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add unique `telescope_entries_uuid_unique`(`uuid`)\",\"time\":\"4.33\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"9fb859ae1faff74c6b9e0b70dfd8eea9\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(31,'93d9e09b-329b-4b33-9c74-50cc713468bd','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_batch_id_index`(`batch_id`)\",\"time\":\"3.77\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"2b075509a9242d6e3f622536c5ccca07\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(32,'93d9e09b-343d-48c3-92ef-96281d72459f','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_family_hash_index`(`family_hash`)\",\"time\":\"3.77\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"3d25a2a244bd2028dfa0326d3dbf7f4c\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(33,'93d9e09b-35f9-42e2-874a-93fa791a309b','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_created_at_index`(`created_at`)\",\"time\":\"4.01\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"7352e7f84460fb7ffc450e7ea4de9dc7\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(34,'93d9e09b-37d4-4d57-86d8-63dcafb68cfc','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`)\",\"time\":\"4.34\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"7317a4cad2dfa1a5167548a6acd0b6a5\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(35,'93d9e09b-3a26-46f7-a266-5ed9ade06450','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries_tags` (`entry_uuid` char(36) not null, `tag` varchar(191) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.17\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"49a385485c9ea77ced1287c810e06704\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(36,'93d9e09b-3bdb-4969-b3cf-6ed11e3a5040','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_entry_uuid_tag_index`(`entry_uuid`, `tag`)\",\"time\":\"3.95\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"d77cdf5585b51f60954d40e76786e20f\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(37,'93d9e09b-3d74-410b-86bc-1451510bca78','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_tag_index`(`tag`)\",\"time\":\"3.69\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"0bdb35d17e876d6225a7774a2c17647d\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(38,'93d9e09b-421b-4c4d-8ea8-da357a37fe08','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add constraint `telescope_entries_tags_entry_uuid_foreign` foreign key (`entry_uuid`) references `telescope_entries` (`uuid`) on delete cascade\",\"time\":\"11.51\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"662a818f80a3a9ba2570081fd7a6af2f\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(39,'93d9e09b-4445-49ea-b9d0-42a3c15addfa','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_monitoring` (`tag` varchar(191) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.07\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"88f0c31d036f95c144b2633daa82c5dd\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(40,'93d9e09b-4496-42ae-bf56-73a40915a349','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_08_08_100000_create_telescope_entries_table\', 1)\",\"time\":\"0.27\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(41,'93d9e09b-48ce-4083-9c7a-5a428943cf52','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `profiles` (`id` bigint unsigned not null auto_increment primary key, `user_id` bigint unsigned not null, `title` varchar(191) null, `url` varchar(191) null, `description` text null, `image` varchar(191) null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"5.05\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2021_06_15_160249_create_profiles_table.php\",\"line\":26,\"hash\":\"88fdb808166ef33b72a92ad04543c055\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(42,'93d9e09b-4d45-4174-84b3-8c4e347712b7','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `profiles` add constraint `profiles_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"11.03\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2021_06_15_160249_create_profiles_table.php\",\"line\":26,\"hash\":\"e05eb54d8c95018aad598ee68fd99fa5\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(43,'93d9e09b-4f2f-43b4-9cb8-1abb2debeb78','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `profiles` add index `profiles_user_id_index`(`user_id`)\",\"time\":\"4.50\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2021_06_15_160249_create_profiles_table.php\",\"line\":26,\"hash\":\"7e9cc7a701dd13113a6a574e075ceebb\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(44,'93d9e09b-4f77-497f-8d2e-52984065e267','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_06_15_160249_create_profiles_table\', 1)\",\"time\":\"0.30\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(45,'93d9e09b-5188-4a1c-8af8-6e86e5dc4f20','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `posts` (`id` bigint unsigned not null auto_increment primary key, `user_id` bigint unsigned not null, `caption` varchar(191) not null, `image` varchar(191) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.42\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2021_06_16_152653_create_posts_table.php\",\"line\":24,\"hash\":\"26128b6953a77d4076ed2b8ebd1da9ff\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(46,'93d9e09b-5558-4d0f-8d03-4a27ea404a84','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `posts` add constraint `posts_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"9.34\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2021_06_16_152653_create_posts_table.php\",\"line\":24,\"hash\":\"4c0aa882292e2658cac18ffd06a58193\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(47,'93d9e09b-5769-4d0c-8f10-deed52178c18','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `posts` add index `posts_user_id_index`(`user_id`)\",\"time\":\"4.88\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2021_06_16_152653_create_posts_table.php\",\"line\":24,\"hash\":\"a2d621abe948688ab12cbb9be8c34a64\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(48,'93d9e09b-57b7-49e5-96cb-d860c86d2d67','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_06_16_152653_create_posts_table\', 1)\",\"time\":\"0.34\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(49,'93d9e09b-59d9-4017-bc3a-f19df58987e2','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `profile_user` (`id` bigint unsigned not null auto_increment primary key, `profile_id` bigint unsigned not null, `user_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"4.53\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2021_06_27_170308_create_profile_user_pivot_table.php\",\"line\":23,\"hash\":\"70f376f5c73921305be2ae2ea223774d\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(50,'93d9e09b-5e04-4321-86f0-5db6586bb927','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `profile_user` add constraint `profile_user_profile_id_foreign` foreign key (`profile_id`) references `profiles` (`id`)\",\"time\":\"10.28\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2021_06_27_170308_create_profile_user_pivot_table.php\",\"line\":23,\"hash\":\"3016a63b21cec7d8265d9dbeb054c8c7\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(51,'93d9e09b-62ee-41c8-82e1-629da6623997','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `profile_user` add constraint `profile_user_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"12.19\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\database\\\\migrations\\\\2021_06_27_170308_create_profile_user_pivot_table.php\",\"line\":23,\"hash\":\"0f1126d802570894adeb168546d7878d\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(52,'93d9e09b-6339-4d6a-8a74-2ad49ef0f399','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_06_27_170308_create_profile_user_pivot_table\', 1)\",\"time\":\"0.32\",\"slow\":false,\"file\":\"C:\\\\Users\\\\tyumi\\\\Desktop\\\\instagrem\\\\artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34'),(53,'93d9e09b-6390-40bc-a1d6-3370004fa995','93d9e09b-63a6-4742-b5a6-46a36efa05e5',NULL,1,'command','{\"command\":\"migrate:refresh\",\"exit_code\":0,\"arguments\":{\"command\":\"migrate:refresh\"},\"options\":{\"database\":null,\"force\":false,\"path\":[],\"realpath\":false,\"seed\":false,\"seeder\":null,\"step\":null,\"help\":false,\"quiet\":false,\"verbose\":false,\"version\":false,\"ansi\":false,\"no-interaction\":false,\"env\":null},\"hostname\":\"LAPTOP-P2T51096\"}','2021-07-07 06:37:34');
/*!40000 ALTER TABLE `telescope_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_entries_tags`
--

DROP TABLE IF EXISTS `telescope_entries_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_entries_tags`
--

LOCK TABLES `telescope_entries_tags` WRITE;
/*!40000 ALTER TABLE `telescope_entries_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope_entries_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_monitoring`
--

DROP TABLE IF EXISTS `telescope_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_monitoring` (
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_monitoring`
--

LOCK TABLES `telescope_monitoring` WRITE;
/*!40000 ALTER TABLE `telescope_monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope_monitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'instagrem'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-07  8:38:15
