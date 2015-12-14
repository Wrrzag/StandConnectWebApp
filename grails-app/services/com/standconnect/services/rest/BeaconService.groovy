package com.standconnect.services.rest

import grails.transaction.Transactional

import com.standconnect.domain.Beacon
import com.standconnect.domain.Event

@Transactional
class BeaconService {

	def relationshipService
	
    def list() {
		return Beacon.list().collect() {
			getBeaconInfo(it)
		}
    }
	
	def listByEventId(eventId) {
		def event = Event.get(eventId)
		if(!event) {
			log.debug("No event found with ID $eventId")
			return list()
		}
		
		return relationshipService.getBeacons(event).collect() {
			getBeaconInfo(it, true)
		}
	}
	
	def get(id) {
		def beacon = Beacon.get(id)
		
		if(!beacon) {
			log.debug("No beacon found with ID $id")
			return 
		}
		
		return getBeaconInfo(beacon)
	}
	
	def getByEventId(id, eventId) {
		def beacon = Beacon.get(id)
		
		if(!beacon) {
			log.debug("No beacon found with ID $id")
			return
		}
		
		return getBeaconInfo(beacon, true)
	}
	
	private getBeaconInfo(Beacon beacon, standsWithBusinessInfo = false) {
		log.debug("Add business info to the stands: $standsWithBusinessInfo")
		
		def businesses = relationshipService.getBusinesses(beacon)
		def stands = relationshipService.getStands(beacon)
		
		def businessList = businesses.collect() { it.getBasicInfo() }
		def standList = stands.collect() { standsWithBusinessInfo ? it.getBasicInfoWithBusiness() : it.getBasicInfo() }[0]
		
		def beaconReturn = [:]
		beaconReturn['id'] = beacon.id
		beaconReturn['name'] = beacon.name
		beaconReturn['mac'] = beacon.mac
		if(!standsWithBusinessInfo) beaconReturn['business'] = businessList
		beaconReturn['stand'] = standList
		
		return beaconReturn
	}
}
