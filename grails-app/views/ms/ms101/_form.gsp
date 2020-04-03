<%--
  Created by JamesChang
  Date/檔案建立日期: 2020/4/3
  Time/檔案建立時間: 上午 11:23
  File Description/檔案描述:帳戶收支明細表單
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
        <th class="table-info text-right" scope="row">${g.message(code: 'ms101.status1.label')}</th>
        <td>
            <jc:multipleSelect name="ms101.status1" value="${ms101I?.status1}" from="${bs.Bs101.findAllByPtype('MS101_STATUS1')}" optionKey="pcode" optionValue="typedesc" noSelection="['':'---']" />
        </td>
        <th class="table-info text-right" scope="row">${g.message(code: 'ms101.status2.label')}</th>
        <td>
            <jc:multipleSelect name="ms101.status2" value="${ms101I?.status2}" from="${bs.Bs101.findAllByPtype('MS101_STATUS2')}" optionKey="pcode" optionValue="typedesc" noSelection="['':'---']" />
        </td>
    </tr>
    <tr>
        <th class="table-info text-right" scope="row">${g.message(code: 'ms101.happenDate.label')}</th>
        <td>
            <jc:datepicker name="ms101.happenDate" value="${ms101I?.happenDate}" readonly="${readonly}" />
        </td>
        <th class="table-info text-right" scope="row">${g.message(code: 'ms101.amt.label')}</th>
        <td>
            <jc:numberField name="ms101.amt" value="${ms101I?.amt}" readonly="${readonly}" />
        </td>
    </tr>
    <tr>
        <th class="table-info text-right" scope="row">${g.message(code: 'ms101.remark.label')}</th>
        <td colspan="3">
            <jc:textarea name="ms101.remark" value="${ms101I?.remark}" readonly="${readonly}" />
        </td>
    </tr>
    </tbody>
</table>