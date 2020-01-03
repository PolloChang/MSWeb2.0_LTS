<jc:modalContent id="${modalId}" static="true" ariaLabelledby="exampleModalLabel"
                 modalDialogClass="modal-dialog-scrollable modal-xl"
>
    <jc:moalHeader title="新增資料" ariaLabelledby="exampleModalLabel">
    </jc:moalHeader>
    <jc:moalBody>
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
                <td></td>
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
                    <select class="selectpicker">
                        <option>Mustard</option>
                        <option>Ketchup</option>
                        <option>Relish</option>
                    </select>
                </td>
                <th  class="table-info text-right" scope="row">${g.message(code: 'ex100.birthdy.label')}</th>
                <td>
                    <jc:textField name="ex100.birthdy" value="${ex100I?.birthdy}" readonly="${readonly}" />
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
                    <jc:textField name="ex100.zip" value="${ex100I?.zip}" />
                    <jc:multipleSelect name="ex100.citycode" value="${ex100I?.citycode}" class="addrChang" from="${bs.Bs200.getAll()}" optionKey="code" optionValue="textShow" noSelection="['':'---']" selectDataSize="5" dataLiveSearch="true" />
                    <span id="twnspcodeOption">
                        <jc:multipleSelect name="ex100.twnspcode" value="${ex100I?.twnspcode}" class="addrChang" from="[[key:'',val:'---']]" optionKey="key" optionValue="val"/>
                    </span>
                    <span id="vilgcodeOption">
                        <jc:multipleSelect name="ex100.vilgcode" value="${ex100I?.vilgcode}" class="addrChang" from="[[key:'',val:'---']]" optionKey="key" optionValue="val"/>
                    </span>
                </td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="4">

                </td>
            </tr>
            </tfoot>
        </table>
    </jc:moalBody>
    <jc:moalFooter>
        <jc:botton type="button" class="btn btn-primary">${g.message(code: 'default.button.save.label')}</jc:botton>
    </jc:moalFooter>
</jc:modalContent>
