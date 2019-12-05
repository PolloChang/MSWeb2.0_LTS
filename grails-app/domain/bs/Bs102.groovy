package bs

class Bs102 {

    Long		id
    Long		pcode
    String		ptype
    String		typedesc
    Integer		issure = 2
    String		notes
    Date		creatdate
    String		creator
    Date		updt
    String		upator


    static mapping = {
        table 'BS102'
        comment 'bs102'
        version true
        id					column:"ID",				comment:"ID"
        pcode				column:"PCODE",				comment:"代碼"
        ptype				column:"PTYPE",				comment:"類型"
        typedesc			column:"TYPEDESC",			comment:"類型名稱"
        issure				column:"ISSURE",			comment:"資料狀態"
        notes				column:"NOTES",				comment:"資料註記"
        creatdate			column:"CREATDATE",			comment:"資料建立時間"
        creator				column:"CREATOR",			comment:"資料建立者"
        updt				column:"UPDT",				comment:"資料更新時間"
        upator				column:"UPATOR",			comment:"資料更新者"
    }


    static constraints = {
        id					(nullable:false, blank: false)
        pcode				(nullable:false, blank: false)
        ptype				(nullable:false, blank: false, maxSize: 20)
        typedesc			(nullable:true, maxSize: 100)
        issure				(nullable:true)
        notes				(nullable:true, maxSize: 1000)
        creatdate			(nullable:false, blank: false)
        creator				(nullable:false, blank: false, maxSize: 20)
        updt				(nullable:false, blank: false)
        upator				(nullable:true, maxSize: 20)
    }
}
