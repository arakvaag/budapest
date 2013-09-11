
<%@ page import="budapest.Artist" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'artist.label', default: 'Artist')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-artist" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-artist" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list artist">
			
				<g:if test="${artistInstance?.navn}">
				<li class="fieldcontain">
					<span id="navn-label" class="property-label"><g:message code="artist.navn.label" default="Navn" /></span>
					
						<span class="property-value" aria-labelledby="navn-label"><g:fieldValue bean="${artistInstance}" field="navn"/></span>
					
				</li>

				</g:if>
				<g:if test="${artistInstance?.album}">
					<li class="fieldcontain">
						<span id="album-label" class="property-label"><g:message code="artist.album.label" default="Album" /></span>
						<g:each in="${artistInstance.album}" var="a">
							<span class="property-value" aria-labelledby="album-label"><g:link controller="album" action="show" id="${a.id}">${a?.navn}</g:link></span>
						</g:each>					
					</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${artistInstance?.id}" />
					<g:link class="edit" action="edit" id="${artistInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
