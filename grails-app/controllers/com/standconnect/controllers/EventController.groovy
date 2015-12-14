package com.standconnect.controllers



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import com.standconnect.domain.Event

@Transactional(readOnly = true)
class EventController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]
	def springSecurityService

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
        respond eventInstance
    }

    @Transactional
	@Secured(["ROLE_ADMIN","ROLE_ORGANIZER"])
    def update(Event eventInstance) {
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
	
	def getEventImage() {println params.id
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
}
