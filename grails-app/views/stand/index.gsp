
<%@ page import="com.standconnect.domain.Stand" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stand.label', default: 'Stand')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-stand" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
<%--				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
			</ul>
		</div>
		<div id="list-stand" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="stand.event.label" default="Event" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'stand.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="number" title="${message(code: 'stand.number.label', default: 'Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${standInstanceList}" status="i" var="standInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${standInstance.id}">${fieldValue(bean: standInstance, field: "event")}</g:link></td>
					
						<td>${fieldValue(bean: standInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: standInstance, field: "number")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${standInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
