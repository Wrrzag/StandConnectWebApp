package com.standconnect.domain

import com.standconnect.domain.relationships.StandBeaconBusiness

class Beacon {
	String name
	String mac
	
	static hasMany = [standBeaconBusiness: StandBeaconBusiness]
	
    static constraints = {
    }
}
