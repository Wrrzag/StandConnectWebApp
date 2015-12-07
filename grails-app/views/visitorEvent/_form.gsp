<%@ page import="com.standconnect.domain.relationships.VisitorEvent" %>



<div class="fieldcontain ${hasErrors(bean: visitorEventInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="visitorEvent.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${com.standconnect.domain.Event.list()}" optionKey="id" required="" value="${visitorEventInstance?.event?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitorEventInstance, field: 'visitor', 'error')} required">
	<label for="visitor">
		<g:message code="visitorEvent.visitor.label" default="Visitor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="visitor" name="visitor.id" from="${com.standconnect.domain.Visitor.list()}" optionKey="id" required="" value="${visitorEventInstance?.visitor?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitorEventInstance, field: 'visitorEventTag', 'error')} ">
	<label for="visitorEventTag">
		<g:message code="visitorEvent.visitorEventTag.label" default="Visitor Event Tag" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${visitorEventInstance?.visitorEventTag?}" var="v">
    <li><g:link controller="visitorEventTag" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="visitorEventTag" action="create" params="['visitorEvent.id': visitorEventInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'visitorEventTag.label', default: 'VisitorEventTag')])}</g:link>
</li>
</ul>


</div>

