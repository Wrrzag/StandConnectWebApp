<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<div class="topbar">
			<locale:list />
		
	        <sec:ifLoggedIn>
	            <div class="header-login">
<%--	                <g:message code="logged.message" args="[sec.loggedInUserInfo(field: 'name')]" />.--%>
                    <auth:loggedUserMsg />
	                <g:link method="POST" controller="Logout"><g:message code="logout.message"/></g:link>
	            </div>
	        </sec:ifLoggedIn>
	        <sec:ifNotLoggedIn>
	            <div class="header-login">
	                <a href="${createLink(uri: '/login')}"><g:message code="login.label"/></a>
	            </div>
	        </sec:ifNotLoggedIn>
        </div>
        
        <div id="grailsLogo" role="banner">
            <g:link controller="secUser" action="home"><asset:image src="grails_logo.png" alt="Grails"/></g:link>
            <div class="main-title">Stand Connect</div>
        </div>
       
        <sec:ifAnyGranted roles="ROLE_BUSINESSUSER">
        	<div class="nav main-nav buser-nav" role="navigation">
				<ul>
					<li style="width: 21.6%;"><g:link class="list ${controller == 'business' ? 'main-nav-selected' : ''}" controller="business" action="userBusinesses"><g:message code="default.my.businesses.label" default="_My Businesses"/></g:link></li>
					<li style="width: 21.6%;"><g:link class="list ${controller == 'event' && view == 'businessEvents' ? 'main-nav-selected' : ''}" controller="event" action="businessEvents"><g:message code="default.attending.events.label" default="_Attending Events" /></g:link></li>
					<li style="width: 14.6%;"><g:link class="list ${controller == 'event' && view != 'businessEvents' ? 'main-nav-selected' : ''}" controller="event" action="index"><g:message code="default.event.plural.label" default="_Events" /></g:link></li>
					<li style="width: 14.6%;"><g:link class="list ${controller == 'product' ? 'main-nav-selected' : ''}" controller="product" action="index"><g:message code="default.product.plural.label" default="_Products" /></g:link></li>
					<li style="width: 13.6%;"><g:link class="list ${controller == 'stand' ? 'main-nav-selected' : ''}" controller="stand" action="index"><g:message code="default.stand.plural.label" default="_Stands" /></g:link></li>
					<li style="width: 13.6%;"><g:link class="list ${controller == 'beacon' ? 'main-nav-selected' : ''}" controller="beacon" action="index"><g:message code="default.beacon.plural.label" default="_Beacons" /></g:link></li>
				</ul>
			</div>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="ROLE_ORGANIZER">
        	<div class="nav main-nav orguser-nav" role="navigation">
				<ul>
					<li><g:link class="list ${controller == 'event' ? 'main-nav-selected' : ''}" controller="event" action="userEvents"><g:message code="default.my.events.label" default="_My Events" /></g:link></li>
<%--					<li><g:link class="list" controller="event" action="index"><g:message code="default.event.plural.label" default="_Events" /></g:link></li>--%>
					<li><g:link class="list ${controller == 'product' ? 'main-nav-selected' : ''}" controller="product" action="index"><g:message code="default.product.plural.label" default="_Products" /></g:link></li>
					<li><g:link class="list ${controller == 'stand' ? 'main-nav-selected' : ''}" controller="stand" action="index"><g:message code="default.stand.plural.label" default="_Stands" /></g:link></li>
				</ul>
			</div>
        </sec:ifAnyGranted>
		<g:layoutBody/>
		
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
