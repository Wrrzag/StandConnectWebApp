<%@ page import="com.standconnect.domain.relationships.StandBeaconBusiness" %>



<div class="fieldcontain ${hasErrors(bean: standBeaconBusinessInstance, field: 'beacon', 'error')} required">
	<label for="beacon">
		<g:message code="standBeaconBusiness.beacon.label" default="Beacon" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="beacon" name="beacon.id" from="${com.standconnect.domain.Beacon.list()}" optionKey="id" required="" value="${standBeaconBusinessInstance?.beacon?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: standBeaconBusinessInstance, field: 'business', 'error')} required">
	<label for="business">
		<g:message code="standBeaconBusiness.business.label" default="Business" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="business" name="business.id" from="${com.standconnect.domain.Business.list()}" optionKey="id" required="" value="${standBeaconBusinessInstance?.business?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: standBeaconBusinessInstance, field: 'stand', 'error')} required">
	<label for="stand">
		<g:message code="standBeaconBusiness.stand.label" default="Stand" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stand" name="stand.id" from="${com.standconnect.domain.Stand.list()}" optionKey="id" required="" value="${standBeaconBusinessInstance?.stand?.id}" class="many-to-one"/>

</div>

