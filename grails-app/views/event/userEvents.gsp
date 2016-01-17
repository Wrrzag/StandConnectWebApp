
<%@ page import="com.standconnect.domain.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.my.events.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<%--			<div class="nav" role="navigation">--%>
<%--				<ul>--%>
<%--					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
<%--					<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_ORGANIZER'>--%>
<%--						<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
<%--					</sec:ifAnyGranted>--%>
<%--				</ul>--%>
<%--			</div>--%>
		<div id="list-event" class="content scaffold-list col-lg-12" role="main">
			<div class="row title-row">
				<div class="col-lg-10"><h1 class="big-title"><g:message code="default.list.label" args="[entityName]" /></h1></div>
				<div class="col-lg-2">
					<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_ORGANIZER'>
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
			<table class="table table-bordered striped">
			<thead>
					<tr>
					    <th><g:message code="event.image.label" default="_Image" /></th>
					   
                        <g:sortableColumn property="name" title="${message(code: 'event.name.label', default: 'Name')}" />
                        
                        <g:sortableColumn property="location" title="${message(code: 'event.location.label', default: 'Location')}" />
                        
                        <g:sortableColumn property="beginDate" title="${message(code: 'event.beginDate.label', default: 'Begin Date')}" />
                    
                        <g:sortableColumn property="endDate" title="${message(code: 'event.endDate.label', default: 'End Date')}" />
                        
						<th><g:message code="event.organizer.label" default="Organizer" /></th>
					
						<sec:ifAnyGranted roles='ROLE_ADMIN,ORGANIZER'><th></th></sec:ifAnyGranted>
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
							
							<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_ORGANIZER'>
							<td class="options">
							  <div class="btn-group">
								  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								  	<span class="glyphicon glyphicon-cog"></span>&nbsp;<g:message code="default.options.label" default="_Options"></g:message>
								  	<span class="caret"></span>
								    <span class="sr-only">Toggle Dropdown</span>
								  </button>
								  <ul class="dropdown-menu">
								 	<li>
								         <g:link class="show" action="show" resource="${eventInstance}"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;&nbsp;<g:message code="default.button.show.label" default="_Show" /></g:link>
								    </li>
								    <li>
								         <g:link class="edit" action="edit" resource="${eventInstance}"><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;&nbsp;<g:message code="default.button.edit.label" default="_Edit" /></g:link>
								    </li>
								    <li onclick="deleteForm.click();" class="deleteli">
								    	<a><span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;&nbsp;<g:message code="default.button.delete.label" default="_Delete" /></a>
								    	<g:form url="[resource:eventInstance, action:'delete']" method="DELETE">
											<g:actionSubmit hidden id="deleteForm" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
										</g:form>
	                                </li>
								  </ul>
							  </div>
							</td>
						</sec:ifAnyGranted>
							
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
