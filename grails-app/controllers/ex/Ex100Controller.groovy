package ex

import grails.converters.JSON

class Ex100Controller {

    def ex100Service

    /**主頁面**/
    def index() { }

    def creatEx100 = {
        def modalId = params?.modalId
        def ex100I = new Ex100()
        render view: 'creatEx100', model: ['modalId':modalId,readonly:false,ex100I:ex100I]
    }

    /**
     * 新增資料
     */
    def doInsert = {
        println params
        LinkedHashMap result = ex100Service.doSave(params)
        println result
        render result as JSON
    }
}
