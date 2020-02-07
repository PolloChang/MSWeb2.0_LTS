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
    <div class="col-12 border-bottom">
        <span id="activeMessage" />
    </div>
    <div class="col-12 mt-2">
        <form id="form">
            <g:hiddenField name="ex100.id" value="${ex100I.id}" />
            <g:hiddenField name="ex100.version" value="${ex100I.version}" />
            <g:render template="/ex100/form" model="[ex100I:ex100I,readonly:readonly]"/>
            <div class="border-top">
                <jc:bottom type="button" class="btn btn-outline-primary" onclick="doInsert()">${g.message(code: 'default.button.save.label')} <icon:svg iconType="save" /></jc:bottom>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">

    /**
     * 儲存
     */
    function doInsert() {
        var nextPageUrl =  "${createLink(controller:'ex200',action: "editPage")}/";
        jQuery.ajax({
            url:"${createLink(controller: "ex200" ,action: "doInsert")}",
            data: $('#form').serialize(),
            type: "POST",
            ataType: "JSON",
            success: function (json) {
                if(json.acrtionIsSuccess){
                    parent.forwardEditPageAfterDoSave('${pageId}',json.forWardId,nextPageUrl+json.forWardId);
                }
                else{
                    doSaveFaild('activeMessage',json.acrtionMessage);
                }
            },
            beforeSend:function(){
                doSaveBeforSend('activeMessage');
            }
        });
    }
</script>
</body>
</html>