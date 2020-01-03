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
                        <icon:svg iconType="search" message="${g.message(code: 'page.default.search.label')}"/>
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.numbers.label')}</th>
                    <td><jc:numberField name="numbers" readonly="true" /></td>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.amts.label')}</th>
                    <td>
                        <jc:moneyField name="amts" />
                    </td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.string.label')}</th>
                    <td><jc:textField name="string"/></td>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.texts.label')}</th>
                    <td><jc:textField name="texts"/></td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.idno.label')}</th>
                    <td colspan="3"><jc:textField name="idno"/></td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.name.label')}</th>
                    <td><jc:textField name="name"/></td>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.sex.label')}</th>
                    <td>
                        <jc:multipleSelect name="example" from="${bs.Bs101.findAllByPtype('GENDER')}" optionKey="pcode" optionValue="typedesc" noSelection="['':'---']" />
                        <select id="object"></select>
                    </td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.birthdy.label')}</th>
                    <td>Mark</td>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.unid.label')}</th>
                    <td><jc:numberField name="unid" /></td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.addr.label')}</th>
                    <td colspan="3">
                        <jc:textField name="zip" />
                        <jc:multipleSelect name="citycode" class=""
                                       from="${bs.Bs200.getAll()}"
                                       optionKey="code" optionValue="textShow" noSelection="['':'---']"
                                       nextSelectId="twnspcode" nextSelectUrl="${createLink(controller: "toolBox",action: "getBs201Select")}"
                        />
                        <jc:multipleSelect name="twnspcode" class="addrChang"
                                       from="[[key:'',val:'---']]" optionKey="key" optionValue="val"
                                       nextSelectId="vilgcode" nextSelectUrl="${createLink(controller: "toolBox",action: "getBs202Select")}"
                        />
                        <jc:multipleSelect name="vilgcode" class="addrChang" from="[[key:'',val:'---']]" optionKey="key" optionValue="val"/>
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
                        <jc:botton onclick="openMondal('modalSpan','${createLink(controller: "ex100", action: "creatEx100")}');" type="button" class="btn btn-success">${g.message(code: 'default.button.create.label')}</jc:botton>
                    </div>
                </td></tr></tfoot>
            </table>
        </div>
        <div class="row">
        </div>
    </div>
</g:form>

    <!-- Modal -->
    <span id="modalSpan" />
    </div>
</div>
<script type="text/javascript">
</script>
<asset:javascript src="projectJS/ex/ex.js"/>
</body>
</html>