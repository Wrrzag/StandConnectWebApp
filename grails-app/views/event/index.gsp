
<%@ page import="com.standconnect.domain.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
			<div class="nav" role="navigation">
				<ul>
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_ORGANIZER'>
						<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
					</sec:ifAnyGranted>
				</ul>
			</div>
		<div id="list-event" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					   <g:sortableColumn property="image" title="${message(code: 'event.image.label', default: 'Image')}" />
					   
                        <g:sortableColumn property="name" title="${message(code: 'event.name.label', default: 'Name')}" />
                        
                        <g:sortableColumn property="location" title="${message(code: 'event.location.label', default: 'Location')}" />
                        
                        <g:sortableColumn property="beginDate" title="${message(code: 'event.beginDate.label', default: 'Begin Date')}" />
                    
                        <g:sortableColumn property="endDate" title="${message(code: 'event.endDate.label', default: 'End Date')}" />
                        
						<th><g:message code="event.organizer.label" default="Organizer" /></th>
						
						<th><!-- LIST --></th>
					
					</tr>
				</thead>
				<tbody>
					<g:each in="${eventInstanceList}" status="i" var="eventInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							  
							<td>
								<g:if test="${eventInstance.image}">
<%--									${fieldValue(bean: eventInstance, field: "image")}--%>
									<img style="width:50px" class="photo" src="${createLink(controller:'event', action:'getEventImage', id:"${eventInstance.id}")}" />
								</g:if>
							</td>
						
	                        <td><g:link action="show" id="${eventInstance.id}">${fieldValue(bean: eventInstance, field: "name")}</g:link></td>
	                        
	                        <td>${fieldValue(bean: eventInstance, field: "location")}</td>
	                        
							<td><g:formatDate date="${eventInstance.beginDate}" /></td>
						
							<td><g:formatDate date="${eventInstance.endDate}" /></td>
						
							<td>${fieldValue(bean: eventInstance, field: "organizer")}</td>
							
							<td><g:link controller="event" action="enroll"  id="${eventInstance.id}"><g:message code="event.enroll.label" default="_Enrol" /></g:link></td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${eventInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
