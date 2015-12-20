<%@ page import="com.standconnect.domain.Business" %>


<div class="fieldcontain ${hasErrors(bean: businessInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="business.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${businessInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: businessInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="business.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${businessInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: businessInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="business.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${businessInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: businessInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="business.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${businessInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: businessInstance, field: 'contact', 'error')} required">
	<label for="contact">
		<g:message code="business.contact.label" default="Contact" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contact" required="" value="${businessInstance?.contact}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: businessInstance, field: 'image', 'error')} ">
	<div id="imageControl" hidden>
        <label for="replaceImage"> 
           <g:message code="business.image.replace.label" default="Replace Image" />
        </label> 
        <input type="checkbox" id="replaceImage" name="replaceImage" />
    </div>
    
    <div id="imageInput">
		<label for="image"> 
		   <g:message code="business.image.label" default="Image" />
		</label> 
		<input type="file" id="image" name="image" />
	</div>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: businessInstance, field: 'products', 'error')} ">--%>
<%--	<label for="products">--%>
<%--		<g:message code="business.products.label" default="Products" />--%>
<%--		--%>
<%--	</label>--%>
<%--	--%>
<%--<ul class="one-to-many">--%>
<%--<g:each in="${businessInstance?.products?}" var="p">--%>
<%--    <li><g:link controller="product" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>--%>
<%--</g:each>--%>
<%--<li class="add">--%>
<%--<g:link controller="product" action="create" params="['business.id': businessInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'product.label', default: 'Product')])}</g:link>--%>
<%--</li>--%>
<%--</ul>--%>
<%----%>
<%----%>
<%--</div>--%>

<%--<div class="fieldcontain ${hasErrors(bean: businessInstance, field: 'eventBusiness', 'error')} ">--%>
<%--	<label for="eventBusiness">--%>
<%--		<g:message code="business.eventBusiness.label" default="Event Business" />--%>
<%--		--%>
<%--	</label>--%>
<%--	--%>
<%--<ul class="one-to-many">--%>
<%--<g:each in="${businessInstance?.eventBusiness?}" var="e">--%>
<%--    <li><g:link controller="eventBusiness" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>--%>
<%--</g:each>--%>
<%--<li class="add">--%>
<%--<g:link controller="eventBusiness" action="create" params="['business.id': businessInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'eventBusiness.label', default: 'EventBusiness')])}</g:link>--%>
<%--</li>--%>
<%--</ul>--%>
<%----%>
<%----%>
<%--</div>--%>
<%--<div class="fieldcontain ${hasErrors(bean: businessInstance, field: 'standBeaconBusiness', 'error')} ">--%>
<%--	<label for="standBeaconBusiness">--%>
<%--		<g:message code="business.standBeaconBusiness.label" default="Stand Beacon Business" />--%>
<%--		--%>
<%--	</label>--%>
<%--	--%>
<%--<ul class="one-to-many">--%>
<%--<g:each in="${businessInstance?.standBeaconBusiness?}" var="s">--%>
<%--    <li><g:link controller="standBeaconBusiness" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>--%>
<%--</g:each>--%>
<%--<li class="add">--%>
<%--<g:link controller="standBeaconBusiness" action="create" params="['business.id': businessInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'standBeaconBusiness.label', default: 'StandBeaconBusiness')])}</g:link>--%>
<%--</li>--%>
<%--</ul>--%>
<%----%>
<%----%>
<%--</div>--%>

<%----%>
<%--<div class="fieldcontain ${hasErrors(bean: businessInstance, field: 'businessTagProduct', 'error')} ">--%>
<%--	<label for="businessTagProduct">--%>
<%--		<g:message code="business.businessTagProduct.label" default="Business Tag Product" />--%>
<%--		--%>
<%--	</label>--%>
<%--	--%>
<%--<ul class="one-to-many">--%>
<%--<g:each in="${businessInstance?.businessTagProduct?}" var="b">--%>
<%--    <li><g:link controller="businessTagProduct" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>--%>
<%--</g:each>--%>
<%--<li class="add">--%>
<%--<g:link controller="businessTagProduct" action="create" params="['business.id': businessInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'businessTagProduct.label', default: 'BusinessTagProduct')])}</g:link>--%>
<%--</li>--%>
<%--</ul>--%>
<%----%>
<%----%>
<%--</div>--%>
<%----%>
<%--<div class="fieldcontain ${hasErrors(bean: businessInstance, field: 'businessUser', 'error')} required">--%>
<%--	<label for="businessUser">--%>
<%--		<g:message code="business.businessUser.label" default="Business User" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:select id="businessUser" name="businessUser.id" from="${com.standconnect.domain.BusinessUser.list()}" optionKey="id" required="" value="${businessInstance?.businessUser?.id}" class="many-to-one"/>--%>
<%----%>
<%--</div>--%>
