package com.standconnect.domain

import com.standconnect.domain.relationships.StandBeaconBusiness

class Stand {
	def relationshipService
	
	String name
	int number
	byte[] image
	
	static hasMany = [standBeaconBusiness: StandBeaconBusiness]
	static belongsTo = [event: Event]
	
    static constraints = {
		image nullable: true//, maxsize:s
    }
	
	def getBasicInfo() {
		return [
			"id" : this.id, "name" : this.name, "number" : this.number, 
			"image" : this.image, "event" : this.event.getBasicInfo()
		]
	}
	
	def getBasicInfoWithBusiness() {
		def info = getBasicInfo()
		info["business"] = relationshipService.getBusinesses(this)[0].getBasicInfo()
		
		return info
	}
	
	String toString() {
		return name
	}
}
