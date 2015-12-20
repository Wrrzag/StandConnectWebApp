import com.standconnect.domain.Beacon
import com.standconnect.domain.Business
import com.standconnect.domain.BusinessUser
import com.standconnect.domain.Event
import com.standconnect.domain.Organizer
import com.standconnect.domain.Product
import com.standconnect.domain.Stand
import com.standconnect.domain.Tag
import com.standconnect.domain.Visitor
import com.standconnect.security.SecRole
import com.standconnect.security.SecUser
import com.standconnect.security.SecUserSecRole
import com.standconnect.security.SecUser.Gender

class BootStrap {

	def grailsApplication
	def relationshipService
	
    def init = { servletContext ->
		def adminRole = new SecRole('ROLE_ADMIN').save()
		log.debug("ROLE_ADMIN created")
		def adminUser = new SecUser(username: 'admin', 
								password: 'admin',
								name: 'Admin',
								mail: 'admin@nimda.com').save()
		log.debug("Admin user created")
		
		new SecUserSecRole(secUser: adminUser, secRole: adminRole).save()
		log.debug("Assigned ROLE_ADMIN to admin user")
		
		if(grailsApplication.config.dataSource.dbCreate != "update") {
			log.info("First run: filling the database...")
			
			// Test data
			log.debug("Creating objects...")
			def organizer = new Organizer(username: 'organizer', 
											password: 'organizer',
											name: 'Mr. Organizer',
											mail: 'organizer@event.com',
											address: 'Abbey Road 3',
											city: 'London',
											postalCode: '341349',
											gender: SecUser.Gender.MALE).save()
			def organizerRole = new SecRole("ROLE_ORGANIZER").save(failOnError: true)
			new SecUserSecRole(secUser: organizer, secRole: organizerRole).save(failOnError: true)
			
			log.debug("Organizer user created")
			def businessUser = new BusinessUser(username: 'buser', 
											password: 'buser',
											name: 'Mrs. Business User',
											mail: 'buser@event.com',
											address: 'Carrer Major 45',
											city: 'Lleida',
											postalCode: '25001',
											gender: SecUser.Gender.FEMALE).save()
			def businessRole = new SecRole("ROLE_BUSINESSUSER").save()
			new SecUserSecRole(secUser: businessUser, secRole: businessRole).save()
			log.debug("Business user created")								
				
			def visitors = []
			log.debug("Creating visitors...")
			(1..10).each {
				def visitor = new Visitor(username: "visitor$it", 
											password: '1234',
											name: "Mr Visitor $it",
											mail: "visitor${it}@event.com",
											address: "Carrer Visitants $it",
											city: 'Lleida',
											postalCode: '25001',
											gender: SecUser.Gender.MALE)
				visitors << visitor
				visitor.save() ? log.debug("Visitor $visitor created") : log.debug("Errors creating visitor: ${visitor.errors}")						
			}
			log.debug("Visitor users created")
																		
			def tags = []
			log.debug("Creating tags...")
			(1..50).each {
				def tag = new Tag(name: "Tag$it")
				tags << tag
				
				tag.save() ? log.debug("Tag $tag created") : log.debug("Errors creating tag: ${tag.errors}")
			}
			log.debug("Tags created")
			
			def event1 = new Event(name: 'First Event',
									beginDate: new Date(),
									endDate: new Date(),
									schedule: "9 AM to 10 PM",
									location: 'Borricontu',
									standNumber: 100,
									organizer: organizer).save()
			log.debug("Event 1 created")						
			def event2 = new Event(name: 'Second Event',
									beginDate: new Date(),
									endDate: new Date(),
									schedule: "8 AM to 1 PM",
									location: 'London',
									standNumber: 10,
									organizer: organizer).save()
			log.debug("Event 2 created")						
			
															
			def business = new Business(name: 'DreamFac',
											description: 'Fabricantes de sueños',
											contact: 'No hi ha contacte',
											phone: '604928493',
											address: 'Carrer Et s/n',
											businessUser: businessUser).save()
			log.debug("Business created")								
											
			def products = []
			log.debug("Creating products...")
			(1..25).each {
				def product = new Product(name: "Product $it", description: "A product", price: it, business: business)
				products << product
				product.save() ? log.debug("Product $product created") : log.debug("Errors creating product: ${product.errors}")
			}
			log.debug("Products created")
					
			def beacon = new Beacon(name: "Beacon 1", mac: "A4:05:09", business: business).save()		
			log.debug("Beacon created")
			
			def stands = []
			log.debug("Creating stands...")
			(1..10).each { 
				def stand = new Stand(name: "Stand $it", number: it, event: event1)
				stands << stand
				stand.save() ? log.debug("Stand $stand created") : log.debug("Errors creating stand: ${stand.errors}")
			}
			log.debug("Stands created")
			log.debug("Objects created")
			
			
			// Relationships
			log.debug("Stablishing relationships...")
			relationshipService.newEventBusiness(event1, business)
			log.debug("Business added to event 1")
			relationshipService.newStandBeaconBusiness(stands[0], beacon, business)
			log.debug("Beacon added to business $business and stand ${stands[0]}")
			
			// Add some tags to the products
			log.debug("Adding tags to the products...")
			products.each { product ->
				log.debug("Adding tags to product $product...")
				def tmpLst = tags.collect()
				Collections.shuffle(tmpLst)
				
				tmpLst[0..new Random().nextInt(tmpLst.size())].each { tag ->
					relationshipService.newBusinessTagProduct(business, tag, product) ? 
						log.debug("Tag $tag added to product $product and business $business") : log.debug("Errors adding tag $tag to product $product and business $business")
				}
				log.debug("Tags added to product $product")
			}
			log.debug("Tags added to the products")
			
			// Assume visitors have already picked some tags for the event
			log.debug("Assigning tags to the visitors...")
			visitors.each { visitor ->
				// Visitor attends the event
				log.debug("Making visitor $visitor attend event1")
				def visitorEvent = relationshipService.newVisitorEvent(visitor, event1)
				def tmpLst = tags.collect()
				Collections.shuffle(tmpLst)
				
				tmpLst[0..new Random().nextInt(tmpLst.size())].each { tag -> 
					relationshipService.newVisitorEventTag(visitorEvent, tag) ?
						log.debug("Tag $tag added to visitor $visitor and event $event1") : log.debug("Errors adding tag $tag to visitor $visitor and event $event1")
				}
			}
			log.debug("Tags assigned to the visitors")
			log.debug("Relationships stablished")
			log.info("Database filled")
		}
    }
    def destroy = {
    }
}
