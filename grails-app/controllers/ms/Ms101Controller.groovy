package ms

import grails.converters.JSON

/**
 * 帳本明細
 * @author JamesChang
 * @since  2020-04-03
 * @version 1.0
 */
class Ms101Controller {

    def ms101Service

    /**
     * 查詢
     */
    def filter = {
        LinkedHashMap result = [:]
        if(params?.params){
            result = ms101Service.filter(params)
        }
        else{
            result.rows = []
        }
        render result as JSON
    }

    /**
     * 查詢頁面
     * @return
     */
    def index =  {
        render view: "/ms/ms101/index"
    }


    def ms101L = {
        def ms100I = Ms100.get(params?.id)
        render view: "/ms/ms101/ms101L", model: [ms100I:ms100I,readonly:true,pageId:params.id]
    }

    def creatPage = {
        def ms101I = new Ms101()
        ms101I.status1 = 5
        ms101I.ms100 = Ms100.get(params.id)
        render view: "/ms/ms101/creatPage", model: [modalId:params?.modalId,ms101I:ms101I,readonly:false]
    }

    def editPage = {
        def ms101I = Ms101.get(params?.id)
        render view: "/ms/ms101/editPage", model: [modalId:params?.modalId,ms101I:ms101I,readonly:false]
    }

    /**
     * 新增資料
     */
    def doInsert(){
        LinkedHashMap result = ms101Service.doSave(params)
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
    def doUpdate() {
        LinkedHashMap result = ms101Service.doSave(params)
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
    def doDelete() {
        LinkedHashMap result = ms101Service.doDelete(params)
        render result as JSON
    }
}
