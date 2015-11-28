
<%@ page import="com.standconnect.domain.Visitor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'visitor.label', default: 'Visitor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-visitor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-visitor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'visitor.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'visitor.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'visitor.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="mail" title="${message(code: 'visitor.mail.label', default: 'Mail')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'visitor.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'visitor.city.label', default: 'City')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${visitorInstanceList}" status="i" var="visitorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${visitorInstance.id}">${fieldValue(bean: visitorInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: visitorInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: visitorInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: visitorInstance, field: "mail")}</td>
					
						<td>${fieldValue(bean: visitorInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: visitorInstance, field: "city")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${visitorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
