package toolBox

import grails.converters.JSON

class ToolBoxController {

    def toolBoxService

    def index() { }

    /**
     * 取得鄉鎮市行政區清單
     */
    def getBs201Select = {
        String whereBs200Code = params?.whereItem
        def result = toolBoxService.getBs2xxSelect("Bs201",whereBs200Code)
        def exportData = []
        exportData << [text:'---',value:'']
        result.dataBean.each{
            exportData << [text:it?.textShow,value:it?.code]
        }
        result.exportData = exportData
        render result as JSON
    }

    /**
     * 取得里別區清單
     */
    def getBs202Select = {
        String whereBs201Code = params?.whereItem
        def result = toolBoxService.getBs2xxSelect("Bs202",whereBs201Code)
        def exportData = []
        exportData << [text:'---',value:'']
        result.dataBean.each{
            exportData << [text:it?.textShow,value:it?.code]
        }
        result.exportData = exportData
        render result as JSON
    }
}
