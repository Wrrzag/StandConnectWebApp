
<%@ page import="com.standconnect.domain.Business" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'business.label', default: 'Business')}" />
		<title><g:message code="default.my.businesses.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-business" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<%--		<div class="nav" role="navigation">--%>
<%--			<ul>--%>
<%--				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
<%--				<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'>--%>
<%--					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
<%--				</sec:ifAnyGranted>--%>
<%--			</ul>--%>
<%--		</div>--%>
		<div id="list-business" class="content scaffold-list col-lg-12" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="image" title="${message(code: 'business.image.label', default: 'Image')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'business.name.label', default: 'Name')}" />
						
						<g:sortableColumn property="description" title="${message(code: 'business.description.label', default: 'Description')}" />
						
						<g:sortableColumn property="address" title="${message(code: 'business.address.label', default: 'Address')}" />
					
<%--						<th><g:message code="business.businessUser.label" default="Business User" /></th>--%>
					
						<g:sortableColumn property="contact" title="${message(code: 'business.contact.label', default: 'Contact')}" />
						
						<th></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${businessInstanceList}" status="i" var="businessInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>
							<g:if test="${businessInstance.image}">
								<img style="width:50px" class="photo" src="${createLink(controller:'business', action:'getBusinessImage', id:"${businessInstance.id}")}" />
							</g:if>
						</td>
					
						<td><g:link controller="business" action="show" id="${businessInstance.id}">${fieldValue(bean: businessInstance, field: "name")}</g:link></td>
						
						<td>${fieldValue(bean: businessInstance, field: "description")}</td>
						
						<td>${fieldValue(bean: businessInstance, field: "address")}</td>
					
<%--						<td>${fieldValue(bean: businessInstance, field: "businessUser")}</td>--%>
					
						<td>${fieldValue(bean: businessInstance, field: "contact")}</td>
						
						<td>
						  <div class="btn-group">
							  <button type="button" class="btn btn-primary"><g:message code="default.options.label" default="_Options"></g:message></button>
							  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    <span class="caret"></span>
							    <span class="sr-only">Toggle Dropdown</span>
							  </button>
							  <ul class="dropdown-menu">
							    <li>
							         <g:link class="edit" action="edit" resource="${businessInstance}"><g:message code="default.button.edit.label" default="_Edit" /></g:link>
							    </li>
							    <li><!--  TODO -->
							         <g:link action="delete" id="${businessInstance.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: '_Are you sure?')}');">
							             <g:message code="default.delete.label" default="_Delete"></g:message>
							         </g:link>
                                </li>
							  </ul>
						  </div>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${businessInstanceCount ?: 0}" />
			</div>
		</div>
		
		<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'>
			<div class="nav" role="navigation">
	            <ul>
	<%--                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
	                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
	                
	            </ul>
	        </div>
        </sec:ifAnyGranted>
	</body>
</html>
