<%@ page import="budapest.Album" %>



<div class="fieldcontain ${hasErrors(bean: albumInstance, field: 'aar', 'error')} ">
	<label for="aar">År</label>
	<g:field name="aar" type="number" value="${albumInstance.aar}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: albumInstance, field: 'artist', 'error')} required">
	<label for="artist">
		<g:message code="album.artist.label" default="Artist" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="artist" name="artist.id" from="${budapest.Artist.list()}" optionKey="id" required="" value="${albumInstance?.artist?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: albumInstance, field: 'navn', 'error')} ">
	<label for="navn">
		<g:message code="album.navn.label" default="Navn" />
		
	</label>
	<g:textField name="navn" value="${albumInstance?.navn}"/>
</div>

