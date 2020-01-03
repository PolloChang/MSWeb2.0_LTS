package webBaseFunction.bootstrap

import grails.gsp.TagLib
import groovy.transform.CompileStatic
import groovy.util.logging.Slf4j
import groovy.xml.MarkupBuilder
import org.springframework.web.servlet.support.RequestDataValueProcessor
import org.grails.encoder.CodecLookup
import org.grails.core.artefact.DomainClassArtefactHandler
import org.grails.encoder.Encoder
import org.grails.buffer.GrailsPrintWriter
import org.springframework.beans.factory.InitializingBean
import org.springframework.context.ApplicationContext
import org.springframework.context.ApplicationContextAware
import org.springframework.context.MessageSourceResolvable
import org.springframework.core.convert.ConversionService
import org.springframework.web.servlet.support.RequestContextUtils
import org.springframework.web.servlet.support.RequestDataValueProcessor

@TagLib
@Slf4j
class FormsTagLib {

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
    Closure botton = { attrs, body ->
        StringWriter output = new StringWriter()
        MarkupBuilder builder = new MarkupBuilder(output)
        builder.button(attrs) {
            mkp.yieldUnescaped(body())
        }
        out << output.toString()
    }

    /**
     * 文字
     */
    Closure textField = { attrs ->
        attrs.type = "text"
        out << inpitField(attrs)
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
        boolean readonly = attrs.remove('readonly')?:false

        returnVal = "<input id='${id}' value='${value}' name='${name}' placeholder='${placeholder}' class='form-control ${classes}' ${readonly?"readonly":""}/>"

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
        def value = attrs.remove('value')

        def messageSource = grailsAttributes.getApplicationContext().getBean("messageSource")
        def locale = RequestContextUtils.getLocale(request)
        def writer = out
        def selectClass = attrs.remove('class')
        def from = attrs.remove('from')
        boolean selectDisabled = attrs.remove('selectDisabled')?:false
        String onclick = attrs.remove("onchange")
        String onchange = attrs.remove("onchange")
        String nextSelectId = attrs.remove("nextSelectId")
        String nextSelectUrl = attrs.remove("nextSelectUrl")

        def optionKey = attrs.remove('optionKey')
        def optionDisabled = attrs.remove('optionDisabled')
        def optionValue = attrs.remove('optionValue')

        boolean multiple = attrs.remove('multiple')
        String placeholder = attrs.remove('placeholder')
        if (value instanceof CharSequence) {
            value = value.toString()
        }
        def valueMessagePrefix = attrs.remove('valueMessagePrefix')
        def noSelection = attrs.remove('noSelection')
        if (noSelection != null) {
            noSelection = noSelection.entrySet().iterator().next()
        }
        booleanToAttribute(attrs, 'disabled')
        booleanToAttribute(attrs, 'readonly')

        writer << "<select "

        writer << "id='${id}' "
        writer << "name='${name}' "

        writer << "class=' "
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
            writer << """onchange='ajaxChangSelectOption(\$("#${id}").multipleSelect("getSelects"),"${nextSelectId}","${nextSelectUrl}");'"""
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

        // create options from list
        from.eachWithIndex {el, i ->
            def keyDisabled
            def keyValue
            writer << '<option '
            if (optionKey) {
                def keyValueObject
                if (optionKey instanceof Closure) {
                    keyValue = optionKey(el)
                }
                else if (el != null && optionKey == 'id' && grailsApplication.getArtefact(DomainClassArtefactHandler.TYPE, el.getClass().name)) {
                    keyValue = el.ident()
                    keyValueObject = el
                }
                else {
                    keyValue = el[optionKey]
                    keyValueObject = el
                }
                if(optionDisabled) {
                    if (optionDisabled instanceof Closure) {
                        keyDisabled = optionDisabled(el)
                    }
                    else {
                        keyDisabled = el[optionDisabled]
                    }
                }
                writeValueAndCheckIfSelected(attrs.name, keyValue, value, writer, keyValueObject,keyDisabled)
            }
            else {
                keyValue = el
                writeValueAndCheckIfSelected(attrs.name, keyValue, value, writer)
            }
            writer << '>'
            if (optionValue) {
                if (optionValue instanceof Closure) {
                    writer << optionValue(el).toString().encodeAsHTML()
                }
                else {
                    writer << el[optionValue].toString().encodeAsHTML()
                }
            }
            else if (el instanceof MessageSourceResolvable) {
                writer << messageSource.getMessage(el, locale)
            }
            else if (valueMessagePrefix) {
                def message = messageSource.getMessage("${valueMessagePrefix}.${keyValue}", null, null, locale)
                if (message != null) {
                    writer << message.encodeAsHTML()
                }
                else if (keyValue && keys) {
                    def s = el.toString()
                    if (s) writer << s.encodeAsHTML()
                }
                else if (keyValue) {
                    writer << keyValue.encodeAsHTML()
                }
                else {
                    def s = el.toString()
                    if (s) writer << s.encodeAsHTML()
                }
            }
            else {
                def s = el.toString()
                if (s) writer << s.encodeAsHTML()
            }
            writer << '</option>'
            writer.println()
        }
        // close tag
        writer << '</select>'
    }


    void afterPropertiesSet() {
        if (applicationContext.containsBean('requestDataValueProcessor')) {
            requestDataValueProcessor = applicationContext.getBean('requestDataValueProcessor', RequestDataValueProcessor)
        }
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


    def renderNoSelectionOptionImpl(out, noSelectionKey, noSelectionValue, value) {
        // If a label for the '--Please choose--' first item is supplied, write it out
        out << "<option value=\"${(noSelectionKey == null ? '' : noSelectionKey)}\"${noSelectionKey == value ? ' selected="selected"' : ''}>${noSelectionValue.encodeAsHTML()}</option>"
    }

    private void writeValueAndCheckIfSelected(selectName, keyValue, value, writer) {
        writeValueAndCheckIfSelected(selectName, keyValue, value, writer, null)
    }
    private void writeValueAndCheckIfSelected(selectName, keyValue, value, writer, el) {
        writeValueAndCheckIfSelected(selectName, keyValue, value, writer, el, null)
    }

    private void writeValueAndCheckIfSelected(selectName, keyValue, value, writer, el, keyDisabled) {

        boolean selected = false
        def keyClass = keyValue?.getClass()
        if (keyClass.isInstance(value)) {
            selected = (keyValue == value)
        }
        else if (value instanceof Collection) {
            // first try keyValue
            selected = value.contains(keyValue)
            if (!selected && el != null) {
                selected = value.contains(el)
            }
        }
        // GRAILS-3596: Make use of Groovy truth to handle GString <-> String
        // and other equivalent types (such as numbers, Integer <-> Long etc.).
        else if (keyValue == value) {
            selected = true
        }
        else if (keyClass && value != null) {
            try {
                value = conversionService.convert(value, keyClass)
                selected = keyValue == value
            }
            catch (e) {
                // ignore
            }
        }
        keyValue = processFormFieldValueIfNecessary(selectName, "${keyValue}","option")
        writer << "value=\"${keyValue}\" "
        if (selected) {
            writer << 'selected="selected" '
        }
        if(keyDisabled && !selected) {
            writer << 'disabled="disabled" '
        }
    }

    private processFormFieldValueIfNecessary(name, value, type) {
        if (requestDataValueProcessor != null) {
            value = requestDataValueProcessor.processFormFieldValue(request, name, "${value}", type)
        }
        return value
    }

}
