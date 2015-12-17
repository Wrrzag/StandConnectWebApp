package com.standconnect.taglibs

class SelectorTagLib {
	static namespace = "sel"
	
    static defaultEncodeAs = [taglib:'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	
	def springSecurityService
	
	def businesses = { attrs ->
		def currentUser = springSecurityService.getCurrentUser()
		springSecurityService.getCurrentUser()
		println currentUser.class
		println springSecurityService.getPrincipal()
		
		out << g.select(id: "business", name: "business.id", from: currentUser?.businesses, optionKey: "id", required: "", value: attrs?.business?.id)
	}
}
