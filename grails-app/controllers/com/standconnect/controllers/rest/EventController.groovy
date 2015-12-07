package com.standconnect.controllers.rest


class EventController {

	static namespace = 'api'
	static responseFormats = ['json', 'xml']
	
	def eventService
	
    def index() {
		log.debug("REST petition on index method")
		log.debug("Params: ${params}")
		
		respond eventService.list(params)
	}
	
	def show() {
		log.debug("REST petition on show method")
		log.debug("Params: ${params}")
		
		respond eventService.get(params.id)
	}
}
