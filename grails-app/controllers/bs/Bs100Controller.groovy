/**
 * Created by JamesChang
 * Date/檔案建立日期: 2020-02-07
 *Time/檔案建立時間: 09:31
 * File Description/檔案描述:BS系統選單
 */
package bs

import grails.converters.JSON

class Bs100Controller {

    def bs100Service

    def index() {
        render view: '/bs/bs100List/index'
    }

    def creatPage = {
        def bs100I = new Bs100()
        render view: '/bs/bs100List/creatBs100', model: [readonly:false,bs100I:bs100I,pageId:params.id]
    }

    /**
     * 編輯畫面
     */
    def editPage = {
        def bs100I = Bs100.get(params?.id)
        render view: '/bs/bs100List/editBs100', model: [readonly:false,bs100I:bs100I,pageId:params.id]
    }

    /**
     * 查詢
     * @return
     */
    def filter(){
        LinkedHashMap result = [:]
        if(params?.params){
            result = bs100Service.filter(params)
        }
        else{
            result.rows = []
        }
        render result as JSON
    }

    /**
     * 新增BS100
     * @return result[JSON]
     */
    def doInsert(){
        LinkedHashMap result = bs100Service.doSave(params)
        if(!result.acrtionIsSuccess){
            result.acrtionMessage = g.renderErrors( bean:result.bean,as:'list')
        }
        else{
            result.forWardId = result.bean?.id.toString()
        }
        render result as JSON
    }

    def doUpdate(){
        LinkedHashMap result = bs100Service.doSave(params)
        if(!result.acrtionIsSuccess){
            result.acrtionMessage = g.renderErrors( bean:result.bean,as:'list')
        }
        else{
            result.forWardId = result.bean?.id.toString()
        }
        render result as JSON
    }

    /**
     * 刪除
     * @return JSON
     */
    def doDelete(){
        LinkedHashMap result = bs100Service.doDelete(params)
        render result as JSON
    }

    /**
     * 新增BS101頁面
     */
    def creatPageBs101 = {
        def modalId = params?.modalId
        def bs101I = new Bs101()
        bs101I.ptype = params.ptype
        render view: '/bs/bs100List/creatBs101', model: ['modalId':modalId,readonly:false,bs101I:bs101I]
    }

    /**
     * BS101編輯頁面
     */
    def editPageBs101 = {
        def modalId = params?.modalId
        def bs101I = Bs101.get(params?.id)
        render view: '/bs/bs100List/editBs101', model: ['modalId':modalId,readonly:false,bs101I:bs101I]
    }

    /**
     * 新增選單
     * @return JSON
     */
    def doInsertBs101(){
        LinkedHashMap result = bs100Service.bs101DoSave(params)
        if(!result.acrtionIsSuccess){
            result.acrtionMessage = g.renderErrors( bean:result.bean,as:'list')
        }
        else{
            result.forWardId = result.bean?.id.toString()
        }
        render result as JSON
    }

    /**
     * 更新選單
     * @return JSON
     */
    def doUpdateBs101(){
        LinkedHashMap result = bs100Service.bs101DoSave(params)
        if(!result.acrtionIsSuccess){
            result.acrtionMessage = g.renderErrors( bean:result.bean,as:'list')
        }
        else{
            result.forWardId = result.bean?.id.toString()
        }
        render result as JSON
    }

    /**
     * 刪除選單
     * @return JSON
     */
    def doDeleteBs101(){
        LinkedHashMap result = bs100Service.doDeleteBs101(params)
        render result as JSON
    }
}
