package com.standconnect.domain.relationships



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BusinessTagProductController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond BusinessTagProduct.list(params), model:[businessTagProductInstanceCount: BusinessTagProduct.count()]
    }

    def show(BusinessTagProduct businessTagProductInstance) {
        respond businessTagProductInstance
    }

    def create() {
        respond new BusinessTagProduct(params)
    }

    @Transactional
    def save(BusinessTagProduct businessTagProductInstance) {
        if (businessTagProductInstance == null) {
            notFound()
            return
        }

        if (businessTagProductInstance.hasErrors()) {
            respond businessTagProductInstance.errors, view:'create'
            return
        }

        businessTagProductInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'businessTagProduct.label', default: 'BusinessTagProduct'), businessTagProductInstance.id])
                redirect businessTagProductInstance
            }
            '*' { respond businessTagProductInstance, [status: CREATED] }
        }
    }

    def edit(BusinessTagProduct businessTagProductInstance) {
        respond businessTagProductInstance
    }

    @Transactional
    def update(BusinessTagProduct businessTagProductInstance) {
        if (businessTagProductInstance == null) {
            notFound()
            return
        }

        if (businessTagProductInstance.hasErrors()) {
            respond businessTagProductInstance.errors, view:'edit'
            return
        }

        businessTagProductInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BusinessTagProduct.label', default: 'BusinessTagProduct'), businessTagProductInstance.id])
                redirect businessTagProductInstance
            }
            '*'{ respond businessTagProductInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(BusinessTagProduct businessTagProductInstance) {

        if (businessTagProductInstance == null) {
            notFound()
            return
        }

        businessTagProductInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BusinessTagProduct.label', default: 'BusinessTagProduct'), businessTagProductInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'businessTagProduct.label', default: 'BusinessTagProduct'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
