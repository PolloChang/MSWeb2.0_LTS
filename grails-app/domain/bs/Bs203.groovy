package bs

class Bs203 {

    Long		issure = 1
    String		notes
    Date		creatdate
    String		creator
    Date		updt
    String		upator
    String		bs201Code
    String		textShow
    String		textFull
    String		textEn
    String		areaName
    String		cityName
    String		status

    static mapping = {
        table 'BS203'
        comment '省市縣市代碼'
        version true
        //---1.資料流水號 PK0
        id					column:"OBJID", generator:"assigned"
        issure				column:"ISSURE",			        comment:"資料狀態"
        notes				column:"NOTES",				        comment:"資料註記"
        creatdate			column:"CREATDATETINE",			    comment:"資料建立時間"
        creator				column:"CREATOR",			        comment:"資料建立者"
        updt				column:"UPDATETINE",				comment:"資料更新人"
        upator				column:"UPATOR",			        comment:"資料更新者"
        bs201Code           column:"BS201_CODE",			    comment:"省市縣市鄉鎮市區代碼"
        textShow            column:"TEXT_SHOW",			        comment:"路名"
        textFull            column:"TEXT_FULL",			        comment:"全名"
        textEn              column:"TEXT_EN",			        comment:"英文名字"
        status              column:"STATUS",			        comment:"狀態"
        cityName            column:"CITY_NAME",			        comment:"縣市名稱"
        areaName            column:"AREA_NAME",			        comment:"行政區域名稱"
    }

    static constraints = {
        issure				(nullable:false, blank: false)
        notes				(nullable:true, maxSize: 1000)
        creatdate			(nullable:false, blank: false)
        creator				(nullable:false, blank: false, maxSize: 200)
        updt				(nullable:true)
        upator				(nullable:true, maxSize: 200)
        bs201Code		    (nullable:false, blank: false, maxSize: 100)
        textShow			(nullable:false, blank: false, maxSize: 1000)
        textFull			(nullable:false, blank: false, maxSize: 1000)
        textEn			    (nullable:false, blank: false, maxSize: 1000)
        status		        (nullable:true, blank: true, maxSize: 100)
        cityName			(nullable:false, blank: false, maxSize: 1000)
        areaName			(nullable:false, blank: false, maxSize: 1000)
    }
}
