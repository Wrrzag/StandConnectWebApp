
<%@ page import="com.standconnect.domain.Stand" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stand.label', default: 'Stand')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-stand" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
<%--				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
			</ul>
		</div>
		<div id="show-stand" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list stand">
			
			
				<g:if test="${standInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="stand.image.label" default="Image" /></span>
					<img class="photo" src="${createLink(controller:'stand', action:'getStandImage', id:"${standInstance.id}")}" />
				</li>
				</g:if>
				
				
				<g:if test="${standInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="stand.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${standInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${standInstance?.number}">
				<li class="fieldcontain">
					<span id="number-label" class="property-label"><g:message code="stand.number.label" default="Number" /></span>
					
						<span class="property-value" aria-labelledby="number-label"><g:fieldValue bean="${standInstance}" field="number"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${standInstance?.event}">
				<li class="fieldcontain">
					<span id="event-label" class="property-label"><g:message code="stand.event.label" default="Event" /></span>
					
						<span class="property-value" aria-labelledby="event-label"><g:link controller="event" action="show" id="${standInstance?.event?.id}">${standInstance?.event?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
<%--				<g:if test="${standInstance?.standBeaconBusiness}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="standBeaconBusiness-label" class="property-label"><g:message code="stand.standBeaconBusiness.label" default="Stand Beacon Business" /></span>--%>
<%--					--%>
<%--						<g:each in="${standInstance.standBeaconBusiness}" var="s">--%>
<%--						<span class="property-value" aria-labelledby="standBeaconBusiness-label"><g:link controller="standBeaconBusiness" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>--%>
<%--						</g:each>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
			</ol>
			<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_ORGANIZER'>
                <auth:hasPermission instance="${standInstance}">
					<g:form url="[resource:standInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:link class="edit" action="edit" resource="${standInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</auth:hasPermission>
			</sec:ifAnyGranted>
		</div>
	</body>
</html>
