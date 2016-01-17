
<%@ page import="com.standconnect.domain.Tag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<%--		<div class="nav" role="navigation">--%>
<%--			<ul>--%>
<%--				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
<%--				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--%>
<%--				<sec:ifAnyGranted roles='ROLE_ADMIN'>--%>
<%--				    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
<%--			    </sec:ifAnyGranted>--%>
<%--			</ul>--%>
<%--		</div>--%>
		<div id="show-tag" class="content scaffold-show col-lg-12" role="main">
			<div class="row title-row">
				<div class="col-lg-10"><h1 class="big-title"><g:message code="default.show.label" args="[entityName]" /></h1></div>
				<div class="col-lg-2">
					<sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_BUSINESSUSER'>
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
			<ol class="property-list tag">
			
<%--				<g:if test="${tagInstance?.businessTagProduct}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="businessTagProduct-label" class="property-label"><g:message code="tag.businessTagProduct.label" default="Business Tag Product" /></span>--%>
<%--					--%>
<%--						<g:each in="${tagInstance.businessTagProduct}" var="b">--%>
<%--						<span class="property-value" aria-labelledby="businessTagProduct-label"><g:link controller="businessTagProduct" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>--%>
<%--						</g:each>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
				<g:if test="${tagInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="tag.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${tagInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
<%--				<g:if test="${tagInstance?.visitorEventTag}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="visitorEventTag-label" class="property-label"><g:message code="tag.visitorEventTag.label" default="Visitor Event Tag" /></span>--%>
<%--					--%>
<%--						<g:each in="${tagInstance.visitorEventTag}" var="v">--%>
<%--						<span class="property-value" aria-labelledby="visitorEventTag-label"><g:link controller="visitorEventTag" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>--%>
<%--						</g:each>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
			</ol>
			<sec:ifAnyGranted roles='ROLE_ADMIN'>
				<g:form url="[resource:tagInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${tagInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</sec:ifAnyGranted>
		</div>
	</body>
</html>
