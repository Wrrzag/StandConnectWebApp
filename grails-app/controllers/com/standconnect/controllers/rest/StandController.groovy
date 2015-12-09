package com.standconnect.controllers.rest

import com.standconnect.domain.Stand

class StandController {

	static namespace = 'api'
	static responseFormats = ['json', 'xml']
	
	def standService
	
    def index() { 
		log.debug("REST petition on index method")
		log.debug("Params: ${params}") 
		
		if(params.eventId) {
			respond standService.listByEventId(params.eventId)
		}
		else if(params.beaconId) {
			respond standService.listByBeaconId(params.beaconId)
		}
		else {
			respond Stand.list()
		}
	}
	
	def show() {
		log.debug("REST petition on show method")
		log.debug("Params: ${params}")
		
		respond standService.get(params.id)
	}
}
