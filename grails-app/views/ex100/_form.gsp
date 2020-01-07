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
            <icon:svg iconType="add" message="${g.message(code: 'page.default.creat.label')}"/>
        </th>
    </tr>
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
            <jc:datepicker name="ex100.birthdy" value="${ex100I?.birthdy}" readonly="${readonly}"/>
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
            <jc:textField name="ex100.zip" placeholder="${g.message(code:  'ex100.zip.label')}" style="width: 90px;display: inline-block;" />
            <jc:multipleSelect name="ex100.citycode" class="addrSelect"
                               from="${bs.Bs200.getAll()}"
                               optionKey="code" optionValue="textShow" noSelection="['':'---']"
                               nextSelectId="ex100.twnspcode" nextSelectUrl="${createLink(controller: "toolBox",action: "getBs201Select")}"
            />
            <jc:multipleSelect name="ex100.twnspcode" class="addrSelect"
                               from="[[key:'',val:'---']]" optionKey="key" optionValue="val"
                               nextSelectId="ex100.vilgcode" nextSelectUrl="${createLink(controller: "toolBox",action: "getBs202Select")}"
            />
            <jc:multipleSelect name="ex100.vilgcode" class="addrSelect" from="[[key:'',val:'---']]" optionKey="key" optionValue="val"/>
            <jc:textField name="ex100.addr" placeholder="${g.message(code:  'ex100.addr.label')}" style="max-width: 400px;display: inline-block;" />
        </td>
    </tr>
    </tbody>
</table>