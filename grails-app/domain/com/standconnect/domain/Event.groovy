package com.standconnect.domain

import org.codehaus.groovy.grails.web.mapping.LinkGenerator

import com.standconnect.domain.relationships.EventBusiness
import com.standconnect.domain.relationships.VisitorEvent



class Event {
	static transient LinkGenerator grailsLinkGenerator
	
	String name
	Date beginDate
	Date endDate
	String schedule
	String location
	int standNumber
	byte[] image
	Date dateCreated
	
	static hasMany = [stands: Stand, eventBusiness: EventBusiness, visitorEvent: VisitorEvent]
	static belongsTo = [organizer: Organizer]
	
    static constraints = {
		image nullable: true, maxsize: 1024*1024
    }
	
	static mapping = {
		eventBusiness cascade: 'all-delete-orphan'
		visitorEvent cascade: 'all-delete-orphan'
		image type: 'image'
	}
	
	def getBasicInfo() {
		return [
			"id" : this.id, "name" :  this.name, "beginDate" : this.beginDate,
			"endDate" : this.endDate, "schedule" : this.schedule, 
			"location" : this.location, "image" : this.image ? grailsLinkGenerator.link(controller: 'event', action: 'getEventImage', id: "${this.id}", absolute: true) : "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg",
			"organizer" : this.organizer.getBasicInfo()
		]
	}
	
	String toString() {
		return name
	}
}
