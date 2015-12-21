package com.standconnect.controllers



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import com.standconnect.domain.Product
import com.standconnect.domain.Tag

@Transactional(readOnly = true)
class ProductController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

	def relationshipService
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Product.list(params), model:[productInstanceCount: Product.count()]
    }

    def show(Product productInstance) {
        respond productInstance
    }

	@Secured(["ROLE_ADMIN", "ROLE_BUSINESSUSER"])
    def create() {
        respond new Product(params)
    }

    @Transactional
	@Secured(["ROLE_ADMIN", "ROLE_BUSINESSUSER"])
    def save(Product productInstance) {
        if (productInstance == null) {
            notFound()
            return
        }

        if (productInstance.hasErrors()) {
            respond productInstance.errors, view:'create'
            return
        }

        productInstance.save flush:true

		def error
		params.tags.each {
			def tag = Tag.get(Long.parseLong(it, 10))
			if(!relationshipService.newBusinessTagProduct(productInstance.business, tag, productInstance)) {
				println "ups"
				error = true
			}
		}
		
		if(error) {/* rollback */}
		
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
                redirect productInstance
            }
            '*' { respond productInstance, [status: CREATED] }
        }
    }

	@Secured(["ROLE_ADMIN", "ROLE_BUSINESSUSER"])
    def edit(Product productInstance) {
        respond productInstance
    }

    @Transactional
	@Secured(["ROLE_ADMIN", "ROLE_BUSINESSUSER"])
    def update(Product productInstance) {
        if (productInstance == null) {
            notFound()
            return
        }

        if (productInstance.hasErrors()) {
            respond productInstance.errors, view:'edit'
            return
        }

        productInstance.save flush:true
		
		def error = relationshipService.removeBusinessTagProducts(productInstance)
		params.tags.each {
			def tag = Tag.get(Long.parseLong(it, 10))
			if(!relationshipService.newBusinessTagProduct(productInstance.business, tag, productInstance)) {
				println "ups"
				error = true
			}
		}
		
		if(error) {/* rollback */}

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Product.label', default: 'Product'), productInstance.id])
                redirect productInstance
            }
            '*'{ respond productInstance, [status: OK] }
        }
    }

    @Transactional
	@Secured(["ROLE_ADMIN", "ROLE_BUSINESSUSER"])
    def delete(Product productInstance) {

        if (productInstance == null) {
            notFound()
            return
        }

        productInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Product.label', default: 'Product'), productInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

	def getProductImage() {
		def product = Product.get(Long.parseLong(params.id, 10))
		
		if(!product) {
			notFound()
			return
		}
		
		byte[] image = product.image
		response.outputStream << image
	}
	
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
