
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
<%--		<div class="nav" role="navigation">--%>
<%--			<ul>--%>
<%--				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
<%--				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
<%--			</ul>--%>
<%--		</div>--%>
		<div id="list-stand" class="content scaffold-list col-lg-12" role="main">
			<div class="row title-row">
				<div class="col-lg-10"><h1 class="big-title"><g:message code="default.list.label" args="[entityName]" /></h1></div>
			</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered striped">
			<thead>
					<tr>
					
						<th><g:message code="stand.image.label" default="_Image" /></th>
						
						<th><g:message code="stand.event.label" default="Event" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'stand.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="number" title="${message(code: 'stand.number.label', default: 'Number')}" />
						
						<th><g:message code="stand.business.label" default="_Business" /></th>
					
						<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'><th></th></sec:ifAnyGranted>
					</tr>
				</thead>
				<tbody>
				<g:each in="${standInstanceList}" status="i" var="standInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>
							<g:if test="${standInstance.image}">
								<img style="width:50px" class="photo" src="${createLink(controller:'stand', action:'getStandImage', id:"${standInstance.id}")}" />
							</g:if>
						</td>
						
						<td><g:link action="show" id="${standInstance.id}">${fieldValue(bean: standInstance, field: "event")}</g:link></td>
					
						<td>${fieldValue(bean: standInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: standInstance, field: "number")}</td>
						
						<td><g:each in="${standInstance.standBeaconBusiness}" var="s"><g:link controller="business" action="show" id="${s?.business?.id}">${s?.business}</g:link></g:each></td>
					
						<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'>
							<td class="options">
							  <div class="btn-group">
								  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								  	<span class="glyphicon glyphicon-cog"></span>&nbsp;<g:message code="default.options.label" default="_Options"></g:message>
								  	<span class="caret"></span>
								    <span class="sr-only">Toggle Dropdown</span>
								  </button>
								  <ul class="dropdown-menu">
								 	<li>
								         <g:link class="show" action="show" resource="${standInstance}"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;&nbsp;<g:message code="default.button.show.label" default="_Show" /></g:link>
								    </li>
								    <li>
								         <g:link class="edit" action="edit" resource="${standInstance}"><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;&nbsp;<g:message code="default.button.edit.label" default="_Edit" /></g:link>
								    </li>
								    <li onclick="deleteForm${standInstance.id}.click();" class="deleteli">
								    	<a><span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;&nbsp;<g:message code="default.button.delete.label" default="_Delete" /></a>
								    	<g:form url="[resource:standInstance, action:'delete']" method="DELETE">
											<g:actionSubmit hidden id="deleteForm${standInstance.id}" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
				<g:paginate total="${standInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
