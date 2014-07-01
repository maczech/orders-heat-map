package com.hotels.cds

class HotelOrder {

    static constraints = {
    }

	
/*	String checkInDate
	Integer checkInMonth
	String expediaHotelId
	String hcomHotelId
	Integer nights
	Integer adults
	Integer children
	Double priceUsd
	Double pricePerNightUsd
	Double starRating
	GeoPoint location*/
	
	Integer month
	String expediaHotelId
	String hcomHotelId
	Integer nightsStayed
	//Integer adults
	Integer childrenStayed
	Double priceUsd
	Integer orders
	//Double pricePerNightUsd
	Double starRating
	String pos
	GeoPoint location

	static searchable = {
		location geoPoint: true, component: true
	}
}
