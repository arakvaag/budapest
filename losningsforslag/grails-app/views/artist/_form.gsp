<%@ page import="budapest.Artist" %>



<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'navn', 'error')} ">
	<label for="navn">
		<g:message code="artist.navn.label" default="Navn" />
		
	</label>
	<g:textField name="navn" value="${artistInstance?.navn}"/>
</div>

