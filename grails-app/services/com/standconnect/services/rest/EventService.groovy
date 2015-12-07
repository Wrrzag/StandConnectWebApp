package com.standconnect.services.rest

import java.util.Date;

import grails.transaction.Transactional

import com.standconnect.domain.Event
import com.standconnect.security.SecUser.Gender;

@Transactional
class EventService {

	def relationshipService 
	
    def list(params) {
		return Event.collect() {
			getEventInfo(it)
		}
    }
	
	def get(id) {
		def event = Event.get(id)
		
		if(!event) {
			log.debug("No event found with ID $id")
			return
		}
		
		return getEventInfo(event)
	}
	
	private getEventInfo(Event event) {
		
		def stands = event.stands.collect(){ it.getBasicInfo() }
		def businesses = relationshipService.getBusinesses(event).collect(){ it.getBasicInfo() }
		def visitors = relationshipService.getVisitors(event).collect(){ it.getBasicInfo() }
		
		def eventReturn = [:]
		eventReturn["id"] = event.id
		eventReturn["name"] = event.name
		eventReturn["beginDate"] = event.beginDate
		eventReturn["endDate"] = event.endDate
		eventReturn["schedule"] = event.schedule
		eventReturn["location"] = event.location
		eventReturn["image"] = event.image
		eventReturn["organizer"] = event.organizer.getBasicInfo()
		eventReturn["stands"] = stands
		eventReturn["businesses"] = businesses
		eventReturn["visitors"] = visitors
		
		return eventReturn
	}
}
