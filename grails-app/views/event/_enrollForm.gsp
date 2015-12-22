<%@ page import="com.standconnect.domain.Event"%>

<g:hiddenField name="eventId" value="${eventInstance.id}"/>

<div class="fieldcontain required">
    <label for="business">
        <g:message code="product.business.label" default="_Business" />
        <span class="required-indicator">*</span>
    </label>
    <sel:businesses business="${business}"/>
</div>

<div class="fieldcontain required">
    <label for="beacon">
        <g:message code="product.beacons.label" default="_Beacons" />
        <span class="required-indicator">*</span>
    </label>
    
    <select required id="beacon" name="beacon">
        
    </select>
</div>

<div
    class="fieldcontain required">
    <label for="name"> 
       <g:message code="stand.name.label" default="_Name" /> 
       <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${name}" />
</div>

<%--<div class="fieldcontain  required">--%>
<%--    <label for="products">--%>
<%--        <g:message code="product.tags.label" default="_Tags" />--%>
<%--     </label>--%>
<%--    <sel:multiSelectProduct id="products" name="products" business="${businessInstance}" event="${eventInstance}"/>--%>
<%--</div>--%>

<div class="fieldcontain ">
	<label for="image"> 
	   <g:message code="stand.image.label" default="Image" />
	</label> 
	<input type="file" id="image" name="image" />
</div>