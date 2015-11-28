package com.standconnect.domain.relationships



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StandBeaconBusinessController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond StandBeaconBusiness.list(params), model:[standBeaconBusinessInstanceCount: StandBeaconBusiness.count()]
    }

    def show(StandBeaconBusiness standBeaconBusinessInstance) {
        respond standBeaconBusinessInstance
    }

    def create() {
        respond new StandBeaconBusiness(params)
    }

    @Transactional
    def save(StandBeaconBusiness standBeaconBusinessInstance) {
        if (standBeaconBusinessInstance == null) {
            notFound()
            return
        }

        if (standBeaconBusinessInstance.hasErrors()) {
            respond standBeaconBusinessInstance.errors, view:'create'
            return
        }

        standBeaconBusinessInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'standBeaconBusiness.label', default: 'StandBeaconBusiness'), standBeaconBusinessInstance.id])
                redirect standBeaconBusinessInstance
            }
            '*' { respond standBeaconBusinessInstance, [status: CREATED] }
        }
    }

    def edit(StandBeaconBusiness standBeaconBusinessInstance) {
        respond standBeaconBusinessInstance
    }

    @Transactional
    def update(StandBeaconBusiness standBeaconBusinessInstance) {
        if (standBeaconBusinessInstance == null) {
            notFound()
            return
        }

        if (standBeaconBusinessInstance.hasErrors()) {
            respond standBeaconBusinessInstance.errors, view:'edit'
            return
        }

        standBeaconBusinessInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'StandBeaconBusiness.label', default: 'StandBeaconBusiness'), standBeaconBusinessInstance.id])
                redirect standBeaconBusinessInstance
            }
            '*'{ respond standBeaconBusinessInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(StandBeaconBusiness standBeaconBusinessInstance) {

        if (standBeaconBusinessInstance == null) {
            notFound()
            return
        }

        standBeaconBusinessInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'StandBeaconBusiness.label', default: 'StandBeaconBusiness'), standBeaconBusinessInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'standBeaconBusiness.label', default: 'StandBeaconBusiness'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
