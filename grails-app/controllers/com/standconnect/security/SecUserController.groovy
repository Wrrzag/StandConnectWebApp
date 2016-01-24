package com.standconnect.security



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SecUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

	def springSecurityService
	
	@Secured(["ROLE_ADMIN"])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SecUser.list(params), model:[secUserInstanceCount: SecUser.count()]
    }

	@Secured(["ROLE_ADMIN"])
    def show(SecUser secUserInstance) {
        respond secUserInstance
    }

	@Secured(["ROLE_ADMIN"])
    def create() {
        respond new SecUser(params)
    }

    @Transactional
	@Secured(["ROLE_ADMIN"])
    def save(SecUser secUserInstance) {
        if (secUserInstance == null) {
            notFound()
            return
        }

        if (secUserInstance.hasErrors()) {
            respond secUserInstance.errors, view:'create'
            return
        }

        secUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'secUser.label', default: 'SecUser'), secUserInstance.id])
                redirect secUserInstance
            }
            '*' { respond secUserInstance, [status: CREATED] }
        }
    }

	@Secured(["ROLE_ADMIN"])
    def edit(SecUser secUserInstance) {
        respond secUserInstance
    }

    @Transactional
	@Secured(["ROLE_ADMIN"])
    def update(SecUser secUserInstance) {
        if (secUserInstance == null) {
            notFound()
            return
        }

        if (secUserInstance.hasErrors()) {
            respond secUserInstance.errors, view:'edit'
            return
        }

        secUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SecUser.label', default: 'SecUser'), secUserInstance.id])
                redirect secUserInstance
            }
            '*'{ respond secUserInstance, [status: OK] }
        }
    }

    @Transactional
	@Secured(["ROLE_ADMIN"])
    def delete(SecUser secUserInstance) {

        if (secUserInstance == null) {
            notFound()
            return
        }

        secUserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SecUser.label', default: 'SecUser'), secUserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUser.label', default: 'SecUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	@Secured(["IS_AUTHENTICATED_REMEMBERED"])
	def home() {
		def authorities = springSecurityService.getCurrentUser().authorities*.authority
		if("ROLE_ADMIN" in authorities) {
			log.debug("Redirecting to ADMIN frontpage")
//			render view: '/index'
			redirect controller: 'admin', action: 'index'
		}
		else if("ROLE_ORGANIZER" in authorities) {
			log.debug("Redirecting to ORGANIZER frontpage")
			redirect controller: 'event', action: 'userEvents'
		}
		else if("ROLE_BUSINESSUSER" in authorities) {
			log.debug("Redirecting to BUSINESS USER frontpage")
			redirect controller: 'business', action: 'userBusinesses'
		}
	}
}
