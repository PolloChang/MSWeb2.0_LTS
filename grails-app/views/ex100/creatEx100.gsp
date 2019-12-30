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
                <th class="table-info text-right" scope="row">${g.message(code: 'ex100.numbers.lable')}</th>
                <td><jc:numberField name="numbers" readonly="true" /></td>
                <th class="table-info text-right" scope="row">${g.message(code: 'ex100.amts.lable')}</th>
                <td>
                    <jc:moneyField name="amts" />
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
