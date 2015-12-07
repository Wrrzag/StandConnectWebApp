package com.standconnect.domain

import com.standconnect.domain.relationships.StandBeaconBusiness

class Stand {

	String name
	int number
	
	static hasMany = [standBeaconBusiness: StandBeaconBusiness]
	static belongsTo = [event: Event]
	
    static constraints = {
    }
	
	def getBasicInfo() {
		return [
			"id" : this.id, "name" : this.name, "number" : this.number
		]
	}
}
