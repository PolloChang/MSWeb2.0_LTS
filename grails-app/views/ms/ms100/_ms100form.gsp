<%@ page import="bs.Bs101" %>
<%--
  Created by JamesChang
  Date/檔案建立日期: 2020/4/2
  Time/檔案建立時間: 上午 07:10
  File Description/檔案描述: 帳本資料
--%>
<table class="table table-bordered">
    <colgroup>
        <col width="20%">
        <col width="30%">
        <col width="20%">
        <col width="30%">
    </colgroup>
    <thead>
    </thead>
    <tbody>
    <tr>
        <th class="table-info text-right" scope="row">${g.message(code: 'ms100.status.label')}</th>
        <td>
            <jc:multipleSelect name="ms100.status" value="${ms100I?.status}" from="${bs.Bs101.findAllByPtype('MS100_STATUS')}" optionKey="pcode" optionValue="typedesc" noSelection="['':'---']" />
        </td>
        <th class="table-info text-right" scope="row">${g.message(code: 'ms100.ownerName.label')}</th>
        <td>
            <jc:textField name="ms100.ownerName" value="${ms100I?.ownerName}" readonly="${readonly}" />
        </td>
    </tr>
    <tr>
        <th class="table-info text-right" scope="row">${g.message(code: 'ms100.accountName.label')}</th>
        <td>
            <jc:textField name="ms100.accountName" value="${ms100I?.accountName}" readonly="${readonly}" />
        </td>
        <th class="table-info text-right" scope="row">${g.message(code: 'ms100.accountNo.label')}</th>
        <td>
            <jc:textField name="ms100.accountNo" value="${ms100I?.accountNo}" readonly="${readonly}" />
        </td>
    </tr>
    <tr>
        <th class="table-info text-right" scope="row">${g.message(code: 'ms100.bankNo.label')}</th>
        <td colspan="3">
            <jc:numberField name="ms100.bankNo" value="${ms100I?.bankNo}" readonly="${readonly}" />
        </td>
    </tr>
    </tbody>
</table>