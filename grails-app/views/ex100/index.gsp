<%@ page import="bs.Bs101" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="iframePage"/>
</head>
<body>
<g:form id="search">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">${g.message(code: "page.${controllerName}.${actionName}.lable",default:'未設定properties')}-${controllerName}/${actionName}</li>
        </ol>
    </nav>
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
                        <icon:svg iconType="search" message="查詢條件"/>
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
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.string.lable')}</th>
                    <td><jc:textField name="string"/></td>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.texts.lable')}</th>
                    <td><jc:textField name="texts"/></td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.idno.lable')}</th>
                    <td colspan="3"><jc:textField name="idno"/></td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.name.lable')}</th>
                    <td><jc:textField name="name"/></td>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.sex.lable')}</th>
                    <td>
                        <jc:multipleSelect name="example" from="${bs.Bs101.findAllByPtype('GENDER')}" optionKey="pcode" optionValue="typedesc" noSelection="['':'---']" />
                    </td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.birthdy.lable')}</th>
                    <td>Mark</td>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.unid.lable')}</th>
                    <td><jc:numberField name="unid" /></td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.addr.lable')}</th>
                    <td colspan="3">
                        <jc:textField name="zip" />
                        <jc:multipleSelect name="citycode" from="${bs.Bs200.getAll()}" optionKey="code" optionValue="textShow" noSelection="['':'---']" selectDataSize="5" dataLiveSearch="true" />
                        <span id="twnspcodeOption">
                            <jc:multipleSelect name="twnspcode" from="[[key:'',val:'---']]" optionKey="key" optionValue="val"/>
                        </span>
                        <span id="vilgcodeOption">
                            <jc:multipleSelect name="vilgcode" from="[[key:'',val:'---']]" optionKey="key" optionValue="val"/>
                        </span>
                        <asset:script>
                            $("#cities")
                            .html('<option>city1</option><option>city2</option>')
                            .selectpicker('refresh');
                        </asset:script>
                    </td>
                </tr>

                </tbody>
                <tfoot><tr><td colspan="4">
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <jc:botton type="button" class="btn btn-primary">${g.message(code: 'default.button.search.label')}</jc:botton>
                        <jc:botton type="button" class="btn btn-info">${g.message(code: 'default.button.export.label')}</jc:botton>
                        <jc:botton type="button" class="btn btn-outline">${g.message(code: 'default.button.clear.label')}</jc:botton>
                    </div>
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">${g.message(code: 'default.button.create.label')}</button>
                    </div>
                </td></tr></tfoot>
            </table>
        </div>
        <div class="row">

        </div>
    </div>
</g:form>

<!-- Modal -->
<jc:modalContent id="exampleModal" static="true" ariaLabelledby="exampleModalLabel">
    <jc:moalHeader title="Modal title" ariaLabelledby="exampleModalLabel">
    </jc:moalHeader>
    <jc:moalBody>
        ${g.message(code: "ex.largString.lable")}
    </jc:moalBody>
    <jc:moalFooter></jc:moalFooter>
</jc:modalContent>
    </div>
</div>
</body>
</html>