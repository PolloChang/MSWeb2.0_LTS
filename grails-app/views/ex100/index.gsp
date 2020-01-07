<%@ page import="bs.Bs101" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="iframePage"/>
</head>
<body>

<g:form id="search">
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
                        <jc:multipleSelect name="sex" from="${bs.Bs101.findAllByPtype('GENDER')}" optionKey="pcode" optionValue="typedesc" noSelection="['':'---']" />
                    </td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.birthdy.label')}</th>
                    <td>
                        <jc:datepicker name="ex100.birthdy1"/>至<jc:datepicker name="ex100.birthdy2"/>
                    </td>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.unid.label')}</th>
                    <td><jc:numberField name="unid" /></td>
                </tr>
                <tr>
                    <th class="table-info text-right" scope="row">${g.message(code: 'ex100.addr.label')}</th>
                    <td colspan="3">
                        <div class="form-row align-items-center">
                            <div class="col-1"><jc:textField name="zip" placeholder="${g.message(code:  'ex100.zip.label')}" /></div>
                            <div class="col-auto">
                            <jc:multipleSelect name="citycode" class=""
                                               from="${bs.Bs200.getAll()}"
                                               optionKey="code" optionValue="textShow" noSelection="['':'---']"
                                               nextSelectId="twnspcode" nextSelectUrl="${createLink(controller: "toolBox",action: "getBs201Select")}"
                            />
                            </div>
                            <div class="col-auto">
                            <jc:multipleSelect name="twnspcode" class="addrChang"
                                               from="[[key:'',val:'---']]" optionKey="key" optionValue="val"
                                               nextSelectId="vilgcode" nextSelectUrl="${createLink(controller: "toolBox",action: "getBs202Select")}"
                            />
                            </div>
                            <div class="col-auto">
                            <jc:multipleSelect name="vilgcode" class="addrChang" from="[[key:'',val:'---']]" optionKey="key" optionValue="val"/>
                            </div>
                            <div class="col-8">
                                <jc:textField name="addr" placeholder="${g.message(code:  'ex100.addr.label')}" />
                            </div>
                        </div>
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
<a id="AC" name="C" accesskey="C" href="#C" title="中間區域"> ::: </a>

    <!-- Modal -->
    <span id="modalSpan" />
    </div>
</div>
<script type="text/javascript">
</script>
<asset:javascript src="projectJS/ex/ex.js"/>
</body>
</html>