<%--
  Created by JamesChang
  Date/檔案建立日期: 2020/4/3
  Time/檔案建立時間: 上午 08:13
  File Description/檔案描述:查詢Ms100的查詢欄位
--%>
<tr>
    <th class="table-info text-right" scope="row">${g.message(code: 'ms100.status.label')}</th>
    <td>
        <jc:multipleSelect name="status" from="${bs.Bs101.findAllByPtype('MS100_STATUS')}" optionKey="pcode" optionValue="typedesc" noSelection="['':'---']" />
    </td>
    <th class="table-info text-right" scope="row">${g.message(code: 'ms100.ownerName.label')}</th>
    <td>
        <jc:textField name="ownerName" />
    </td>
</tr>
<tr>
    <th class="table-info text-right" scope="row">${g.message(code: 'ms100.accountNo.label')}</th>
    <td>
        <jc:textField name="accountNo" />
    </td>
    <th class="table-info text-right" scope="row">${g.message(code: 'ms100.accountName.label')}</th>
    <td>
        <jc:textField name="accountName" />
    </td>
</tr>