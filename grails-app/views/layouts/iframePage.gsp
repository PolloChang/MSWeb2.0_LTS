%{--iframe專有--}%
<!doctype html>
<html lang="zh-TW" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    %{--<asset:stylesheet src="bootstrap.css"/>--}%
    %{--https://fezvrasta.github.io/bootstrap-material-design/--}%
    <asset:stylesheet src="bootstrap-material-design/bootstrap-material-design.css"/>
    <asset:stylesheet src="bootstrap-grid.css"/>
    <asset:stylesheet src="bootstrap-reboot.css"/>
    <asset:stylesheet src="multiple-select/multiple-select.min.css"/>
    <asset:stylesheet src="jquery-ui/jquery-ui.min.css"/>
    <asset:stylesheet src="jquery-ui/jquery-ui.structure.min.css"/>
    <asset:stylesheet src="jquery-ui/jquery-ui.theme.min.css"/>
    <asset:stylesheet src="bootstrap-table/bootstrap-table.min.css"/>
    <asset:stylesheet src="comments.css"/>
    <g:layoutHead/>

    %{--<asset:javascript src="jquery.min.js"/>--}%
    %{--<asset:javascript src="popper.min.js"/>--}%
    %{--<asset:javascript src="bootstrap.js"/>--}%
    %{--<asset:javascript src="bootstrap.bundle.js"/>--}%
    %{--<asset:javascript src="multiple-select/multiple-select.min.js"/>--}%
    %{--<asset:javascript src="multiple-select/multiple-select-locale-all.min.js"/>--}%
    %{--<asset:javascript src="jquery-ui/jquery-ui.min.js"/>--}%
    %{--<asset:javascript src="bootstrap-table/bootstrap-table.min.js"/>--}%
    %{--<asset:javascript src="bootstrap-table/bootstrap-table-locale-all.min.js"/>--}%
    <asset:javascript src="application.js"/>
</head>

<body>
<a id="AU" name="U" accesskey="U" href="#U" title="上方區域">:::</a>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item active" aria-current="page">${g.message(code: "page.${controllerName}.${actionName}.label")}[${controllerName}/${actionName}]</li>
    </ol>
</nav>
<g:layoutBody/>
</body>
</html>
