package com.standconnect.controllers.rest

import com.standconnect.domain.Stand

class StandController {

	static namespace = 'api'
	static responseFormats = ['json', 'xml']
	
    def index() { 
		log.debug("REST petition on index method")
		log.debug("Params: ${params}") 
		
		if(params.eventId) {
			def eventId = params.eventId
			respond Stand.where {
	            event.id == eventId
	        }.list()
		}
		else {
			respond Stand.list()
		}
	}
	
	def show() {
		log.debug("REST petition on show method")
		log.debug("Params: ${params}")
		
		respond Stand.get(params.id)
	}
}
