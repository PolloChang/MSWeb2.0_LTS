package webBaseFunction

import java.util.regex.Pattern
import java.util.regex.Matcher

/**
 * 工具箱
 */
class toolBox {


    /**
     * 民國三碼舞碼日期轉換
     * @param input
     * @param startOrEnd
     * @return Date
     */
    public Date dateStringToDate(String input,String startOrEnd){
        input = input.replace(" ","")
        String dateStr = ""

        int yyyy = input.substring(0,3) as int
        String mm = input.substring(3,5)
        String dd = ""
        if(startOrEnd=="start"){
            dd = "01"
        }
        else if(startOrEnd=="end"){
            if(mm=="02"){
                if(
                yyyy%4>0  //公元年分除以4不可整除，為平年。
                        || (yyyy%100==0 && yyyy%400==0) //公元年分除以100可整除但除以400不可整除，為平年。
                ){
                    dd = "28"
                }
                else if(
                (yyyy%4==0 && yyyy%100>0) //公元年分除以4可整除但除以100不可整除，為閏年。
                        || yyyy%400==0  //公元年分除以400可整除，為閏年。
                ){
                    dd = "29"
                }
            }
            else if(mm in ["01","03","05","07","08","10","12"]){dd = "31"}
            else if(mm in ["04","06","09","11"]){dd = "30"}
        }
        if(input.length()==5){
            dateStr = "${yyyy + 1911}/${mm}/${dd}"
        }
        else if(input.length()==7){
            dateStr = "${yyyy + 1911}/${mm}/${input.substring(6,7)}"
        }
        return new Date(dateStr)
    }
}
