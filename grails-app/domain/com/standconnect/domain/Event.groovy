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
	
	def getBasicInfo() {
		return [
			"id" : this.id, "name" :  this.name, "beginDate" : this.beginDate,
			"endDate" : this.endDate, "schedule" : this.schedule, 
			"location" : this.location, "image" : this.image,
			"organizer" : this.organizer.getBasicInfo()
		]
	}
}
