USE onekey;
SET NAMES utf8;


DROP TABLE IF EXISTS onekey_apps;
CREATE TABLE onekey_apps
(
  id           SMALLINT UNSIGNED NOT NULL  AUTO_INCREMENT,
  cn_name      VARCHAR(45)       NOT NULL
  COMMENT '应用名中文简体',
  hk_name      VARCHAR(45)       NOT NULL  DEFAULT ''
  COMMENT '应用名繁体',
  en_name      VARCHAR(45)       NOT NULL  DEFAULT ''
  COMMENT '应用名英文',
  version_code SMALLINT          NOT NULL  DEFAULT '1'
  COMMENT '应用版本号',
  version_name VARCHAR(10)       NOT NULL  DEFAULT '1.0'
  COMMENT '应用版本名',
  logo         VARCHAR(150)      NOT NULL  DEFAULT ''
  COMMENT '应用logo',
  PRIMARY KEY (id)
)
  ENGINE = MyISAM
  DEFAULT CHARSET = utf8
  COMMENT '应用表';

DROP TABLE IF EXISTS onekey_apps_filtermac;
CREATE TABLE onekey_apps_filtermac
(
  app_id SMALLINT UNSIGNED NOT NULL
  COMMENT '应用的ID',
  mac_id SMALLINT UNSIGNED NOT NULL
  COMMENT '物理地址的id'
);

DROP TABLE IF EXISTS onekey_filtermac;
CREATE TABLE onekey_filtermac
(
  id          SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  mac_address VARCHAR(45)       NOT NULL
  COMMENT '物理地址',
  PRIMARY KEY (id)
)
  ENGINE = MyISAM
  DEFAULT CHARSET = utf8 COMMENT "物理地址表";

DROP TABLE IF EXISTS onekey_apps_country;
CREATE TABLE onekey_apps_country
(
  app_id SMALLINT UNSIGNED NOT NULL
  COMMENT '应用的ID',
  country_id SMALLINT UNSIGNED NOT NULL
  COMMENT '国家的id'
);

DROP TABLE IF EXISTS onekey_country;
CREATE TABLE onekey_country
(
  id          SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  coutry_name VARCHAR(45)       NOT NULL
  COMMENT '国家名',
  PRIMARY KEY (id)
)
  ENGINE = MyISAM
  DEFAULT CHARSET = utf8
  COMMENT '国家表';


DROP TABLE IF EXISTS  onekey_user;
CREATE TABLE onekey_user
(
  id SMALLINT UNSIGNED NOT NULL  AUTO_INCREMENT,
  username VARCHAR(30) NOT NULL COMMENT '账号',
  password  CHAR(32) NOT NULL COMMENT '密码',
  is_use tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT  '是否启用 1：启用0：禁用',
  PRIMARY KEY (id)
) ENGINE = MyISAM
  DEFAULT CHARSET = utf8
  COMMENT '用户表';

