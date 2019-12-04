package ex

class Ex100 {
    static auditable = [ignore: ['dateCreated', 'lastUpdated', 'manCreated', 'manLastUpdated']]
    int issure = 2
    String notes
    String		manCreated
    Date		dateCreated = new Date()
    String		manLastUpdated
    Date		lastUpdated = new Date()
    int         numbers
    int         amts
    String		string
    String		texts
    String		status
    String		idno
    String		name
    String		sex
    Date        birthdy
    String		unid
    String		zip
    String		citycode
    String		twnspcode
    String		vilgcode
    String		rode
    String		addr



    static mapping = {

        table 'EX100'
        comment '資料範例'
        version true

        id					column:"OBJID"
        issure				column:"ISSURE"         ,comment:"資料狀態"
        notes				column:"NOTES"          ,comment:"資料註記"
        dateCreated			column:"CREATDATETINE"  ,omment:"資料建立時間"
        manCreated			column:"CREATOR"        ,comment:"資料建立者"
        lastUpdated			column:"UPDATETINE"     ,comment:"資料更新人"
        manLastUpdated		column:"UPATOR"         ,comment:"資料更新者"
        numbers             column: "NUMBERS"       ,comment: "數值"
        amts                column: "AMTS"          ,comment: "金額"
        string              column: "STRING"        ,comment: "字串"
        texts               column: "TEXTS"         ,comment: "文章"
        status              column: "STATUS"        ,comment: "案件狀態,BS101.XXX"
        idno                column: "IDNO"          ,comment: "身分證字號"
        name                column: "NAME"          ,comment: "姓名"
        sex                 column: "SEX"           ,comment: "性別,BS101.GENDER"
        birthdy             column: "BIRTHDT"       ,comment: "生日"
        unid                column: "UNID"          ,comment: "公司統編"
        zip                 column: "ZIP"           ,comment: "郵遞區號"
        citycode            column: "CITYCODE"      ,comment: "縣、市"
        twnspcode           column: "TWNSPCODE"     ,comment: "鄉、鎮、縣市"
        vilgcode            column: "VILGCODE"      ,comment: "里別"
        rode                column: "RODE"          ,comment: "道路"
        addr                column: "ADDR"          ,comment: "地址"

    }

    static constraints = {
        issure				(nullable:false, blank: false)
        notes				(nullable:true, maxSize: 1000)
        dateCreated			(nullable:false, blank: false)
        manCreated			(nullable:false, blank: false, maxSize: 200)
        lastUpdated			(nullable:true)
        manLastUpdated		(nullable:true, maxSize: 200)
        numbers             (nullable:true)
        amts                (nullable:true)
        string              (nullable:true, blank: true, maxSize: 20)
        texts               (nullable:true, blank: true)
        status              (nullable:true, blank: true, maxSize: 200)
        idno                (nullable:true, blank: true, maxSize: 20)
        name                (nullable:true, blank: true, maxSize: 200)
        sex                 (nullable:true, blank: true, maxSize: 200)
        birthdy             (nullable:true)
        unid                (nullable:true, blank: true, maxSize: 20)
        zip                 (nullable:true, blank: true, maxSize: 10)
        citycode            (nullable:true, blank: true, maxSize: 100)
        twnspcode           (nullable:true, blank: true, maxSize: 100)
        vilgcode            (nullable:true, blank: true, maxSize: 100)
        rode                (nullable:true, blank: true, maxSize: 1000)
        addr                (nullable:true, blank: true, maxSize: 1000)
    }
}
