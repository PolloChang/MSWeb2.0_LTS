package bs

import grails.gorm.transactions.Transactional
import grails.web.databinding.DataBinder
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class BsService implements DataBinder {
    def i18nService,toolBoxService

    def appListFilter(GrailsParameterMap params) {
        LinkedHashMap result = [:]

        //查詢條件集
        def searchData = [:]
        def showRows = []

        //相等
        searchData.equalList = ['status','status','actionType']
        //相似
        searchData.likeList = ['appName','appCname','parentApp']

        def bsAppList = BsAppList.createCriteria().list(params) {
            //必要條件
            'in'("issure", ['1'.toLong(),'2'.toLong()])

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

            order('parentApp','desc')
            order('idx','desc')
        }

        bsAppList.each {
            def row = [:]
            row.id = it?.id.toString()
            row.appName = it?.appName
            row.parentApp = it?.parentApp
            row.appCname = it?.appCname
            row.status = it?.statusDesc
            row.showOnMenu = it?.showOnMenuDesc
            row.controller = it?.controller
            row.action = it?.action

            showRows << row
        }
        result.rows = showRows
        return result
    }

     /**
          * 儲存資料
          * @param params
          * @return
          */
     def appListDoSave(GrailsParameterMap params){
         LinkedHashMap result = [:]
         BsAppList bsAppListI
         if(params.bsAppList.id){
             bsAppListI = BsAppList.get(params.bsAppList.id)
             bsAppListI.version = bsAppListI.version +1
             bsAppListI.lastUpdated = new Date()
             bsAppListI.manLastUpdated = '系統管理員'
         }
         else {
             bsAppListI = new BsAppList()
         }

         result.bean = bsAppListI
         bindData(bsAppListI, params["bsAppList"], [include: bsAppListI.updateBindMap])
         bsAppListI.manCreated = 'FWJDBA'
         bsAppListI.validate()
         if (bsAppListI.hasErrors() || !bsAppListI.save(flush: true)) { //失敗
             def errorColumn = []
             bsAppListI.errors.allErrors.eachWithIndex  {item, index ->
                 errorColumn[index] = [item?.arguments,item?.defaultMessage]
             }
             bsAppListI.discard()
             result.acrtionIsSuccess = false
             return result
         }
         result.acrtionIsSuccess = true
         result.acrtionMessage = i18nService.msg("default.updated.message", "", [""])
         return result
     }
}
