<%@ page import="budapest.Artist" %>



<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'spotifyURI', 'error')} ">
	<label for="spotifyURI">
		<g:message code="artist.spotifyURI.label" default="Spotify URI" />
		
	</label>
	<g:textField name="spotifyURI" value="${artistInstance?.spotifyURI}"/>
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
<g:link controller="album" action="create" params="['artist.id': artistInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'album.label', default: 'Album')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'navn', 'error')} ">
	<label for="navn">
		<g:message code="artist.navn.label" default="Navn" />
		
	</label>
	<g:textField name="navn" value="${artistInstance?.navn}"/>
</div>

