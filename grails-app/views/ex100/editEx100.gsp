<script>
    $('select').multipleSelect({});
</script>
<style>
select {
    width: 50%;
}
.addrSelect {
    width: 100px;
}
</style>

<jc:modalContent id="${modalId}" static="true" ariaLabelledby="exampleModalLabel"
                 modalDialogClass="modal-dialog-scrollable modal-xl"
>
    <jc:moalHeader title="新增資料" ariaLabelledby="exampleModalLabel">
    </jc:moalHeader>
    <jc:moalBody>
        <form id="form">
            <g:hiddenField name="ex100.id" value="${ex100I.id}" />
            <g:hiddenField name="ex100.version" value="${ex100I.version}" />
            <g:render template="form" model="[ex100I:ex100I,readonly:readonly]"/>
        </form>
    </jc:moalBody>
    <jc:moalFooter>
        <jc:botton type="button" class="btn btn-primary" onclick="doUpdate()">${g.message(code: 'default.button.save.label')}</jc:botton>
        <jc:botton type="button" class="btn btn-danger" onclick="doDelete()">${g.message(code: 'default.button.delete.label')}</jc:botton>
    </jc:moalFooter>
</jc:modalContent>
<script type="text/javascript">
    /**
     * 更新
     */
    function doUpdate() {
        jQuery.ajax({
            url:"${createLink(controller: "ex100" ,action: "doUpdate")}",
            data: $('#form').serialize(),
            type: "POST",
            ataType: "JSON",
            success: function (json) {

            }
        });
    }

    /**
     * 刪除
     */
    function doDelete() {
        jQuery.ajax({
            url:"${createLink(controller: "ex100" ,action: "doDelete")}",
            data: $('#form').serialize(),
            type: "POST",
            ataType: "JSON",
            success: function (json) {

            }
        });
    }
</script>
