<%--
  Created by JamesChang
  Date/檔案建立日期: 2020/3/29
  Time/檔案建立時間: 下午 01:14
  File Description/檔案描述:
--%>
<%@ page import="bs.Bs101" %>
<html>
<head>
    <meta name="layout" content="iframePage"/>
</head>
<body>
    <form id="search">
        <div class="container-fluid" >
            <div class="row">
                <table class="table table-bordered">
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <thead>
                        <tr class="bg-info">
                            <th colspan="4">
                                <icon:svg iconType="search" message="${g.message(code: 'page.default.search.label')}"/>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:render template="/ms/ms100/ms100SearchForm" />
                    </tbody>
                    <tfoot><tr><td colspan="4">
                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                            <jc:bottom type="button" class="btn btn-outline-primary" onclick="searchFrom('searchTable','search','${createLink(controller: "ms100",action: 'filter')}')">${g.message(code: 'default.button.search.label')}</jc:bottom>
                            <jc:bottom type="button" class="btn btn-outline-info">${g.message(code: 'default.button.export.label')}</jc:bottom>
                            <jc:bottom type="button" class="btn btn-outline" onclick="clearFrom()">${g.message(code: 'default.button.clear.label')}</jc:bottom>
                        </div>
                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                            <jc:bottom onclick="openMondal('modalSpan','${createLink(controller: "ms100", action: "creatPage")}');"  type="button" class="btn btn-outline-success">${g.message(code: 'default.button.create.label')}</jc:bottom>
                        </div>
                    </td></tr></tfoot>
                </table>
            </div>
        </div>
    </form>
    <div class="m-2">

        <a id="AC" name="C" accesskey="C" href="#C" title="${message(code: 'system.free.center.label')}"> ::: </a>
        <jc:bootstrapTable id="searchTable" url="${g.createLink(controller: 'ms100', action: "filter")}">
            <th data-field="id" data-formatter="formatterEditButton">${g.message(code: 'ms100.accountName.label')}</th>
            <g:render template="/ms/ms100/ms100FilterL" />
        </jc:bootstrapTable>
    </div>
    <!-- Modal -->
    <span id="modalSpan" />


    <script type="text/javascript">
        /**
         * 編輯按鈕
         * @param value
         * @param row
         * @param index
         * @returns {string}
         */
        function formatterEditButton(value, row, index) {
            var btnTitle ="編輯:"+row.accountName;
            var url = "${createLink(controller:'ms100',action: "editPage")}/"+row.id;
            var onclickFunction = "openMondal('modalSpan','"+url+"');";
            return '<button type="button" class="btn btn-info search-edit-btn" onclick="'+onclickFunction+'"><i class="mdi mdi-edit"/> '+btnTitle+'</button>';
        }
    </script>
</body>
</html>