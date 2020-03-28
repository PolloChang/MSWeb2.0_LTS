package ex

import grails.converters.JSON

/**
 * 範例程式
 * @author JamesChang
 * @since Grails4.0.1
 */
class Ex100Controller {

    def ex100Service

    /**主頁面**/
    def index() { }

    /**
     * 查詢
     */
    def filter = {
        LinkedHashMap result = [:]
        if(params?.params){
            result = ex100Service.filter(params)
        }
        else{
            result.rows = []
        }
        render result as JSON
    }

    /**
     * 新增頁面
     */
    def creatPage = {
        def modalId = params?.modalId
        def ex100I = new Ex100()
        render view: 'creatEx100', model: ['modalId':modalId,readonly:false,ex100I:ex100I]
    }

    /**
     * 編輯頁面
     */
    def editPage = {
        def modalId = params?.modalId
        def ex100I = Ex100.get(params?.id)
        render view: 'editEx100', model: ['modalId':modalId,readonly:false,ex100I:ex100I]
    }


    /**
     * 新增資料
     */
    def doInsert = {
        LinkedHashMap result = ex100Service.doSave(params)
        if(!result.acrtionIsSuccess){
            result.acrtionMessage = g.renderErrors( bean:result.bean,as:'list')
        }
        else{
            result.forWardId = result.bean?.id.toString()
        }
        render result as JSON
    }

    /**
     * 更新資料
     */
    def doUpdate = {
        LinkedHashMap result = ex100Service.doSave(params)
        if(!result.acrtionIsSuccess){
            result.acrtionMessage = g.renderErrors( bean:result.bean,as:'list')
        }
        else{
            result.forWardId = result.bean?.id.toString()
        }
        render result as JSON
    }

    /**
     * 刪除資料
     */
    def doDelete = {
        LinkedHashMap result = ex100Service.doDelete(params)
        render result as JSON
    }
}
