
<%@ page import="com.hotels.cds.HotelOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
			<style>
		      html, body, #map-canvas {
		        height: 100%;
		        margin: 0px;
		        padding: 0px
		      }
      </style>
		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=visualization"></script>
		<script>
		var map, pointarray, heatmap;
		var taxiData = [
			<g:each in="${hotelOrderInstanceList}" status="i" var="hotelOrderInstance">
  				new google.maps.LatLng(${fieldValue(bean: hotelOrderInstance.location, field: "lon")},${fieldValue(bean: hotelOrderInstance.location, field: "lat")}),
  			</g:each>
  	  			];

		function initialize() {
		  var mapOptions = {
		    zoom: 13,
		    center: new google.maps.LatLng(51.5073,0.1276),
		    mapTypeId: google.maps.MapTypeId.SATELLITE
		  };

		  map = new google.maps.Map(document.getElementById('map-canvas'),
		      mapOptions);

		  var pointArray = new google.maps.MVCArray(taxiData);

		  heatmap = new google.maps.visualization.HeatmapLayer({
		    data: pointArray
		  });

		  heatmap.setMap(map);
		}
		google.maps.event.addDomListener(window, 'load', initialize);
  		</script>
		<g:set var="entityName" value="${message(code: 'hotelOrder.label', default: 'HotelOrder')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-hotelOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="map-canvas"></div>
		<div id="list-hotelOrder" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="adults" title="${message(code: 'hotelOrder.adults.label', default: 'Adults')}" />
					
						<g:sortableColumn property="checkInDate" title="${message(code: 'hotelOrder.checkInDate.label', default: 'Check In Date')}" />
					
						<g:sortableColumn property="checkInMonth" title="${message(code: 'hotelOrder.checkInMonth.label', default: 'Check In Month')}" />
					
						<g:sortableColumn property="children" title="${message(code: 'hotelOrder.children.label', default: 'Children')}" />
					
						<g:sortableColumn property="expediaHotelId" title="${message(code: 'hotelOrder.expediaHotelId.label', default: 'Expedia Hotel Id')}" />
					
						<g:sortableColumn property="hcomHotelId" title="${message(code: 'hotelOrder.hcomHotelId.label', default: 'Hcom Hotel Id')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${hotelOrderInstanceList}" status="i" var="hotelOrderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${hotelOrderInstance.id}">${fieldValue(bean: hotelOrderInstance, field: "adults")}</g:link></td>
					
						<td>${fieldValue(bean: hotelOrderInstance, field: "checkInDate")}</td>
					
						<td>${fieldValue(bean: hotelOrderInstance, field: "checkInMonth")}</td>
					
						<td>${fieldValue(bean: hotelOrderInstance, field: "children")}</td>
					
						<td>${fieldValue(bean: hotelOrderInstance, field: "expediaHotelId")}</td>
					
						<td>${fieldValue(bean: hotelOrderInstance, field: "hcomHotelId")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${hotelOrderInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
