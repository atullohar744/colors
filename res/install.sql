SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+05:30";

CREATE TABLE banners (
  id int(20) NOT NULL auto_increment primary key,
  imgpath varchar(128) DEFAULT NULL,
  link varchar(128) DEFAULT NULL,
  deleted tinyint(1) DEFAULT 0,
  dt timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE config (
  id bigint(20) NOT NULL auto_increment primary key,
  name varchar(128) DEFAULT NULL,
  value varchar(128) DEFAULT NULL,
  displayname varchar(128) DEFAULT NULL,
  dt timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE elog (
  id bigint(20) NOT NULL auto_increment primary key,
  etype varchar(16) DEFAULT NULL,
  shortdesc varchar(256) DEFAULT NULL,
  fulldesc text DEFAULT NULL,
  data text DEFAULT NULL,
  dt timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE logged (
  id bigint(20) NOT NULL auto_increment primary key,
  userid int(12) DEFAULT NULL,
  tlogin timestamp NOT NULL DEFAULT current_timestamp(),
  tlogout datetime DEFAULT NULL,
  logged tinyint(1) DEFAULT 1,
  ip varchar(16) DEFAULT NULL,
  session varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE notifications (
  id int(20) NOT NULL auto_increment primary key,
  title varchar(128) DEFAULT NULL,
  message text DEFAULT NULL,
  sent tinyint(1) DEFAULT 0,
  deleted tinyint(1) DEFAULT 0,
  dt timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE page (
  id bigint(20) NOT NULL auto_increment primary key,
  name varchar(32) DEFAULT NULL,
  displayname varchar(64) DEFAULT NULL,
  contents blob DEFAULT NULL,
  seotitle varchar(64) DEFAULT NULL,
  seokeywords varchar(128) DEFAULT NULL,
  seodescription varchar(256) DEFAULT NULL,
  dt timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE remindpass (
  id bigint(20) NOT NULL auto_increment primary key,
  userid int(20) DEFAULT NULL,
  email varchar(64) DEFAULT NULL,
  code varchar(16) DEFAULT NULL,
  mobile_code varchar(16) DEFAULT NULL,
  ip varchar(15) DEFAULT NULL,
  dt timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE site_settings (
  id bigint(20) NOT NULL auto_increment primary key,
  onesignal_app_id varchar(128) DEFAULT NULL,
  onesignal_api_key varchar(128) DEFAULT NULL,
  userid int(20) DEFAULT 0,
  title varchar(128) DEFAULT NULL,
  email varchar(128) DEFAULT NULL,
  phone bigint(20) DEFAULT NULL,
  logo_imgpath varchar(128) DEFAULT NULL,
  favicon varchar(128) DEFAULT NULL,
  play_store_link varchar(128) DEFAULT NULL,
  terms text DEFAULT NULL,
  terms_url varchar(128) DEFAULT NULL,
  privacy text DEFAULT NULL,
  privacy_url varchar(128) DEFAULT NULL,
  deleted tinyint(1) DEFAULT 0,
  dt timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE template (
  id bigint(20) NOT NULL auto_increment primary key,
  shortname varchar(64) DEFAULT NULL,
  tags varchar(128) DEFAULT NULL,
  name varchar(128) DEFAULT NULL,
  subject varchar(128) DEFAULT NULL,
  message text DEFAULT NULL,
  message_text text DEFAULT NULL,
  html tinyint(1) DEFAULT 1,
  disabled tinyint(1) DEFAULT 0,
  dt timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE template_logs (
  id bigint(20) NOT NULL auto_increment primary key,
  userid int(20) DEFAULT 0,
  ip varchar(16) DEFAULT NULL,
  url varchar(256) DEFAULT NULL,
  referer varchar(256) DEFAULT NULL,
  template varchar(64) DEFAULT NULL,
  subject varchar(128) DEFAULT NULL,
  emails varchar(512) DEFAULT NULL,
  disabled tinyint(1) DEFAULT 0,
  dt timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


CREATE TABLE urls (
  id bigint(20) NOT NULL auto_increment primary key,
  otype varchar(16) DEFAULT NULL,
  oid int(20) DEFAULT NULL,
  url varchar(256) DEFAULT NULL,
  active tinyint(1) DEFAULT 1,
  dt timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE user (
  id bigint(20) NOT NULL auto_increment primary key,
  name varchar(256) DEFAULT NULL,
  email varchar(128) DEFAULT NULL,
  phone varchar(24) DEFAULT NULL,
  dob date NOT NULL,
  state varchar(64) NOT NULL,
  gender varchar(64) NOT NULL,
  pass varchar(64) DEFAULT NULL,
  usertype varchar(32) DEFAULT NULL,
  balance double(10,2) NOT NULL DEFAULT 0.00,
  status tinyint(1) DEFAULT 1,
  imgpath varchar(128) DEFAULT NULL,
  bio text DEFAULT NULL,
  deleted tinyint(1) DEFAULT 0,
  dt timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  auth varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO user (name, email, phone, pass, usertype, status) VALUES
('admin', 'admin@gmail.com', '1234567890', '123', 'Administrator', 1);

CREATE TABLE user_otp (
  id int(20) NOT NULL auto_increment primary key,
  userid int(20) NOT NULL DEFAULT 0,
  otp int(10) NOT NULL DEFAULT 0,
  deleted tinyint(1) NOT NULL DEFAULT 0,
  dt timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE rewards (
  id bigint(20) NOT NULL auto_increment primary key,
  reward varchar(256) DEFAULT NULL,
  description text,
  amount double(10,2) NOT NULL DEFAULT 0,
  link varchar(256) DEFAULT NULL,
  button varchar(256) NOT NULL,
  imgpath varchar(256) NOT NULL,
  deleted tinyint(1) DEFAULT 0,
  dt timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE reviews (
  id bigint(20) NOT NULL auto_increment primary key,
  userid int(20) DEFAULT 0,
  house int(20) DEFAULT 0,
  rating double(10,2) NOT NULL DEFAULT 0,
  comments text,
  deleted tinyint(1) DEFAULT 0,
  dt timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE app_feedback (
  id bigint(20) NOT NULL auto_increment primary key,
  userid int(20) DEFAULT 0,
  rating double(10,2) NOT NULL DEFAULT 0,
  comments text,
  deleted tinyint(1) DEFAULT 0,
  dt timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `transactions` (
  `id` int(11) NOT NULL auto_increment primary key,
  `type` enum('credit','debit') NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `userid` int(11) NOT NULL,
  `date` varchar(25) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0,
  `remark` text DEFAULT NULL,
  `paid` tinyint(1) DEFAULT 0,
  `paid_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE pricing (
  id int(11) NOT NULL auto_increment primary key,
  red_color varchar(64),
  green_color varchar(64),
  purple_color varchar(64),
  deleted tinyint(1) DEFAULT 0,
  dt timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE numbers (
  id int(11) NOT NULL auto_increment primary key,
  digit int(20) default 0,
  green tinyint(1) DEFAULT 0,
  purple tinyint(1) DEFAULT 0,
  red tinyint(1) DEFAULT 0,
  deleted tinyint(1) DEFAULT 0,
  dt timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

insert into numbers(digit) VALUES(0), (1), (2), (3), (4), (5), (6), (7), (8), (9);

CREATE TABLE joined_users (
  id int(11) NOT NULL auto_increment primary key,
  userid int(20) default 0,
  digit int(20) default 0,
  amount double(10, 2) default 0,
  declared tinyint(1) DEFAULT 0,
  winner tinyint(1) DEFAULT 0,
  deleted tinyint(1) DEFAULT 0,
  dt timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;