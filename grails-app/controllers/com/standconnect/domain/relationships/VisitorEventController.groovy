package com.standconnect.domain.relationships



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VisitorEventController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VisitorEvent.list(params), model:[visitorEventInstanceCount: VisitorEvent.count()]
    }

    def show(VisitorEvent visitorEventInstance) {
        respond visitorEventInstance
    }

    def create() {
        respond new VisitorEvent(params)
    }

    @Transactional
    def save(VisitorEvent visitorEventInstance) {
        if (visitorEventInstance == null) {
            notFound()
            return
        }

        if (visitorEventInstance.hasErrors()) {
            respond visitorEventInstance.errors, view:'create'
            return
        }

        visitorEventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'visitorEvent.label', default: 'VisitorEvent'), visitorEventInstance.id])
                redirect visitorEventInstance
            }
            '*' { respond visitorEventInstance, [status: CREATED] }
        }
    }

    def edit(VisitorEvent visitorEventInstance) {
        respond visitorEventInstance
    }

    @Transactional
    def update(VisitorEvent visitorEventInstance) {
        if (visitorEventInstance == null) {
            notFound()
            return
        }

        if (visitorEventInstance.hasErrors()) {
            respond visitorEventInstance.errors, view:'edit'
            return
        }

        visitorEventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VisitorEvent.label', default: 'VisitorEvent'), visitorEventInstance.id])
                redirect visitorEventInstance
            }
            '*'{ respond visitorEventInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(VisitorEvent visitorEventInstance) {

        if (visitorEventInstance == null) {
            notFound()
            return
        }

        visitorEventInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VisitorEvent.label', default: 'VisitorEvent'), visitorEventInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'visitorEvent.label', default: 'VisitorEvent'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
