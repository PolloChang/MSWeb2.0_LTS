<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap"/>
    <title>Welcome to Grails</title>
</head>
<body>
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"><g:message code="default.dashboard.lable"/> </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Profile</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab"><g:message code="page.test.content.label"/> </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <iframe title='' id='ifromDataMain' class='' style="width:100%;height: 1080px"  frameborder='0' src='${createLink(controller: 'information',action: 'index')}' ></iframe>
                </div>
            </div>
</body>
</html>
