<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
    <li class="nav-item" onclick="changeIframeMain('${createLink(controller:c.logicalPropertyName)}')">
        <a class=""nav-link>
            <icon:svg iconType="fileWhite" message="未開發程式:${c.fullName}/${c.logicalPropertyName}" />
        </a>
        %{--<g:link class="nav-link" controller="${c.logicalPropertyName}"></g:link>--}%
    </li>
</g:each>