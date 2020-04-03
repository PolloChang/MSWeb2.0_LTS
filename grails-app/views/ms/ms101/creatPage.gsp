<%--
  Created by JamesChang
  Date/檔案建立日期: 2020/4/3
  Time/檔案建立時間: 上午 09:05
  File Description/檔案描述:建立收支資料
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
            <g:hiddenField name="ms101.ms100" value="${ms101I.ms100Id}" />
            <g:render template="/ms/ms101/form" model="[ms101I:ms101I,readonly:readonly]"/>
        </form>
    </jc:moalBody>
    <jc:moalFooter>
        <jc:bottom type="button" class="btn btn-primary" onclick="doInsert()">${g.message(code: 'default.button.save.label')}</jc:bottom>
        <jc:bottom type="button" class="btn btn-primary" onclick="doInsertAfterSaveMs101()">${g.message(code: 'default.button.doInsertAfterSave.label')}</jc:bottom>
    </jc:moalFooter>
</jc:modalContent>
<script type="text/javascript">


    /**
     * 儲存
     */
    function doInsert() {
        var nextPageUrl =  "${createLink(controller:'ms101',action: "editPage")}/";
        jQuery.ajax({
            url:"${createLink(controller: "ms101" ,action: "doInsert")}",
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
            },
            error:function () {
                Swal.fire('錯誤','請洽系統管理員','error');
            }
        });
    }


    /**
     * 儲存後再新增
     */
    function doInsertAfterSaveMs101() {
        var nextPageUrl =  "${createLink(controller:'ms101',action: "creatPage")}/${ms101I.ms100Id}";
        jQuery.ajax({
            url:"${createLink(controller: "ms101" ,action: "doInsert")}",
            data: $('#form-ms101').serialize(),
            type: "POST",
            ataType: "JSON",
            success: function (json) {
                if(json.acrtionIsSuccess){
                    forwardEditModeAfterDoSave('${modalId}','modalSpanMs101',nextPageUrl);
                }
                else{
                    doSaveFaild('activeMessage-ms101',json.acrtionMessage);
                }
            },
            beforeSend:function(){
                doSaveBeforSend('activeMessage-ms101');
            },
            error:function () {
                Swal.fire('錯誤','請洽系統管理員','error');
            }
        });
    }
</script>
