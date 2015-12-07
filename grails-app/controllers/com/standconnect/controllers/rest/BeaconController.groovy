package com.standconnect.controllers.rest

class BeaconController {

	static namespace = 'api'
	static responseFormats = ['json', 'xml']
	
	def beaconService
	
    def index() {
		log.debug("REST petition on index method")
		log.debug("Params: ${params}")
		
		if(params.eventId) {
			respond beaconService.listByEventId(params.eventId)
		}
		else {
			respond beaconService.list()
		}
	}
	
	def show() {
		log.debug("REST petition on show method")
		log.debug("Params: ${params}")
		
		respond beaconService.get(params.id)
	}
}
