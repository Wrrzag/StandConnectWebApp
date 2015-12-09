package com.standconnect.controllers.rest

class BusinessController {

	static namespace = 'api'
	static responseFormats = ['json', 'xml']
	
	def businessService
	
    def index() {
		log.debug("REST petition on index method")
		log.debug("Params: ${params}")
		
		if(params.eventId) {
			respond businessService.listByEventId(params.eventId)
		}
		else if(params.beaconId) {
			respond businessService.listByBeaconId(params.beaconId)
		}
		else {
			respond businessService.list()
		}
	}
	
	def show() {
		log.debug("REST petition on show method")
		log.debug("Params: ${params}")
		
		respond businessService.get(params.id)
	}
}
