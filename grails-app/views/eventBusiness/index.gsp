
<%@ page import="com.standconnect.domain.relationships.EventBusiness" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'eventBusiness.label', default: 'EventBusiness')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-eventBusiness" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-eventBusiness" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="eventBusiness.business.label" default="Business" /></th>
					
						<th><g:message code="eventBusiness.event.label" default="Event" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventBusinessInstanceList}" status="i" var="eventBusinessInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventBusinessInstance.id}">${fieldValue(bean: eventBusinessInstance, field: "business")}</g:link></td>
					
						<td>${fieldValue(bean: eventBusinessInstance, field: "event")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${eventBusinessInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
