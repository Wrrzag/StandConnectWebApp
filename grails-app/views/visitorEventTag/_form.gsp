<%@ page import="com.standconnect.domain.relationships.VisitorEventTag" %>



<div class="fieldcontain ${hasErrors(bean: visitorEventTagInstance, field: 'tag', 'error')} required">
	<label for="tag">
		<g:message code="visitorEventTag.tag.label" default="Tag" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tag" name="tag.id" from="${com.standconnect.domain.Tag.list()}" optionKey="id" required="" value="${visitorEventTagInstance?.tag?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitorEventTagInstance, field: 'visitorEvent', 'error')} required">
	<label for="visitorEvent">
		<g:message code="visitorEventTag.visitorEvent.label" default="Visitor Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="visitorEvent" name="visitorEvent.id" from="${com.standconnect.domain.relationships.VisitorEvent.list()}" optionKey="id" required="" value="${visitorEventTagInstance?.visitorEvent?.id}" class="many-to-one"/>

</div>

