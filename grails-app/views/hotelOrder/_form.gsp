<%@ page import="com.hotels.cds.HotelOrder" %>



<div class="fieldcontain ${hasErrors(bean: hotelOrderInstance, field: 'adults', 'error')} required">
	<label for="adults">
		<g:message code="hotelOrder.adults.label" default="Adults" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="adults" type="number" value="${hotelOrderInstance.adults}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: hotelOrderInstance, field: 'checkInDate', 'error')} required">
	<label for="checkInDate">
		<g:message code="hotelOrder.checkInDate.label" default="Check In Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="checkInDate" required="" value="${hotelOrderInstance?.checkInDate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: hotelOrderInstance, field: 'checkInMonth', 'error')} required">
	<label for="checkInMonth">
		<g:message code="hotelOrder.checkInMonth.label" default="Check In Month" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="checkInMonth" type="number" value="${hotelOrderInstance.checkInMonth}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: hotelOrderInstance, field: 'children', 'error')} required">
	<label for="children">
		<g:message code="hotelOrder.children.label" default="Children" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="children" type="number" value="${hotelOrderInstance.children}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: hotelOrderInstance, field: 'expediaHotelId', 'error')} required">
	<label for="expediaHotelId">
		<g:message code="hotelOrder.expediaHotelId.label" default="Expedia Hotel Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="expediaHotelId" required="" value="${hotelOrderInstance?.expediaHotelId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: hotelOrderInstance, field: 'hcomHotelId', 'error')} required">
	<label for="hcomHotelId">
		<g:message code="hotelOrder.hcomHotelId.label" default="Hcom Hotel Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="hcomHotelId" required="" value="${hotelOrderInstance?.hcomHotelId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: hotelOrderInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="hotelOrder.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="location" name="location.id" from="${com.hotels.cds.GeoPoint.list()}" optionKey="id" required="" value="${hotelOrderInstance?.location?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: hotelOrderInstance, field: 'nights', 'error')} required">
	<label for="nights">
		<g:message code="hotelOrder.nights.label" default="Nights" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nights" type="number" value="${hotelOrderInstance.nights}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: hotelOrderInstance, field: 'pricePerNightUsd', 'error')} required">
	<label for="pricePerNightUsd">
		<g:message code="hotelOrder.pricePerNightUsd.label" default="Price Per Night Usd" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pricePerNightUsd" value="${fieldValue(bean: hotelOrderInstance, field: 'pricePerNightUsd')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: hotelOrderInstance, field: 'priceUsd', 'error')} required">
	<label for="priceUsd">
		<g:message code="hotelOrder.priceUsd.label" default="Price Usd" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="priceUsd" value="${fieldValue(bean: hotelOrderInstance, field: 'priceUsd')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: hotelOrderInstance, field: 'starRating', 'error')} required">
	<label for="starRating">
		<g:message code="hotelOrder.starRating.label" default="Star Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="starRating" value="${fieldValue(bean: hotelOrderInstance, field: 'starRating')}" required=""/>

</div>

