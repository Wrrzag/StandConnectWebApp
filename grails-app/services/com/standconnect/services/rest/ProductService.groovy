package com.standconnect.services.rest

import org.codehaus.groovy.grails.web.mapping.LinkGenerator;

import grails.transaction.Transactional

import com.standconnect.domain.Event
import com.standconnect.domain.Product

@Transactional
class ProductService {

	LinkGenerator grailsLinkGenerator
    def relationshipService
	
	def list() {
		return Product.list().collect() {
			getProductInfo(it)
		}
	}
	
    def listByEventId(eventId) {
		def event = Event.get(eventId)
		if(!event) {
			log.debug("No event found with ID $eventId")
			return list()
		}
		
		return relationshipService.getProducts(event).collect() { getProductInfo(it) }
    }
	
	def get(id) {
		def product = Product.get(id)
		
		if(!product) {
			log.debug("No product found with ID $id")
			return
		}
		
		return getProductInfo(product)
	}
	
	def getByEventId(id, eventId) {
		def product = Product.get(id)
		
		if(!product) {
			log.debug("No product found with ID $id")
			return
		}
		
		return getProductInfo(product)
	}
	
	private getProductInfo(Product product) {
		
		def business = product.business.getBasicInfo() 
		def tags = relationshipService.getTags(product).collect() { it.getBasicInfo() }
		
		def productReturn = [:]
		productReturn["id"] = product.id
		productReturn["name"] = product.name
		productReturn["description"] = product.description
		productReturn["price"] = product.price
		productReturn["image"] = product.image ? grailsLinkGenerator.link(controller: 'product', action: 'getProductImage', id: "${product.id}", absolute: true) : "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
		productReturn["business"] = business
		productReturn["tags"] = tags
		
		return productReturn
	}
}
