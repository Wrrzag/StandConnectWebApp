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
import com.standconnect.domain.relationships.VisitorEventTag

@Transactional
class RelationshipService {

    def newVisitorEventTag(Visitor v, Event e, Tag t) {
		def rel = new VisitorEventTag(visitor: v, event: e, tag: t)
		if(!rel.save()) return null
		
		v.addToVisitorEventTag(rel)
		e.addToVisitorEventTag(rel)
		t.addToVisitorEventTag(rel)
		
		VisitorEventTag.withTransaction {
			if(!v.save() || !e.save() || !t.save) {
				// TODO rollback
				return null
			}
			
			return rel
		}
    }
	
	def newBusinessTagProduct(Business b, Tag t, Product p) {
		def rel = new BusinessTagProduct(business: p, tag: t, product: p)
		if(!rel.save()) return null
		
		b.addToBusinessTagProduct(rel)
		t.addToBusinessTagProduct(rel)
		p.addToBusinessTagProduct(rel)
		
		BusinessTagProduct.withTransaction {
			if(!b.save() || !t.save() || !p.save) {
				// TODO rollback
				return null
			}
			
			return rel
		}
	}
	
	def newEventBusiness(Event e, Business b) {
		def rel = new EventBusiness(event: e, business: b)
		if(!rel.save()) return null
		
		e.addToEventBusiness(rel)
		b.addToEventBusiness(rel)
		
		EventBusiness.withTransaction {
			if(!e.save() || !b.save()){
				// TODO rollback
				return null
			}
			
			return rel
		}
	}
	
	def newStandBeaconBusiness(Stand s, Beacon bc, Business b) {
		def rel = new StandBeaconBusiness(stand: s, beacon: bc, business: b)
		if(!rel.save()) return null
		
		s.addToStandBeaconBusiness(rel)
		bc.addToStandBeaconBusiness(rel)
		b.addToStandBeaconBusiness(rel)
		
		StandBeaconBusiness.withTransaction {
			if(!s.save() || !bc.save() || !b.save) {
				// TODO rollback
				return null
			}
			
			return rel
		}
	}
}
