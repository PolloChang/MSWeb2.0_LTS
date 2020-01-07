package ex

import grails.gorm.transactions.Transactional
import grails.web.databinding.DataBinder
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class Ex100Service implements DataBinder {

    def i18nService

    /**
     * 共同儲存欄位
     */
    ArrayList updateBindEx100Map = ['numbers', 'amts','string','status','idno','name','sex','birthdy','unid',
                                    'zip','citycode','twnspcode','vilgcode','addr']

    def filter(GrailsParameterMap params){
        LinkedHashMap result = [:]

        return result
    }

    /**
     * 儲存資料
     * @param params
     * @return
     */
    def doSave(GrailsParameterMap params) {
        LinkedHashMap result = [:]
        Ex100 ex100I = new Ex100()
        result.bean = ex100I
        bindData(ex100I, params["ex100"], [include: updateBindEx100Map])
        ex100I.manCreated = 'FWJDBA'
        ex100I.validate()
        if (ex100I.hasErrors() || !ex100I.save(flush: true)) { //失敗
            result.failed = i18nService.msg("default.updated.failure", "", [""])
            return result
        }
        result.success = i18nService.msg("default.updated.message", "", [""])
        return result
    }
}
