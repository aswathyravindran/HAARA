﻿# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_haara
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    11-04-2024 18:48:14
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_haara'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_haara" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_haara";


#
# Table structure for table 'tbl_addfurniture'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_addfurniture" (
  "addfurniture_id" int(10) unsigned NOT NULL auto_increment,
  "user_id" int(10) unsigned default NULL,
  "addfurniture_time_period" int(10) unsigned default NULL,
  PRIMARY KEY  ("addfurniture_id")
);



#
# Dumping data for table 'tbl_addfurniture'
#

# No data found.



#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(50) NOT NULL auto_increment,
  "admin_name" varchar(50) default NULL,
  "admin_email" varchar(50) default NULL,
  "admin_password" varchar(50) default NULL,
  "admin_contact" varchar(30) default NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_email", "admin_password", "admin_contact") VALUES
	(2,'gwdlejfrw','hfildrjgioerj','fufhrieogj;oeri','uhfidoguieo');
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_email", "admin_password", "admin_contact") VALUES
	(3,'Aswathy Ravindran','aswathyravindran.t02@gmail.com','aswathy@2002','9744185351');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_cart_furniture'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_cart_furniture" (
  "cart_furniture_id" int(10) unsigned NOT NULL auto_increment,
  "addfurniture_id" int(10) unsigned default NULL,
  "furniture_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("cart_furniture_id")
);



#
# Dumping data for table 'tbl_cart_furniture'
#

# No data found.



#
# Table structure for table 'tbl_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaint" (
  "complaint_id" int(10) unsigned NOT NULL auto_increment,
  "complaint_content" varchar(150) default NULL,
  "user_id" int(10) unsigned default NULL,
  "complaint_reply" varchar(150) default 'not yet replied',
  "complaint_status" int(10) unsigned default '0',
  PRIMARY KEY  ("complaint_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_complaint'
#

LOCK TABLES "tbl_complaint" WRITE;
/*!40000 ALTER TABLE "tbl_complaint" DISABLE KEYS;*/
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_content", "user_id", "complaint_reply", "complaint_status") VALUES
	('6','gdgdldlakdsq','11','pavam

hi chetta','1');
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_content", "user_id", "complaint_reply", "complaint_status") VALUES
	('7','sdfjksdf','11','pavam

hi chetta','1');
/*!40000 ALTER TABLE "tbl_complaint" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(10) unsigned NOT NULL auto_increment,
  "district_name" varchar(50) default NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=21;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('7','thiruvanathapuram');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('8','kollam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('9','pathanamthitta');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('10','alapuzha');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('11','kottayam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('12','idukki');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('13','eranakulam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('14','thrissur');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('15','malappuram');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('16','palakkad');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('17','kozhikodu');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('18','wayanad');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('19','kannur');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('20','kazargod');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_feedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_feedback" (
  "feedback_id" int(10) unsigned NOT NULL auto_increment,
  "feedback_content" varchar(50) default NULL,
  "property_id" int(10) unsigned default NULL,
  "feedback_title" varchar(50) default NULL,
  PRIMARY KEY  ("feedback_id")
);



#
# Dumping data for table 'tbl_feedback'
#

# No data found.



#
# Table structure for table 'tbl_furniture'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_furniture" (
  "furniture_id" int(10) unsigned NOT NULL auto_increment,
  "furniture_image" varchar(50) default NULL,
  "furniture_description" varchar(50) default NULL,
  "furniture_price" varchar(50) default NULL,
  "furniture_address" varchar(50) default NULL,
  "furniture_owner_id" int(10) unsigned default NULL,
  "furniture_contract_time" varchar(50) default NULL,
  "place_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("furniture_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_furniture'
#

LOCK TABLES "tbl_furniture" WRITE;
/*!40000 ALTER TABLE "tbl_furniture" DISABLE KEYS;*/
REPLACE INTO "tbl_furniture" ("furniture_id", "furniture_image", "furniture_description", "furniture_price", "furniture_address", "furniture_owner_id", "furniture_contract_time", "place_id") VALUES
	('2','UserPhoto_1829.jpeg','sgdas','13590','ghsasdhkhsdl','8','6 months','4');
REPLACE INTO "tbl_furniture" ("furniture_id", "furniture_image", "furniture_description", "furniture_price", "furniture_address", "furniture_owner_id", "furniture_contract_time", "place_id") VALUES
	('3','UserPhoto_1180.jpeg','vzvhsjd','3543','gdsdlsal','8','6 months','4');
REPLACE INTO "tbl_furniture" ("furniture_id", "furniture_image", "furniture_description", "furniture_price", "furniture_address", "furniture_owner_id", "furniture_contract_time", "place_id") VALUES
	('4','UserPhoto_1386.jpeg','cssddkdkls','523723','gdsldsldgjsd','5','6 months','4');
/*!40000 ALTER TABLE "tbl_furniture" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_furniture_owner'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_furniture_owner" (
  "furniture_owner_id" int(10) unsigned NOT NULL auto_increment,
  "furniture_owner_name" varchar(50) default NULL,
  "furniture_owner_email" varchar(50) default NULL,
  "furniture_owner_address" varchar(50) default NULL,
  "place_id" int(10) unsigned default NULL,
  "furniture_owner_proof" varchar(50) default NULL,
  "furniture_owner_password" varchar(50) default NULL,
  "furniture_owner_contact" bigint(20) unsigned default NULL,
  "furniture_owner_photo" varchar(50) default NULL,
  "furniture_owner_status" varchar(50) default '0',
  PRIMARY KEY  ("furniture_owner_id")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_furniture_owner'
#

LOCK TABLES "tbl_furniture_owner" WRITE;
/*!40000 ALTER TABLE "tbl_furniture_owner" DISABLE KEYS;*/
REPLACE INTO "tbl_furniture_owner" ("furniture_owner_id", "furniture_owner_name", "furniture_owner_email", "furniture_owner_address", "place_id", "furniture_owner_proof", "furniture_owner_password", "furniture_owner_contact", "furniture_owner_photo", "furniture_owner_status") VALUES
	('1','elna','elna@gmail.com',NULL,'2','UserPhoto_1695.png','kochukudiyil h',NULL,NULL,'1');
REPLACE INTO "tbl_furniture_owner" ("furniture_owner_id", "furniture_owner_name", "furniture_owner_email", "furniture_owner_address", "place_id", "furniture_owner_proof", "furniture_owner_password", "furniture_owner_contact", "furniture_owner_photo", "furniture_owner_status") VALUES
	('8','satto','satto@gmail.com','satto house','4','UserPhoto_1035.png','satto1','8129282992','UserPhoto_1077.png','1');
REPLACE INTO "tbl_furniture_owner" ("furniture_owner_id", "furniture_owner_name", "furniture_owner_email", "furniture_owner_address", "place_id", "furniture_owner_proof", "furniture_owner_password", "furniture_owner_contact", "furniture_owner_photo", "furniture_owner_status") VALUES
	('9','madhav','madhavi@gmail.com','fdkfkglglr','2','UserPhoto_1064.JPG','madhavi','9853403344','UserPhoto_1844.JPG','0');
/*!40000 ALTER TABLE "tbl_furniture_owner" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_furniture_owner_user_chat'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_furniture_owner_user_chat" (
  "from_furniture_owner_id" int(10) unsigned NOT NULL default '0',
  "to_user_id" int(10) unsigned default '0',
  "from_user_id" int(10) unsigned default '0',
  "to_furniture_owner_id" int(10) unsigned default '0',
  "chat_content" varchar(500) default NULL,
  "chat_date" varchar(100) default NULL,
  "chat_id" int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  ("chat_id")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_furniture_owner_user_chat'
#

LOCK TABLES "tbl_furniture_owner_user_chat" WRITE;
/*!40000 ALTER TABLE "tbl_furniture_owner_user_chat" DISABLE KEYS;*/
REPLACE INTO "tbl_furniture_owner_user_chat" ("from_furniture_owner_id", "to_user_id", "from_user_id", "to_furniture_owner_id", "chat_content", "chat_date", "chat_id") VALUES
	('0','0','11','8','Hello','April 10 2024, 11:28 AM','5');
REPLACE INTO "tbl_furniture_owner_user_chat" ("from_furniture_owner_id", "to_user_id", "from_user_id", "to_furniture_owner_id", "chat_content", "chat_date", "chat_id") VALUES
	('8','11','0','0','Hai','April 10 2024, 11:29 AM','6');
REPLACE INTO "tbl_furniture_owner_user_chat" ("from_furniture_owner_id", "to_user_id", "from_user_id", "to_furniture_owner_id", "chat_content", "chat_date", "chat_id") VALUES
	('8','11','0','0','Hello','April 10 2024, 11:41 AM','7');
REPLACE INTO "tbl_furniture_owner_user_chat" ("from_furniture_owner_id", "to_user_id", "from_user_id", "to_furniture_owner_id", "chat_content", "chat_date", "chat_id") VALUES
	('8','11','0','0','Hello','April 10 2024, 11:45 AM','8');
REPLACE INTO "tbl_furniture_owner_user_chat" ("from_furniture_owner_id", "to_user_id", "from_user_id", "to_furniture_owner_id", "chat_content", "chat_date", "chat_id") VALUES
	('0','0','11','8','hi','April 10 2024, 12:24 PM','9');
/*!40000 ALTER TABLE "tbl_furniture_owner_user_chat" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_photo'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_photo" (
  "photo_id" int(10) unsigned NOT NULL auto_increment,
  "photo_caption" varchar(500) default NULL,
  "photo_image" varchar(500) default NULL,
  "property_id" int(10) unsigned default NULL,
  "furniture_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("photo_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_photo'
#

LOCK TABLES "tbl_photo" WRITE;
/*!40000 ALTER TABLE "tbl_photo" DISABLE KEYS;*/
REPLACE INTO "tbl_photo" ("photo_id", "photo_caption", "photo_image", "property_id", "furniture_id") VALUES
	('1','hai
','UserPhoto_1958.JPG','6',NULL);
REPLACE INTO "tbl_photo" ("photo_id", "photo_caption", "photo_image", "property_id", "furniture_id") VALUES
	('4','buu','UserPhoto_1356.jpg','6',NULL);
REPLACE INTO "tbl_photo" ("photo_id", "photo_caption", "photo_image", "property_id", "furniture_id") VALUES
	('5','ji
','UserPhoto_1068.png','6',NULL);
REPLACE INTO "tbl_photo" ("photo_id", "photo_caption", "photo_image", "property_id", "furniture_id") VALUES
	('6','jiii','UserPhoto_1719.jpeg','6',NULL);
REPLACE INTO "tbl_photo" ("photo_id", "photo_caption", "photo_image", "property_id", "furniture_id") VALUES
	('7','hii','UserPhoto_1308.jpg','6',NULL);
/*!40000 ALTER TABLE "tbl_photo" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(10) unsigned NOT NULL auto_increment,
  "place_name" varchar(50) default NULL,
  "district_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('2','chakka','7');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('3','kollam','8');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('4','Muvattupuzha','13');
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('5','thodupuzha','12');
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_property'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_property" (
  "property_id" int(50) NOT NULL auto_increment,
  "property_file" varchar(50) default NULL,
  "property_address" varchar(50) default NULL,
  "property_price" float default NULL,
  "property_details" varchar(50) default NULL,
  "place_id" int(10) unsigned default NULL,
  "property_owners_id" int(11) default NULL,
  "property_contract_time" varchar(20) default NULL,
  PRIMARY KEY  ("property_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_property'
#

LOCK TABLES "tbl_property" WRITE;
/*!40000 ALTER TABLE "tbl_property" DISABLE KEYS;*/
REPLACE INTO "tbl_property" ("property_id", "property_file", "property_address", "property_price", "property_details", "place_id", "property_owners_id", "property_contract_time") VALUES
	(5,'UserPhoto_1785.jpeg','hihello house','20000','house','4',2,'6');
REPLACE INTO "tbl_property" ("property_id", "property_file", "property_address", "property_price", "property_details", "place_id", "property_owners_id", "property_contract_time") VALUES
	(6,'UserPhoto_1087.jpeg','gsdvkjewkq','15000','sdjhfksdf','4',3,'5');
REPLACE INTO "tbl_property" ("property_id", "property_file", "property_address", "property_price", "property_details", "place_id", "property_owners_id", "property_contract_time") VALUES
	(7,'UserPhoto_1268.jpeg','ftsdsujdk','20000','sjkddsiid','4',1,'6');
/*!40000 ALTER TABLE "tbl_property" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_property_owners'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_property_owners" (
  "property_owners_id" int(10) unsigned NOT NULL auto_increment,
  "property_owners_name" varchar(50) default NULL,
  "property_owners_email" varchar(50) default NULL,
  "property_owners_address" varchar(300) default NULL,
  "property_owners_password" varchar(10) default NULL,
  "property_owners_proof" varchar(50) default NULL,
  "property_owners_contact" bigint(20) unsigned default NULL,
  "place_id" int(10) unsigned default '0',
  "property_owners_photo" varchar(50) default NULL,
  "property_owners_status" varchar(50) default '0',
  PRIMARY KEY  ("property_owners_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_property_owners'
#

LOCK TABLES "tbl_property_owners" WRITE;
/*!40000 ALTER TABLE "tbl_property_owners" DISABLE KEYS;*/
REPLACE INTO "tbl_property_owners" ("property_owners_id", "property_owners_name", "property_owners_email", "property_owners_address", "property_owners_password", "property_owners_proof", "property_owners_contact", "place_id", "property_owners_photo", "property_owners_status") VALUES
	('3','Mariya Nixon','mn@gmail.com','palamattam','mariy@1','UserPhoto_1997.png','234567890','4','UserPhoto_1997.png','1');
REPLACE INTO "tbl_property_owners" ("property_owners_id", "property_owners_name", "property_owners_email", "property_owners_address", "property_owners_password", "property_owners_proof", "property_owners_contact", "place_id", "property_owners_photo", "property_owners_status") VALUES
	('4','ron','ron@gmail.com','ron house','ronsi4','UserPhoto_2018.png','5673738290','2','UserPhoto_2018.png','1');
/*!40000 ALTER TABLE "tbl_property_owners" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_property_owner_user_chat'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_property_owner_user_chat" (
  "chat_id" int(10) unsigned NOT NULL auto_increment,
  "chat_date" varchar(50) default NULL,
  "chat_content" varchar(500) NOT NULL,
  "to_property_owner_id" int(10) unsigned default '0',
  "from_user_id" int(10) unsigned default '0',
  "to_user_id" int(10) unsigned default '0',
  "from_property_owner_id" int(10) unsigned default '0',
  PRIMARY KEY  ("chat_id"),
  KEY "chat_content" ("chat_content")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_property_owner_user_chat'
#

LOCK TABLES "tbl_property_owner_user_chat" WRITE;
/*!40000 ALTER TABLE "tbl_property_owner_user_chat" DISABLE KEYS;*/
REPLACE INTO "tbl_property_owner_user_chat" ("chat_id", "chat_date", "chat_content", "to_property_owner_id", "from_user_id", "to_user_id", "from_property_owner_id") VALUES
	('5','April 10 2024, 11:33 AM','Hello','3','11','0','0');
REPLACE INTO "tbl_property_owner_user_chat" ("chat_id", "chat_date", "chat_content", "to_property_owner_id", "from_user_id", "to_user_id", "from_property_owner_id") VALUES
	('6','April 10 2024, 11:33 AM','Hai','0','0','11','3');
REPLACE INTO "tbl_property_owner_user_chat" ("chat_id", "chat_date", "chat_content", "to_property_owner_id", "from_user_id", "to_user_id", "from_property_owner_id") VALUES
	('7','April 10 2024, 11:45 AM','Hello','0','0','11','3');
REPLACE INTO "tbl_property_owner_user_chat" ("chat_id", "chat_date", "chat_content", "to_property_owner_id", "from_user_id", "to_user_id", "from_property_owner_id") VALUES
	('8','April 10 2024, 11:45 AM','Hi','3','11','0','0');
/*!40000 ALTER TABLE "tbl_property_owner_user_chat" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_request'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_request" (
  "request_id" int(10) unsigned NOT NULL auto_increment,
  "request_date" varchar(50) default NULL,
  "user_id" int(10) unsigned default NULL,
  "property_id" int(10) unsigned default '0',
  "request_status" varchar(50) default '0',
  "furniture_id" int(10) unsigned default '0',
  PRIMARY KEY  ("request_id")
) AUTO_INCREMENT=14;



#
# Dumping data for table 'tbl_request'
#

LOCK TABLES "tbl_request" WRITE;
/*!40000 ALTER TABLE "tbl_request" DISABLE KEYS;*/
REPLACE INTO "tbl_request" ("request_id", "request_date", "user_id", "property_id", "request_status", "furniture_id") VALUES
	('12','2024-04-10','11','6','1','0');
REPLACE INTO "tbl_request" ("request_id", "request_date", "user_id", "property_id", "request_status", "furniture_id") VALUES
	('13','2024-04-10','11','0','1','2');
/*!40000 ALTER TABLE "tbl_request" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_review'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_review" (
  "review_id" int(11) NOT NULL auto_increment,
  "user_name" varchar(100) NOT NULL,
  "user_rating" varchar(100) NOT NULL,
  "user_review" varchar(100) NOT NULL,
  "review_datetime" varchar(100) NOT NULL,
  "property_id" int(11) NOT NULL default '0',
  "furniture_id" int(11) NOT NULL default '0',
  PRIMARY KEY  ("review_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_review'
#

LOCK TABLES "tbl_review" WRITE;
/*!40000 ALTER TABLE "tbl_review" DISABLE KEYS;*/
REPLACE INTO "tbl_review" ("review_id", "user_name", "user_rating", "user_review", "review_datetime", "property_id", "furniture_id") VALUES
	(1,'Suraj K S','5','uvuyhib','2024-04-10 12:14:16',5,0);
REPLACE INTO "tbl_review" ("review_id", "user_name", "user_rating", "user_review", "review_datetime", "property_id", "furniture_id") VALUES
	(2,'jhvgj','5','jhvjhv','2024-04-10 12:19:07',0,2);
/*!40000 ALTER TABLE "tbl_review" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" int(10) unsigned NOT NULL auto_increment,
  "user_name" varchar(50) default NULL,
  "user_email" varchar(50) default NULL,
  "user_password" varchar(50) default NULL,
  "user_proof" varchar(50) default NULL,
  "place_id" int(10) unsigned NOT NULL,
  "user_contact" bigint(20) unsigned default NULL,
  "user_address" varchar(100) default NULL,
  "user_photo" varchar(50) default NULL,
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=15;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_password", "user_proof", "place_id", "user_contact", "user_address", "user_photo") VALUES
	('11','Anand Ravindran','anand@gmail.com','anand1','UserPhoto_1730.jpg','4','8129289229','thadathil h','UserPhoto_1730.jpg');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_password", "user_proof", "place_id", "user_contact", "user_address", "user_photo") VALUES
	('13','madhav','madhav@gmail.com','madhav1','UserPhoto_1638.png','4','345678912','madhav h','UserPhoto_1638.png');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_password", "user_proof", "place_id", "user_contact", "user_address", "user_photo") VALUES
	('14','seetha','seetha@gmail.com','seetha1','UserPhoto_1604.png','4','7654312199','seetha h','UserPhoto_1604.png');
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_wishlist'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_wishlist" (
  "wishlist_id" int(10) unsigned NOT NULL auto_increment,
  "property_id" int(10) unsigned default NULL,
  "user_id" int(10) unsigned default NULL,
  "furniture_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("wishlist_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_wishlist'
#

LOCK TABLES "tbl_wishlist" WRITE;
/*!40000 ALTER TABLE "tbl_wishlist" DISABLE KEYS;*/
REPLACE INTO "tbl_wishlist" ("wishlist_id", "property_id", "user_id", "furniture_id") VALUES
	('1',NULL,'11','3');
REPLACE INTO "tbl_wishlist" ("wishlist_id", "property_id", "user_id", "furniture_id") VALUES
	('2','6','11',NULL);
/*!40000 ALTER TABLE "tbl_wishlist" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
