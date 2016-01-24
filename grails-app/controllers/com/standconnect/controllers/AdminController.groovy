package com.standconnect.controllers

import grails.plugin.springsecurity.annotation.Secured

import com.standconnect.domain.Business
import com.standconnect.domain.Event
import com.standconnect.domain.Product

class AdminController {

	def afterInterceptor = { model, modelAndView ->
		model.controller = "business"
		model.view = modelAndView?.viewName
	}
	
	@Secured(["ROLE_ADMIN"])
    def index() {
//		def lastEvents = Event.list([max: 3, sort: 'dateCreated', order: 'desc'])
//		def lastProducts = Product.list([max: 3, sort: 'dateCreated', order: 'desc'])
//		def lastBusinesses = Business.list([max: 3, sort: 'dateCreated', order: 'desc'])
//		
//		return [eventList: lastEvents, productList: lastProducts, businessList: lastBusinesses]
	}
}
