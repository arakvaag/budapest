<%@ page import="budapest.Artist" %>



<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'navn', 'error')} ">
	<label for="navn">
		<g:message code="artist.navn.label" default="Navn" />
		
	</label>
	<g:textField name="navn" value="${artistInstance?.navn}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'album', 'error')} ">
	<label for="album">
		<g:message code="artist.album.label" default="Album" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${artistInstance?.album?}" var="a">
    <li><g:link controller="album" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="album" action="create" params="['artist.id': artistInstance?.id]">Legg til album</g:link>
</li>
</ul>

</div>