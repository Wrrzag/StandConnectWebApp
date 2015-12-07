package com.standconnect.controllers.rest

class BusinessController {

	static namespace = 'api'
	static responseFormats = ['json', 'xml']
	
    def index() {
		log.debug("REST petition on index method")
		log.debug("Params: ${params}")
		
	}
	
	def show() {
		log.debug("REST petition on show method")
		log.debug("Params: ${params}")
		
	}
}
