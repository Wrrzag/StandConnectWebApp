<%@ page import="com.standconnect.domain.relationships.VisitorEventTag" %>



<div class="fieldcontain ${hasErrors(bean: visitorEventTagInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="visitorEventTag.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${com.standconnect.domain.Event.list()}" optionKey="id" required="" value="${visitorEventTagInstance?.event?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitorEventTagInstance, field: 'tag', 'error')} required">
	<label for="tag">
		<g:message code="visitorEventTag.tag.label" default="Tag" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tag" name="tag.id" from="${com.standconnect.domain.Tag.list()}" optionKey="id" required="" value="${visitorEventTagInstance?.tag?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitorEventTagInstance, field: 'visitor', 'error')} required">
	<label for="visitor">
		<g:message code="visitorEventTag.visitor.label" default="Visitor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="visitor" name="visitor.id" from="${com.standconnect.domain.Visitor.list()}" optionKey="id" required="" value="${visitorEventTagInstance?.visitor?.id}" class="many-to-one"/>

</div>

