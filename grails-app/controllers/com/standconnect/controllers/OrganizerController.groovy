package com.standconnect.controllers



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import com.standconnect.domain.Event
import com.standconnect.domain.Organizer

@Transactional(readOnly = true)
class OrganizerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def springSecurityService
	
	def eventList(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Event.createCriteria().list(params) {
			eq('organizer', springSecurityService.getCurrentUser())
		}
	}
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Organizer.list(params), model:[organizerInstanceCount: Organizer.count()]
    }

    def show(Organizer organizerInstance) {
        respond organizerInstance
    }

    def create() {
        respond new Organizer(params)
    }

    @Transactional
    def save(Organizer organizerInstance) {
        if (organizerInstance == null) {
            notFound()
            return
        }

        if (organizerInstance.hasErrors()) {
            respond organizerInstance.errors, view:'create'
            return
        }

        organizerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'organizer.label', default: 'Organizer'), organizerInstance.id])
                redirect organizerInstance
            }
            '*' { respond organizerInstance, [status: CREATED] }
        }
    }

    def edit(Organizer organizerInstance) {
        respond organizerInstance
    }

    @Transactional
    def update(Organizer organizerInstance) {
        if (organizerInstance == null) {
            notFound()
            return
        }

        if (organizerInstance.hasErrors()) {
            respond organizerInstance.errors, view:'edit'
            return
        }

        organizerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Organizer.label', default: 'Organizer'), organizerInstance.id])
                redirect organizerInstance
            }
            '*'{ respond organizerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Organizer organizerInstance) {

        if (organizerInstance == null) {
            notFound()
            return
        }

        organizerInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Organizer.label', default: 'Organizer'), organizerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'organizer.label', default: 'Organizer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
