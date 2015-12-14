package com.standconnect.controllers.rest

class TagController {

	static namespace = 'api'
	static responseFormats = ['json', 'xml']
	
    def tagService
	
    def index() {
		log.debug("REST petition on index method")
		log.debug("Params: ${params}")
		
		if(params.eventId) {
			log.debug("Petition coming from an Event")
			respond tagService.listByEventId(params.eventId)
		}
		else {
			log.debug("Standalone petition")
			respond tagService.list()
		}
	}
	
	def show() {
		log.debug("REST petition on show method")
		log.debug("Params: ${params}")
		
		if(params.eventId) {
			log.debug("Petition coming from an Event")
			respond tagService.getByEventId(params.id, params.eventId)
		}
		else {
			log.debug("Standalone petition")
			respond tagService.get(params.id)
		}
	}
}
