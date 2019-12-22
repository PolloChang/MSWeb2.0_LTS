package webBaseFunction.bootstrap

class ModalTagLib {
    static defaultEncodeAs = [taglib:'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    def i18nService

    static namespace = "jc"

    /**
     * modalContent
     */
    Closure modalContent = { attrs,body ->
        if (!attrs.id) {
            throwTagError("Tag [modalContent] is missing required attribute [id]")
        }
        def ariaLabelledby = attrs.remove("ariaLabelledby")
        String id = attrs.remove("id")
        boolean staticType = attrs.remove("static")?:false

        out << "<div class='modal fade' id='${id}' ${staticType?"data-backdrop='static'":""} tabindex='-1' role='dialog' ${ariaLabelledby?"aria-labelledby='"+ariaLabelledby+"'":""} aria-hidden='true'>"
        out <<  "<div class='modal-dialog' role='document'>"
        out <<  "<div class='modal-content'>"
        out << body()
        out <<  "</div>"
        out <<  "</div>"
        out <<  "</div>"
    }

    /**
     * moalHeader
     */
    Closure moalHeader = { attrs,body ->
        def ariaLabelledId = attrs.remove("ariaLabelledby")
        String title = attrs.remove("title")?:""
        out <<  "<div class='modal-header'>"
        if(title){
            out <<  "<h5 class='modal-title' ${ariaLabelledId?"id='"+ariaLabelledId+"'":""}>${title}</h5>"
        }
        out << body()
        out <<  "</div>"
    }

    /**
     * moalBody
     */
    Closure moalBody = { attrs,body ->
        out <<  "<div class='modal-body'>"
        out << body()
        out <<  "</div>"
    }

    /**
     * moalFooter
     */
    Closure moalFooter = { attrs,body ->
        out <<  "<div class='modal-footer'>"
        out << body()
        out << "<button type='button' class='btn btn-secondary' data-dismiss='modal'>${i18nService.msg("default.button.close.label","關閉")}</button>"
        out <<  "</div>"
    }

}
