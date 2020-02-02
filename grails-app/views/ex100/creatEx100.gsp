<jc:modalContent id="${modalId}" static="true" ariaLabelledby="exampleModalLabel"
                 modalDialogClass="modal-dialog-scrollable modal-lg"
>
    <jc:moalHeader title="新增資料" ariaLabelledby="exampleModalLabel">
    </jc:moalHeader>
    <jc:moalBody>
        <span id="activeMessage" />
        <form id="form">
        <g:hiddenField name="ex100.id" value="${ex100I.id}" />
        <g:hiddenField name="ex100.version" value="${ex100I.version}" />
        <g:render template="form" model="[ex100I:ex100I,readonly:readonly]"/>
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
        var nextPageUrl =  "${createLink(controller:'ex100',action: "editPage")}/";
        jQuery.ajax({
            url:"${createLink(controller: "ex100" ,action: "doInsert")}",
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
