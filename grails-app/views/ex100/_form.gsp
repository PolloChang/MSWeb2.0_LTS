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
        <th class="table-info text-right" scope="row">${g.message(code: 'ex100.numbers.label')}</th>
        <td><jc:numberField name="ex100.numbers" value="${ex100I?.numbers}" readonly="${readonly}" /></td>
        <th class="table-info text-right" scope="row">${g.message(code: 'ex100.amts.label')}</th>
        <td>
            <jc:moneyField name="ex100.amts" value="${ex100I?.amts}" readonly="${readonly}" />
        </td>
    </tr>
    <tr>
        <th class="table-info text-right" scope="row">${g.message(code: 'ex100.string.label')}</th>
        <td>
            <jc:textField name="ex100.string" value="${ex100I?.string}" readonly="${readonly}" />
        </td>
        <th  class="table-info text-right" scope="row">${g.message(code: 'ex100.status.label')}</th>
        <td>
            <jc:multipleSelect name="ex100.status" value="${ex100I?.status}" from="${bs.Bs101.findAllByPtypeAndIssure('EX100_STATUS',2)}" optionKey="pcode" optionValue="typedesc" noSelection="['':'---']" />
        </td>
    </tr>
    <tr>
        <th class="table-info text-right" scope="row">${g.message(code: 'ex100.idno.label')}</th>
        <td>
            <jc:textField name="ex100.idno" value="${ex100I?.idno}" readonly="${readonly}" />
        </td>
        <th  class="table-info text-right" scope="row">${g.message(code: 'ex100.name.label')}</th>
        <td>
            <jc:textField name="ex100.name" value="${ex100I?.name}" readonly="${readonly}" />
        </td>
    </tr>
    <tr>
        <th class="table-info text-right" scope="row">${g.message(code: 'ex100.sex.label')}</th>
        <td>
            <jc:multipleSelect name="ex100.sex" value="${ex100I?.sex}" from="${bs.Bs101.findAllByPtype('GENDER')}" optionKey="pcode" optionValue="typedesc" noSelection="['':'---']" />
        </td>
        <th  class="table-info text-right" scope="row">${g.message(code: 'ex100.birthdy.label')}</th>
        <td>
            <jc:datepicker name="ex100.birthdy" value="${g.formatDate(date: ex100I?.birthdy,format: 'yyyy-MM-dd')}" readonly="${readonly}"/>
        </td>
    </tr>
    <tr>
        <th class="table-info text-right" scope="row">${g.message(code: 'ex100.unid.label')}</th>
        <td colspan="3">
            <jc:textField name="ex100.unid" value="${ex100I?.unid}" readonly="${readonly}" />
        </td>
    </tr>
    <tr>
        <th class="table-info text-right" scope="row">${g.message(code: 'ex100.addr.label')}</th>
        <td colspan="3">
            <jc:addressSelect
                    nameZip="ex100.zip" valueZip="${ex100I?.zip}"
                    nameCitycode="ex100.citycode" valueCitycode="${ex100I?.citycode}"
                    nameTwnspcode="ex100.twnspcode" valueTwnspcode="${ex100I?.twnspcode}"
                    nameVilgcode="ex100.vilgcode" valueVilgcode="${ex100I?.vilgcode}"
                    nameAddr="ex100.addr" valueAddr="${ex100I?.addr}"
            />
        </td>
    </tr>
    </tbody>
</table>