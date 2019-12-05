package bs

class BsAppList {

    Long		id
    Long		issure = 1
    String		notes
    Date		creatdate
    String		creator
    Date		updt
    String		upator
    String		appName
    String		parentApp
    String		appCname
    String		appCnameI18n
    String		status
    String		controller
    String		action
    Integer		idx
    String 		actionType
    boolean 	showOnMenu


    static mapping = {
        table 'APP_LIST'
        comment '程式清單'
        version true
        id					column:"OBJID",			    comment:"資料流水號"
        issure				column:"ISSURE",			comment:"資料狀態"
        notes				column:"NOTES",				comment:"資料註記"
        creatdate			column:"CREATDATE",			comment:"資料建立時間"
        creator				column:"CREATOR",			comment:"資料建立者"
        updt				column:"UPDT",				comment:"資料更新人"
        upator				column:"UPATOR",			comment:"資料更新者"
        appName				column:"APP_NAME",			comment:"程式名稱_E"
        parentApp			column:"PARENT_APP",		comment:"上層APP"
        appCname			column:"APP_CNAME",			comment:"程式名稱"
        appCnameI18n		column:"APP_CNAME_I18N",	comment:"程式名稱_I18N"
        status				column:"STATUS",			comment:"狀態"
        controller			column:"CONTROLLER",		comment:"CONTROLLER"
        action				column:"ACTION",			comment:"ACTION"
        idx					column:"IDX",				comment:"排序"
        actionType			column:"ACTION_TYPE",		comment:"onlyFunction:單純執行程式,isDropdown:底下還有執行程式"
        showOnMenu			column: "SHOW_ON_MENU",		comment:"顯示在程式清單上"
    }


    static constraints = {
        id   				(nullable:false, blank: false)
        issure				(nullable:false, blank: false)
        notes				(nullable:true, maxSize: 1000)
        creatdate			(nullable:false, blank: false)
        creator				(nullable:false, blank: false, maxSize: 200)
        updt				(nullable:true)
        upator				(nullable:true, maxSize: 200)
        appName				(nullable:false, blank: false, maxSize: 100)
        parentApp			(nullable:true, maxSize: 100)
        appCname			(nullable:true, maxSize: 500)
        appCnameI18n		(nullable:true, maxSize: 200)
        status				(nullable:false, blank: false, maxSize: 200)
        controller			(nullable:true, maxSize: 100)
        action				(nullable:true, maxSize: 100)
        idx					(nullable:false, blank: false)
    }
}
