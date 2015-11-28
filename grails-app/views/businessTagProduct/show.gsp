
<%@ page import="com.standconnect.domain.relationships.BusinessTagProduct" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'businessTagProduct.label', default: 'BusinessTagProduct')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-businessTagProduct" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-businessTagProduct" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list businessTagProduct">
			
				<g:if test="${businessTagProductInstance?.business}">
				<li class="fieldcontain">
					<span id="business-label" class="property-label"><g:message code="businessTagProduct.business.label" default="Business" /></span>
					
						<span class="property-value" aria-labelledby="business-label"><g:link controller="business" action="show" id="${businessTagProductInstance?.business?.id}">${businessTagProductInstance?.business?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessTagProductInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="businessTagProduct.product.label" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${businessTagProductInstance?.product?.id}">${businessTagProductInstance?.product?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessTagProductInstance?.tag}">
				<li class="fieldcontain">
					<span id="tag-label" class="property-label"><g:message code="businessTagProduct.tag.label" default="Tag" /></span>
					
						<span class="property-value" aria-labelledby="tag-label"><g:link controller="tag" action="show" id="${businessTagProductInstance?.tag?.id}">${businessTagProductInstance?.tag?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:businessTagProductInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${businessTagProductInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
