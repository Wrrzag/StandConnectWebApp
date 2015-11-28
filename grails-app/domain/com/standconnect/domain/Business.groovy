package com.standconnect.domain

import com.standconnect.domain.relationships.BusinessTagProduct
import com.standconnect.domain.relationships.EventBusiness
import com.standconnect.domain.relationships.StandBeaconBusiness



class Business {

	String name
	String description
	int standNumber
	byte[] image
	String contact
	String phone
	String address
	
	static hasMany = [standBeaconBusiness: StandBeaconBusiness, businessTagProduct: BusinessTagProduct, eventBusiness: EventBusiness]
	static belongsTo = [businessUser: BusinessUser]
	
    static constraints = {
		image nullable: true//, maxsize:s
    }
}
