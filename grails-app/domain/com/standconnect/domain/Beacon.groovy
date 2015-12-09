package com.standconnect.domain

import com.standconnect.domain.relationships.StandBeaconBusiness

class Beacon {
	def relationshipService
	
	String name
	String mac
	
	static hasMany = [standBeaconBusiness: StandBeaconBusiness]
	
    static constraints = {
    }
	
	def getBasicInfo() {
		return [
			"id" : this.id, "name" : this.name, "mac" : this.mac
		]
	}
	
	def getBasicInfoWithStand() {
		def info = getBasicInfo()
		info["stand"] = relationshipService.getStands(this)[0].getSimpleInfoWithBusiness() 
		
		return info
	}
}
