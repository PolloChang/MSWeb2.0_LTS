package bs

class Bs102 {

    static auditable = [ignore: ['dateCreated', 'lastUpdated', 'manCreated', 'manLastUpdated']]
    UUID id
    Long		pcode
    String		ptype
    String		typedesc
    Integer		issure = 2
    String		notes
    Date		dateCreated
    String		manCreated
    Date		lastUpdated
    String		manLastUpdated


    static mapping = {
        table 'BS102'
        comment 'bs102'
        version true
        id					column:"UUID",generator: "uuid2", type: "uuid-binary", length: 16
        pcode				column:"PCODE",				comment:"代碼"
        ptype				column:"PTYPE",				comment:"類型"
        typedesc			column:"TYPEDESC",			comment:"類型名稱"
        issure				column:"ISSURE",			comment:"資料狀態"
        notes				column:"NOTES",				comment:"資料註記"
        dateCreated			column:"DATE_CREATED",		comment:"資料建立時間"
        manCreated			column:"MAN_CREATED",		comment:"資料建立者"
        lastUpdated			column:"LAST_UPDATED",		comment:"資料更新人"
        manLastUpdated		column:"MAN_LAST_UPDATED",	comment:"資料更新者"
    }


    static constraints = {
        id					(nullable:false, blank: false)
        pcode				(nullable:false, blank: false)
        ptype				(nullable:false, blank: false, maxSize: 20)
        typedesc			(nullable:true, maxSize: 100)
        issure				(nullable:true)
        notes				(nullable:true, maxSize: 1000)
        dateCreated			(nullable:false, blank: false)
        manCreated			(nullable:false, blank: false, maxSize: 200)
        lastUpdated			(nullable:true)
        manLastUpdated		(nullable:true, maxSize: 200)
    }
}
