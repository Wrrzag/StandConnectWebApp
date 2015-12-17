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
	
	static hasMany = [beacon: Beacon, standBeaconBusiness: StandBeaconBusiness, businessTagProduct: BusinessTagProduct, eventBusiness: EventBusiness, products: Product]
	static belongsTo = [businessUser: BusinessUser]
	
    static constraints = {
		image nullable: true, maxsize: 1024*1024
    }
	
	static mapping = {
		image type: 'image'
	}
	
	def getBasicInfo() {
		return [
			'id' : this.id, 'name' : this.name, 'description' : this.description, 
			'standNumber' : this.standNumber, 'image' : this.image, 
			'contact' : this.contact, 'phone' : this.phone, 'address' : this.address
		]
	}
	
	String toString() {
		return name
	}
}
