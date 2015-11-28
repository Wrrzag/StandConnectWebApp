
<%@ page import="com.standconnect.domain.BusinessUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'businessUser.label', default: 'BusinessUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-businessUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-businessUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'businessUser.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'businessUser.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'businessUser.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="mail" title="${message(code: 'businessUser.mail.label', default: 'Mail')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'businessUser.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'businessUser.city.label', default: 'City')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${businessUserInstanceList}" status="i" var="businessUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${businessUserInstance.id}">${fieldValue(bean: businessUserInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: businessUserInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: businessUserInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: businessUserInstance, field: "mail")}</td>
					
						<td>${fieldValue(bean: businessUserInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: businessUserInstance, field: "city")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${businessUserInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
