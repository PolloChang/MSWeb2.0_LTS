package ms

/**
 *  收支資料
 * @author JamesChang
 * @since  2020-03-29
 * @version 1.0
 **/
class Ms101 {

    static auditable = [ignore: ['dateCreated', 'lastUpdated', 'manCreated', 'manLastUpdated']]
    static belongsTo = [ms100: Ms100]


    UUID id
    Long issure = 2
    String notes
    String		manCreated
    Date		dateCreated = new Date()
    String		manLastUpdated
    Date		lastUpdated = new Date()
    Ms100       ms100
    Long        status1
    Long        status2
    Integer     amt = 0
    String      remark
    Date        happenDate

    String      status1Desc
    String      status2Desc

    static mapping = {
        dynamicInsert true
        table 'MS101'
        comment '收支資料'
        version true
        id					column:"UUID",generator: "uuid2", type: "uuid-binary", length: 16
        issure				column:"ISSURE"                 ,comment:"資料狀態"
        notes				column:"NOTES"                  ,comment:"資料註記"
        dateCreated			column:"DATE_CREATED"           ,comment:"資料建立時間"
        manCreated			column:"MAN_CREATED"            ,comment:"資料建立者"
        lastUpdated			column:"LAST_UPDATED"           ,comment:"資料更新人"
        manLastUpdated		column:"MAN_LAST_UPDATED"       ,comment:"資料更新者"
        ms100               column:"MS100_ID"               ,comment:"資料更新者"
        status1             column:"STATUS1"                ,comment:"收入或支出，BS101.MS101_STATUS1"
        status2             column:"STATUS2"                ,comment:"金額類別，BS101.MS101_STATUS2"
        amt                 column:"AMT"                    ,comment:"金額"
        remark              column:"REMARK"                 ,comment:"備註"
        happenDate          column:"HAPPEN_DATE"            ,comment:"收支日期"


        status1Desc          comment:"收入或支出中文敘述"   ,formula: "(SELECT bs.TYPEDESC FROM bs101 bs WHERE bs.PTYPE = 'MS101_STATUS1' AND bs.PCODE = STATUS1 )"
        status2Desc          comment:"金額類別中文敘述"     ,formula: "(SELECT bs.TYPEDESC FROM bs101 bs WHERE bs.PTYPE = 'MS101_STATUS2' AND bs.PCODE = STATUS2 )"
    }

    static constraints = {
        issure				(nullable:false, blank: false)
        notes				(nullable:true, maxSize: 1000)
        dateCreated			(nullable:false, blank: false)
        manCreated			(nullable:false, blank: false, maxSize: 200)
        lastUpdated			(nullable:true)
        manLastUpdated		(nullable:true, maxSize: 200)
        ms100               (nullable:false)
        status1             (nullable:false)
        status2             (nullable:true)
        amt                 (nullable:false)
        remark              (nullable:true,maxSize: 500)
        happenDate          (nullable:true)

        status1Desc         (nullable:true, blank: true)
        status2Desc         (nullable:true, blank: true)
    }

    /**
     * 共同儲存欄位
     */
    ArrayList updateBindMap = [
            'status1','status2','amt','remark','happenDate'
    ]


}
