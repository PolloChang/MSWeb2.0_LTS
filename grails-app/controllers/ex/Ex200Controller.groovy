package ex

import grails.converters.JSON

class Ex200Controller {

    def ex100Service

    /**
     * 主頁面
     */
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

    def creatPage = {
        def ex100I = new Ex100()
        render view: 'creatEx200', model: [readonly:false,ex100I:ex100I,pageId:params.id]
    }

    /**
     * 編輯頁面
     */
    def editPage = {
        def ex100I = Ex100.get(params?.id)
        render view: 'editEx200', model: [readonly:false,ex100I:ex100I,pageId:params.id]
    }

    /**
     * 新增資料
     * @return JSON
     */
    def doInsert(){
        LinkedHashMap result = ex100Service.doSave(params)
        if(!result.acrtionIsSuccess){
            result.acrtionMessage = g.renderErrors( bean:result.bean,as:'list')
        }
        else{
            result.forWardId = result.bean?.id.toString()
        }
        println result.acrtionIsSuccess
        render result as JSON

    }

    /**
     * 更新資料
     * @return
     */
    def doUpdate(){
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
     * @return
     */
    def doDelete(){
        LinkedHashMap result = ex100Service.doDelete(params)
        render result as JSON
    }
}
