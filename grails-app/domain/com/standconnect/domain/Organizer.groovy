package com.standconnect.domain

import com.standconnect.security.SecUser

class Organizer extends SecUser {
	
	static hasMany = [events: Event]
	
    static constraints = {
		address blank: false, nullable: false
		city blank: false, nullable: false
		postalCode blank: false, nullable: false
		gender nullable: false
    }
}
