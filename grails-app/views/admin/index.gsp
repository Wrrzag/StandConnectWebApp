
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'beacon.label', default: 'Beacon')}" />
		<title><g:message code="default.general.info.label" args="_General Info" /></title>
	</head>
	<body>
		<a href="#list-beacon" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<%--		<div class="nav" role="navigation">--%>
<%--			<ul>--%>
<%--				<li><a class="home btn btn-default" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
<%--				<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'>--%>
<%--				    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
<%--				</sec:ifAnyGranted>--%>
<%--			</ul>--%>
<%--		</div>--%>
		<div id="general-info" class="content scaffold-show col-lg-12" role="main">
<%--			<div class="row title-row">--%>
<%--				<div class="col-lg-10"><h1 class="big-title"><g:message code="default.general.info.label" args="[entityName]" /></h1></div>--%>
<%--			</div>--%>
<%----%>
<%--			<div class="lastStuff col-lg-12 row">--%>
<%--				<div class="lastStuffHead col-lg-2">--%>
<%--					<div class="lastStuffTitle"><g:message code="last.events.label" default="_Last Events" /></div>--%>
<%--					<g:link controller="event" action="index"><g:message code="default.show.all.events.label" default="_Show All Events" /></g:link>--%>
<%--				</div>--%>
<%--				<g:each in="${eventList}" >--%>
<%--					<div class="stuff ${it.image?'':'noImage'} col-lg-3">--%>
<%--						<g:if test="${it.image}">--%>
<%--							<img style="width:50px" class="photo" src="${createLink(controller:'event', action:'getEventImage', id:"${it.id}")}" />--%>
<%--						</g:if>--%>
<%--						<div class="stuffTitle">${it.name}</div>--%>
<%--						<div class="stuffLocation"><small><g:formatDate format="yy-MM-dd" date="${it.beginDate}"/></small> - ${it.location}</div>--%>
<%--						<div class="btn btn-info stuffBtn"><g:link controller="event" action="show" resource="${it}"><g:message code="default.button.show.label" default="_Edit" /></g:link></div>--%>
<%--					</div>--%>
<%--				</g:each>--%>
<%--			</div>--%>
			
			<div class="row mainmenu">
				<div class="col-lg-4">
					<g:link controller="businessUser" action="index">
						<asset:image src="businessUser.png" alt="Business Users"/>
						<h1><g:message code="default.businessUsers.label" default="_Business Users"/></h1>
					</g:link>
				</div>
				<div class="col-lg-4">
					<g:link controller="organizer" action="index">
						<asset:image src="organizer.png" alt="Organizers"/>
						<h1><g:message code="default.organizers.label" default="_Organizers"/></h1>
					</g:link>
				</div>
				<div class="col-lg-4">
					<g:link controller="tag" action="index">
						<asset:image src="tag.png" alt="Tags"/>
						<h1><g:message code="default.tags.label" default="_Tags" /></h1>
					</g:link>
				</div>
			</div>
			
		</div>
	</body>
</html>
