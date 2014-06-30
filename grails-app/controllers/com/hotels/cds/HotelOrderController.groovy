package com.hotels.cds



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import groovy.json.JsonBuilder;

@Transactional(readOnly = true)
class HotelOrderController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def hotelOrderService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		
		def res = hotelOrderService.search()
		
		
        respond res.searchResults, model:[hotelOrderInstanceCount: res.total]
    }

    def show(HotelOrder hotelOrderInstance) {
        respond hotelOrderInstance
    }

    def create() {
        respond new HotelOrder(params)
    }
	
    @Transactional
    def save(HotelOrder hotelOrderInstance) {
        if (hotelOrderInstance == null) {
            notFound()
            return
        }

        if (hotelOrderInstance.hasErrors()) {
            respond hotelOrderInstance.errors, view:'create'
            return
        }

        hotelOrderInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'hotelOrder.label', default: 'HotelOrder'), hotelOrderInstance.id])
                redirect hotelOrderInstance
            }
            '*' { respond hotelOrderInstance, [status: CREATED] }
        }
    }

    def edit(HotelOrder hotelOrderInstance) {
        respond hotelOrderInstance
    }

    @Transactional
    def update(HotelOrder hotelOrderInstance) {
        if (hotelOrderInstance == null) {
            notFound()
            return
        }

        if (hotelOrderInstance.hasErrors()) {
            respond hotelOrderInstance.errors, view:'edit'
            return
        }

        hotelOrderInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'HotelOrder.label', default: 'HotelOrder'), hotelOrderInstance.id])
                redirect hotelOrderInstance
            }
            '*'{ respond hotelOrderInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(HotelOrder hotelOrderInstance) {

        if (hotelOrderInstance == null) {
            notFound()
            return
        }

        hotelOrderInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'HotelOrder.label', default: 'HotelOrder'), hotelOrderInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

	def load() {
		hotelOrderService.loadHotelOrders()
		render "Loaded"
		
	}
	
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'hotelOrder.label', default: 'HotelOrder'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
}
