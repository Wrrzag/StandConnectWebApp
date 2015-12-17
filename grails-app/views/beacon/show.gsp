
<%@ page import="com.standconnect.domain.Beacon" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'beacon.label', default: 'Beacon')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-beacon" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'>
				    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			    </sec:ifAnyGranted>
			</ul>
		</div>
		<div id="show-beacon" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list beacon">
			
				<g:if test="${beaconInstance?.mac}">
				<li class="fieldcontain">
					<span id="mac-label" class="property-label"><g:message code="beacon.mac.label" default="Mac" /></span>
					
						<span class="property-value" aria-labelledby="mac-label"><g:fieldValue bean="${beaconInstance}" field="mac"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beaconInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="beacon.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${beaconInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beaconInstance?.standBeaconBusiness}">
				<li class="fieldcontain">
					<span id="standBeaconBusiness-label" class="property-label"><g:message code="beacon.standBeaconBusiness.label" default="Stand Beacon Business" /></span>
					
						<g:each in="${beaconInstance.standBeaconBusiness}" var="s">
						<span class="property-value" aria-labelledby="standBeaconBusiness-label"><g:link controller="standBeaconBusiness" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'>
				<g:form url="[resource:beaconInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${beaconInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</sec:ifAnyGranted>
		</div>
	</body>
</html>
