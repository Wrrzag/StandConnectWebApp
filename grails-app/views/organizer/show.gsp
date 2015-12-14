
<%@ page import="com.standconnect.domain.Organizer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'organizer.label', default: 'Organizer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-organizer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-organizer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list organizer">
			
				<g:if test="${organizerInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="organizer.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${organizerInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
<%--				<g:if test="${organizerInstance?.password}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="password-label" class="property-label"><g:message code="organizer.password.label" default="Password" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${organizerInstance}" field="password"/></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
				<g:if test="${organizerInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="organizer.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${organizerInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organizerInstance?.mail}">
				<li class="fieldcontain">
					<span id="mail-label" class="property-label"><g:message code="organizer.mail.label" default="Mail" /></span>
					
						<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${organizerInstance}" field="mail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organizerInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="organizer.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${organizerInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organizerInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="organizer.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${organizerInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organizerInstance?.postalCode}">
				<li class="fieldcontain">
					<span id="postalCode-label" class="property-label"><g:message code="organizer.postalCode.label" default="Postal Code" /></span>
					
						<span class="property-value" aria-labelledby="postalCode-label"><g:fieldValue bean="${organizerInstance}" field="postalCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organizerInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="organizer.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${organizerInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organizerInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="organizer.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${organizerInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${organizerInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="organizer.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${organizerInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${organizerInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="organizer.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${organizerInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${organizerInstance?.events}">
				<li class="fieldcontain">
					<span id="events-label" class="property-label"><g:message code="organizer.events.label" default="Events" /></span>
					
						<g:each in="${organizerInstance.events}" var="e">
						<span class="property-value" aria-labelledby="events-label"><g:link controller="event" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${organizerInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="organizer.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${organizerInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:organizerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${organizerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
