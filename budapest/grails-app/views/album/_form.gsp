<%@ page import="budapest.Album" %>



<div class="fieldcontain ${hasErrors(bean: albumInstance, field: 'aar', 'error')} ">
	<label for="aar">
		<g:message code="album.aar.label" default="Aar" />
		
	</label>
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

<div class="fieldcontain ${hasErrors(bean: albumInstance, field: 'sporene', 'error')} ">
	<label for="sporene">
		<g:message code="album.sporene.label" default="Sporene" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${albumInstance?.sporene?}" var="s">
    <li><g:link controller="spor" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="spor" action="create" params="['album.id': albumInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'spor.label', default: 'Spor')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: albumInstance, field: 'spotifyURI', 'error')} ">
	<label for="spotifyURI">
		<g:message code="album.spotifyURI.label" default="Spotify URI" />
		
	</label>
	<g:textField name="spotifyURI" value="${albumInstance?.spotifyURI}"/>
</div>

