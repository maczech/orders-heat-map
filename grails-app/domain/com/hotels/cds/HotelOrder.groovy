package com.hotels.cds

class HotelOrder {

    static constraints = {
    }

	
	String checkInDate
	Integer checkInMonth
	String expediaHotelId
	String hcomHotelId
	Integer nights
	Integer adults
	Integer children
	Double priceUsd
	Double pricePerNightUsd
	Double starRating
	GeoPoint location
	
/*	Date checkInDate
	Long checkInMonth
	String expediaHotelId
	String hcomHotelId
	Long nights
	Long adults
	Long children
	Double priceUsd
	Double pricePerNightUsd
	Double starRating
	GeoPoint location*/
	
	static searchable = {
		location geoPoint: true, component: true
	}
}
