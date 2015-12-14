package com.standconnect.controllers.rest

class ProductController {

	static namespace = 'api'
	static responseFormats = ['json', 'xml']
	
    def productService
	
    def index() {
		log.debug("REST petition on index method")
		log.debug("Params: ${params}")
		
		if(params.eventId) {
			log.debug("Petition coming from an Event")
			respond productService.listByEventId(params.eventId)
		}
		else {
			log.debug("Standalone petition")
			respond productService.list()
		}
	}
	
	def show() {
		log.debug("REST petition on show method")
		log.debug("Params: ${params}")
		
		if(params.eventId) {
			log.debug("Petition coming from an Event")
			respond productService.getByEventId(params.id, params.eventId)
		}
		else {
			log.debug("Standalone petition")
			respond productService.get(params.id)
		}
	}
}
