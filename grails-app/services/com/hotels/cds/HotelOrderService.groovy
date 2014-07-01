package com.hotels.cds

import java.util.ArrayList;

import com.hotels.hermes.searchapp.hotelsearch.area.AreaDefinition;
import com.hotels.hermes.searchapp.hotelsearch.area.GeoRectangle
import com.hotels.hermes.searchapp.hotelsearch.data.HotelOrderDetails
import com.hotels.hermes.searchapp.hotelsearch.data.HotelSearchQuery
import com.hotels.hermes.searchapp.hotelsearch.service.HotelSearchService
//import com.hotels.hermes.searchapp.hotelsearch.area.AreaDefinitionSupport;
import com.hotels.hermes.searchapp.hotelsearch.area.Coordinate;
import com.hcomemea.common.area.data.DestinationLocation;
import com.hcomemea.common.area.data.Rectangle;
import com.hcomemea.common.area.domain.Destination;
import com.hcomemea.common.hotel.service.CreateAreaDefinitionSupport
import com.hcomemea.common.hotel.service.impl.CreateAreaDefinitionSupportImpl
import groovyx.net.http.*
//import com.hotels.cds.services.HotelSearchQuery;




import grails.transaction.Transactional
import groovy.json.JsonSlurper

@Transactional
class HotelOrderService {
	def grailsApplication
	def elasticSearchService
	def elasticSearchAdminService
	CreateAreaDefinitionSupport areaDefinitionSupport = new CreateAreaDefinitionSupportImpl();
	def hotelSearchService
	def jsonSlurper = new JsonSlurper();
	
	
    def loadHotelOrders() {
		def ordersFile = grailsApplication.mainContext.getResource("hotels-in-london.2.json").file
		int i =0;
		//elasticSearchAdminService.deleteIndex();
		ordersFile.eachLine{line->
			def orderJson = jsonSlurper.parseText(line)
			def geoPoint =new GeoPoint();
			geoPoint.lat = orderJson["latitude"]
			geoPoint.lon = orderJson["longitude"]
			geoPoint.save(failOnError: true)
			
			HotelOrder order = new HotelOrder()
			order.location = geoPoint
			order.hcomHotelId = orderJson.hcomHotelId
			order.expediaHotelId = orderJson.expediaHotelId
			order.month = orderJson.month
			order.starRating = orderJson.starRating
			order.orders = orderJson.orders
			order.priceUsd = orderJson.priceUsd
			order.nightsStayed = orderJson.nightsStayed
			order.childrenStayed = orderJson.childrenStayed
			order.pos = "0"
			
			order.save(failOnError: true)
			i++
			elasticSearchService.index(order)
			println(i)
			
			/*	{"hcomHotelId":"163531","expediaHotelId":"16008","month":4,
			 "starRating":4.0,"longitude":-0.19349,
			 "latitude":51.5135,"orders":50,"priceUsd":29656.303,"nightsStayed":154,"childrenStayed":4}*/
		}
		
		ordersFile = grailsApplication.mainContext.getResource("hotels-by-pos.1.json").file
		i =0;
		//elasticSearchAdminService.deleteIndex();
		ordersFile.eachLine{line->
			def orderJson = jsonSlurper.parseText(line)
			def geoPoint =new GeoPoint();
			geoPoint.lat = orderJson["latitude"]
			geoPoint.lon = orderJson["longitude"]
			geoPoint.save(failOnError: true)
			
			HotelOrder order = new HotelOrder()
			order.location = geoPoint
			order.hcomHotelId = orderJson.hcomHotelId
			order.expediaHotelId = orderJson.expediaHotelId
			order.month = orderJson.month
			order.starRating = orderJson.starRating
			order.orders = orderJson.orders
			order.priceUsd = orderJson.priceUsd
			order.nightsStayed = orderJson.nightsStayed
			order.childrenStayed = orderJson.childrenStayed
			order.pos = orderJson.pos
			
			order.save(failOnError: true)
			i++
			elasticSearchService.index(order)
			println(i)
			
			/*	{"hcomHotelId":"163531","expediaHotelId":"16008","month":4,
			 "starRating":4.0,"longitude":-0.19349,
			 "latitude":51.5135,"orders":50,"priceUsd":29656.303,"nightsStayed":154,"childrenStayed":4}*/
		}
		
		elasticSearchAdminService.refresh()
	}
	
	def getHotelsByGeoRange(top,left,bottom,right) {

		Coordinate bottomRight = new Coordinate(bottom.toDouble(), right.toDouble());
		Coordinate topLeft = new Coordinate(top.toDouble(), left.toDouble());
		GeoRectangle rectangle = new GeoRectangle(topLeft,bottomRight);
		
		def query = new HotelSearchQuery(false, new ArrayList<Long>());
		query.setAreaDefinition(rectangle);
		// Set<HotelOrderDetails> matchingHotels = hotelSearchService.findHotels(query).getMatchingHotels();
		 def matchingHotels = hotelSearchService.findHotels(query).getMatchingHotels();
		 def hotelPointList  = []
		 matchingHotels.each {hotel ->
			 def coordinate = hotel.getCoordinate()
			 GeoPoint location = new GeoPoint()
			 location.lon = coordinate.longitude
			 location.lat = coordinate.latitude
			 location.id = hotel.hotelId
			 hotelPointList+=location
		 }

		 
		 return hotelPointList
	}
	
	def getHotelDetails(hotelId) {
		try {
			def json = new JsonSlurper().parseText( new URL( "http://hcom-pcs.ch.expeso.com/property_catalogue_svc/v1/property/${hotelId}?view=summary" ).text )
			def hotelPoint = new HotelPoint()
			hotelPoint.name=json.name
			if (json.imageReferences != null && json.imageReferences.size() >0) {
				hotelPoint.imageUrl="http://exp.cdn-hotels.com/"+json.imageReferences[0].url
			}
			return hotelPoint
		} catch(e) {
			println e
		}

	}
	
	def search() {
		def res = HotelOrder.search("checkInMonth:6", [size:200000])
//		def res = HotelOrder.search("", [size:200000])
		return res;
	}
	/*{"checkInDate":"2013-06-29T16:00:00.000+0000","checkInMonth":6,"expediaHotelId":"1097700","hcomHotelId":"341205",
	 "nights":3,"adults":2,"children":0,"priceUsd":547.7979,"pricePerNightUsd":182.5993,"latitude":-0.17333,"longitude":51.51619,"starRating":3.0}
	 */
}
