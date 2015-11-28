<%@ page import="com.standconnect.domain.relationships.EventBusiness" %>



<div class="fieldcontain ${hasErrors(bean: eventBusinessInstance, field: 'business', 'error')} required">
	<label for="business">
		<g:message code="eventBusiness.business.label" default="Business" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="business" name="business.id" from="${com.standconnect.domain.Business.list()}" optionKey="id" required="" value="${eventBusinessInstance?.business?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventBusinessInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="eventBusiness.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${com.standconnect.domain.Event.list()}" optionKey="id" required="" value="${eventBusinessInstance?.event?.id}" class="many-to-one"/>

</div>

