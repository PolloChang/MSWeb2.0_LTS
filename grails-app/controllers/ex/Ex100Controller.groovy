package ex

class Ex100Controller {

    /**主頁面**/
    def index() { }

    def creatEx100 = {
        def modalId = params?.modalId
        render view: 'creatEx100', model: ['modalId':modalId]
    }
}
