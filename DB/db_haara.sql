# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_haara
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2024-04-03 17:32:09
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
# Table structure for table 'tbl_chat'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_chat" (
  "chat_id" int(10) unsigned NOT NULL auto_increment,
  "request_id" int(10) unsigned default NULL,
  "property_owner_id" int(10) unsigned default NULL,
  "user_id" int(10) unsigned default NULL,
  "chat_content" varchar(50) default NULL,
  PRIMARY KEY  ("chat_id")
);



#
# Dumping data for table 'tbl_chat'
#

# No data found.



#
# Table structure for table 'tbl_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaint" (
  "complaint_id" int(10) unsigned NOT NULL auto_increment,
  "complaint_content" varchar(50) default NULL,
  "user_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("complaint_id")
);



#
# Dumping data for table 'tbl_complaint'
#

# No data found.



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
  PRIMARY KEY  ("furniture_owner_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_furniture_owner'
#

LOCK TABLES "tbl_furniture_owner" WRITE;
/*!40000 ALTER TABLE "tbl_furniture_owner" DISABLE KEYS;*/
REPLACE INTO "tbl_furniture_owner" ("furniture_owner_id", "furniture_owner_name", "furniture_owner_email", "furniture_owner_address", "place_id", "furniture_owner_proof", "furniture_owner_password", "furniture_owner_contact", "furniture_owner_photo") VALUES
	('1','elna','elna@gmail.com',NULL,'2','UserPhoto_1695.png','kochukudiyil h',NULL,NULL);
REPLACE INTO "tbl_furniture_owner" ("furniture_owner_id", "furniture_owner_name", "furniture_owner_email", "furniture_owner_address", "place_id", "furniture_owner_proof", "furniture_owner_password", "furniture_owner_contact", "furniture_owner_photo") VALUES
	('2','Aswathy Ravindran','aswathyravindran.t02@gmail.com','vhdfklvmdfkv','2','','ghdjdfgl','9744185351',NULL);
REPLACE INTO "tbl_furniture_owner" ("furniture_owner_id", "furniture_owner_name", "furniture_owner_email", "furniture_owner_address", "place_id", "furniture_owner_proof", "furniture_owner_password", "furniture_owner_contact", "furniture_owner_photo") VALUES
	('3','Sharon Sunny','sharon@gmail.com','mvpa','4','','sharon','8129289229',NULL);
REPLACE INTO "tbl_furniture_owner" ("furniture_owner_id", "furniture_owner_name", "furniture_owner_email", "furniture_owner_address", "place_id", "furniture_owner_proof", "furniture_owner_password", "furniture_owner_contact", "furniture_owner_photo") VALUES
	('8','satto','satto@gmail.com','satto house','4','UserPhoto_1035.png','satto1','8129282992','UserPhoto_1077.png');
/*!40000 ALTER TABLE "tbl_furniture_owner" ENABLE KEYS;*/
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
  "place_id" int(10) unsigned default NULL,
  "property_owners_photo" varchar(50) default NULL,
  PRIMARY KEY  ("property_owners_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_property_owners'
#

LOCK TABLES "tbl_property_owners" WRITE;
/*!40000 ALTER TABLE "tbl_property_owners" DISABLE KEYS;*/
REPLACE INTO "tbl_property_owners" ("property_owners_id", "property_owners_name", "property_owners_email", "property_owners_address", "property_owners_password", "property_owners_proof", "property_owners_contact", "place_id", "property_owners_photo") VALUES
	('3','Mariya Nixon','mn@gmail.com','palamattam','mariy@1','UserPhoto_1997.png','234567890','4','UserPhoto_1997.png');
/*!40000 ALTER TABLE "tbl_property_owners" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_request'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_request" (
  "request_id" int(10) unsigned NOT NULL auto_increment,
  "request_date" datetime default NULL,
  "user_id" int(10) unsigned default NULL,
  "property_id" int(10) unsigned default NULL,
  "request_status" varchar(50) default NULL,
  "furniture_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("request_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_request'
#

LOCK TABLES "tbl_request" WRITE;
/*!40000 ALTER TABLE "tbl_request" DISABLE KEYS;*/
REPLACE INTO "tbl_request" ("request_id", "request_date", "user_id", "property_id", "request_status", "furniture_id") VALUES
	('3','2024-04-01 00:00:00','8','5','2',NULL);
REPLACE INTO "tbl_request" ("request_id", "request_date", "user_id", "property_id", "request_status", "furniture_id") VALUES
	('4','2024-04-01 00:00:00','8','5','1',NULL);
REPLACE INTO "tbl_request" ("request_id", "request_date", "user_id", "property_id", "request_status", "furniture_id") VALUES
	('5','2024-04-01 00:00:00','8','5','1',NULL);
REPLACE INTO "tbl_request" ("request_id", "request_date", "user_id", "property_id", "request_status", "furniture_id") VALUES
	('6','2024-04-02 00:00:00','8','6','1',NULL);
REPLACE INTO "tbl_request" ("request_id", "request_date", "user_id", "property_id", "request_status", "furniture_id") VALUES
	('7','2024-04-02 00:00:00','8',NULL,'1','2');
REPLACE INTO "tbl_request" ("request_id", "request_date", "user_id", "property_id", "request_status", "furniture_id") VALUES
	('8','2024-04-02 00:00:00','8',NULL,'2','2');
/*!40000 ALTER TABLE "tbl_request" ENABLE KEYS;*/
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
) AUTO_INCREMENT=13;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_password", "user_proof", "place_id", "user_contact", "user_address", "user_photo") VALUES
	('11','Anand Ravindran','anand@gmail.com','anand1','UserPhoto_1730.jpg','4','8129289229','thadathil h','UserPhoto_1730.jpg');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_password", "user_proof", "place_id", "user_contact", "user_address", "user_photo") VALUES
	('12','Aswathy Ravindran','aswathyravindran.t02@gmail.com','aswathy1','UserPhoto_1295.jpg','4','9744185351','thadathil h','UserPhoto_1295.jpg');
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_wishlist'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_wishlist" (
  "wishlist_id" int(10) unsigned NOT NULL auto_increment,
  "property_id" int(10) unsigned default NULL,
  "user_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("wishlist_id")
);



#
# Dumping data for table 'tbl_wishlist'
#

# No data found.

/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
