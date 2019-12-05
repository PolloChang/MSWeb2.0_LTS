package bs

class BsI18 {

    Long		id
    Integer		issure = 2
    String		notes
    Date		creatdate
    String		creator
    Date		updt
    String		upator
    String		langCultureName
    String		displayName
    Long		languageFamily
    Long		groupType


    static mapping = {
        table 'BS_I18'
        comment 'bs_i18'
        version true
        id					column:"ID",				comment:"ID"
        issure				column:"ISSURE",			comment:"資料狀態"
        notes				column:"NOTES",				comment:"資料註記"
        creatdate			column:"CREATDATE",			comment:"資料建立時間"
        creator				column:"CREATOR",			comment:"資料建立者"
        updt				column:"UPDT",				comment:"資料更新時間"
        upator				column:"UPATOR",			comment:"資料更新者"
        langCultureName		column:"LANG_CULTURE_NAME",	comment:"語言文化名稱"
        displayName			column:"DISPLAY_NAME",		comment:"顯示名稱"
        languageFamily		column:"LANGUAGE_FAMILY",	comment:"語系"
        groupType			column:"GROUP_TYPE",		comment:"群組類別"
    }


    static constraints = {
        id					(nullable:true)
        issure				(nullable:true)
        notes				(nullable:true, maxSize: 1000)
        creatdate			(nullable:false, blank: false)
        creator				(nullable:false, blank: false, maxSize: 20)
        updt				(nullable:false, blank: false)
        upator				(nullable:true, maxSize: 20)
        langCultureName		(nullable:false, blank: false, maxSize: 20)
        displayName			(nullable:true, maxSize: 1000)
        languageFamily		(nullable:false, blank: false)
        groupType			(nullable:false, blank: false)
    }
}
