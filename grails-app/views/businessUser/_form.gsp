<%@ page import="com.standconnect.domain.BusinessUser" %>



<div class="fieldcontain ${hasErrors(bean: businessUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="businessUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${businessUserInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: businessUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="businessUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" required="" value="${businessUserInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: businessUserInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="businessUser.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${businessUserInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: businessUserInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="businessUser.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mail" required="" value="${businessUserInstance?.mail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: businessUserInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="businessUser.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${businessUserInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: businessUserInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="businessUser.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${businessUserInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: businessUserInstance, field: 'postalCode', 'error')} required">
	<label for="postalCode">
		<g:message code="businessUser.postalCode.label" default="Postal Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="postalCode" required="" value="${businessUserInstance?.postalCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: businessUserInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="businessUser.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select valueMessagePrefix="gender" name="gender" from="${com.standconnect.security.SecUser$Gender?.values()}" keys="${com.standconnect.security.SecUser$Gender.values()*.name()}" required="" value="${businessUserInstance?.gender?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: businessUserInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="businessUser.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${businessUserInstance?.accountExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: businessUserInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="businessUser.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${businessUserInstance?.accountLocked}" />

</div>

<div class="fieldcontain ${hasErrors(bean: businessUserInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="businessUser.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${businessUserInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: businessUserInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="businessUser.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${businessUserInstance?.passwordExpired}" />

</div>

