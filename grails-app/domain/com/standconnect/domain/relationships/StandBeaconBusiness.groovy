package com.standconnect.domain.relationships

import com.standconnect.domain.Beacon
import com.standconnect.domain.Business
import com.standconnect.domain.Stand

class StandBeaconBusiness {
	
	Stand stand
	Beacon beacon
	Business business
	
    static constraints = {
    }
}
