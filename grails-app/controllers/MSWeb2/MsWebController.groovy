package MSWeb2

import grails.plugin.springsecurity.annotation.Secured

class MsWebController {

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index() { }
}
