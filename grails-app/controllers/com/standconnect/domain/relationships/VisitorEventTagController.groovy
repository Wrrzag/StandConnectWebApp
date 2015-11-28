package com.standconnect.domain.relationships



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VisitorEventTagController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VisitorEventTag.list(params), model:[visitorEventTagInstanceCount: VisitorEventTag.count()]
    }

    def show(VisitorEventTag visitorEventTagInstance) {
        respond visitorEventTagInstance
    }

    def create() {
        respond new VisitorEventTag(params)
    }

    @Transactional
    def save(VisitorEventTag visitorEventTagInstance) {
        if (visitorEventTagInstance == null) {
            notFound()
            return
        }

        if (visitorEventTagInstance.hasErrors()) {
            respond visitorEventTagInstance.errors, view:'create'
            return
        }

        visitorEventTagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'visitorEventTag.label', default: 'VisitorEventTag'), visitorEventTagInstance.id])
                redirect visitorEventTagInstance
            }
            '*' { respond visitorEventTagInstance, [status: CREATED] }
        }
    }

    def edit(VisitorEventTag visitorEventTagInstance) {
        respond visitorEventTagInstance
    }

    @Transactional
    def update(VisitorEventTag visitorEventTagInstance) {
        if (visitorEventTagInstance == null) {
            notFound()
            return
        }

        if (visitorEventTagInstance.hasErrors()) {
            respond visitorEventTagInstance.errors, view:'edit'
            return
        }

        visitorEventTagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VisitorEventTag.label', default: 'VisitorEventTag'), visitorEventTagInstance.id])
                redirect visitorEventTagInstance
            }
            '*'{ respond visitorEventTagInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(VisitorEventTag visitorEventTagInstance) {

        if (visitorEventTagInstance == null) {
            notFound()
            return
        }

        visitorEventTagInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VisitorEventTag.label', default: 'VisitorEventTag'), visitorEventTagInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'visitorEventTag.label', default: 'VisitorEventTag'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
