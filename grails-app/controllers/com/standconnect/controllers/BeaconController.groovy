package com.standconnect.controllers



import static org.springframework.http.HttpStatus.*

import com.standconnect.domain.Beacon;

import grails.transaction.Transactional

@Transactional(readOnly = true)
class BeaconController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Beacon.list(params), model:[beaconInstanceCount: Beacon.count()]
    }

    def show(Beacon beaconInstance) {
        respond beaconInstance
    }

    def create() {
        respond new Beacon(params)
    }

    @Transactional
    def save(Beacon beaconInstance) {
        if (beaconInstance == null) {
            notFound()
            return
        }

        if (beaconInstance.hasErrors()) {
            respond beaconInstance.errors, view:'create'
            return
        }

        beaconInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'beacon.label', default: 'Beacon'), beaconInstance.id])
                redirect beaconInstance
            }
            '*' { respond beaconInstance, [status: CREATED] }
        }
    }

    def edit(Beacon beaconInstance) {
        respond beaconInstance
    }

    @Transactional
    def update(Beacon beaconInstance) {
        if (beaconInstance == null) {
            notFound()
            return
        }

        if (beaconInstance.hasErrors()) {
            respond beaconInstance.errors, view:'edit'
            return
        }

        beaconInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Beacon.label', default: 'Beacon'), beaconInstance.id])
                redirect beaconInstance
            }
            '*'{ respond beaconInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Beacon beaconInstance) {

        if (beaconInstance == null) {
            notFound()
            return
        }

        beaconInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Beacon.label', default: 'Beacon'), beaconInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'beacon.label', default: 'Beacon'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
