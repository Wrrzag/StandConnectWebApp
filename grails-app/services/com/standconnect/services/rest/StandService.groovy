package com.standconnect.services.rest

import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.mapping.LinkGenerator

import com.standconnect.domain.Beacon
import com.standconnect.domain.Event
import com.standconnect.domain.Stand

@Transactional
class StandService {

	LinkGenerator grailsLinkGenerator
	def relationshipService
	
    def list() {
		return Stand.collect() {
			getStandInfo(it)
		}
    }
	
	def listByEventId(eventId) {
		def event = Event.get(eventId)
		if(!event) {
			log.debug("No event found with ID $eventId")
			return list()
		}
		
		return event.stands.collect() { getStandInfo(it) }
	}
	
	def listByBeaconId(beaconId) {
		def beacon = Beacon.get(beaconId)
		if(!beacon) {
			log.debug("No beacon found with ID $beaconId")
			return list()
		}
		
		return relationshipService.getStands(beacon).collect() { getStandInfo(it) }
	}
	
	def get(id) {
		def stand = Stand.get(id)
		
		if(!stand) {
			log.debug("No stand found with ID $id")
			return
		}
		
		return getStandInfo(stand)
	}
	
	private getStandInfo(Stand stand) {
		def businesses = relationshipService.getBusinesses(stand).collect() { it.getBasicInfo() }
		def beacons = relationshipService.getBeacons(stand).collect() { it.getBasicInfo() }
		
		def standReturn = [:]
		standReturn["id"] = stand.id
		standReturn["name"] = stand.name
		standReturn["number"] = stand.number
		standReturn["image"] = stand.image ? grailsLinkGenerator.link(controller: 'stand', action: 'getStandImage', id: "${stand.id}", absolute: true) : "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
		standReturn["businesses"] = businesses
		standReturn["beacons"] = beacons
		standReturn["event"] = stand.event.getBasicInfo()
		
		return standReturn
	}
}
