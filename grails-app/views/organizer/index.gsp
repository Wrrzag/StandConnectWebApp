
<%@ page import="com.standconnect.domain.Organizer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'organizer.label', default: 'Organizer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-organizer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-organizer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'organizer.username.label', default: 'Username')}" />
					
<%--						<g:sortableColumn property="password" title="${message(code: 'organizer.password.label', default: 'Password')}" />--%>
					
						<g:sortableColumn property="name" title="${message(code: 'organizer.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="mail" title="${message(code: 'organizer.mail.label', default: 'Mail')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'organizer.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'organizer.city.label', default: 'City')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${organizerInstanceList}" status="i" var="organizerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${organizerInstance.id}">${fieldValue(bean: organizerInstance, field: "username")}</g:link></td>
					
<%--						<td>${fieldValue(bean: organizerInstance, field: "password")}</td>--%>
					
						<td>${fieldValue(bean: organizerInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: organizerInstance, field: "mail")}</td>
					
						<td>${fieldValue(bean: organizerInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: organizerInstance, field: "city")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${organizerInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
