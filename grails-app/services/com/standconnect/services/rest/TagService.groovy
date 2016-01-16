package com.standconnect.services.rest

import grails.transaction.Transactional

import com.standconnect.domain.Event
import com.standconnect.domain.Tag

@Transactional
class TagService {

    def relationshipService
	
	def list() {
		return Tag.list().collect() {
			//getTagInfo(it)
			['id': it.id, 'name': it.name]
		}
	}
	
    def listByEventId(eventId) {
		def event = Event.get(eventId)
		if(!event) {
			log.debug("No event found with ID $eventId")
			return list()
		}
		
		return relationshipService.getTags(event).collect() { /*getTagInfo(it)*/['id': it.id, 'name': it.name] }
    }
	
	def get(id) {
		def tag = Tag.get(id)
		
		if(!tag) {
			log.debug("No tag found with ID $id")
			return
		}
		
		return getTagInfo(tag)
	}
	
	def getByEventId(id, eventId) {
		def tag = Tag.get(id)
		
		if(!tag) {
			log.debug("No tag found with ID $id")
			return
		}
		
		return getTagInfo(tag)
	}
	
	private getTagInfo(Tag tag) {
		
		def businesses = relationshipService.getBusinesses(tag).collect() { it.getBasicInfo() }
		def products = relationshipService.getProducts(tag).collect() { it.getBasicInfo() }
//		def visitors = relationshipService.getVisitors(tag).collect() { it.getBasicInfo() }
		def events = relationshipService.getEvents(tag).collect() { it.getBasicInfo() }
//		def beacons = relationshipService.getBeacons(tag).collect() { it.getBasicInfo() }
		
		def tagReturn = [:]
		tagReturn["id"] = tag.id
		tagReturn["name"] = tag.name
		tagReturn["business"] = businesses
		tagReturn["products"] = products
//		tagReturn["visitors"] = visitors
//		tagReturn["beacons"] = beacons
		tagReturn["events"] = events
		
		return tagReturn
	}
}
