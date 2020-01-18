package bs

import grails.converters.JSON

class BsController {
    def bsService

    /**
     * 程式清單
     */
    def bsAppList = {
        render view: 'bsAppList/index'
    }

    /**
     *  程式清單查詢結果
     */
    def appListFilter = {
        LinkedHashMap result = [:]
        if(params?.params){
            result = bsService.appListFilter(params)
        }
        else{
            result.rows = []
        }
        render result as JSON
    }

    /**
     * 程式清單新增頁面
     */
    def appListCreat = {
        def modalId = params?.modalId
        def bsAppListI = new BsAppList()
        render view: 'bsAppList/appListCreatPage', model: ['modalId':modalId,readonly:false,bsAppListI:bsAppListI]
    }

    /**
     * 程式清單資料編輯頁面
     */
    def appListEdit = {
        def modalId = params?.modalId
        def bsAppListI = BsAppList.get(params?.id)
        render view: 'bsAppList/appListEditPage', model: ['modalId':modalId,readonly:false,bsAppListI:bsAppListI]
    }

    /**
     * 程式清單資料更新
     * @return
     */
    def appListDoUpdate(){
        LinkedHashMap result = bsService.appListDoSave(params)
        if(!result.acrtionIsSuccess){
            result.acrtionMessage = g.renderErrors( bean:result.bean,as:'list')
        }
        else{
            result.forWardId = result.bean?.id.toString()
        }
        render result as JSON
    }

    def bs200List = {
        render view: 'bs200List/index'
    }
}
