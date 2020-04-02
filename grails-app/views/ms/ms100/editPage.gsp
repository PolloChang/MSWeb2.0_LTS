<%--
  Created by JamesChang
  Date/檔案建立日期: 2020/4/2
  Time/檔案建立時間: 下午 02:22
  File Description/檔案描述:
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
            <g:render template='/public/upDataMessage' model='[instance: ms100I]'/>
        </form>
    </jc:moalBody>
    <jc:moalFooter>
        <jc:bottom type="button" class="btn btn-primary" onclick="doUpdate()">${g.message(code: 'default.button.save.label')}</jc:bottom>
        <jc:bottom type="button" class="btn btn-danger" onclick="doDelete()">${g.message(code: 'default.button.delete.label')}</jc:bottom>
    </jc:moalFooter>
</jc:modalContent>
<script type="text/javascript">
    /**
     * 更新
     */
    function doUpdate() {
        var nextPageUrl =  "${createLink(controller:'ms100',action: "editPage")}/";
        jQuery.ajax({
            url:"${createLink(controller: "ms100" ,action: "doUpdate")}",
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

    /**
     * 刪除
     */
    function doDelete() {
        jQuery.ajax({
            url:"${createLink(controller: "ms100" ,action: "doDelete")}",
            data: $('#form').serialize(),
            type: "POST",
            ataType: "JSON",
            success: function (json) {
                if(json.acrtionIsSuccess){
                    colseModalAfterDoDelete('${modalId}');
                }
            }
        });
    }
</script>