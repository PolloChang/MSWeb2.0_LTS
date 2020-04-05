package sys.security

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    UUID id
    Long issure = 2
    String notes
    String		manCreated
    Date		dateCreated = new Date()
    String		manLastUpdated
    Date		lastUpdated = new Date()

    String username
    String password
    String fullname
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    static constraints = {
        password nullable: false, blank: false, password: true
        username nullable: false, blank: false, unique: true
        fullname nullable: false, blank: false
        issure				(nullable:false, blank: false)
        notes				(nullable:true, maxSize: 1000)
        dateCreated			(nullable:false, blank: false)
        manCreated			(nullable:false, blank: false, maxSize: 200)
        lastUpdated			(nullable:true)
        manLastUpdated		(nullable:true, maxSize: 200)
    }

    static mapping = {
        table 'BS_USER'
        comment '資料範例'

        id					column:"UUID",generator: "uuid2", type: "uuid-binary", length: 16
        issure				column:"ISSURE"         ,comment:"資料狀態"
        notes				column:"NOTES"          ,comment:"資料註記"
        dateCreated			column:"DATE_CREATED",	comment:"資料建立時間"
        manCreated			column:"MAN_CREATED",	comment:"資料建立者"
        lastUpdated			column:"LAST_UPDATED",	comment:"資料更新人"
        manLastUpdated		column:"MAN_LAST_UPDATED",comment:"資料更新者"
        username            column:"USERNAME"         ,comment:"使用者帳號"
        password            column:"PASSWORD"         ,comment:"使用者密碼"
        fullname            column:"FULLNAME"         ,comment:"使用者名稱"
        enabled             column:"ENABLED"         ,comment:"可以登入"
        accountExpired      column:"ACCOUNTEXPIRED"         ,comment:"帳戶已逾期"
        accountLocked       column:"ACCOUNTLOCKED"         ,comment:"帳戶已被鎖定"
        passwordExpired     column:"PASSWORDEXPIRED"         ,comment:"需要輸入密碼"
    }
}
