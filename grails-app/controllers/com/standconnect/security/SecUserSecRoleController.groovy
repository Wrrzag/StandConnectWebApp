package com.standconnect.security



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SecUserSecRoleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SecUserSecRole.list(params), model:[secUserSecRoleInstanceCount: SecUserSecRole.count()]
    }

    def show(SecUserSecRole secUserSecRoleInstance) {
        respond secUserSecRoleInstance
    }

    def create() {
        respond new SecUserSecRole(params)
    }

    @Transactional
    def save(SecUserSecRole secUserSecRoleInstance) {
        if (secUserSecRoleInstance == null) {
            notFound()
            return
        }

        if (secUserSecRoleInstance.hasErrors()) {
            respond secUserSecRoleInstance.errors, view:'create'
            return
        }

        secUserSecRoleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), secUserSecRoleInstance.id])
                redirect secUserSecRoleInstance
            }
            '*' { respond secUserSecRoleInstance, [status: CREATED] }
        }
    }

    def edit(SecUserSecRole secUserSecRoleInstance) {
        respond secUserSecRoleInstance
    }

    @Transactional
    def update(SecUserSecRole secUserSecRoleInstance) {
        if (secUserSecRoleInstance == null) {
            notFound()
            return
        }

        if (secUserSecRoleInstance.hasErrors()) {
            respond secUserSecRoleInstance.errors, view:'edit'
            return
        }

        secUserSecRoleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SecUserSecRole.label', default: 'SecUserSecRole'), secUserSecRoleInstance.id])
                redirect secUserSecRoleInstance
            }
            '*'{ respond secUserSecRoleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SecUserSecRole secUserSecRoleInstance) {

        if (secUserSecRoleInstance == null) {
            notFound()
            return
        }

        secUserSecRoleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SecUserSecRole.label', default: 'SecUserSecRole'), secUserSecRoleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
