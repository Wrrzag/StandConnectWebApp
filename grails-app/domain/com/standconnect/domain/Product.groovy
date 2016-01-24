package com.standconnect.domain

import org.codehaus.groovy.grails.web.mapping.LinkGenerator

import com.standconnect.domain.relationships.BusinessTagProduct

class Product {
	static transient LinkGenerator grailsLinkGenerator
	
	String name
	String description
	String price
	byte[] image
	Date dateCreated
	
	static hasMany = [businessTagProduct: BusinessTagProduct]
	static belongsTo = [business: Business]
	
    static constraints = {
		image nullable: true, maxsize: 1024*1024
    }
	
	static mapping = {
		businessTagProduct cascade: 'all-delete-orphan'
		image type: 'image'
	}
	
	def getBasicInfo() {
		return [
			"id" : this.id, "name" : this.name, "description" : this.description,
			"price" : this.price, 
			"image" : this.image ? grailsLinkGenerator.link(controller: 'product', action: 'getProductImage', id: "${this.id}", absolute: true) : "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg",
			"business" : this.business.getBasicInfo()	
		]
	}
	
	String toString() {
		return name
	}
}
