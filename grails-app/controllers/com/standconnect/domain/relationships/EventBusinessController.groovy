package com.standconnect.domain.relationships



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EventBusinessController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EventBusiness.list(params), model:[eventBusinessInstanceCount: EventBusiness.count()]
    }

    def show(EventBusiness eventBusinessInstance) {
        respond eventBusinessInstance
    }

    def create() {
        respond new EventBusiness(params)
    }

    @Transactional
    def save(EventBusiness eventBusinessInstance) {
        if (eventBusinessInstance == null) {
            notFound()
            return
        }

        if (eventBusinessInstance.hasErrors()) {
            respond eventBusinessInstance.errors, view:'create'
            return
        }

        eventBusinessInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'eventBusiness.label', default: 'EventBusiness'), eventBusinessInstance.id])
                redirect eventBusinessInstance
            }
            '*' { respond eventBusinessInstance, [status: CREATED] }
        }
    }

    def edit(EventBusiness eventBusinessInstance) {
        respond eventBusinessInstance
    }

    @Transactional
    def update(EventBusiness eventBusinessInstance) {
        if (eventBusinessInstance == null) {
            notFound()
            return
        }

        if (eventBusinessInstance.hasErrors()) {
            respond eventBusinessInstance.errors, view:'edit'
            return
        }

        eventBusinessInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EventBusiness.label', default: 'EventBusiness'), eventBusinessInstance.id])
                redirect eventBusinessInstance
            }
            '*'{ respond eventBusinessInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EventBusiness eventBusinessInstance) {

        if (eventBusinessInstance == null) {
            notFound()
            return
        }

        eventBusinessInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EventBusiness.label', default: 'EventBusiness'), eventBusinessInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventBusiness.label', default: 'EventBusiness'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
