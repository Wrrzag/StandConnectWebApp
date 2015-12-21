
<%@ page import="com.standconnect.domain.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'>
				    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			    </sec:ifAnyGranted>
			</ul>
		</div>
		<div id="show-product" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list product">
			
				<g:if test="${productInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="product.image.label" default="Image" /></span>
					<img class="photo" src="${createLink(controller:'product', action:'getProductImage', id:"${productInstance.id}")}" />
				</li>
				</g:if>
			
				<g:if test="${productInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="product.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productInstance}" field="name"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${productInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="product.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${productInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="product.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${productInstance}" field="price"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${productInstance?.business}">
				<li class="fieldcontain">
					<span id="business-label" class="property-label"><g:message code="product.business.label" default="Business" /></span>
					
						<span class="property-value" aria-labelledby="business-label"><g:link controller="business" action="show" id="${productInstance?.business?.id}">${productInstance?.business?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.businessTagProduct}">
					<li class="fieldcontain">
						<span id="tags-label" class="property-label"><g:message code="product.tags.label" default="_Tags" /></span>
						
						<g:each in="${productInstance.businessTagProduct}" var="b">
						   <span class="property-value" aria-labelledby="tags-label">${b?.tag}</span>
						</g:each>
					</li>
				</g:if>
			
			</ol>
			<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'>
		       <g:form url="[resource:productInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${productInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</sec:ifAnyGranted>
		</div>
	</body>
</html>
