package com.standconnect.domain

import com.standconnect.security.SecUser

class BusinessUser extends SecUser {

	static hasMany = [businesses: Business]
	
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
