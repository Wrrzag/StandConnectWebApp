package com.standconnect.domain

import com.standconnect.domain.relationships.EventBusiness
import com.standconnect.domain.relationships.VisitorEvent
import com.standconnect.domain.relationships.VisitorEventTag



class Event {
	String name
	Date beginDate
	Date endDate
	String schedule
	String location
	byte[] image
	
	static hasMany = [/*visitorEventTag: VisitorEventTag, */stands: Stand, eventBusiness: EventBusiness, visitorEvent: VisitorEvent]
	static belongsTo = [organizer: Organizer]
	
    static constraints = {
		image nullable: true//, maxsize: 
    }
}
