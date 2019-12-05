<%--
  動態階層選單
  Created by IntelliJ IDEA.
  User: JamesChang
  Date: 2019/4/7
  Time: 上午 09:49
--%>
<g:each in="${bs.BsAppList.findAllByStatusAndShowOnMenuAndActionType("5",true,"isDropdown")}" var="row" status="i">
    <g:set var="childAppL" value="${bs.BsAppList.findAllByStatusAndShowOnMenuAndParentApp("5",true,row.appName)}" />
    <g:set var="childAppSize" value="${childAppL.size()}" />
    <g:if test="${childAppSize>0}">
        <div class="card">
            <div class="card-header" id="heading_${i}">
                <h2 class="mb-0">
                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse_${i}" aria-expanded="true" aria-controls="collapse_${i}">
                        <icon:svg iconType="folder" message="${row.appCname}" />
                    </button>
                </h2>
            </div>
            <div id="collapse_${i}" class="collapse" aria-labelledby="heading_${i}">
                <div class="card-body">
                    <ul class='nav flex-column'>
                        <g:if test="${(row.controller) && (row.action)}">
                            <li class="nav-item" onclick="changeIframeMain('${createLink(controller:row.controller,action: row.action)}')">
                                <a class='nav-link' href='#'>
                                    <icon:svg iconType="fileWhite" message="${row.appCname}" />
                                </a>
                            </li>
                        </g:if>
                        <g:each in="${childAppL}" var="rowL">
                            <li class="nav-item" onclick="changeIframeMain('${createLink(controller:rowL.controller,action: rowL.action)}')">
                                <a class='nav-link' href='#'>
                                    <icon:svg iconType="fileWhite" message="${rowL.appCname}" />
                                </a>
                            </li>
                        </g:each>
                    </ul>
                </div>
            </div>
        </div>
    </g:if>
    <g:else>
        <ul class='nav flex-column'>
            <li class="nav-item" onclick="changeIframeMain('${createLink(controller:row.controller,action: row.action)}')">
                <a class='nav-link' href='#'>
                    <icon:svg iconType="fileWhite" message="${row.appCname}" />
                </a>
            </li>
        </ul>
    </g:else>


</g:each>
%{--<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">--}%
    %{--<li class="nav-item" onclick="changeIframeMain('${createLink(controller:c.logicalPropertyName)}')">--}%
        %{--<a class=""nav-link>--}%
            %{--<icon:svg iconType="fileWhite" message="未開發程式:${c.fullName}/${c.logicalPropertyName}" />--}%
        %{--</a>--}%
        %{--<g:link class="nav-link" controller="${c.logicalPropertyName}"></g:link>--}%
    %{--</li>--}%
%{--</g:each>--}%
%{--只有一層
<ul class='nav flex-column'>
    <li class='nav-item'>
        <a class='nav-link' href='#'>
            <icon:svg iconType="dashboard" message="${message(code: 'default.dashboard.lable')}" />
        </a>
    </li>
</ul>
--}%
%{--多層
<div class="card">
    <div class="card-header" id="headingOne">
        <h2 class="mb-0">
            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                Collapsible Group Item #1
            </button>
        </h2>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
        <div class="card-body">
            <ul class='nav flex-column'>
                <li class='nav-item'>
                    <a class='nav-link' href='#'>
                        <icon:svg iconType="dashboard" message="${message(code: 'default.dashboard.lable')}" />
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
--}%