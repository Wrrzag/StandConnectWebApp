<%@ page import="com.standconnect.domain.Product" %>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'business', 'error')} required">
    <label for="name">
        <g:message code="product.business.label" default="_Business" />
        <span class="required-indicator">*</span>
    </label>
    <sel:businesses business="${productInstance.business}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="product.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${productInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="product.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${productInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="product.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="price" required="" value="${productInstance?.price}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'image', 'error')} ">
	<div id="imageControl" hidden>
        <label for="replaceImage"> 
           <g:message code="product.image.replace.label" default="Replace Image" />
        </label> 
        <input type="checkbox" id="replaceImage" name="replaceImage" />
    </div>
    
    <div id="imageInput">
		<label for="image"> 
		   <g:message code="product.image.label" default="Image" />
		</label> 
		<input type="file" id="image" name="image" />
	</div>
</div>

<div class="fieldcontain  required">
    <label for="tags">
        <g:message code="product.tags.label" default="_Tags" />
     </label>
    <sel:multiSelectTag id="tags" name="tags" product="${productInstance}"/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'business', 'error')} required">--%>
<%--	<label for="business">--%>
<%--		<g:message code="product.business.label" default="Business" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:select id="business" name="business.id" from="${com.standconnect.domain.Business.list()}" optionKey="id" required="" value="${productInstance?.business?.id}" class="many-to-one"/>--%>
<%----%>
<%--</div>--%>

<%--<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'businessTagProduct', 'error')} ">--%>
<%--	<label for="businessTagProduct">--%>
<%--		<g:message code="product.businessTagProduct.label" default="Business Tag Product" />--%>
<%--		--%>
<%--	</label>--%>
<%--	--%>
<%--<ul class="one-to-many">--%>
<%--<g:each in="${productInstance?.businessTagProduct?}" var="b">--%>
<%--    <li><g:link controller="businessTagProduct" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>--%>
<%--</g:each>--%>
<%--<li class="add">--%>
<%--<g:link controller="businessTagProduct" action="create" params="['product.id': productInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'businessTagProduct.label', default: 'BusinessTagProduct')])}</g:link>--%>
<%--</li>--%>
<%--</ul>--%>
<%----%>
<%----%>
<%--</div>--%>

