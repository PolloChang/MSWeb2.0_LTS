package toolBox

import bs.*
import grails.gorm.transactions.Transactional

@Transactional
class ToolBoxService {

    /**
     *getBs2xxSelect 取得行政區資料
     * @param bsType
     * @param whereCode
     * @return result[Map]
     */
    def getBs2xxSelect(String bsType,String whereCode) {
        LinkedHashMap result = [:]
        switch (bsType){
            case "Bs200":
                result.dataBean = Bs200.findAllByIssure(2,[sort:'code',order:'asc'])
                break
            case "Bs201":
                if(!whereCode){
                    throw new Exception("function [serviceMethod] is missing [whereCode] can't null if bsType equal Bs201 ")
                }
                result.dataBean = Bs201.findAllByIssureAndBs200Code(2,whereCode,[sort:'code',order:'asc'])
                break
            case "Bs202":
                if(!whereCode){
                    throw new Exception("function [serviceMethod] is missing [whereCode] can't null if bsType equal Bs202 ")
                }
                result.dataBean = Bs202.findAllByIssureAndBs201Code(2,whereCode,[sort:'code',order:'asc'])
                break
            case "Bs203":
                if(!whereCode){
                    throw new Exception("function [serviceMethod] is missing [whereCode] can't null if bsType equal Bs202 ")
                }
                result.dataBean = Bs203.findAllByIssureAndBs201Code(2,whereCode,[sort:'code',order:'asc'])
                break
            default:
                throw new Exception("function [serviceMethod] 未定義此項目")
        }
        return result
    }
}
