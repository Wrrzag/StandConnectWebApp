package com.standconnect.taglibs

import com.standconnect.domain.Business
import com.standconnect.domain.Event

class SecTagLib {
    static namespace = "auth"
	
    static defaultEncodeAs = [taglib:'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	
	def springSecurityService
	
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
		}
	}
}
