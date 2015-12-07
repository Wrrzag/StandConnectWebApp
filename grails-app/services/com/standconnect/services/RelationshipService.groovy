package com.standconnect.services

import grails.transaction.Transactional

import com.standconnect.domain.Beacon
import com.standconnect.domain.Business
import com.standconnect.domain.Event
import com.standconnect.domain.Product
import com.standconnect.domain.Stand
import com.standconnect.domain.Tag
import com.standconnect.domain.Visitor
import com.standconnect.domain.relationships.BusinessTagProduct
import com.standconnect.domain.relationships.EventBusiness
import com.standconnect.domain.relationships.StandBeaconBusiness
import com.standconnect.domain.relationships.VisitorEvent
import com.standconnect.domain.relationships.VisitorEventTag

@Transactional
class RelationshipService {

//    def newVisitorEventTag(Visitor v, Event e, Tag t) {
//		def rel = new VisitorEventTag(visitor: v, event: e, tag: t)
//		if(!rel.save()) return null
//		
//		v.addToVisitorEventTag(rel)
//		e.addToVisitorEventTag(rel)
//		t.addToVisitorEventTag(rel)
//		
//		VisitorEventTag.withTransaction {
//			if(!v.save() || !e.save() || !t.save) {
//				// TODO rollback
//				return null
//			}
//			
//			return rel
//		}
//    }
	
	def getBusinesses(Tag tag) {
		return BusinessTagProduct.findAllByTag(tag)*.business
	}
	
	def getBusinesses(Product product) {
		return BusinessTagProduct.findAllByProduct(product)*.business
	}
	
	def getBusinesses(Beacon beacon) {
		return StandBeaconBusiness.findAllByBeacon(beacon)*.business
	}
	
	def getBusinesses(Stand stand) {
		return StandBeaconBusiness.findAllByStand(stand)*.business
	}
	
	def getBusinesses(Event event) {
		return EventBusiness.findAllByEvent(event)*.business
	}
	
	def getTags(Business business) {
		
	}
	
	def getTags(Product product) {
		
	}
	
	def getTags(VisitorEvent visitorEvent) {
		
	}
	
	def getTags(Visitor visitor, Event event) {
		
	}
	
	def getProducts(Business business) {
		
	}
	
	def getProducts(Tag tag) {
		
	}
	
	def getEvents(Business business) {
		
	}
	
	def getEvents(Visitor visitor) {
		VisitorEvent.findAllByVisitor(sisitor)*.event
	}
	
	def getStands(Beacon beacon) {
		StandBeaconBusiness.findAllByBeacon(beacon)*.stand
	}
	
	def getStands(Business business) {
		StandBeaconBusiness.findAllByBusiness(business)*.stand
	}
	
	def getVisitors(Event event) {
		VisitorEvent.findAllByEvent(event)*.visitor
	}
	
	def getBeacons(Stand stand) {
		StandBeaconBusiness.findAllByStand(stand)*.beacon
	}
	
	def getBeacons(Business business) {
		StandBeaconBusiness.findAllByBusiness(business)*.beacon
	}
	
	def getBeacons(Event event) {
		def beacons = []
		def stands = event.stands
		
		stands.each {
			getBeacons(it).each {
				beacons << it
			}
		}
		
		return beacons
	}
	
	
	//-----------------------------------
	//------------  CREATE  -------------
	//-----------------------------------
	def newVisitorEventTag(VisitorEvent ve, Tag t) {
		def rel = new VisitorEventTag(visitorEvent: ve, tag: t)
		if(!rel.save()) {
			log.error("Errors saving VisitorEventTag: ${rel.errors}")
			return null
		}
		
		ve.addToVisitorEventTag(rel)
		t.addToVisitorEventTag(rel)
		
		VisitorEventTag.withTransaction { status ->
			if(!ve.save() || !t.save()) {
				status.setRollbackOnly()
				log.error("Errors saving VisitorEvent to related objects")
				log.error("VisitorEvent errors -> ${ve.errors}")
				log.error("Tag errors -> ${t.errors}")
				return null
			}
			
			log.debug("VisitorEventTag $rel saved successfully")
			return rel
		}
	}
	
	def newBusinessTagProduct(Business b, Tag t, Product p) {
		def rel = new BusinessTagProduct(business: b, tag: t, product: p)
		if(!rel.save()) {
			log.error("Errors saving BusinessTagProduct: ${rel.errors}")
			return null
		}
		
		b.addToBusinessTagProduct(rel)
		t.addToBusinessTagProduct(rel)
		p.addToBusinessTagProduct(rel)
		
		BusinessTagProduct.withTransaction { status ->
			if(!b.save() || !t.save() || !p.save()) {
				status.setRollbackOnly()
				log.error("Errors saving BusinessTagProduct to related objects")
				log.error("Business errors -> ${b.errors}")
				log.error("Tag errors -> ${t.errors}")
				log.error("Product errors -> ${p.errors}")
				return null
			}
			
			log.debug("BusinessTagProduct $rel saved successfully")
			return rel
		}
	}
	
	def newEventBusiness(Event e, Business b) {
		def rel = new EventBusiness(event: e, business: b)
		if(!rel.save()) {
			log.error("Errors saving EventBusiness: ${rel.errors}")
			return null
		}
		
		e.addToEventBusiness(rel)
		b.addToEventBusiness(rel)
		
		EventBusiness.withTransaction { status ->
			if(!e.save() || !b.save()){
				status.setRollbackOnly()
				log.error("Errors saving EventBusiness to related objects")
				log.error("Business errors -> ${b.errors}")
				log.error("Event errors -> ${t.errors}")
				return null
			}
			
			log.debug("EventBusiness $rel saved successfully")
			return rel
		}
	}
	
	def newStandBeaconBusiness(Stand s, Beacon bc, Business b) {
		def rel = new StandBeaconBusiness(stand: s, beacon: bc, business: b)
		if(!rel.save()) {
			log.error("Errors saving StandBeaconBusiness: ${rel.errors}")
			return null
		}
		
		s.addToStandBeaconBusiness(rel)
		bc.addToStandBeaconBusiness(rel)
		b.addToStandBeaconBusiness(rel)
		
		StandBeaconBusiness.withTransaction { status ->
			if(!s.save() || !bc.save() || !b.save()) {
				status.setRollbackOnly()
				log.error("Errors saving StandBeaconBusiness to related objects")
				log.error("Stand errors -> ${s.errors}")
				log.error("Beacon errors -> ${bc.errors}")
				log.error("Business errors -> ${b.errors}")
				return null
			}
			
			log.debug("StandBeaconBusiness $rel saved successfully")
			return rel
		}
	}
	
	def newVisitorEvent(Visitor v, Event e) {
		def rel = new VisitorEvent(event: e, visitor: v)
		if(!rel.save()) {
			log.error("Errors saving VisitorEvent: ${rel.errors}")
			return null
		}
		
		e.addToVisitorEvent(rel)
		v.addToVisitorEvent(rel)
		
		VisitorEvent.withTransaction { status ->
			if(!e.save() || !v.save()){
				status.setRollbackOnly()
				log.error("Errors saving VisitorEvent to related objects")
				log.error("Visitor errors -> ${v.errors}")
				log.error("Event errors -> ${e.errors}")
				return null
			}
			
			log.debug("VisitorEvent $rel saved successfully")
			return rel
		}
	}
}