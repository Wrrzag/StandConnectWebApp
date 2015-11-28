<%@ page import="com.standconnect.security.SecUser" %>



<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="secUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${secUserInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="secUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${secUserInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="secUser.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${secUserInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="secUser.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mail" required="" value="${secUserInstance?.mail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="secUser.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${secUserInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="secUser.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${secUserInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'postalCode', 'error')} ">
	<label for="postalCode">
		<g:message code="secUser.postalCode.label" default="Postal Code" />
		
	</label>
	<g:textField name="postalCode" value="${secUserInstance?.postalCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="secUser.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${com.standconnect.security.SecUser$Gender?.values()}" keys="${com.standconnect.security.SecUser$Gender.values()*.name()}" value="${secUserInstance?.gender?.name()}"  noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="secUser.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${secUserInstance?.accountExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="secUser.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${secUserInstance?.accountLocked}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="secUser.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${secUserInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="secUser.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${secUserInstance?.passwordExpired}" />

</div>

