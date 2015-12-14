package com.standconnect.domain

import com.standconnect.domain.relationships.BusinessTagProduct
import com.standconnect.domain.relationships.VisitorEventTag


class Tag {
	String name
	
	static hasMany = [businessTagProduct: BusinessTagProduct, visitorEventTag: VisitorEventTag]
	
    static constraints = {
    }
	
	def getBasicInfo() {
		return [
			"id" : this.id, "name" : this.name	
		]
	}
	
	String toString() {
		return name
	}
}
