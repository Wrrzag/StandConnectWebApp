package com.standconnect.services.rest

import grails.transaction.Transactional

import com.standconnect.domain.Beacon
import com.standconnect.domain.Business
import com.standconnect.domain.Event

@Transactional
class BusinessService {

	def relationshipService
	
	def list() {
		return Business.list().collect() {
			getBusinessInfo(it)
		}
	}
	
    def listByEventId(eventId) {
		def event = Event.get(eventId)
		if(!event) {
			log.debug("No event found with ID $eventId")
			return list()
		}
		
		return relationshipService.getBusinesses(event).collect() { getBusinessInfo(it) }
    }
	
	def listByBeaconId(beaconId) {
		def beacon = Beacon.get(beaconId)
		if(!beacon) {
			log.debug("No beacon found with ID $beaconId")
			return list()
		}
		
		return relationshipService.getBusinesses(beacon).collect() { getBusinessInfo(it) }
	}
	
	def get(id) {
		def business = Business.get(id)
		
		if(!business) {
			log.debug("No business found with ID $id")
			return
		}
		
		return getBusinessInfo(business)
	}
	
	private getBusinessInfo(Business business) {
		
		def beacons = relationshipService.getBeacons(business).collect() { it.getBasicInfo() }
		def stands = relationshipService.getStands(business).collect() { it.getBasicInfo() }
		def tags = relationshipService.getTags(business).collect() { it.getBasicInfo() }
		def products = business.products.collect() { it.getBasicInfo() }
		def events = relationshipService.getEvents(business).collect() { it.getBasicInfo() }
		
		def businessReturn = [:]
		businessReturn["id"] = business.id
		businessReturn["name"] = business.name
		businessReturn["description"] = business.description
		businessReturn["standNumber"] = business.standNumber
		businessReturn["image"] = business.image
		businessReturn["contact"] = business.contact
		businessReturn["phone"] = business.phone
		businessReturn["address"] = business.address
		businessReturn["beacons"] = beacons
		businessReturn["stands"] = stands
		businessReturn["tags"] = tags
		businessReturn["products"] = products
		businessReturn["events"] = events
		businessReturn["businessUser"] = business.businessUser.getBasicInfo()
		
		return businessReturn
	}
}
