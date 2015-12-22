package com.standconnect.controllers



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import com.standconnect.domain.Beacon
import com.standconnect.domain.Business

@Transactional(readOnly = true)
class BeaconController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def springSecurityService
	def relationshipService
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        
//		respond Beacon.list(params), model:[beaconInstanceCount: Beacon.count()]
		
		respond Beacon.createCriteria().list(params) {
			business {
				eq('businessUser', springSecurityService.getCurrentUser())
			}
		}
    }

    def show(Beacon beaconInstance) {
        respond beaconInstance
    }

	@Secured(["ROLE_ADMIN","ROLE_BUSINESSUSER"])
    def create() {
        respond new Beacon(params)
    }

    @Transactional
	@Secured(["ROLE_ADMIN","ROLE_BUSINESSUSER"])
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

	@Secured(["ROLE_ADMIN","ROLE_BUSINESSUSER"])
    def edit(Beacon beaconInstance) {
        respond beaconInstance
    }

    @Transactional
	@Secured(["ROLE_ADMIN","ROLE_BUSINESSUSER"])
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
	@Secured(["ROLE_ADMIN","ROLE_BUSINESSUSER"])
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

	def getByBusiness() {
		if(!params.businessId) {render [] as JSON; return}
		
		def business = Business.get(Long.parseLong(params.businessId, 10))
		
		if(business) {
			def beacons = relationshipService.getBeacons(business).flatten()
			println "beacons: $beacons"
			render beacons as JSON
		}
		else {
			log.debug("Business ${params.businessId} not found")
			render [] as JSON
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
