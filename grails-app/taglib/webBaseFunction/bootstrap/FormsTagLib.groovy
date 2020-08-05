package webBaseFunction.bootstrap

import grails.gsp.TagLib
import groovy.transform.CompileStatic
import groovy.util.logging.Slf4j
import groovy.xml.MarkupBuilder
import org.grails.encoder.CodecLookup
import org.grails.encoder.Encoder
import org.grails.buffer.GrailsPrintWriter
import org.springframework.context.ApplicationContext
import org.springframework.core.convert.ConversionService
import org.springframework.web.servlet.support.RequestDataValueProcessor

@TagLib
@Slf4j
class FormsTagLib {

    def i18nService

    static defaultEncodeAs = [taglib:'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    static namespace = "jc"
    ApplicationContext applicationContext
    CodecLookup codecLookup
    RequestDataValueProcessor requestDataValueProcessor
    ConversionService conversionService

    /**
     * 直接產生紐物件
     */
    Closure bottom = { attrs, body ->
        StringWriter output = new StringWriter()
        MarkupBuilder builder = new MarkupBuilder(output)
        builder.button(attrs) {
            mkp.yieldUnescaped(body())
        }
        out << output.toString()
    }

    /**
     * 日期選擇器
     */
    Closure datepicker = { attrs, body ->
        if (!attrs.name) {
            throwTagError("Tag [select] is missing required attribute [name]")
        }

        def uuid = UUID.randomUUID().toString()
        def id = attrs.remove('id')?:uuid
        def name = attrs.remove('name')
        String value = attrs.remove('value')?:""
        String Class = attrs.remove('class')?:""
        boolean readonly = attrs.remove('readonly')?:false
        def formattedDate
        if(value){
            def date = new Date().parse("yyyy-MM-dd HH:mm:ss.f", value)
            formattedDate = date.format("yyyy-MM-dd")
        }
        else{
            formattedDate = ""
        }


        out << "<input id='${id}' name='${name}' value='${formattedDate}' class='form-control ${Class}' ${readonly?"readonly":""} style='width: 120px;display: inline-block;'>"
        out << """
                <script type="text/javascript">
                    jQuery( function() {
                        jQuery( "#${id}" ).datepicker({
                            showButtonPanel: true,
                            changeYear: true,
                            changeMonth: true,
                            dateFormat:'yy-mm-dd',
                            showWeek: true,
                            firstDay: 1
                        });
                    } );
                </script>
            """
    }

    /**
     * 文字
     */
    Closure textField = { attrs ->
        attrs.type = "text"
        out << inpitField(attrs)
    }

    /**
     * textarea
     */
    Closure textarea  = { attrs ->

        String name = attrs.remove("name")?:""
        String id = attrs.remove("id")?:name

        String cssClass = attrs.remove("cssClass")?:""
        String value = attrs.remove("value")?:""
        boolean readonly = attrs.remove("readonly")?:false


        out << "<textarea id='${id}' name='${name}'  class='form-control ${cssClass}' id=\"exampleFormControlTextarea1\" rows=\"3\" ${readonly}>${value}</textarea>"
    }

    /**
     * 數值
     */
    Closure numberField = { attrs ->
        attrs.type = "number"
        out << inpitField(attrs)
    }

    /**
     * 金額
     */
    Closure moneyField = { attrs ->
        attrs.type = "number"
        out << "<div class='input-group'><div class='input-group-prepend'><span class='input-group-text'>\$</span></div>"
        out << inpitField(attrs)
        out << "<div class='input-group-append'><span class='input-group-text'>.00</span></div></div>"
    }

    /**
     * email
     */
    Closure emailField = { attrs ->
        attrs.type = "email"
        out << inpitField(attrs)
    }

    /**
     * 產生input
     * @param attrs
     * @return
     */
    private inpitField(attrs){
        String returnVal = ""

        if (!attrs.type) {
            throwTagError("Tag [inpitField] is missing required attribute [type]")
        }
        if (!attrs.name) {
            throwTagError("Tag [inpitField] is missing required attribute [name]")
        }
        String classes = attrs.remove('class')?:""
        String name = attrs.remove('name')?:""
        String id = attrs.remove('id')?:name
        String value = attrs.remove('value')?:""
        String placeholder = attrs.remove('placeholder')?:""
        String style = attrs.remove('style')?:""
        String type = attrs.type?:"text"
        def size = attrs.remove('size')
        boolean readonly = attrs.remove('readonly')?:false
        boolean reset = attrs.remove('reset')?:false

        returnVal = "<input id='${id}' name='${name}' value='${value}'  type='${type}' placeholder='${placeholder}' class='form-control ${reset?"reset":""} ${classes}' ${size?" size='"+size+"'":""} style='${style}' ${readonly?"readonly":""}/>"

        return returnVal
    }


    /**
     * bootstrap-select
     */
    Closure multipleSelect = { attrs ->
        if (!attrs.name) {
            throwTagError("Tag [select] is missing required attribute [name]")
        }
        if (!attrs.containsKey('from')) {
            throwTagError("Tag [select] is missing required attribute [from]")
        }

        String id = attrs.remove('id')?:attrs.name
        String name = attrs.remove('name')
        String value = attrs.remove('value').toString()

        def writer = out
        def selectClass = attrs.remove('class')
        ArrayList from = attrs.remove('from')
        boolean selectDisabled = attrs.remove('selectDisabled')?:false
        String onclick = attrs.remove("onchange")
        String onchange = attrs.remove("onchange")
        String nextSelectId = attrs.remove("nextSelectId")
        String nextSelectUrl = attrs.remove("nextSelectUrl")

        String optionKey = attrs.remove('optionKey')
        String optionValue = attrs.remove('optionValue')

        boolean multiple = attrs.remove('multiple')
        String placeholder = attrs.remove('placeholder')

        def noSelection = attrs.remove('noSelection')
        if (noSelection != null) {
            noSelection = noSelection.entrySet().iterator().next()
        }
        booleanToAttribute(attrs, 'disabled')
        booleanToAttribute(attrs, 'readonly')

        writer << "<select "

        writer << "id='${id}' "
        writer << "name='${name}' "

        writer << "class=' form-control w-auto d-inline "
        if(selectClass){
            writer << selectClass
        }
        writer << " '"

        outputAttributes(attrs, writer, true)
        if(multiple){
            writer << "multiple"
        }

        if(selectDisabled){
            writer << " disabled "
        }

        if(onclick){
            writer << " onclick='${onclick}' "
        }

        if(onchange){
            writer << " onchange='${onchange}' "
        }

        /**
             * 下階層選單
             */
        if(nextSelectUrl && nextSelectId){
            writer << """onchange='ajaxChangSelectOption(this.value,"${nextSelectId}","${nextSelectUrl}");'"""
        }

        if(placeholder){
            writer << " placeholder='${placeholder}' "
        }

        writer << '>'
        writer.println()

        if (noSelection) {
            renderNoSelectionOptionImpl(writer, noSelection.key, noSelection.value, value)
            writer.println()
        }

        writer << optionList(from,value,optionKey,optionValue)
        // close tag
        writer << '</select>'
    }

    /**
     * 地址連動選單
     */
    Closure addressSelect = { attrs ->
        if(!attrs.nameZip && !attrs.nameCitycode && !attrs.nameTwnspcode && !attrs.nameVilgcode && !attrs.nameAddr){
            throwTagError("Tag [addressSelect] is missing required one attribute [nameZip,nameCitycode,nameTwnspcode,nameVilgcode,nameAddr]")
        }
        String nameZip = attrs.remove("nameZip")
        String nameCitycode = attrs.remove("nameCitycode")
        String nameTwnspcode = attrs.remove("nameTwnspcode")
        String nameVilgcode = attrs.remove("nameVilgcode")
        String nameAddr = attrs.remove("nameAddr")
        String idZip = attrs.remove("idZip")?:nameZip
        String idCitycode = attrs.remove("idCitycode")?:nameCitycode
        String idTwnspcode = attrs.remove("idTwnspcode")?:nameTwnspcode
        String idVilgcode = attrs.remove("idVilgcode")?:nameVilgcode
        String idAddr = attrs.remove("idAddr")?:nameAddr
        def valueZip = attrs.remove("valueZip")?:''
        def valueCitycode = attrs.remove("valueCitycode")?:''
        def valueTwnspcode = attrs.remove("valueTwnspcode")?:''
        def valueVilgcode = attrs.remove("valueVilgcode")?:''
        def valueAddr = attrs.remove("valueAddr")?:''
        out << '<div class="form-row">'
        if(nameZip){
            def nameZipAttrs = [:]
            nameZipAttrs.type = "text"
            nameZipAttrs.id = idZip
            nameZipAttrs.name = nameZip
            nameZipAttrs.value = valueZip
            nameZipAttrs.placeholder = i18nService.message(code: 'ex100.zip.label')
            out << '<div class="col-2">'
            out << inpitField(nameZipAttrs)
            out << "</div>"
        }

        if(nameCitycode){
            out << '<div class="col-auto">'
            out << "<select id='${idCitycode}' name='${nameCitycode}' class='form-control w-auto d-inline' "
            if(nameTwnspcode){
                out << """onchange='ajaxChangSelectOption(this.value,"${nameTwnspcode}","${createLink(controller: "toolBox",action: "getBs201Select")}");'"""
            }
            out << ' >'
            renderNoSelectionOptionImpl(out, '', '---', valueCitycode)
            out.println()
            out << optionList(bs.Bs200.getAll(),valueCitycode.toString(),"code","textShow")
            out << '</select>'
            out << "</div>"
        }

        if(nameTwnspcode){
            out << '<div class="col-auto">'
            out << "<select id='${idTwnspcode}' name='${nameTwnspcode}' class='form-control w-auto d-inline' "
            if(nameVilgcode){
                out << """onchange='ajaxChangSelectOption(this.value,"${nameVilgcode}","${createLink(controller: "toolBox",action: "getBs202Select")}");'"""
            }
            out << ' >'
            renderNoSelectionOptionImpl(out, '', '---', valueTwnspcode)
            out.println()
            out << optionList(bs.Bs201.findAllByIssureAndBs200Code(2,valueCitycode.toString()),valueTwnspcode.toString(),"code","textShow")
            out << '</select>'
            out << "</div>"
        }

        if(nameVilgcode){
            out << '<div class="col-auto">'
            out << "<select id='${idVilgcode}' name='${nameVilgcode}' class='form-control w-auto d-inline' "
            out << ' >'
            renderNoSelectionOptionImpl(out, '', '---', valueVilgcode)
            out.println()
            out << optionList(bs.Bs202.findAllByIssureAndBs201Code(2,valueTwnspcode.toString()),valueVilgcode.toString(),"code","textShow")
            out << '</select>'
            out << "</div>"
        }

        if(nameAddr){
            attrs.type = "text"
            attrs.id = idAddr
            attrs.name = nameAddr
            attrs.value = valueAddr
            attrs.class = "w-100 d-inline"
            attrs.placeholder = i18nService.message(code: 'ex100.addr.label')
            out << '<div class="col-5">'
            out << inpitField(attrs)
            out << "</div>"
        }
        out << "</div>"
    }

    /**
     *
     * @param from
     * @param value
     * @param optionKey
     * @param optionValue
     * @return option清單
     */
    private String optionList(ArrayList from,String value,String optionKey,String optionValue){
        StringBuffer returnValue = new StringBuffer()

        // create options from list
        from.eachWithIndex {el, i ->
            def keyValue = el[optionKey]
            def text = el[optionValue]
            boolean selected
            returnValue.append('<option ')
            returnValue.append(" value='${keyValue}'' ")

            selected = value.equals(keyValue.toString())

            if(selected){
                returnValue.append("selected")
            }
            returnValue.append(' >')
            if(!keyValue.equals('')){
                returnValue.append("${i+1}.${text}")
            }
            else{
                returnValue.append("${text}")
            }

            returnValue.append('</option>')
        }

        return returnValue.toString()
    }


    @CompileStatic
    private void outputNameAsIdIfIdDoesNotExist(Map attrs, GrailsPrintWriter out) {
        if (!attrs.containsKey('id') && attrs.containsKey('name')) {
            Encoder htmlEncoder = codecLookup?.lookupEncoder('HTML')
            out << 'id="'
            out << (htmlEncoder != null ? htmlEncoder.encode(attrs.name) : attrs.name)
            out << '" '
        }
    }
    /**
     * Some attributes can be defined as Boolean values, but the html specification
     * mandates the attribute must have the same value as its name. For example,
     * disabled, readonly and checked.
     */
    @CompileStatic
    private void booleanToAttribute(Map attrs, String attrName) {
        def attrValue = attrs.remove(attrName)
        if (attrValue instanceof CharSequence) {
            attrValue = attrValue.toString().trim()
        }
        // If the value is the same as the name or if it is a boolean value,
        // reintroduce the attribute to the map according to the w3c rules, so it is output later
        if ((attrValue instanceof Boolean && attrValue) ||
                (attrValue instanceof String && (((String)attrValue).equalsIgnoreCase("true") || ((String)attrValue).equalsIgnoreCase(attrName)))) {
            attrs.put(attrName, attrName)
        } else if (attrValue instanceof String && !((String)attrValue).equalsIgnoreCase("false")) {
            // If the value is not the string 'false', then we should just pass it on to
            // keep compatibility with existing code
            attrs.put(attrName, attrValue)
        }
    }

    /**
     * Dump out attributes in HTML compliant fashion.
     */
    @CompileStatic
    private void outputAttributes(Map attrs, GrailsPrintWriter writer, boolean useNameAsIdIfIdDoesNotExist = false) {
        attrs.remove('tagName') // Just in case one is left
        Encoder htmlEncoder = codecLookup?.lookupEncoder('HTML')
        attrs.each { k, v ->
            if (v != null) {
                writer << k
                writer << '="'
                writer << (htmlEncoder != null ? htmlEncoder.encode(v) : v)
                writer << '" '
            }
        }
        if (useNameAsIdIfIdDoesNotExist) {
            outputNameAsIdIfIdDoesNotExist(attrs, writer)
        }
    }

    /**
     * 未選擇選項
     * @param out
     * @param noSelectionKey
     * @param noSelectionValue
     * @param value
     * @return
     */
    def renderNoSelectionOptionImpl(out, noSelectionKey, noSelectionValue, value) {
        // If a label for the '--Please choose--' first item is supplied, write it out
        out << "<option value=\"${(noSelectionKey == null ? '' : noSelectionKey)}\"${noSelectionKey == value ? ' selected="selected"' : ''}>${noSelectionValue.encodeAsHTML()}</option>"
    }

}
