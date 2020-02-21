package webBaseFunction.bootstrap

class BootstrapTableTagLib {
    static defaultEncodeAs = [taglib:'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "jc"

    Closure bootstrapTable = {attrs, body ->
        if (!attrs.id) {
            throwTagError("Tag [bootstrapTable] is missing required attribute [id]")
        }
        if (!attrs."url") {
            throwTagError("Tag [bootstrapTable] is missing required attribute [url]")
        }

        def id = attrs.remove('id')
        String dataPageSize = attrs.remove('dataPageSize')?:'10'
        boolean dataClickToSelect = attrs.remove('dataClickToSelect')?:false
        String url = attrs.remove('url')

        out << "<table "
        out << " id='${id}'"
        out << " data-page-size='${dataPageSize}'"

        out << """
                data-pagination-h-align="left"
                data-pagination-detail-h-align="right"
                data-toggle="table"
                data-pagination="true"
                data-search="true"
                data-search-on-enter-key="true"
                data-show-search-button="true"
                data-show-columns="true"
                data-show-footer="true"
                data-show-pagination-switch="true"
                data-show-toggle="true"
                data-show-fullscreen="true"
                """
        out << " data-click-to-select='${dataClickToSelect}'"
        out << " data-url='${url}' "

        out << ">"
        out << '<thead class="thead-light"><tr>'
        if(dataClickToSelect){
            out << '<th data-field="state" data-checkbox="true"></th>'
        }
        out << '<th data-formatter="formatterDataSerialNumber" data-align="center" data-width="30"  data-footer-formatter="footerFormatterTotal">#</th>'
        out << body()
        out << '</tr></thead>'
        out << "</table>"
    }

}
