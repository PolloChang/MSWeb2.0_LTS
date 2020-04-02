package ms

import grails.converters.JSON

/**
 * 帳本維護
 * @author JamesChang
 * @since  2020-03-29
 * @version 1.0
 */
class Ms100Controller {

    def ms100Service

    /**
     *  帳本查詢畫面
     */
    def index = {
        render view: "/ms/ms100/index"
    }

    /**
     * 搜尋
     */
    def filter = {
        LinkedHashMap result = [:]
        if(params?.params){
            result = ms100Service.filter(params)
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
        def ms100I = new Ms100()
        render view: "/ms/ms100/creatPage", model: ['modalId':modalId,readonly:false,ms100I:ms100I]
    }

    /**
     * 編輯頁面
     */
    def editPage = {
        def modalId = params?.modalId
        def ms100I = Ms100.get(params?.id)
        render view: '/ms/ms100/editPage', model: ['modalId':modalId,readonly:false,ms100I:ms100I]
    }

    /**
     * 執行新增帳本資料
     */
    def doInsert(){
        LinkedHashMap result = ms100Service.doSave(params)
        if(!result.acrtionIsSuccess){
            result.acrtionMessage = g.renderErrors( bean:result.bean,as:'list')
        }
        else{
            result.forWardId = result.bean?.id.toString()
        }
        render result as JSON
    }


    /**
     * 更新帳本資料
     */
    def doUpdate = {
        LinkedHashMap result = ms100Service.doSave(params)
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
        LinkedHashMap result = ms100Service.doDelete(params)
        render result as JSON
    }
}
