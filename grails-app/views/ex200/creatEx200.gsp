<%--
  Created by JamesChang
  Date/檔案建立日期: 2020/2/2
  Time/檔案建立時間: 下午 12:14
  File Description/檔案描述:
--%>
<!doctype html>
<html>
<head>
    <meta name="layout" content="iframePageContent"/>
</head>
<body>
<div class="row">
    <div class="col-11">
        <icon:svg iconType="cube" message="新增資料"/>
    </div>
    <div class="col-1">
        <jc:bottom type="button" class="btn btn-primary" onclick="parent.closeContent('${pageId}');">關閉頁面 <icon:svg iconType="close"/></jc:bottom>
    </div>
</div>
<div class="row">
    <div class="col-12">
        <span id="activeMessage" />
        <form id="form">
            <g:hiddenField name="ex100.id" value="${ex100I.id}" />
            <g:hiddenField name="ex100.version" value="${ex100I.version}" />
            <g:render template="/ex100/form" model="[ex100I:ex100I,readonly:readonly]"/>
        </form>
    </div>
</div>
</body>
</html>