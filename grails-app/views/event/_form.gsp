<%@ page import="com.standconnect.domain.Event" %>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="event.image.label" default="Image" />
		
	</label>
	<input type="file" id="image" name="image" />

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'beginDate', 'error')} required">
	<label for="beginDate">
		<g:message code="event.beginDate.label" default="Begin Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="beginDate" precision="day"  value="${eventInstance?.beginDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="event.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${eventInstance?.endDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'eventBusiness', 'error')} ">
	<label for="eventBusiness">
		<g:message code="event.eventBusiness.label" default="Event Business" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${eventInstance?.eventBusiness?}" var="e">
    <li><g:link controller="eventBusiness" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="eventBusiness" action="create" params="['event.id': eventInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'eventBusiness.label', default: 'EventBusiness')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="event.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="location" required="" value="${eventInstance?.location}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="event.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${eventInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'organizer', 'error')} required">
	<label for="organizer">
		<g:message code="event.organizer.label" default="Organizer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="organizer" name="organizer.id" from="${com.standconnect.domain.Organizer.list()}" optionKey="id" required="" value="${eventInstance?.organizer?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'schedule', 'error')} required">
	<label for="schedule">
		<g:message code="event.schedule.label" default="Schedule" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="schedule" required="" value="${eventInstance?.schedule}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'stands', 'error')} ">
	<label for="stands">
		<g:message code="event.stands.label" default="Stands" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${eventInstance?.stands?}" var="s">
    <li><g:link controller="stand" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="stand" action="create" params="['event.id': eventInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'stand.label', default: 'Stand')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'visitorEventTag', 'error')} ">
	<label for="visitorEventTag">
		<g:message code="event.visitorEventTag.label" default="Visitor Event Tag" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${eventInstance?.visitorEventTag?}" var="v">
    <li><g:link controller="visitorEventTag" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="visitorEventTag" action="create" params="['event.id': eventInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'visitorEventTag.label', default: 'VisitorEventTag')])}</g:link>
</li>
</ul>


</div>

