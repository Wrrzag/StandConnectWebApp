package com.standconnect.domain

import org.codehaus.groovy.grails.web.mapping.LinkGenerator

import com.standconnect.domain.relationships.StandBeaconBusiness

class Stand {
	static transient LinkGenerator grailsLinkGenerator
	def relationshipService
	
	String name
	int number
	byte[] image
	
	static hasMany = [standBeaconBusiness: StandBeaconBusiness]
	static belongsTo = [event: Event]
	
    static constraints = {
		image nullable: true, maxsize: 1024*1024
	}
	
	static mapping = {
		standBeaconBusiness cascade: 'all-delete-orphan'
		image type: 'image'
	}
	
	def getBasicInfo() {
		return [
			"id" : this.id, "name" : this.name, "number" : this.number, 
			"image" : this.image ? grailsLinkGenerator.link(controller: 'stand', action: 'getStandImage', id: "${this.id}", absolute: true) : "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg", 
			"event" : this.event.getBasicInfo(), 
			"businesses" : this.standBeaconBusiness.business ? this.standBeaconBusiness.business?.flatten()?.unique()*.getBasicInfo() : []
		]
	}
	
	def getBasicInfoWithBusiness() {
		def info = getBasicInfo()
		info["business"] = relationshipService.getBusinesses(this)[0].getBasicInfo()
		
		return info
	}
	
	String toString() {
		return name
	}
}
