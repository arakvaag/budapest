
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
				<li><g:link class="create" action="create">Nytt album</g:link></li>
				<li><g:link class="create" url="[action:'create',controller:'artist']">Ny artist</g:link></li>
			</ul>
		</div>
		<div class="search" role="main">
			<h1>Søk</h1>
			
			<g:if test="${flash.message}">
				<div class="message" on role="status">${flash.message}</div>
			</g:if>
			<div id="messagebox" onload="this.style.display='none'"></div>
			
			<g:form action="search" method="get" >			
				<label for="artist">Artist</label><g:textField name="artist"/>&nbsp;&nbsp;&nbsp;
				<label for="album">Album</label><g:textField name="album"/>&nbsp;&nbsp;&nbsp;
				<g:submitButton value="Søk" name="search" />
			</g:form>
			
			<g:if test="${albumliste}">
				<ul>
					<g:each in="${albumliste}" var="album">
					<g:form>
						<li><g:submitToRemote id="${album.spotifyURI}" update="messagebox" value="+" action="add" 
    							onSuccess="document.getElementById('${album.spotifyURI}').style.visibility = 'hidden'; 
    										document.getElementById('messagebox').style.visibility = 'visible';
    										document.getElementById('messagebox').classList.add('message')"/>&nbsp;&nbsp;
    						${album.artist.navn} - ${album.navn}
    						<input type="hidden" name="spotifyURI" value="${album.spotifyURI}" /></li>
					</g:form >
					</g:each>
				</ul>
			</g:if>
			
		</div>
	</body>
</html>
