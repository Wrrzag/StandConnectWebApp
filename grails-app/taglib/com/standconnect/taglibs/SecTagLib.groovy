package com.standconnect.taglibs

import com.standconnect.domain.Business
import com.standconnect.domain.Event
import com.standconnect.domain.Stand

class SecTagLib {
    static namespace = "auth"
	
    static defaultEncodeAs = [taglib:'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	
	def springSecurityService
	def relationshipService
	
	def hasPermission = { attrs, body ->
		def currentUser = springSecurityService.getCurrentUser()
		
		if("ROLE_ADMIN" in currentUser?.authorities*.authority) {
			out << body()
		}
		else {
			if(attrs?.instance?.class == Business.class && attrs?.instance?.businessUser == currentUser) {
				out << body()
			}
			else if(attrs?.instance?.class == Event.class && attrs?.instance?.organizer == currentUser) {
				out << body()
			}
			else if(attrs?.instance?.class == Stand.class && currentUser in getStandOwner(attrs?.instance)) {
				out << body()
			}
		}
	}
	
	def loggedUserMsg = { attrs ->
		def currentUser = springSecurityService.getCurrentUser()
		
		out << g.message(code: "logged.message", args: [currentUser.name]) + "."
	}
	
	private getStandOwner(standInstance) {
		relationshipService.getBusinesses(standInstance)*.businessUser
	}
}
