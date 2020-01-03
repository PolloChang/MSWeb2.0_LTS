// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery.min.js
//= require popper.min.js
//= require bootstrap.js
//= require bootstrap.bundle.js
//= require multiple-select/multiple-select.min.js
//= require multiple-select/multiple-select-locale-all.min.js
//= encoding UTF-8

/**
 * 切換iframe
 */
function changeIframeMain(srcValue){
    $("#ifromDataMain").attr("src",srcValue);
    $('#myTab li:last-child a').tab('show');
}

/**
 *
 * @param optionId:替換Id
 * @param url
 * @param thisVal
 */
function ajaxChangSelectOption(thisVal,optionId,url){
    jQuery.ajax({
        url: url,
        data:{whereItem:thisVal.toString()},
        type: "POST",
        ataType: "JSON",
        success: function (json) {
            for(var i=0;i < json.exportData.length; i++){
                var optionTag = document.createElement("option");
                optionTag.value = json.exportData[i].value;
                optionTag.text = json.exportData[i].text;
                $('#'+optionId).append(optionTag).multipleSelect('refresh');
            }
        },
        beforeSend:function(){
            $('#'+optionId+' option').remove();
        }
    });
}

/**
 * 開啟
 */
function openMondal(mondalId,url){
    var openMondalId = mondalId+'-'+_uuid();
    jQuery.ajax({
        url: url,
        data:{'modalId':openMondalId},
        type: "POST",
        ataType: "html",
        success: function (html) {
            jQuery('#'+mondalId).html(html);
            jQuery('#'+openMondalId).modal('show');
        }
    });
}

/**
 * 時間戳記
 * @returns {string}
 * @private
 */
function _uuid() {
    var d = Date.now();
    if (typeof performance !== 'undefined' && typeof performance.now === 'function'){
        d += performance.now(); //use high-precision timer if available
    }
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = (d + Math.random() * 16) % 16 | 0;
        d = Math.floor(d / 16);
        return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
    });
}


/**
 * 一進入頁面執行
 */
$(function() {
    $('select').multipleSelect({});
});