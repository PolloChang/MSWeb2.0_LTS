<%--
  Created by JamesChang
  Date/檔案建立日期: 2020/4/2
  Time/檔案建立時間: 上午 07:04
  File Description/檔案描述: 新增帳本資料
--%>
<jc:modalContent id="${modalId}" static="true" ariaLabelledby="exampleModalLabel"
                 modalDialogClass="modal-dialog-scrollable modal-lg"
>
    <jc:moalHeader title="${g.message(code: 'page.default.creat.label')}" ariaLabelledby="exampleModalLabel">
    </jc:moalHeader>
    <jc:moalBody>
        <span id="activeMessage" />
        <form id="form">
            <g:hiddenField name="ms100.id" value="${ms100I.id}" />
            <g:hiddenField name="ms100.version" value="${ms100I.version}" />
            <g:render template="/ms/ms100/ms100form" model="[ms100I:ms100I,readonly:readonly]"/>
        </form>
    </jc:moalBody>
    <jc:moalFooter>
        <jc:bottom type="button" class="btn btn-primary" onclick="doInsert()">${g.message(code: 'default.button.save.label')}</jc:bottom>
    </jc:moalFooter>
</jc:modalContent>
<script type="text/javascript">

    /**
     * 儲存
     */
    function doInsert() {
        var nextPageUrl =  "${createLink(controller:'ms100',action: "editPage")}/";
        jQuery.ajax({
            url:"${createLink(controller: "ms100" ,action: "doInsert")}",
            data: $('#form').serialize(),
            type: "POST",
            ataType: "JSON",
            success: function (json) {
                if(json.acrtionIsSuccess){
                    forwardEditModeAfterDoSave('${modalId}','modalSpan',nextPageUrl+json.forWardId);
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