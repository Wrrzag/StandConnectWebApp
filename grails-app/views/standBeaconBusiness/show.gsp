
<%@ page import="com.standconnect.domain.relationships.StandBeaconBusiness" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'standBeaconBusiness.label', default: 'StandBeaconBusiness')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-standBeaconBusiness" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-standBeaconBusiness" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list standBeaconBusiness">
			
				<g:if test="${standBeaconBusinessInstance?.beacon}">
				<li class="fieldcontain">
					<span id="beacon-label" class="property-label"><g:message code="standBeaconBusiness.beacon.label" default="Beacon" /></span>
					
						<span class="property-value" aria-labelledby="beacon-label"><g:link controller="beacon" action="show" id="${standBeaconBusinessInstance?.beacon?.id}">${standBeaconBusinessInstance?.beacon?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${standBeaconBusinessInstance?.business}">
				<li class="fieldcontain">
					<span id="business-label" class="property-label"><g:message code="standBeaconBusiness.business.label" default="Business" /></span>
					
						<span class="property-value" aria-labelledby="business-label"><g:link controller="business" action="show" id="${standBeaconBusinessInstance?.business?.id}">${standBeaconBusinessInstance?.business?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${standBeaconBusinessInstance?.stand}">
				<li class="fieldcontain">
					<span id="stand-label" class="property-label"><g:message code="standBeaconBusiness.stand.label" default="Stand" /></span>
					
						<span class="property-value" aria-labelledby="stand-label"><g:link controller="stand" action="show" id="${standBeaconBusinessInstance?.stand?.id}">${standBeaconBusinessInstance?.stand?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:standBeaconBusinessInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${standBeaconBusinessInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
