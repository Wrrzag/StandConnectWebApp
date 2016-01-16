package com.standconnect.controllers



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import com.standconnect.domain.Beacon
import com.standconnect.domain.Business
import com.standconnect.domain.Event
import com.standconnect.domain.Stand

@Transactional(readOnly = true)
@Secured(["IS_AUTHENTICATED_REMEMBERED"])
class EventController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]
	
	def afterInterceptor = { model, modelAndView ->
		model.controller = "event"
		model.view = modelAndView?.viewName
	}
	
	def springSecurityService
	def relationshipService

	def userEvents(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Event.createCriteria().list(params) {
			eq('organizer', springSecurityService.getCurrentUser())
		}
	}
	
	@Secured(["ROLE_BUSINESSUSER"])
	def businessEvents(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def businesses = springSecurityService.getCurrentUser()?.businesses?.eventBusiness?.id.flatten()
		
		println businesses*.properties
		
		if(businesses){
			respond Event.createCriteria().list(params) {
				'in'('id', businesses)
			}
		}
	}
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Event.list(params), model:[eventInstanceCount: Event.count()]
    }

    def show(Event eventInstance) {
        respond eventInstance
    }

	@Secured(["ROLE_ADMIN","ROLE_ORGANIZER"])
    def create() {
        respond new Event(params)
    }

    @Transactional
	@Secured(["ROLE_ADMIN","ROLE_ORGANIZER"])
    def save(Event eventInstance) {
        if (eventInstance == null) {
            notFound()
            return
        }

		eventInstance.organizer = springSecurityService.getCurrentUser()
		
        if (!eventInstance.save()) {
            respond eventInstance.errors, view:'create'
            return
        }

        eventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'event.label', default: 'Event'), eventInstance.id])
                redirect eventInstance
            }
            '*' { respond eventInstance, [status: CREATED] }
        }
    }

	@Secured(["ROLE_ADMIN","ROLE_ORGANIZER"])
    def edit(Event eventInstance) {
		if(!hasPermission(eventInstance)) {
			render status: 403
			return
		}
		
        respond eventInstance
    }

    @Transactional
	@Secured(["ROLE_ADMIN","ROLE_ORGANIZER"])
    def update(Event eventInstance) {
		if(!hasPermission(eventInstance)) {
			render status: 403
			return
		}
		
        if (eventInstance == null) {
            notFound()
            return
        }

        if (eventInstance.hasErrors()) {
            respond eventInstance.errors, view:'edit'
            return
        }

        eventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Event.label', default: 'Event'), eventInstance.id])
                redirect eventInstance
            }
            '*'{ respond eventInstance, [status: OK] }
        }
    }

    @Transactional
	@Secured(["ROLE_ADMIN","ROLE_ORGANIZER"])
    def delete(Event eventInstance) {
		if(!hasPermission(eventInstance)) {
			render status: 403
			return
		}
		
        if (eventInstance == null) {
            notFound()
            return
        }

        eventInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Event.label', default: 'Event'), eventInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
	
	@Secured(["ROLE_ADMIN","ROLE_BUSINESSUSER"])
	def enroll(Event eventInstance) {
		respond eventInstance
	}
	
	@Secured(["ROLE_ADMIN","ROLE_BUSINESSUSER"])
	def inscription() { println params
		def event = Event.get(Long.parseLong(params.eventId, 10))
		def business = Business.get(Long.parseLong(params.business.id, 10))
		def beacon = Beacon.get(Long.parseLong(params.beacon, 10))
		
		if(event.standNumber >= event.stands.size()) {
			def stand = new Stand(params)
			stand.event = event
			stand.save()
			
			def eventBusiness = relationshipService.newEventBusiness(event, business)
			def standBeaconBusiness = relationshipService.newStandBeaconBusiness(stand, beacon, business)
		}
		else {
			flash.message = "event is full"
			redirect action: 'index'
			return
		}
		
		redirect action:'businessEvents'
	}
	
	def getEventImage() {
		def event = Event.get(Long.parseLong(params.id, 10))
		
		if(!event) {
			notFound()
			return
		}
		
		byte[] image = event.image
		response.outputStream << image
	}

    protected void notFound() {
		log.debug("Event not found")
		
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	private hasPermission(eventInstance) {
		def currentUser = springSecurityService.getCurrentUser()
		
		if("ROLE_ADMIN" in currentUser?.authorities*.authority || eventInstance.organizer == currentUser) {
			return true
		}
		else {
			return false
		}
	}
}
