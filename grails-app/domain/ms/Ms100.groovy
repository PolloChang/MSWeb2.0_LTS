package ms

/**
 *  帳本
 * @author JamesChang
 * @since  2020-03-29
 * @version 1.0
 **/
class Ms100 {

    static auditable = [ignore: ['dateCreated', 'lastUpdated', 'manCreated', 'manLastUpdated']]
    static hasMany = [ms101s:Ms101]

    UUID id
    Long issure = 2
    String notes
    String		manCreated
    Date		dateCreated = new Date()
    String		manLastUpdated
    Date		lastUpdated = new Date()
    Long        status
    String      ownerName
    String      accountName
    String      accountNo
    String      bankNo

    static mapping = {
        dynamicInsert true
        table 'MS100'
        comment '帳本'
        version true
        id					column:"UUID",generator: "uuid2", type: "uuid-binary", length: 16
        issure				column:"ISSURE"                     ,comment:"資料狀態"
        notes				column:"NOTES"                      ,comment:"資料註記"
        dateCreated			column:"DATE_CREATED"               ,comment:"資料建立時間"
        manCreated			column:"MAN_CREATED"                ,comment:"資料建立者"
        lastUpdated			column:"LAST_UPDATED"               ,comment:"資料更新人"
        manLastUpdated		column:"MAN_LAST_UPDATED"           ,comment:"資料更新者"
        status              column:"STATUS"                     ,comment:"帳本類別,BS101.MS100_STATUS"
        ownerName           column:"OWNER_NAME"                 ,comment:"擁有者_姓名"
        accountName         column:"ACCOUNT_NAME"               ,comment:"帳戶中文名稱"
        accountNo           column:"ACCOUNT_NO"                 ,comment:"帳號"
        bankNo              column:"BANK_NO"                    ,comment:"銀行代碼"
    }

    static constraints = {
        issure				(nullable:false, blank: false)
        notes				(nullable:true, maxSize: 1000)
        dateCreated			(nullable:false, blank: false)
        manCreated			(nullable:false, blank: false, maxSize: 200)
        lastUpdated			(nullable:true)
        manLastUpdated		(nullable:true, maxSize: 200)

        status              (nullable:true)
        ownerName           (nullable:true,maxSize: 20)
        accountName         (nullable:true,maxSize: 50)
        accountNo           (nullable:true,maxSize: 50)
        bankNo              (nullable:true,maxSize: 5)
    }

    /**
     * 共同儲存欄位
     */
    ArrayList updateBindMap = [
            'status','ownerName','accountName','accountNo','bankNo'
    ]


}
