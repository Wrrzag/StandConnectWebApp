
<%@ page import="com.standconnect.domain.BusinessUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'businessUser.label', default: 'BusinessUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-businessUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<sec:ifAnyGranted roles='ROLE_ADMIN'>
				    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</sec:ifAnyGranted>
			</ul>
		</div>
		<div id="show-businessUser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list businessUser">
			
				<g:if test="${businessUserInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="businessUser.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${businessUserInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
<%--				<g:if test="${businessUserInstance?.password}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="password-label" class="property-label"><g:message code="businessUser.password.label" default="Password" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${businessUserInstance}" field="password"/></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
				<g:if test="${businessUserInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="businessUser.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${businessUserInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessUserInstance?.mail}">
				<li class="fieldcontain">
					<span id="mail-label" class="property-label"><g:message code="businessUser.mail.label" default="Mail" /></span>
					
						<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${businessUserInstance}" field="mail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessUserInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="businessUser.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${businessUserInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessUserInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="businessUser.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${businessUserInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessUserInstance?.postalCode}">
				<li class="fieldcontain">
					<span id="postalCode-label" class="property-label"><g:message code="businessUser.postalCode.label" default="Postal Code" /></span>
					
						<span class="property-value" aria-labelledby="postalCode-label"><g:fieldValue bean="${businessUserInstance}" field="postalCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessUserInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="businessUser.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${businessUserInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessUserInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="businessUser.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${businessUserInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessUserInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="businessUser.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${businessUserInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessUserInstance?.businesses}">
				<li class="fieldcontain">
					<span id="businesses-label" class="property-label"><g:message code="businessUser.businesses.label" default="Businesses" /></span>
					
						<g:each in="${businessUserInstance.businesses}" var="b">
						<span class="property-value" aria-labelledby="businesses-label"><g:link controller="business" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${businessUserInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="businessUser.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${businessUserInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessUserInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="businessUser.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${businessUserInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<sec:ifAnyGranted roles='ROLE_ADMIN'>
				<g:form url="[resource:businessUserInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${businessUserInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</sec:ifAnyGranted>
		</div>
	</body>
</html>
