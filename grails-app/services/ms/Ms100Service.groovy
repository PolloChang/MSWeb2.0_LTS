package ms

import grails.gorm.transactions.Transactional
import grails.web.databinding.DataBinder
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class Ms100Service implements DataBinder {

    def i18nService,toolBoxService


    def filter(GrailsParameterMap params) {
        LinkedHashMap result = [:]
        def dateTransform = []

        //查詢條件集
        def searchData = [:]
        def showRows = []

        //相等
        searchData.equalIntegerLists = ['status']
        //相似
        searchData.likeList = ['accountName','accountNo','ownerName']

        def ms100List = Ms100.createCriteria().list(params) {
            //必要條件
            'in'("issure", ['1'.toLong(),'2'.toLong()])
            searchData.equalIntegerLists.each {field ->
                if(params?."${field}") {
                    if(toolBoxService.isNumeric(params."${field}".toString())){
                        or {
                            def searchVal = params."${field}"
                            if(searchVal instanceof java.lang.String){
                                eq(field, searchVal.toLong())
                            }
                            else{
                                eq(field, searchVal.toLong())
                            }
                        }
                    }
                }
            }

            searchData.likeList.each {field ->
                if(params."${field}"){
                    like(field,'%'+params."${field}"+'%')
                }
            }


        }

        ms100List.each {
            def row = [:]
            row.id = it?.id.toString()
            row.accountName = it?.accountName
            row.ownerName = it?.ownerName
            row.status = it?.statusDesc
            row.accountNo = it?.accountNo

            showRows << row
        }

        result.rows = showRows
        return result

    }

    /**
     * 儲存資料
     * @param params
     * @return result[LinkedHashMap]
     */
    def doSave(GrailsParameterMap params) {
        LinkedHashMap result = [:]
        Ms100 ms100I
        if(params.ms100.id){
            ms100I = Ms100.get(params.ex100.id)
            ms100I.version = ms100I.version +1
            ms100I.lastUpdated = new Date()
            ms100I.manLastUpdated = '系統管理員'
        }
        else {
            ms100I = new Ms100()
            ms100I.manCreated = '系統管理員'
        }

        result.bean = ms100I
        bindData(ms100I, params["ms100"], [include:ms100I.updateBindMap])
        ms100I.validate()
        if (ms100I.hasErrors() || !ms100I.save(flush: true)) { //失敗
            def errorColumn = []
            ms100I.errors.allErrors.eachWithIndex  {item, index ->
                errorColumn[index] = [item?.arguments,item?.defaultMessage]
            }
            ms100I.discard()
            result.acrtionIsSuccess = false
            return result
        }
        result.acrtionIsSuccess = true
        result.acrtionMessage = i18nService.msg("default.updated.message", "", [""])
        return result
    }

    /**
     * 刪除帳戶資料
     * @param params
     */
    def doDelete(GrailsParameterMap params){
        LinkedHashMap result = [:]
        Ms100 ms100I = Ms100.get(params.ms100.id)

        try{
            ms100I.delete(flush: true)
            result.acrtionIsSuccess = true
            result.acrtionMessage=i18nService.msg("default.deleted.message", "", [""])
        }
        catch (Exception ex){
            result.acrtionIsSuccess = false
            result.acrtionMessage=i18nService.msg("default.not.deleted.message", "", [""])
        }
        finally {
            return result
        }
    }
}
