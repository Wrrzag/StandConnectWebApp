package com.standconnect.domain

import com.standconnect.domain.relationships.StandBeaconBusiness

class Stand {
	def relationshipService
	
	String name
	int number
	
	static hasMany = [standBeaconBusiness: StandBeaconBusiness]
	static belongsTo = [event: Event]
	
    static constraints = {
    }
	
	def getBasicInfo() {
		return [
			"id" : this.id, "name" : this.name, "number" : this.number, 
			"event" : this.event.getBasicInfo()
		]
	}
	
	def getBasicInfoWithBusiness() {
		def info = getBasicInfo()
		info["business"] = relationshipService.getBusinesses(this)[0].getBasicInfo()
		
		return info
	}
}
