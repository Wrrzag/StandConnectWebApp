
<%@ page import="com.standconnect.domain.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<%--		<div class="nav" role="navigation">--%>
<%--			<ul>--%>
<%--				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
<%--				<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'>--%>
<%--				    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
<%--			    </sec:ifAnyGranted>--%>
<%--			</ul>--%>
<%--		</div>--%>
		<div id="list-product" class="content scaffold-list col-lg-12" role="main">
			<div class="row title-row">
				<div class="col-lg-10"><h1 class="big-title"><g:message code="default.list.label" args="[entityName]" /></h1></div>
				<div class="col-lg-2">
					<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'>
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
			<table class="table table-bordered striped">
			<thead>
					<tr>
					
						<th><g:message code="product.image.label" default="_Image" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'product.name.label', default: 'Name')}" />
						
						<g:sortableColumn property="description" title="${message(code: 'product.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'product.price.label', default: 'Price')}" />
						
						<th><g:message code="product.business.label" default="Business" /></th>
					
						<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'><th></th></sec:ifAnyGranted>
					</tr>
				</thead>
				<tbody>
				<g:each in="${productInstanceList}" status="i" var="productInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>
							<g:if test="${productInstance.image}">
								<img style="width:50px" class="photo" src="${createLink(controller:'product', action:'getProductImage', id:"${productInstance.id}")}" />
							</g:if>
						</td>
					
						<td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "name")}</g:link></td>
						
						<td>${fieldValue(bean: productInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "price")}</td>
						
						<td>${fieldValue(bean: productInstance, field: "business")}</td>
					
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
								         <g:link class="show" action="show" resource="${productInstance}"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;&nbsp;<g:message code="default.button.show.label" default="_Show" /></g:link>
								    </li>
								    <li>
								         <g:link class="edit" action="edit" resource="${productInstance}"><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;&nbsp;<g:message code="default.button.edit.label" default="_Edit" /></g:link>
								    </li>
								    <li onclick="deleteForm.click();" class="deleteli">
								    	<a><span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;&nbsp;<g:message code="default.button.delete.label" default="_Delete" /></a>
								    	<g:form url="[resource:productInstance, action:'delete']" method="DELETE">
											<g:actionSubmit hidden id="deleteForm" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
				<g:paginate total="${productInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
