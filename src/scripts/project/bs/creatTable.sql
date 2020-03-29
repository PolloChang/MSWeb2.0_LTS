/**
  Created by JamesChang
  Date/檔案建立日期: 2020/2/1
  Time/檔案建立時間: 下午 02:53
  File Description/檔案描述: 系統選單系列BSXXX
 */

CREATE TABLE `BS100` (
                       `UUID` BINARY(16) DEFAULT NULL COMMENT 'UUIDTOBIN(UUID())',
                       `VERSION` INT(11) DEFAULT 0 COMMENT '版本，每修改一次就是加1',
                       `ISSURE` INT(11) DEFAULT 2 COMMENT '0：刪除、1：新增中、2：使用中',
                       `NOTES` VARCHAR(1000) DEFAULT NULL COMMENT '資料註記',
                       `DATE_CREATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '資料建立時間',
                       `MAN_CREATED` VARCHAR(20) NOT NULL COMMENT '資料建立者',
                       `LAST_UPDATED` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '資料更新時間',
                       `MAN_LAST_UPDATED` VARCHAR(20) DEFAULT NULL COMMENT '資料更新者',
                       `SYSTYPE` VARCHAR(20) NOT NULL COMMENT '系統類型',
                       `PTYPE` VARCHAR(20) NOT NULL COMMENT '類型',
                       `TYPEDESC` VARCHAR(100) NOT NULL COMMENT '類型名稱'
) ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='參數主檔'
;

CREATE OR REPLACE TABLE `bs101` (
        `UUID` binary(16) DEFAULT NULL COMMENT 'UUIDTOBIN(UUID())',
        `VERSION` int(11) DEFAULT 0 COMMENT '版本，每修改一次就是加1',
        `ISSURE` int(11) DEFAULT 2 COMMENT '0：刪除、1：新增中、2：使用中',
        `NOTES` varchar(100) DEFAULT NULL COMMENT '資料註記',
        `DATE_CREATED` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料建立時間',
        `MAN_CREATED` varchar(20) NOT NULL COMMENT '資料建立者',
        `LAST_UPDATED` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '資料更新時間',
        `MAN_LAST_UPDATED` varchar(20) DEFAULT NULL COMMENT '資料更新者',
        `PCODE` bigint(20) NOT NULL COMMENT '代碼',
        `PTYPE` varchar(40) NOT NULL COMMENT '類型',
        `TYPEDESC` varchar(100) NOT NULL COMMENT '類型名稱',
        `IDX` INT DEFAULT NULL COMMENT '排序',
        `EXCEPTION_STRING1` varchar(100) DEFAULT NULL COMMENT '例外字串1',
        `EXCEPTION_STRING2` varchar(100) DEFAULT NULL COMMENT '例外字串2',
        `EXCEPTION_STRING3` varchar(100) DEFAULT NULL COMMENT '例外字串3',
        `EXCEPTION_INT1` INT DEFAULT NULL COMMENT '例外數字1',
        `EXCEPTION_INT2` INT DEFAULT NULL COMMENT '例外數字2',
        `EXCEPTION_INT3` INT DEFAULT NULL COMMENT '例外數字3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='參數子檔'
;
CREATE TABLE `BS103` (
                       `UUID` BINARY(16) DEFAULT NULL COMMENT 'UUIDTOBIN(UUID())',
                       `VERSION` INT(11) DEFAULT 0 COMMENT '版本，每修改一次就是加1',
                       `ISSURE` INT(11) DEFAULT 2 COMMENT '0：刪除、1：新增中、2：使用中',
                       `NOTES` VARCHAR(1000) DEFAULT NULL COMMENT '資料註記',
                       `DATE_CREATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '資料建立時間',
                       `MAN_CREATED` VARCHAR(20) NOT NULL COMMENT '資料建立者',
                       `LAST_UPDATED` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '資料更新時間',
                       `MAN_LAST_UPDATED` VARCHAR(20) DEFAULT NULL COMMENT '資料更新者',
                       `PCODE` BIGINT(20) NOT NULL COMMENT '代碼',
                       `PTYPE` VARCHAR(20) NOT NULL COMMENT '類型',
                       `TYPEDESC` VARCHAR(100) DEFAULT NULL COMMENT '類型名稱',
                       `CODE_REF` BIGINT(20) DEFAULT NULL COMMENT '父層代碼',
                       `IS_SHOW` INT(11) DEFAULT 1 COMMENT '是否顯示，1:顯示、0:不顯示',
                       `LEVEL` INT(11) DEFAULT 1 COMMENT '資料階層'
) ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='子系統介面選單'
;


/**
地址系統系列BS2XX
 */
CREATE TABLE `BS200`  (
                        `UUID` BINARY(16) COMMENT '資料流水號' ,
                        `VERSION` INT DEFAULT 0 COMMENT '版本，每修改一次就是加1' ,
                        `ISSURE` INT DEFAULT 2 COMMENT '0：刪除、1：新增中、2：使用中' ,
                        `NOTES` VARCHAR(100) COMMENT '資料註記' ,
                        `DATE_CREATED` TIMESTAMP NOT NULL COMMENT '資料建立時間' ,
                        `MAN_CREATED` VARCHAR(20) NOT NULL COMMENT '資料建立者' ,
                        `LAST_UPDATED` TIMESTAMP COMMENT '資料更新時間' ,
                        `MAN_LAST_UPDATED` VARCHAR(20) COMMENT '資料更新者' ,
                        `CODE` VARCHAR(100) NOT NULL COMMENT '代碼' ,
                        `TEXT_SHOW` VARCHAR(1000) NOT NULL COMMENT '顯示文字' ,
                        `TEXT_FULL` VARCHAR(1000) COMMENT '全名' ,
                        `TEXT_EN` VARCHAR(1000) COMMENT '英文名字'  )
  ENGINE=INNODB DEFAULT CHARSET=UTF8   COMMENT = '省市縣市代碼'
;

CREATE TABLE `BS201`  (
                        `UUID` BINARY(16) COMMENT '資料流水號' ,
                        `VERSION` INT DEFAULT 0 COMMENT '版本，每修改一次就是加1' ,
                        `ISSURE` INT DEFAULT 2 COMMENT '0：刪除、1：新增中、2：使用中' ,
                        `NOTES` VARCHAR(100) COMMENT '資料註記' ,
                        `DATE_CREATED` TIMESTAMP NOT NULL COMMENT '資料建立時間' ,
                        `MAN_CREATED` VARCHAR(20) NOT NULL COMMENT '資料建立者' ,
                        `LAST_UPDATED` TIMESTAMP COMMENT '資料更新時間' ,
                        `MAN_LAST_UPDATED` VARCHAR(20) COMMENT '資料更新者' ,
                        `BS200_CODE` VARCHAR(100) COMMENT '省市縣市代碼' ,
                        `CODE` VARCHAR(100) NOT NULL COMMENT '代碼' ,
                        `TEXT_SHOW` VARCHAR(1000) NOT NULL COMMENT '顯示文字' ,
                        `TEXT_FULL` VARCHAR(1000) COMMENT '全名' ,
                        `TEXT_EN` VARCHAR(1000) COMMENT '英文名字'  )
  ENGINE=INNODB DEFAULT CHARSET=UTF8   COMMENT = '省市縣市鄉鎮市區代碼'
;

CREATE TABLE `BS202`  (
                        `UUID` BINARY(16) COMMENT '資料流水號' ,
                        `VERSION` INT DEFAULT 0 COMMENT '版本，每修改一次就是加1' ,
                        `ISSURE` INT DEFAULT 2 COMMENT '0：刪除、1：新增中、2：使用中' ,
                        `NOTES` VARCHAR(100) COMMENT '資料註記' ,
                        `DATE_CREATED` TIMESTAMP NOT NULL COMMENT '資料建立時間' ,
                        `MAN_CREATED` VARCHAR(20) NOT NULL COMMENT '資料建立者' ,
                        `LAST_UPDATED` TIMESTAMP COMMENT '資料更新時間' ,
                        `MAN_LAST_UPDATED` VARCHAR(20) COMMENT '資料更新者' ,
                        `BS201_CODE` VARCHAR(100) COMMENT '省市縣市鄉鎮市區代碼' ,
                        `CODE` VARCHAR(100) NOT NULL COMMENT '代碼' ,
                        `TEXT_SHOW` VARCHAR(1000) NOT NULL COMMENT '顯示文字' ,
                        `TEXT_FULL` VARCHAR(1000) COMMENT '全名' ,
                        `TEXT_EN` VARCHAR(1000) COMMENT '英文名字' ,
                        `STATUS` VARCHAR(200) COMMENT '狀態'  )
  ENGINE=INNODB DEFAULT CHARSET=UTF8   COMMENT = '村里代碼表'
;

CREATE TABLE `BS203`(
                      `UUID` BINARY(16) COMMENT '資料流水號' ,
                      `VERSION` INT DEFAULT 0 COMMENT '版本，每修改一次就是加1' ,
                      `ISSURE` INT DEFAULT 2 COMMENT '0：刪除、1：新增中、2：使用中' ,
                      `NOTES` VARCHAR(100) COMMENT '資料註記' ,
                      `DATE_CREATED` TIMESTAMP NOT NULL COMMENT '資料建立時間' ,
                      `MAN_CREATED` VARCHAR(20) NOT NULL COMMENT '資料建立者' ,
                      `LAST_UPDATED` TIMESTAMP COMMENT '資料更新時間' ,
                      `MAN_LAST_UPDATED` VARCHAR(20) COMMENT '資料更新者' ,
                      `BS201_CODE` VARCHAR(100) COMMENT '省市縣市鄉鎮市區代碼' ,
                      `TEXT_SHOW` VARCHAR(1000) NOT NULL COMMENT '路名' ,
                      `TEXT_FULL` VARCHAR(1000) COMMENT '全名' ,
                      `TEXT_EN` VARCHAR(1000) COMMENT '英文名字' ,
                      `STATUS` VARCHAR(200) COMMENT '狀態' ,
                      `CITY_NAME` VARCHAR(1000) COMMENT '縣市名稱' ,
                      `AREA_NAME` VARCHAR(1000) COMMENT '行政區域名稱' )
  ENGINE = INNODB DEFAULT CHARSET = UTF8 COMMENT = '道路代碼表'
;

/**
系統特殊
 */
CREATE TABLE `BS_I18` (
                        `UUID` BINARY(16) DEFAULT NULL COMMENT 'UUIDTOBIN(UUID())',
                        `VERSION` INT(11) DEFAULT 0 COMMENT '版本，每修改一次就是加1',
                        `ISSURE` INT(11) DEFAULT 2 COMMENT '0：刪除、1：新增中、2：使用中',
                        `NOTES` VARCHAR(1000) DEFAULT NULL COMMENT '資料註記',
                        `DATE_CREATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '資料建立時間',
                        `MAN_CREATED` VARCHAR(20) NOT NULL COMMENT '資料建立者',
                        `LAST_UPDATED` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '資料更新時間',
                        `MAN_LAST_UPDATED` VARCHAR(20) DEFAULT NULL COMMENT '資料更新者',
                        `LANG_CULTURE_NAME` VARCHAR(20) NOT NULL COMMENT '語言文化名稱',
                        `DISPLAY_NAME` VARCHAR(1000) DEFAULT NULL COMMENT '顯示名稱',
                        `LANGUAGE_FAMILY` BIGINT(20) NOT NULL COMMENT '語系(BS101.LANGUAGE_FAMILY)',
                        `GROUP_TYPE` BIGINT(20) NOT NULL COMMENT '群組類別(BS101.I18_TYPE)'
) ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='各國語言(語系)代碼表'
;

CREATE TABLE `BS_HOLDAY` (
                           `UUID` BINARY(16) DEFAULT NULL COMMENT 'UUIDTOBIN(UUID())',
                           `VERSION` INT(11) DEFAULT 0 COMMENT '版本，每修改一次就是加1',
                           `ISSURE` INT(11) DEFAULT 2 COMMENT '0：刪除、1：新增中、2：使用中',
                           `NOTES` VARCHAR(1000) DEFAULT NULL COMMENT '資料註記',
                           `DATE_CREATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP() COMMENT '資料建立時間',
                           `MAN_CREATED` VARCHAR(20) NOT NULL COMMENT '資料建立者',
                           `LAST_UPDATED` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '資料更新時間',
                           `MAN_LAST_UPDATED` VARCHAR(20) DEFAULT NULL COMMENT '資料更新者',
                           `NAME` VARCHAR(50) DEFAULT NULL COMMENT '節慶名稱',
                           `PLACE` VARCHAR(50) DEFAULT NULL COMMENT '地方/國家',
                           `VACTION_TYPE` BIGINT(20) DEFAULT NULL COMMENT '放假：BS101:VACTION'
) ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='節日表'
;

CREATE TABLE `APP_LIST` (
  `UUID` BINARY(16) ,
  `VERSION` INT DEFAULT 0 COMMENT '版本，每修改一次就是加1' ,
  `ISSURE` INT DEFAULT 2 COMMENT '0：刪除、1：新增中、2：使用中' ,
  `NOTES` VARCHAR(100) COMMENT '資料註記' ,
  `DATE_CREATED` TIMESTAMP NOT NULL COMMENT '資料建立時間' ,
  `MAN_CREATED` VARCHAR(20) NOT NULL COMMENT '資料建立者' ,
  `LAST_UPDATED` TIMESTAMP COMMENT '資料更新時間' ,
  `MAN_LAST_UPDATED` VARCHAR(20) COMMENT '資料更新者' ,
  `APP_NAME` VARCHAR(100) NOT NULL COMMENT '程式名稱_E' ,
  `PARENT_APP` VARCHAR(100) COMMENT '上層APP' ,
  `APP_CNAME` VARCHAR(500) COMMENT '程式名稱' ,
  `APP_CNAME_I18N` VARCHAR(200) COMMENT '程式名稱_I18N' ,
  `STATUS` VARCHAR(200) NOT NULL COMMENT '狀態' ,
  `CONTROLLER` VARCHAR(100) COMMENT 'CONTROLLER' ,
  `ACTION` VARCHAR(100) COMMENT 'ACTION' ,
  `IDX` INT NOT NULL COMMENT '排序' ,
  `ACTION_TYPE` VARCHAR(100) COMMENT 'onlyFunction:單純執行程式,isDropdown:底下還有執行程式' ,
  `SHOW_ON_MENU` INT COMMENT '顯示在程式清單上' )
  ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '程式清單'
;
ALTER TABLE APP_LIST  ADD CONSTRAINT APP_LIST_PK PRIMARY KEY (UUID);