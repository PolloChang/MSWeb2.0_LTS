package bs

class BsHolday {

    Long		id
    String		name
    String		place
    Long		vactionType
    Integer		issure = 2
    String		notes
    Date		creatdate
    String		creator
    Date		updt
    String		upator


    static mapping = {
        table 'BS_HOLDAY'
        comment '節日表'
        version true
        id					column:"ID",				comment:"ID"
        name				column:"NAME",				comment:"節慶名稱"
        place				column:"PLACE",				comment:"地方/國家"
        vactionType			column:"VACTION_TYPE",		comment:"放假"
        issure				column:"ISSURE",			comment:"資料狀態"
        notes				column:"NOTES",				comment:"資料註記"
        creatdate			column:"CREATDATE",			comment:"資料建立時間"
        creator				column:"CREATOR",			comment:"資料建立者"
        updt				column:"UPDT",				comment:"資料更新時間"
        upator				column:"UPATOR",			comment:"資料更新者"
    }


    static constraints = {
        id					(nullable:false, blank: false)
        name				(nullable:true, maxSize: 50)
        place				(nullable:true, maxSize: 50)
        vactionType			(nullable:true)
        issure				(nullable:true)
        notes				(nullable:true, maxSize: 1000)
        creatdate			(nullable:false, blank: false)
        creator				(nullable:false, blank: false, maxSize: 20)
        updt				(nullable:false, blank: false)
        upator				(nullable:true, maxSize: 20)
    }
}
