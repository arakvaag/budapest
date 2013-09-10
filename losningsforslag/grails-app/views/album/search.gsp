
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
				<li><g:link class="create" action="create">Nytt album</g:link></li>
				<li><g:link class="create" url="[action:'create',controller:'artist']">Ny artist</g:link></li>
			</ul>
		</div>
		<div role="main">
			<h1>Søk</h1>
			<g:form action="search" method="get" >			
				<label for="artist">Artist</label><g:textField name="artist"/>&nbsp;&nbsp;&nbsp;
				<label for="album">Album</label><g:textField name="album"/>&nbsp;&nbsp;&nbsp;
				<g:submitButton value="Søk" name="search" />
			</g:form>
			
			<g:if test="${albumliste}">
				<ul>
					<g:each in="${albumliste}" var="album">
						<li>${album.artist.navn} - ${album.navn}</li>
					</g:each>
				</ul>
			</g:if>
			
		</div>
	</body>
</html>
