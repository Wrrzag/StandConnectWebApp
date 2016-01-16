package com.standconnect.domain.relationships

import com.standconnect.domain.Event
import com.standconnect.domain.Visitor

class VisitorEvent {

	Visitor visitor
	Event event
	
	static hasMany = [visitorEventTag: VisitorEventTag]
	
    static constraints = {
    }
	
	static mapping = {
		visitorEventTag cascade: 'all-delete-orphan'
	}
}
