package com.hotels.cds

import grails.transaction.Transactional
import groovy.json.JsonSlurper

@Transactional
class HotelOrderService {
	def grailsApplication
	def elasticSearchService
	def elasticSearchAdminService
	def jsonSlurper = new JsonSlurper();
	
    def loadHotelOrders() {
		def ordersFile = grailsApplication.mainContext.getResource("orders_in_london.json").file
		int i =0;
		ordersFile.eachLine{line->
			def orderJson = jsonSlurper.parseText(line)
			def geoPoint =new GeoPoint();
			geoPoint.lat = orderJson["latitude"]
			geoPoint.lon = orderJson["longitude"]
			geoPoint.save(failOnError: true)
			
			HotelOrder order = new HotelOrder()
			order.location = geoPoint
			order.adults = orderJson.adults
			order.checkInDate = orderJson.checkInDate
			order.checkInMonth = orderJson.checkInMonth
			order.expediaHotelId = orderJson.expediaHotelId
			order.hcomHotelId = orderJson.hcomHotelId
			order.nights = orderJson.nights
			order.children = orderJson.children
			order.priceUsd = orderJson.priceUsd
			order.pricePerNightUsd = orderJson.pricePerNightUsd
			order.starRating = orderJson.starRating
			
			order.save(failOnError: true)
			i++
			elasticSearchService.index(order)
			println(i)
		}
		elasticSearchAdminService.refresh()
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
