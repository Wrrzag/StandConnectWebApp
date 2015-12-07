<%@ page import="com.standconnect.domain.Beacon" %>



<div class="fieldcontain ${hasErrors(bean: beaconInstance, field: 'mac', 'error')} required">
	<label for="mac">
		<g:message code="beacon.mac.label" default="Mac" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mac" required="" value="${beaconInstance?.mac}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: beaconInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="beacon.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${beaconInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: beaconInstance, field: 'standBeaconBusiness', 'error')} ">
	<label for="standBeaconBusiness">
		<g:message code="beacon.standBeaconBusiness.label" default="Stand Beacon Business" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${beaconInstance?.standBeaconBusiness?}" var="s">
    <li><g:link controller="standBeaconBusiness" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="standBeaconBusiness" action="create" params="['beacon.id': beaconInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'standBeaconBusiness.label', default: 'StandBeaconBusiness')])}</g:link>
</li>
</ul>


</div>

