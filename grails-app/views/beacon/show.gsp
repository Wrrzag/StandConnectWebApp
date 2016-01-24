
<%@ page import="com.standconnect.domain.Beacon" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'beacon.label', default: 'Beacon')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-beacon" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<%--		<div class="nav" role="navigation">--%>
<%--			<ul>--%>
<%--				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
<%--				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--%>
<%--				<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'>--%>
<%--				    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
<%--			    </sec:ifAnyGranted>--%>
<%--			</ul>--%>
<%--		</div>--%>
		<div id="show-beacon" class="content scaffold-show col-lg-12" role="main">
			<div class="row title-row">
				<div class="col-lg-10"><h1 class="big-title"><g:message code="default.show.label" args="[entityName]" /></h1></div>
				<div class="col-lg-2">
					<sec:ifAnyGranted roles='ROLE_BUSINESSUSER'>
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
			<ol class="property-list beacon">
			
				<g:if test="${beaconInstance?.mac}">
				<li class="fieldcontain">
					<span id="mac-label" class="property-label"><g:message code="beacon.mac.label" default="Mac" /></span>
					
						<span class="property-value" aria-labelledby="mac-label"><g:fieldValue bean="${beaconInstance}" field="mac"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beaconInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="beacon.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${beaconInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beaconInstance?.business}">
				<li class="fieldcontain">
					<span id="business-label" class="property-label"><g:message code="beacon.business.label" default="_Business" /></span>
					
					<span class="property-value" aria-labelledby="business-label"><g:fieldValue bean="${beaconInstance}" field="business"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'>
				<g:form url="[resource:beaconInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${beaconInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</sec:ifAnyGranted>
		</div>
	</body>
</html>
