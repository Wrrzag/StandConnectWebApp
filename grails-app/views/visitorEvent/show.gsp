
<%@ page import="com.standconnect.domain.relationships.VisitorEvent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'visitorEvent.label', default: 'VisitorEvent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-visitorEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-visitorEvent" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list visitorEvent">
			
				<g:if test="${visitorEventInstance?.event}">
				<li class="fieldcontain">
					<span id="event-label" class="property-label"><g:message code="visitorEvent.event.label" default="Event" /></span>
					
						<span class="property-value" aria-labelledby="event-label"><g:link controller="event" action="show" id="${visitorEventInstance?.event?.id}">${visitorEventInstance?.event?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${visitorEventInstance?.visitor}">
				<li class="fieldcontain">
					<span id="visitor-label" class="property-label"><g:message code="visitorEvent.visitor.label" default="Visitor" /></span>
					
						<span class="property-value" aria-labelledby="visitor-label"><g:link controller="visitor" action="show" id="${visitorEventInstance?.visitor?.id}">${visitorEventInstance?.visitor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${visitorEventInstance?.visitorEventTag}">
				<li class="fieldcontain">
					<span id="visitorEventTag-label" class="property-label"><g:message code="visitorEvent.visitorEventTag.label" default="Visitor Event Tag" /></span>
					
						<g:each in="${visitorEventInstance.visitorEventTag}" var="v">
						<span class="property-value" aria-labelledby="visitorEventTag-label"><g:link controller="visitorEventTag" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:visitorEventInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${visitorEventInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
