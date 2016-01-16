package com.standconnect.controllers



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import com.standconnect.domain.Visitor

@Transactional(readOnly = true)
@Secured(["IS_AUTHENTICATED_REMEMBERED"])
class VisitorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def afterInterceptor = { model, modelAndView ->
		model.controller = "visitor"
		model.view = modelAndView?.viewName
	}

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Visitor.list(params), model:[visitorInstanceCount: Visitor.count()]
    }

    def show(Visitor visitorInstance) {
        respond visitorInstance
    }

	@Secured(["ROLE_ADMIN"])
    def create() {
        respond new Visitor(params)
    }

    @Transactional
	@Secured(["ROLE_ADMIN"])
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

	@Secured(["ROLE_ADMIN"])
    def edit(Visitor visitorInstance) {
        respond visitorInstance
    }

    @Transactional
	@Secured(["ROLE_ADMIN"])
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
	@Secured(["ROLE_ADMIN"])
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
