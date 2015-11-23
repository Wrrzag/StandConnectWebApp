package com.standconnect.domain

import com.standconnect.domain.relationships.BusinessTagProduct
import com.standconnect.domain.relationships.VisitorEventTag


class Tag {
	String Name
	
	static hasMany = [businessTagProduct: BusinessTagProduct, visitorEventTag: VisitorEventTag]
	
    static constraints = {
    }
}
