<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
        <title><g:message code="event.enroll.label" args="[entityName]" default="_Enrol"/></title>
        
        <script type="text/javascript">
	        $(document).ready(function() {
	            $("#business").on("change", function() {
		            $("#beacon").html("");
	            	$.ajax({
	            		url: "${createLink(controller: 'Beacon', action: 'getByBusiness')}",
	            		data: {'businessId' : $("#business").val()},
	            		success: function(data) {updateBeacons(data);},
	            		error: function() {console.log("ERROR")}
	            	});
	            });

	            $("#business").change();
	        });

	        function updateBeacons(data) {
	        	jQuery.each(data, function(i, obj){
	                console.log("-> ", obj);
	                
	                $('<option>').attr({
	                    id: obj['id'],
	                    value: obj['id'],
	                }).text(obj['name']).appendTo("#beacon");
                });
	        }
        </script>
    </head>
    <body>
        <a href="#create-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-event" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${eventInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${eventInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form url="[resource:eventInstance, action:'inscription']"  enctype="multipart/form-data">
                <fieldset class="form">
                    <g:render template="enrollForm"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
