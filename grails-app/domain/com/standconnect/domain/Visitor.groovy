package com.standconnect.domain

import com.standconnect.domain.relationships.VisitorEvent
import com.standconnect.domain.relationships.VisitorEventTag
import com.standconnect.security.SecUser

class Visitor extends SecUser {

	static hasMany = [/*visitorEventTag: VisitorEventTag, */visitorEvent: VisitorEvent]
	
    static constraints = {
		address blank: false, nullable: false
		city blank: false, nullable: false
		postalCode blank: false, nullable: false
		gender nullable: false
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
