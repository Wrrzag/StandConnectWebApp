package com.standconnect.domain

import com.standconnect.domain.relationships.EventBusiness
import com.standconnect.domain.relationships.VisitorEvent



class Event {
	String name
	Date beginDate
	Date endDate
	String schedule
	String location
	int standNumber
	byte[] image
	
	static hasMany = [stands: Stand, eventBusiness: EventBusiness, visitorEvent: VisitorEvent]
	static belongsTo = [organizer: Organizer]
	
    static constraints = {
		image nullable: true, maxsize: 1024*1024
    }
	
	static mapping = {
		image type: 'image'
	}
	
	def getBasicInfo() {
		return [
			"id" : this.id, "name" :  this.name, "beginDate" : this.beginDate,
			"endDate" : this.endDate, "schedule" : this.schedule, 
			"location" : this.location, "image" : this.image,
			"organizer" : this.organizer.getBasicInfo()
		]
	}
	
	String toString() {
		return name
	}
}
