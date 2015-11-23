package com.standconnect.domain

import com.standconnect.domain.relationships.BusinessTagProduct

class Product {

	String name
	String description
	double price
	// ?? image
	
	static hasMany = [businessTagProduct: BusinessTagProduct]
	
    static constraints = {
    }
}
