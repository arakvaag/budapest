
<%@ page import="budapest.Album" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'album.label', default: 'Album')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-album" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create">Nytt album</g:link></li>
			</ul>
		</div>
		<div id="show-album" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list album">
				<g:if test="${albumInstance?.aar}">
				<li class="fieldcontain">
					<span id="aar-label" class="property-label">År</span>
						<span class="property-value" aria-labelledby="aar-label">${albumInstance.aar}</span>
				</li>
				</g:if>
			
				<g:if test="${albumInstance?.artist}">
				<li class="fieldcontain">
					<span id="artist-label" class="property-label"><g:message code="album.artist.label" default="Artist" /></span>
					
						<span class="property-value" aria-labelledby="artist-label"><g:link controller="artist" action="show" id="${albumInstance?.artist?.id}">${albumInstance?.artist?.navn}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${albumInstance?.navn}">
				<li class="fieldcontain">
					<span id="navn-label" class="property-label"><g:message code="album.navn.label" default="Navn" /></span>
					
						<span class="property-value" aria-labelledby="navn-label"><g:fieldValue bean="${albumInstance}" field="navn"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${albumInstance?.sporene}">
				<li class="fieldcontain">
					<span id="sporene-label" class="property-label"><g:message code="album.sporene.label" default="Sporene" /></span>
					
						<g:each in="${albumInstance.sporene}" var="s">
						<span class="property-value" aria-labelledby="sporene-label"><g:link controller="spor" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${albumInstance?.spotifyURI}">
				<li class="fieldcontain">
					<span id="spotifyURI-label" class="property-label"><g:message code="album.spotifyURI.label" default="Spotify URI" /></span>
					
						<span class="property-value" aria-labelledby="spotifyURI-label"><g:fieldValue bean="${albumInstance}" field="spotifyURI"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${albumInstance?.tilgjengeligINorge}">
				<li class="fieldcontain">
					<span id="tilgjengeligINorge-label" class="property-label">Tilgjengelig i Norge</span>
					
						<span class="property-value" aria-labelledby="tilgjengeligINorge-label"><g:formatBoolean boolean="${albumInstance?.tilgjengeligINorge}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${albumInstance?.id}" />
					<g:link class="edit" action="edit" id="${albumInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
