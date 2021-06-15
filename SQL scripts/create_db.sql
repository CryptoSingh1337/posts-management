CREATE DATABASE  IF NOT EXISTS `posts_management`;

USE `posts_management`;

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `heading` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

LOCK TABLES `post` WRITE;

INSERT INTO `post` VALUES 
	(1,'What is Lorem Ipsum?','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry', '2021-04-21 12:00:00'),
	(2,'Why do we use it?','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.', '2021-05-22 18:56:00'),
	(3,'Where does it come from?','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.', '2021-05-26 16:45:02'),
	(4,'Where can I get some?','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.', '2021-06-06 14:00:21');

UNLOCK TABLES;

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
	`id` int NOT NULL AUTO_INCREMENT,
	`username` varchar(50) DEFAULT 'Anonymous',
	`description` text DEFAULT NULL,
	`date` date DEFAULT NULL,
	`post_id` int DEFAULT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `FK_POST` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
	ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1;