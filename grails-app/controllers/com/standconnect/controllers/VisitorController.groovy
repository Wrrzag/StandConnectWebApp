package com.standconnect.controllers



import static org.springframework.http.HttpStatus.*

import com.standconnect.domain.Visitor;

import grails.transaction.Transactional

@Transactional(readOnly = true)
class VisitorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Visitor.list(params), model:[visitorInstanceCount: Visitor.count()]
    }

    def show(Visitor visitorInstance) {
        respond visitorInstance
    }

    def create() {
        respond new Visitor(params)
    }

    @Transactional
    def save(Visitor visitorInstance) {
        if (visitorInstance == null) {
            notFound()
            return
        }

        if (visitorInstance.hasErrors()) {
            respond visitorInstance.errors, view:'create'
            return
        }

        visitorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'visitor.label', default: 'Visitor'), visitorInstance.id])
                redirect visitorInstance
            }
            '*' { respond visitorInstance, [status: CREATED] }
        }
    }

    def edit(Visitor visitorInstance) {
        respond visitorInstance
    }

    @Transactional
    def update(Visitor visitorInstance) {
        if (visitorInstance == null) {
            notFound()
            return
        }

        if (visitorInstance.hasErrors()) {
            respond visitorInstance.errors, view:'edit'
            return
        }

        visitorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Visitor.label', default: 'Visitor'), visitorInstance.id])
                redirect visitorInstance
            }
            '*'{ respond visitorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Visitor visitorInstance) {

        if (visitorInstance == null) {
            notFound()
            return
        }

        visitorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Visitor.label', default: 'Visitor'), visitorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'visitor.label', default: 'Visitor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
