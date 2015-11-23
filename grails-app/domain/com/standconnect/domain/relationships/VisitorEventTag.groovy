package com.standconnect.domain.relationships

import com.standconnect.domain.Event
import com.standconnect.domain.Tag
import com.standconnect.domain.Visitor

class VisitorEventTag {

	Visitor visitor
	Event event
	Tag tag
	
    static constraints = {
    }
}
