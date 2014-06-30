
<%@ page import="com.hotels.cds.HotelOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hotelOrder.label', default: 'HotelOrder')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-hotelOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-hotelOrder" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list hotelOrder">
			
				<g:if test="${hotelOrderInstance?.adults}">
				<li class="fieldcontain">
					<span id="adults-label" class="property-label"><g:message code="hotelOrder.adults.label" default="Adults" /></span>
					
						<span class="property-value" aria-labelledby="adults-label"><g:fieldValue bean="${hotelOrderInstance}" field="adults"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotelOrderInstance?.checkInDate}">
				<li class="fieldcontain">
					<span id="checkInDate-label" class="property-label"><g:message code="hotelOrder.checkInDate.label" default="Check In Date" /></span>
					
						<span class="property-value" aria-labelledby="checkInDate-label"><g:fieldValue bean="${hotelOrderInstance}" field="checkInDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotelOrderInstance?.checkInMonth}">
				<li class="fieldcontain">
					<span id="checkInMonth-label" class="property-label"><g:message code="hotelOrder.checkInMonth.label" default="Check In Month" /></span>
					
						<span class="property-value" aria-labelledby="checkInMonth-label"><g:fieldValue bean="${hotelOrderInstance}" field="checkInMonth"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotelOrderInstance?.children}">
				<li class="fieldcontain">
					<span id="children-label" class="property-label"><g:message code="hotelOrder.children.label" default="Children" /></span>
					
						<span class="property-value" aria-labelledby="children-label"><g:fieldValue bean="${hotelOrderInstance}" field="children"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotelOrderInstance?.expediaHotelId}">
				<li class="fieldcontain">
					<span id="expediaHotelId-label" class="property-label"><g:message code="hotelOrder.expediaHotelId.label" default="Expedia Hotel Id" /></span>
					
						<span class="property-value" aria-labelledby="expediaHotelId-label"><g:fieldValue bean="${hotelOrderInstance}" field="expediaHotelId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotelOrderInstance?.hcomHotelId}">
				<li class="fieldcontain">
					<span id="hcomHotelId-label" class="property-label"><g:message code="hotelOrder.hcomHotelId.label" default="Hcom Hotel Id" /></span>
					
						<span class="property-value" aria-labelledby="hcomHotelId-label"><g:fieldValue bean="${hotelOrderInstance}" field="hcomHotelId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotelOrderInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="hotelOrder.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:link controller="geoPoint" action="show" id="${hotelOrderInstance?.location?.id}">${hotelOrderInstance?.location?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotelOrderInstance?.nights}">
				<li class="fieldcontain">
					<span id="nights-label" class="property-label"><g:message code="hotelOrder.nights.label" default="Nights" /></span>
					
						<span class="property-value" aria-labelledby="nights-label"><g:fieldValue bean="${hotelOrderInstance}" field="nights"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotelOrderInstance?.pricePerNightUsd}">
				<li class="fieldcontain">
					<span id="pricePerNightUsd-label" class="property-label"><g:message code="hotelOrder.pricePerNightUsd.label" default="Price Per Night Usd" /></span>
					
						<span class="property-value" aria-labelledby="pricePerNightUsd-label"><g:fieldValue bean="${hotelOrderInstance}" field="pricePerNightUsd"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotelOrderInstance?.priceUsd}">
				<li class="fieldcontain">
					<span id="priceUsd-label" class="property-label"><g:message code="hotelOrder.priceUsd.label" default="Price Usd" /></span>
					
						<span class="property-value" aria-labelledby="priceUsd-label"><g:fieldValue bean="${hotelOrderInstance}" field="priceUsd"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotelOrderInstance?.starRating}">
				<li class="fieldcontain">
					<span id="starRating-label" class="property-label"><g:message code="hotelOrder.starRating.label" default="Star Rating" /></span>
					
						<span class="property-value" aria-labelledby="starRating-label"><g:fieldValue bean="${hotelOrderInstance}" field="starRating"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:hotelOrderInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${hotelOrderInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
