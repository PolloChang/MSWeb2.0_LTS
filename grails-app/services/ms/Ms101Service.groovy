package ms

import grails.gorm.transactions.Transactional
import grails.web.databinding.DataBinder
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class Ms101Service implements DataBinder {

    def i18nService,toolBoxService

    /**
     * 查詢
     * @param params
     * @return  result[Map]
     */
    def filter(GrailsParameterMap params){

        LinkedHashMap result = [:]
        def dateTransform = []

        //查詢條件集
        def searchData = [:]
        def showRows = []

        searchData.equalIntegerLists = ['status1','status2']
        //相等
        searchData.equalList = []
        //相似
        searchData.likeList = []
        //日期
        searchData.dateList = ['happenDate']
        searchData.dateList?.each{
            dateTransform << "${it}1"
            dateTransform << "${it}2"
        }

        params << toolBoxService.paramsTextDateTransform(params: params,list: dateTransform)

        def ms101List = Ms101.createCriteria().list(params) {
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

            searchData.equalList.each {field ->
                if(params."${field}"){
                    eq(field,params."${field}")
                }
            }

            searchData.likeList.each {field ->
                if(params."${field}"){
                    like(field,'%'+params."${field}"+'%')
                }
            }

            searchData.dateList.each{field->  //date condition
                if(params."${field}1"){
                    ge(field, params."${field}1")
                }
                if(params."${field}2"){
                    lt(field, params."${field}2")
                }
            }

        }

        ms101List.each {
            def row = [:]
            row.id = it?.id.toString()
            row.amt = it?.amt
            row.status1 = it?.status1Desc
            row.status2 = it?.status2Desc
            row.remark = it?.remark
            row.happenDate = it?.happenDate
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
        Ms101 ms101I
        if(params.ms101.id){
            ms101I = Ms101.get(params.ms101.id)
            ms101I.version = ms101I.version +1
            ms101I.lastUpdated = new Date()
            ms101I.manLastUpdated = '系統管理員'
        }
        else {
            ms101I = new Ms101()
            ms101I.manCreated = '系統管理員'
            ms101I.ms100 = Ms100.get(params.ms101.ms100)
        }

        result.bean = ms101I
        bindData(ms101I, params["ms101"], [include:ms101I.updateBindMap])
        ms101I.validate()
        if (ms101I.hasErrors() || !ms101I.save(flush: true)) { //失敗
            def errorColumn = []
            ms101I.errors.allErrors.eachWithIndex  {item, index ->
                errorColumn[index] = [item?.arguments,item?.defaultMessage]
            }
            ms101I.discard()
            result.acrtionIsSuccess = false
            return result
        }
        result.acrtionIsSuccess = true
        result.acrtionMessage = i18nService.msg("default.updated.message", "", [""])
        return result
    }

    /**
     * 刪除資料
     * @param params
     */
    def doDelete(GrailsParameterMap params){
        LinkedHashMap result = [:]
        Ms101 ms101I = Ms101.get(params.ms101.id)

        try{
            ms101I.delete(flush: true)
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
