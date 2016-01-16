package com.standconnect.controllers



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import com.standconnect.domain.Tag

@Transactional(readOnly = true)
@Secured(["IS_AUTHENTICATED_REMEMBERED"])
class TagController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def afterInterceptor = { model, modelAndView ->
		model.controller = "tag"
		model.view = modelAndView?.viewName
	}

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tag.list(params), model:[tagInstanceCount: Tag.count()]
    }

    def show(Tag tagInstance) {
        respond tagInstance
    }

	@Secured(["ROLE_ADMIN"])
    def create() {
        respond new Tag(params)
    }

    @Transactional
	@Secured(["ROLE_ADMIN"])
    def save(Tag tagInstance) {
        if (tagInstance == null) {
            notFound()
            return
        }

        if (tagInstance.hasErrors()) {
            respond tagInstance.errors, view:'create'
            return
        }

        tagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tag.label', default: 'Tag'), tagInstance.id])
                redirect tagInstance
            }
            '*' { respond tagInstance, [status: CREATED] }
        }
    }

	@Secured(["ROLE_ADMIN"])
    def edit(Tag tagInstance) {
        respond tagInstance
    }

    @Transactional
	@Secured(["ROLE_ADMIN"])
    def update(Tag tagInstance) {
        if (tagInstance == null) {
            notFound()
            return
        }

        if (tagInstance.hasErrors()) {
            respond tagInstance.errors, view:'edit'
            return
        }

        tagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Tag.label', default: 'Tag'), tagInstance.id])
                redirect tagInstance
            }
            '*'{ respond tagInstance, [status: OK] }
        }
    }

    @Transactional
	@Secured(["ROLE_ADMIN"])
    def delete(Tag tagInstance) {

        if (tagInstance == null) {
            notFound()
            return
        }

        tagInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Tag.label', default: 'Tag'), tagInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
