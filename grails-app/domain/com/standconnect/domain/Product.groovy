package com.standconnect.domain

import com.standconnect.domain.relationships.BusinessTagProduct

class Product {

	String name
	String description
	String price
	byte[] image
	
	static hasMany = [businessTagProduct: BusinessTagProduct]
	
    static constraints = {
		image nullable: true//, maxsize:
    }
}
