package com.standconnect.domain

import com.standconnect.domain.relationships.BusinessTagProduct

class Product {

	String name
	String description
	String price
	byte[] image
	
	static hasMany = [businessTagProduct: BusinessTagProduct]
	static belongsTo = [business: Business]
	
    static constraints = {
		image nullable: true//, maxsize:
    }
	
	def getBasicInfo() {
		return [
			"id" : this.id, "name" : this.name, "description" : this.description,
			"price" : this.price, "image" : this.image, "business" : this.business.getBasicInfo()	
		]
	}
	
	String toString() {
		return name
	}
}
