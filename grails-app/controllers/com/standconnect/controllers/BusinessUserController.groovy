package com.standconnect.controllers



import static org.springframework.http.HttpStatus.*

import com.standconnect.domain.BusinessUser;

import grails.transaction.Transactional

@Transactional(readOnly = true)
class BusinessUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def afterInterceptor = { model, modelAndView ->
		model.controller = "businessUser"
		model.view = modelAndView?.viewName
	}
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond BusinessUser.list(params), model:[businessUserInstanceCount: BusinessUser.count()]
    }

    def show(BusinessUser businessUserInstance) {
        respond businessUserInstance
    }

    def create() {
        respond new BusinessUser(params)
    }

    @Transactional
    def save(BusinessUser businessUserInstance) {
        if (businessUserInstance == null) {
            notFound()
            return
        }

        if (businessUserInstance.hasErrors()) {
            respond businessUserInstance.errors, view:'create'
            return
        }

        businessUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'businessUser.label', default: 'BusinessUser'), businessUserInstance.id])
                redirect businessUserInstance
            }
            '*' { respond businessUserInstance, [status: CREATED] }
        }
    }

    def edit(BusinessUser businessUserInstance) {
        respond businessUserInstance
    }

    @Transactional
    def update(BusinessUser businessUserInstance) {
        if (businessUserInstance == null) {
            notFound()
            return
        }

        if (businessUserInstance.hasErrors()) {
            respond businessUserInstance.errors, view:'edit'
            return
        }

        businessUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BusinessUser.label', default: 'BusinessUser'), businessUserInstance.id])
                redirect businessUserInstance
            }
            '*'{ respond businessUserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(BusinessUser businessUserInstance) {

        if (businessUserInstance == null) {
            notFound()
            return
        }

        businessUserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BusinessUser.label', default: 'BusinessUser'), businessUserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'businessUser.label', default: 'BusinessUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
