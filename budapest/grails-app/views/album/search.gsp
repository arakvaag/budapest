
<%@ page import="budapest.Album" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'album.label', default: 'Album')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<g:javascript library="jquery" />
	</head>
	<body>
		<a href="#show-album" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" action="search">Søk</g:link></li>
			</ul>
		</div>
		<div id="show-album" class="content scaffold-show" role="main">
			<h1>Søk</h1>
			
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:form action="search" method="get" >			
				<label for="artist">Artist</label>
				<g:textField name="artist"/>
				<label for="album">Album</label>
				<g:textField name="album"/>
				<g:submitButton value="Søk" name="search" />
			</g:form>
			
			<g:if test="${albumliste}">
				<ul>
					<g:each in="${albumliste}" var="album">
					<g:form action="add">
						<li>
							${album.artist.navn} - ${album.navn}
    						<input type="hidden" name="spotifyURI" value="${album.spotifyURI}" />
    						<g:submitToRemote id="${album.spotifyURI}" update="melding" value="Legg til album" action="add" 
    							onSuccess="document.getElementById('${album.spotifyURI}').style.visibility = 'hidden'"/>
    					</li>
					</g:form >
					</g:each>
				</ul>
				<div id="melding">Ingen album lagt til</div>
			</g:if>
			
		</div>
	</body>
</html>
