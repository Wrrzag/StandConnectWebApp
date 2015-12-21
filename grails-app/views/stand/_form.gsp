<%@ page import="com.standconnect.domain.Stand" %>



<%--<div class="fieldcontain ${hasErrors(bean: standInstance, field: 'event', 'error')} required">--%>
<%--	<label for="event">--%>
<%--		<g:message code="stand.event.label" default="Event" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:select id="event" name="event.id" from="${com.standconnect.domain.Event.list()}" optionKey="id" required="" value="${standInstance?.event?.id}" class="many-to-one"/>--%>
<%----%>
<%--</div>--%>

<div class="fieldcontain ${hasErrors(bean: standInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="stand.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${standInstance?.name}"/>

</div>

<%--<div class="fieldcontain ${hasErrors(bean: standInstance, field: 'number', 'error')} required">--%>
<%--	<label for="number">--%>
<%--		<g:message code="stand.number.label" default="Number" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:field name="number" type="number" value="${standInstance.number}" required=""/>--%>
<%----%>
<%--</div>--%>

<div class="fieldcontain ${hasErrors(bean: standInstance, field: 'image', 'error')} ">
	<div id="imageControl" hidden>
        <label for="replaceImage"> 
           <g:message code="stand.image.replace.label" default="Replace Image" />
        </label> 
        <input type="checkbox" id="replaceImage" name="replaceImage" />
    </div>
    
    <div id="imageInput">
		<label for="image"> 
		   <g:message code="stand.image.label" default="Image" />
		</label> 
		<input type="file" id="image" name="image" />
	</div>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: standInstance, field: 'standBeaconBusiness', 'error')} ">--%>
<%--	<label for="standBeaconBusiness">--%>
<%--		<g:message code="stand.standBeaconBusiness.label" default="Stand Beacon Business" />--%>
<%--		--%>
<%--	</label>--%>
<%--	--%>
<%--<ul class="one-to-many">--%>
<%--<g:each in="${standInstance?.standBeaconBusiness?}" var="s">--%>
<%--    <li><g:link controller="standBeaconBusiness" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>--%>
<%--</g:each>--%>
<%--<li class="add">--%>
<%--<g:link controller="standBeaconBusiness" action="create" params="['stand.id': standInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'standBeaconBusiness.label', default: 'StandBeaconBusiness')])}</g:link>--%>
<%--</li>--%>
<%--</ul>--%>
<%----%>
<%----%>
<%--</div>--%>

