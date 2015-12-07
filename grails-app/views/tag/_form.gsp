<%@ page import="com.standconnect.domain.Tag" %>



<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'businessTagProduct', 'error')} ">
	<label for="businessTagProduct">
		<g:message code="tag.businessTagProduct.label" default="Business Tag Product" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tagInstance?.businessTagProduct?}" var="b">
    <li><g:link controller="businessTagProduct" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="businessTagProduct" action="create" params="['tag.id': tagInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'businessTagProduct.label', default: 'BusinessTagProduct')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="tag.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${tagInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'visitorEventTag', 'error')} ">
	<label for="visitorEventTag">
		<g:message code="tag.visitorEventTag.label" default="Visitor Event Tag" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tagInstance?.visitorEventTag?}" var="v">
    <li><g:link controller="visitorEventTag" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="visitorEventTag" action="create" params="['tag.id': tagInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'visitorEventTag.label', default: 'VisitorEventTag')])}</g:link>
</li>
</ul>


</div>

