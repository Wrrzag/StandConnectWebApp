
<%@ page import="com.standconnect.domain.Visitor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'visitor.label', default: 'Visitor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-visitor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-visitor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list visitor">
			
				<g:if test="${visitorInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="visitor.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${visitorInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${visitorInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="visitor.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${visitorInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${visitorInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="visitor.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${visitorInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${visitorInstance?.mail}">
				<li class="fieldcontain">
					<span id="mail-label" class="property-label"><g:message code="visitor.mail.label" default="Mail" /></span>
					
						<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${visitorInstance}" field="mail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${visitorInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="visitor.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${visitorInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${visitorInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="visitor.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${visitorInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${visitorInstance?.postalCode}">
				<li class="fieldcontain">
					<span id="postalCode-label" class="property-label"><g:message code="visitor.postalCode.label" default="Postal Code" /></span>
					
						<span class="property-value" aria-labelledby="postalCode-label"><g:fieldValue bean="${visitorInstance}" field="postalCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${visitorInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="visitor.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${visitorInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${visitorInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="visitor.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${visitorInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${visitorInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="visitor.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${visitorInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${visitorInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="visitor.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${visitorInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${visitorInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="visitor.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${visitorInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${visitorInstance?.visitorEventTag}">
				<li class="fieldcontain">
					<span id="visitorEventTag-label" class="property-label"><g:message code="visitor.visitorEventTag.label" default="Visitor Event Tag" /></span>
					
						<g:each in="${visitorInstance.visitorEventTag}" var="v">
						<span class="property-value" aria-labelledby="visitorEventTag-label"><g:link controller="visitorEventTag" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:visitorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${visitorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
