package com.standconnect.domain

import com.standconnect.domain.relationships.BusinessTagProduct
import com.standconnect.domain.relationships.EventBusiness
import com.standconnect.domain.relationships.StandBeaconBusiness
import org.codehaus.groovy.grails.web.mapping.LinkGenerator



class Business {
	static transient LinkGenerator grailsLinkGenerator
	
	String name
	String description
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
		standBeaconBusiness cascade: 'all-delete-orphan'
		businessTagProduct cascade: 'all-delete-orphan'
		eventBusiness cascade: 'all-delete-orphan'
		image type: 'image'
	}
	
	def getBasicInfo() {
		return [
			'id' : this.id, 'name' : this.name, 'description' : this.description, 
			'image' : this.image ? grailsLinkGenerator.link(controller: 'business', action: 'getBusinessImage', id: "${this.id}", absolute: true) : "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg", 
			'contact' : this.contact, 'phone' : this.phone, 'address' : this.address
		]
	}
	
	String toString() {
		return name
	}
}
