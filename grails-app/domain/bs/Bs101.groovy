package bs

class Bs101 {

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
    Integer     idx
    String      exceptionString1
    String      exceptionString2
    String      exceptionString3
    Integer     exceptionInt1
    Integer     exceptionInt2
    Integer     exceptionInt3


    static mapping = {
        table 'BS101'
        comment 'bs101'
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
        idx                 column:"IDX",			    comment:"排序"
        exceptionString1    column: "EXCEPTION_STRING1",comment:"例外字串1"
        exceptionString2    column: "EXCEPTION_STRING2",comment:"例外字串2"
        exceptionString3    column: "EXCEPTION_STRING3",comment:"例外字串3"
        exceptionInt1       column: "EXCEPTION_INT1",   comment:"例外數字1"
        exceptionInt2       column: "EXCEPTION_INT2",   comment:"例外數字2"
        exceptionInt3       column: "EXCEPTION_INT3",   comment:"例外數字3"

        sort idx: "asc" // or "asc"
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
        idx                 (nullable:true)
        exceptionString1    (nullable:true)
        exceptionString2    (nullable:true)
        exceptionString3    (nullable:true)
        exceptionInt1       (nullable:true)
        exceptionInt2       (nullable:true)
        exceptionInt3       (nullable:true)
    }
}
