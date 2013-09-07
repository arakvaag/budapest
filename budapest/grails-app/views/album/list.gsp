
<%@ page import="budapest.Album" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'album.label', default: 'Album')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-album" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">Nytt album</g:link></li>
				<li><g:link class="list" action="search">Søk</g:link></li>
			</ul>
		</div>
		<div id="list-album" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<th><g:message code="album.artist.label" default="Artist" /></th>
						<g:sortableColumn property="navn" title="Album" />
						<g:sortableColumn property="aar" title="År" />
						<g:sortableColumn property="spotifyURI" title=" " />
					</tr>
				</thead>
				<tbody>
				<g:each in="${albumInstanceList}" status="i" var="albumInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link controller="artist" action="show" id="${albumInstance.artist.id}">${fieldValue(bean: albumInstance, field: "artist.navn")}</g:link></td>
						<td><g:link action="show" id="${albumInstance.id}">${fieldValue(bean: albumInstance, field: "navn")}</g:link></td>
						<td>${albumInstance.aar}</td>
						<td><g:if test="${albumInstance.spotifyURI}"><g:link url="${albumInstance.spotifyURI}">Åpne i Spotify</g:link></g:if></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${albumInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
