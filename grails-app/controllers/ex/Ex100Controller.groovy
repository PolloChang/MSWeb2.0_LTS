package ex

class Ex100Controller {

    /**主頁面**/
    def index() { }

    def creatEx100 = {
        def modalId = params?.modalId
        def ex100I = new Ex100()
        render view: 'creatEx100', model: ['modalId':modalId,readonly:false,ex100I:ex100I]
    }
}
