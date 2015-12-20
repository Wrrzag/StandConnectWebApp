
<%@ page import="com.standconnect.domain.Business" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'business.label', default: 'Business')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-business" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</sec:ifAnyGranted>
			</ul>
		</div>
		<div id="show-business" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list business">
			
				<g:if test="${businessInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="business.image.label" default="Image" /></span>
					<img class="photo" src="${createLink(controller:'business', action:'getBusinessImage', id:"${businessInstance.id}")}" />
				</li>
				</g:if>
			
				<g:if test="${businessInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="business.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${businessInstance}" field="name"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${businessInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="business.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${businessInstance}" field="description"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${businessInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="business.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${businessInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="business.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${businessInstance}" field="phone"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${businessInstance?.contact}">
				<li class="fieldcontain">
					<span id="contact-label" class="property-label"><g:message code="business.contact.label" default="Contact" /></span>
					
						<span class="property-value" aria-labelledby="contact-label"><g:fieldValue bean="${businessInstance}" field="contact"/></span>
					
				</li>
				</g:if>
				
<%--				--%>
<%--				<g:if test="${businessInstance?.businessTagProduct}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="businessTagProduct-label" class="property-label"><g:message code="business.businessTagProduct.label" default="Business Tag Product" /></span>--%>
<%--					--%>
<%--						<g:each in="${businessInstance.businessTagProduct}" var="b">--%>
<%--						<span class="property-value" aria-labelledby="businessTagProduct-label"><g:link controller="businessTagProduct" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>--%>
<%--						</g:each>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
<%--			--%>
<%--				<g:if test="${businessInstance?.businessUser}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="businessUser-label" class="property-label"><g:message code="business.businessUser.label" default="Business User" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="businessUser-label"><g:link controller="businessUser" action="show" id="${businessInstance?.businessUser?.id}">${businessInstance?.businessUser?.encodeAsHTML()}</g:link></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
<%--			--%>
<%--				<g:if test="${businessInstance?.eventBusiness}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="eventBusiness-label" class="property-label"><g:message code="business.eventBusiness.label" default="Event Business" /></span>--%>
<%--					--%>
<%--						<g:each in="${businessInstance.eventBusiness}" var="e">--%>
<%--						<span class="property-value" aria-labelledby="eventBusiness-label"><g:link controller="eventBusiness" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>--%>
<%--						</g:each>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
<%--			--%>
<%--				<g:if test="${businessInstance?.products}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="products-label" class="property-label"><g:message code="business.products.label" default="Products" /></span>--%>
<%--					--%>
<%--						<g:each in="${businessInstance.products}" var="p">--%>
<%--						<span class="property-value" aria-labelledby="products-label"><g:link controller="product" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>--%>
<%--						</g:each>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
<%--			--%>
<%--				<g:if test="${businessInstance?.standBeaconBusiness}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="standBeaconBusiness-label" class="property-label"><g:message code="business.standBeaconBusiness.label" default="Stand Beacon Business" /></span>--%>
<%--					--%>
<%--						<g:each in="${businessInstance.standBeaconBusiness}" var="s">--%>
<%--						<span class="property-value" aria-labelledby="standBeaconBusiness-label"><g:link controller="standBeaconBusiness" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>--%>
<%--						</g:each>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
				
			
			</ol>
			<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'>
				<g:form url="[resource:businessInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${businessInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</sec:ifAnyGranted>
		</div>
	</body>
</html>
