<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow" role="navigation">
    <span class="navbar-brand col-sm-3 col-md-4 col-lg-3 col-xl-3 mr-0">
        <asset:image class="" src="grails.svg" alt="Logo"/>
        <span class=""> <g:message code="page.index.ststem.title" /></span>
    </span>
    <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="#">Sign out</a>
        </li>
    </ul>
</nav>
<div class="">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class='nav flex-column'>
                    <li class='nav-item'">
                        <a class='nav-link' href='#'>
                            <icon:svg iconType="dashboard" message="${message(code: 'default.dashboard.lable')}" />
                        </a>
                    </li>
                    <g:render template="public/navList" />
                </ul>
            </div>
        </nav>
        <main role="main" class="col-md-10 ml-sm-auto col-lg-10 px-4">
            <g:layoutBody/>
        </main>
</div>

<asset:javascript src="application.js"/>
</body>
</html>
