<%@ page import="com.standconnect.domain.Organizer" %>



<div class="fieldcontain ${hasErrors(bean: organizerInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="organizer.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${organizerInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizerInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="organizer.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" required="" value="${organizerInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizerInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="organizer.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${organizerInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizerInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="organizer.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mail" required="" value="${organizerInstance?.mail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizerInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="organizer.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${organizerInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizerInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="organizer.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${organizerInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizerInstance, field: 'postalCode', 'error')} required">
	<label for="postalCode">
		<g:message code="organizer.postalCode.label" default="Postal Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="postalCode" required="" value="${organizerInstance?.postalCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizerInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="organizer.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select valueMessagePrefix="gender" name="gender" from="${com.standconnect.security.SecUser$Gender?.values()}" keys="${com.standconnect.security.SecUser$Gender.values()*.name()}" required="" value="${organizerInstance?.gender?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: organizerInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="organizer.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${organizerInstance?.accountExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: organizerInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="organizer.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${organizerInstance?.accountLocked}" />

</div>

<div class="fieldcontain ${hasErrors(bean: organizerInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="organizer.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${organizerInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: organizerInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="organizer.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${organizerInstance?.passwordExpired}" />

</div>

