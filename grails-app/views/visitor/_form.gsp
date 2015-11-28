<%@ page import="com.standconnect.domain.Visitor" %>



<div class="fieldcontain ${hasErrors(bean: visitorInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="visitor.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${visitorInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitorInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="visitor.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${visitorInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitorInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="visitor.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${visitorInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitorInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="visitor.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mail" required="" value="${visitorInstance?.mail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitorInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="visitor.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${visitorInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitorInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="visitor.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${visitorInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitorInstance, field: 'postalCode', 'error')} required">
	<label for="postalCode">
		<g:message code="visitor.postalCode.label" default="Postal Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="postalCode" required="" value="${visitorInstance?.postalCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitorInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="visitor.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${com.standconnect.security.SecUser$Gender?.values()}" keys="${com.standconnect.security.SecUser$Gender.values()*.name()}" required="" value="${visitorInstance?.gender?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: visitorInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="visitor.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${visitorInstance?.accountExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: visitorInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="visitor.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${visitorInstance?.accountLocked}" />

</div>

<div class="fieldcontain ${hasErrors(bean: visitorInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="visitor.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${visitorInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: visitorInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="visitor.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${visitorInstance?.passwordExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: visitorInstance, field: 'visitorEventTag', 'error')} ">
	<label for="visitorEventTag">
		<g:message code="visitor.visitorEventTag.label" default="Visitor Event Tag" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${visitorInstance?.visitorEventTag?}" var="v">
    <li><g:link controller="visitorEventTag" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="visitorEventTag" action="create" params="['visitor.id': visitorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'visitorEventTag.label', default: 'VisitorEventTag')])}</g:link>
</li>
</ul>


</div>

