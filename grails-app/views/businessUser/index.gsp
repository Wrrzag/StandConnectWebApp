
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
<%--		<div class="nav" role="navigation">--%>
<%--			<ul>--%>
<%--				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
<%--				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
<%--			</ul>--%>
<%--		</div>--%>
		<div id="list-businessUser" class="content scaffold-list col-lg-12" role="main">
			<div class="row title-row">
				<div class="col-lg-10"><h1 class="big-title"><g:message code="default.list.label" args="[entityName]" /></h1></div>
				<div class="col-lg-2">
					<sec:ifAnyGranted roles='ROLE_ADMIN'>
						<g:link class="create" action="create">
							<div class="btn btn-primary top-btn" role="navigation">
								<span class="glyphicon glyphicon-plus-sign"></span>&nbsp;<g:message code="default.new.label" args="[entityName]" />
					        </div>
					    </g:link>
			        </sec:ifAnyGranted>
				</div>
			</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'businessUser.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'businessUser.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="mail" title="${message(code: 'businessUser.mail.label', default: 'Mail')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'businessUser.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'businessUser.city.label', default: 'City')}" />
						
						<sec:ifAnyGranted roles='ROLE_ADMIN'><th></th></sec:ifAnyGranted>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${businessUserInstanceList}" status="i" var="businessUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${businessUserInstance.id}">${fieldValue(bean: businessUserInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: businessUserInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: businessUserInstance, field: "mail")}</td>
					
						<td>${fieldValue(bean: businessUserInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: businessUserInstance, field: "city")}</td>
						
						<sec:ifAnyGranted roles='ROLE_ADMIN'>
							<td class="options">
							  <div class="btn-group">
								  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								  	<span class="glyphicon glyphicon-cog"></span>&nbsp;<g:message code="default.options.label" default="_Options"></g:message>
								  	<span class="caret"></span>
								    <span class="sr-only">Toggle Dropdown</span>
								  </button>
								  <ul class="dropdown-menu">
								 	<li>
								         <g:link class="show" action="show" resource="${businessUserInstance}"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;&nbsp;<g:message code="default.button.show.label" default="_Show" /></g:link>
								    </li>
								    <li>
								         <g:link class="edit" action="edit" resource="${businessUserInstance}"><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;&nbsp;<g:message code="default.button.edit.label" default="_Edit" /></g:link>
								    </li>
								    <li onclick="deleteForm${businessUserInstance.id}.click();" class="deleteli">
								    	<a><span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;&nbsp;<g:message code="default.button.delete.label" default="_Delete" /></a>
								    	<g:form url="[resource:businessUserInstance, action:'delete']" method="DELETE">
											<g:actionSubmit hidden id="deleteForm${businessUserInstance.id}" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
										</g:form>
	                                </li>
								  </ul>
							  </div>
							</td>
						</sec:ifAnyGranted>
					
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
