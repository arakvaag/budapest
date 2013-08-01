
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
				<li><g:link class="search" action="search">Søk</g:link></li>
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
						<li>${album.artist.navn} - ${album.navn} - <g:remoteLink action="create" method="get" update="res">Test 1</g:remoteLink> </li>
						
					</g:each>
				</ul>
			</g:if>
			
			<div id="res"></div>
			
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
