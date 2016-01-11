package com.standconnect.controllers



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import com.standconnect.domain.Stand

@Transactional(readOnly = true)
class StandController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def afterInterceptor = { model, modelAndView ->
		model.controller = "stand"
		model.view = modelAndView.viewName
	}

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Stand.list(params), model:[standInstanceCount: Stand.count()]
    }

    def show(Stand standInstance) {
        respond standInstance
    }

	@Secured(["ROLE_ADMIN", "ROLE_BUSINESSUSER"])
    def create() {
        respond new Stand(params)
    }

    @Transactional
	@Secured(["ROLE_ADMIN", "ROLE_BUSINESSUSER"])
    def save(Stand standInstance) {
        if (standInstance == null) {
            notFound()
            return
        }

        if (standInstance.hasErrors()) {
            respond standInstance.errors, view:'create'
            return
        }

        standInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'stand.label', default: 'Stand'), standInstance.id])
                redirect standInstance
            }
            '*' { respond standInstance, [status: CREATED] }
        }
    }

	@Secured(["ROLE_ADMIN", "ROLE_BUSINESSUSER"])
    def edit(Stand standInstance) {
        respond standInstance
    }

    @Transactional
	@Secured(["ROLE_ADMIN", "ROLE_BUSINESSUSER"])
    def update(Stand standInstance) {
        if (standInstance == null) {
            notFound()
            return
        }

        if (standInstance.hasErrors()) {
            respond standInstance.errors, view:'edit'
            return
        }

        standInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Stand.label', default: 'Stand'), standInstance.id])
                redirect standInstance
            }
            '*'{ respond standInstance, [status: OK] }
        }
    }

    @Transactional
	@Secured(["ROLE_ADMIN", "ROLE_BUSINESSUSER"])
    def delete(Stand standInstance) {

        if (standInstance == null) {
            notFound()
            return
        }

        standInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Stand.label', default: 'Stand'), standInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'stand.label', default: 'Stand'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
