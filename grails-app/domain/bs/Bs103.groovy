package bs

class Bs103 {

    Long		id
    Long		pcode
    String		ptype
    String		typedesc
    Long		codeRef
    Integer		isShow = 1
    Integer		level = 1
    Integer		issure = 2
    String		notes
    Date		creatdate
    String		creator
    Date		updt
    String		upator


    static mapping = {
        table 'BS103'
        comment 'bs103'
        version true
        id					column:"ID",				comment:"ID"
        pcode				column:"PCODE",				comment:"代碼"
        ptype				column:"PTYPE",				comment:"類型"
        typedesc			column:"TYPEDESC",			comment:"類型名稱"
        codeRef				column:"CODE_REF",			comment:"父層代碼"
        isShow				column:"IS_SHOW",			comment:"IS_SHOW"
        level				column:"LEVEL",				comment:"LEVEL"
        issure				column:"ISSURE",			comment:"資料狀態"
        notes				column:"NOTES",				comment:"資料註記"
        creatdate			column:"CREATDATE",			comment:"資料建立時間"
        creator				column:"CREATOR",			comment:"資料建立者"
        updt				column:"UPDT",				comment:"資料更新時間"
        upator				column:"UPATOR",			comment:"資料更新者"
    }


    static constraints = {
        id					(nullable:true)
        pcode				(nullable:false, blank: false)
        ptype				(nullable:false, blank: false, maxSize: 20)
        typedesc			(nullable:true, maxSize: 100)
        codeRef				(nullable:true)
        isShow				(nullable:true)
        level				(nullable:true)
        issure				(nullable:true)
        notes				(nullable:true, maxSize: 1000)
        creatdate			(nullable:false, blank: false)
        creator				(nullable:false, blank: false, maxSize: 20)
        updt				(nullable:false, blank: false)
        upator				(nullable:true, maxSize: 20)
    }
}
