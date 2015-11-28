<%@ page import="com.standconnect.domain.relationships.BusinessTagProduct" %>



<div class="fieldcontain ${hasErrors(bean: businessTagProductInstance, field: 'business', 'error')} required">
	<label for="business">
		<g:message code="businessTagProduct.business.label" default="Business" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="business" name="business.id" from="${com.standconnect.domain.Business.list()}" optionKey="id" required="" value="${businessTagProductInstance?.business?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: businessTagProductInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="businessTagProduct.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${com.standconnect.domain.Product.list()}" optionKey="id" required="" value="${businessTagProductInstance?.product?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: businessTagProductInstance, field: 'tag', 'error')} required">
	<label for="tag">
		<g:message code="businessTagProduct.tag.label" default="Tag" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tag" name="tag.id" from="${com.standconnect.domain.Tag.list()}" optionKey="id" required="" value="${businessTagProductInstance?.tag?.id}" class="many-to-one"/>

</div>

