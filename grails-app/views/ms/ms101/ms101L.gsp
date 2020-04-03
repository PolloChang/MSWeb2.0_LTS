<%--
  Created by JamesChang
  Date/檔案建立日期: 2020/4/3
  Time/檔案建立時間: 上午 08:24
  File Description/檔案描述:帳本明細清單
--%>
<!doctype html>
<html>
<head>
    <meta name="layout" content="iframePageContent"/>
</head>
<body>
<div class="row">
    <div class="col-12 border-bottom">
        <span id="activeMessage" />
    </div>
    <div class="col-12 mt-2">
        <icon:svg iconType="cube" message="${message(code: 'ms101.ms100L.header.title.label')}"/>
    </div>
    <div class="col-12 mt-2">
        <g:render template="/ms/ms100/ms100form" model="[ms100I:ms100I,readonly:readonly]"/>
    </div>

    <div class="col-12 mt-2">
        <icon:svg iconType="cube" message="${message(code: 'ms101.ms101L.header.title.label')}"/>
    </div>
    <div class="col-12 mt-2">
        <form id="search">
            <table class="table table-bordered">
                <colgroup>
                    <col width="20%">
                    <col width="30%">
                    <col width="20%">
                    <col width="30%">
                </colgroup>
                <thead/>
                <tbody>
                    <tr>
                        <th class="table-info text-right" scope="row">${g.message(code: 'ms101.status1.label')}</th>
                        <td>
                            <jc:multipleSelect name="status1" value="" from="${bs.Bs101.findAllByPtype('MS101_STATUS1')}" optionKey="pcode" optionValue="typedesc" noSelection="['':'---']" />
                        </td>
                        <th class="table-info text-right" scope="row">${g.message(code: 'ms101.status2.label')}</th>
                        <td>
                            <jc:multipleSelect name="status2" value="" from="${bs.Bs101.findAllByPtype('MS101_STATUS2')}" optionKey="pcode" optionValue="typedesc" noSelection="['':'---']" />
                        </td>
                    </tr>
                    <tr>
                        <th class="table-info text-right" scope="row">${g.message(code: 'ms101.happenDate.label')}</th>
                        <td colspan="3">
                            <jc:datepicker name="happenDate1"/>至<jc:datepicker name="happenDate2"/>
                        </td>
                    </tr>
                </tbody>
                <tfoot><tr><td colspan="4">
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <jc:bottom type="button" class="btn btn-outline-primary" onclick="searchFrom('searchTable','search','${createLink(controller: "ms101",action: 'filter')}')">${g.message(code: 'default.button.search.label')}</jc:bottom>
                        <jc:bottom type="button" class="btn btn-outline-info">${g.message(code: 'default.button.export.label')}</jc:bottom>
                        <jc:bottom type="button" class="btn btn-outline" onclick="clearFrom()">${g.message(code: 'default.button.clear.label')}</jc:bottom>
                    </div>
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <jc:bottom onclick="openMondal('modalSpanMs101','${createLink(controller: "ms101", action: "creatPage")}/${ms100I.id}');"  type="button" class="btn btn-outline-success">${g.message(code: 'default.button.create.label')}</jc:bottom>
                    </div>
                </td></tr></tfoot>
            </table>
        </form>
    </div>
    <div class="col-12 mt-2">
        <a id="AC" name="C" accesskey="C" href="#C" title="${message(code: 'system.free.center.label')}"> ::: </a>
        <jc:bootstrapTable id="searchTable" url="${g.createLink(controller: 'ms101', action: "filter")}">
            <th data-field="id" data-formatter="formatterEditButtonMs101" data-width="100"></th>
            <th data-field="amt" data-formatter="formatterNumberAmt" data-width="500">${g.message(code: 'ms101.amt.label')}</th>
            <th data-field="status1" data-formatter="">${g.message(code: 'ms101.status1.label')}</th>
            <th data-field="status2" data-formatter="">${g.message(code: 'ms101.status2.label')}</th>
            <th data-field="happenDate" data-formatter="formatterDatetime">${g.message(code: 'ms101.happenDate.label')}</th>
            <th data-field="remark" data-formatter="">${g.message(code: 'ms101.remark.label')}</th>
        </jc:bootstrapTable>
    </div>
</div>
<!-- Modal -->
<span id="modalSpanMs101" />
<script type="text/javascript">
    /**
     * 編輯按鈕
     * @param value
     * @param row
     * @param index
     * @returns {string}
     */
    function formatterEditButtonMs101(value, row, index) {
        var btnTitle ="編輯";
        var url = "${createLink(controller:'ms101',action: "editPage")}/"+row.id;
        var onclickFunction = "openMondal('modalSpanMs101','"+url+"');";
        return '<button type="button" class="btn btn-info search-edit-btn" onclick="'+onclickFunction+'"><i class="mdi mdi-edit"/> '+btnTitle+'</button>';
    }
</script>
</body>
</html>