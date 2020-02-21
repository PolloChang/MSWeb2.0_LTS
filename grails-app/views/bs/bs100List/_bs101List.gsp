<%--
  Created by JamesChang
  Date/檔案建立日期: 2020/2/8
  Time/檔案建立時間: 上午 07:52
  File Description/檔案描述:
--%>
<form id="search-form">
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
        <tr>
            <th class="table-info text-right" scope="row">${g.message(code: 'bs100.systype.label')}</th>
            <td><jc:textField name="systype" /></td>
            <th class="table-info text-right" scope="row">${g.message(code: 'bs100.ptype.label')}</th>
            <td>
                <jc:textField name="ptype" />
            </td>
        </tr>
        <tr>
            <th class="table-info text-right" scope="row">${g.message(code: 'bs100.typedesc.label')}</th>
            <td colspan="3"><jc:textField name="typedesc"/></td>
        </tr>

        </tbody>
        <tfoot><tr><td colspan="4">
            <div class="btn-group btn-group-toggle" data-toggle="buttons">
                <jc:bottom type="button" class="btn btn-outline-primary" onclick="searchFrom('searchTable','search','${createLink(action: 'filterBs101')}')">${g.message(code: 'default.button.search.label')}</jc:bottom>
                <jc:bottom type="button" class="btn btn-outline-info">${g.message(code: 'default.button.export.label')}</jc:bottom>
                <jc:bottom type="button" class="btn btn-outline" onclick="clearFrom()">${g.message(code: 'default.button.clear.label')}</jc:bottom>
            </div>
            <div class="btn-group btn-group-toggle" data-toggle="buttons">
                <jc:bottom onclick="openMondal('bs101ModalSpan','${createLink(controller: "bs100", action: "creatPageBs101",params: [ptype:bs100I.ptype])}');"  type="button" class="btn btn-outline-success">${g.message(code: 'default.button.create.label')}</jc:bottom>
            </div>
        </td></tr></tfoot>
    </table>
    <!-- Modal -->
    <span id="bs101ModalSpan" />
</form>