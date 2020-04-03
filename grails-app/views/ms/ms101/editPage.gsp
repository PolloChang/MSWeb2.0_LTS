<%--
  Created by JamesChang
  Date/檔案建立日期: 2020/4/3
  Time/檔案建立時間: 上午 11:55
  File Description/檔案描述:編輯收支資料
--%>
<jc:modalContent id="${modalId}" static="true" ariaLabelledby="exampleModalLabel"
                 modalDialogClass="modal-dialog-scrollable modal-lg"
>
    <jc:moalHeader title="${g.message(code: 'page.default.creat.label')}" ariaLabelledby="exampleModalLabel">
    </jc:moalHeader>
    <jc:moalBody>
        <span id="activeMessage-ms101" />
        <form id="form-ms101">
            <g:hiddenField name="ms101.id" value="${ms101I.id}" />
            <g:hiddenField name="ms101.version" value="${ms101I.version}" />
            <g:hiddenField name="ms101.ms100Id" value="${ms101I.ms100Id}" />
            <g:render template="/ms/ms101/form" model="[ms101I:ms101I,readonly:readonly]"/>
            <g:render template='/public/upDataMessage' model='[instance: ms101I]'/>
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
        var nextPageUrl =  "${createLink(controller:'ms101',action: "editPage")}/";
        jQuery.ajax({
            url:"${createLink(controller: "ms101" ,action: "doUpdate")}",
            data: $('#form-ms101').serialize(),
            type: "POST",
            ataType: "JSON",
            success: function (json) {
                if(json.acrtionIsSuccess){
                    forwardEditModeAfterDoSave('${modalId}','modalSpanMs101',nextPageUrl+json.forWardId);
                }
                else{
                    doSaveFaild('activeMessage-ms101',json.acrtionMessage);
                }
            },
            beforeSend:function(){
                doSaveBeforSend('activeMessage-ms101');
            }
        });
    }

    /**
     * 刪除
     */
    function doDelete() {
        jQuery.ajax({
            url:"${createLink(controller: "ms101" ,action: "doDelete")}",
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