/**
  Created by JamesChang
  Date/檔案建立日期: 2020/2/1
  Time/檔案建立時間: 下午 02:53
  File Description/檔案描述: 系統範例
 */
CREATE TABLE `ex100` (
  `UUID` binary(16) DEFAULT NULL COMMENT 'UUIDTOBIN(UUID())',
  `VERSION` int(11) DEFAULT 0 COMMENT '版本，每修改一次就是加1',
  `ISSURE` int(11) DEFAULT 2 COMMENT '0：刪除、1：新增中、2：使用中',
  `NOTES` varchar(100) DEFAULT NULL COMMENT '資料註記',
  `DATE_CREATED` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '資料建立時間',
  `MAN_CREATED` varchar(20) NOT NULL COMMENT '資料建立者',
  `LAST_UPDATED` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '資料更新時間',
  `MAN_LAST_UPDATED` varchar(20) DEFAULT NULL COMMENT '資料更新者',
  `NUMBERS` int(11) DEFAULT NULL COMMENT '數值',
  `AMTS` int(11) DEFAULT NULL COMMENT '金額',
  `STRING` varchar(20) DEFAULT NULL COMMENT '字串',
  `TEXTS` text DEFAULT NULL COMMENT '文章',
  `STATUS` varchar(200) DEFAULT NULL COMMENT '案件狀態,BS101.XXX',
  `IDNO` varchar(20) DEFAULT NULL COMMENT '身分證字號',
  `NAME` varchar(200) DEFAULT NULL COMMENT '姓名',
  `SEX` varchar(200) DEFAULT NULL COMMENT '性別,BS101.GENDER',
  `BIRTHDT` date DEFAULT NULL COMMENT '生日',
  `UNID` varchar(20) DEFAULT NULL COMMENT '公司統編',
  `ZIP` varchar(10) DEFAULT NULL COMMENT '郵遞區號',
  `CITYCODE` varchar(100) DEFAULT NULL COMMENT '縣、市',
  `TWNSPCODE` varchar(100) DEFAULT NULL COMMENT '鄉、鎮、縣市',
  `VILGCODE` varchar(100) DEFAULT NULL COMMENT '里別',
  `RODE` varchar(1000) DEFAULT NULL COMMENT '道路',
  `ADDR` varchar(1000) DEFAULT NULL COMMENT '地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='資料範例'
;
