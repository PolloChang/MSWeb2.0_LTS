<%--
  Created by JamesChang
  Date/檔案建立日期: 2020/2/2
  Time/檔案建立時間: 下午 07:13
  File Description/檔案描述:程式新增的內容
--%>
<!doctype html>
<html lang="zh-TW" class="no-js">
<head>
<asset:stylesheet src="comments.css"/>
<asset:javascript src="application.js"/>
<g:layoutHead/>
</head>
<body>
    <div class="container-fluid m-2">
        <div class="row">
            <div class="col-11">

            </div>
            <div class="col-1">
                <jc:bottom type="button" class="btn btn-primary" onclick="parent.closeContent('${pageId}');">關閉頁面 <icon:svg iconType="close"/></jc:bottom>
            </div>
        </div>
        <g:layoutBody/>
    </div>
</body>
</html>