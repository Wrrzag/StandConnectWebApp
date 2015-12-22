
<%@ page import="com.standconnect.domain.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_ORGANIZER'>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</sec:ifAnyGranted>
			</ul>
		</div>
		<div id="show-event" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list event">
			
				<g:if test="${eventInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="event.image.label" default="Image" /></span>
					<img class="photo" src="${createLink(controller:'event', action:'getEventImage', id:"${eventInstance.id}")}" />
				</li>
				</g:if>
			
			     <g:if test="${eventInstance?.name}">
                <li class="fieldcontain">
                    <span id="name-label" class="property-label"><g:message code="event.name.label" default="Name" /></span>
                    
                        <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${eventInstance}" field="name"/></span>
                </li>
                </g:if>
                
                <g:if test="${eventInstance?.location}">
                <li class="fieldcontain">
                    <span id="location-label" class="property-label"><g:message code="event.location.label" default="Location" /></span>
                    
                        <span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${eventInstance}" field="location"/></span>
                    
                </li>
                </g:if>
                
				<g:if test="${eventInstance?.beginDate}">
				<li class="fieldcontain">
					<span id="beginDate-label" class="property-label"><g:message code="event.beginDate.label" default="Begin Date" /></span>
					
						<span class="property-value" aria-labelledby="beginDate-label"><g:formatDate date="${eventInstance?.beginDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="event.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${eventInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
			
			     <g:if test="${eventInstance?.schedule}">
                <li class="fieldcontain">
                    <span id="schedule-label" class="property-label"><g:message code="event.schedule.label" default="Schedule" /></span>
                    
                        <span class="property-value" aria-labelledby="schedule-label"><g:fieldValue bean="${eventInstance}" field="schedule"/></span>
                    
                </li>
                </g:if>
                
                <g:if test="${businessInstance?.standNumber}">
				<li class="fieldcontain">
					<span id="standNumber-label" class="property-label"><g:message code="event.standNumber.label" default="Stand Number" /></span>
					
						<span class="property-value" aria-labelledby="standNumber-label"><g:fieldValue bean="${businessInstance}" field="standNumber"/></span>
					
				</li>
				</g:if>
				
			     <g:if test="${eventInstance?.organizer}">
                <li class="fieldcontain">
                    <span id="organizer-label" class="property-label"><g:message code="event.organizer.label" default="Organizer" /></span>
                    
                    <span class="property-value" aria-labelledby="organizer-label">
                        <g:link controller="organizer" action="show" id="${eventInstance?.organizer?.id}">${eventInstance?.organizer?.name}</g:link>
                    </span>
                    
                </li>
                </g:if>
                
                <g:if test="${eventInstance?.stands}">
                <li class="fieldcontain">
                    <span id="stands-label" class="property-label"><g:message code="event.stands.label" default="Stands" /></span>
                    
                        <g:each in="${eventInstance.stands}" var="s">
                        <span class="property-value" aria-labelledby="stands-label"><g:link controller="stand" action="show" id="${s.id}">${s?.name}</g:link></span>
                        </g:each>
                    
                </li>
                </g:if>
                
                
				<g:if test="${eventInstance?.eventBusiness}">
				<li class="fieldcontain">
					<span id="eventBusiness-label" class="property-label"><g:message code="event.businesses.label" default="_Businesses" /></span>
					
					<g:each in="${eventInstance.eventBusiness}" var="e">
						<span class="property-value" aria-labelledby="eventBusiness-label"><g:link controller="eventBusiness" action="show" id="${e.id}">${e?.business?.name}</g:link></span>
					</g:each>
					
				</li>
				</g:if>
			
<%--				<g:if test="${eventInstance?.visitorEvent}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="visitor-label" class="property-label"><g:message code="event.visitor.label" default="_Visitors" /></span>--%>
<%--					--%>
<%--					<g:each in="${eventInstance.visitorEvent}" var="v">--%>
<%--						<span class="property-value" aria-labelledby="visitor-label"><g:link controller="visitor" action="show" id="${v?.visitor?.id}">${v?.visitor?.name}</g:link></span>--%>
<%--					</g:each>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
			</ol>
			<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_ORGANIZER'>
			    <auth:hasPermission instance="${eventInstance}">
					<g:form url="[resource:eventInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:link class="edit" action="edit" resource="${eventInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</auth:hasPermission>
			</sec:ifAnyGranted>
		</div>
	</body>
</html>
