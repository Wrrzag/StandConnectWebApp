import com.standconnect.domain.Business
import com.standconnect.domain.BusinessUser
import com.standconnect.domain.Event
import com.standconnect.domain.Organizer
import com.standconnect.domain.Tag
import com.standconnect.security.SecRole
import com.standconnect.security.SecUser
import com.standconnect.security.SecUserSecRole
import com.standconnect.security.SecUser.Gender

class BootStrap {

	def relationshipService
	
    def init = { servletContext ->
		def adminRole = new SecRole('ROLE_ADMIN').save()
		def adminUser = new SecUser(username: 'admin', 
								password: 'admin',
								name: 'Admin',
								mail: 'admin@nimda.com').save()
		
		new SecUserSecRole(user: adminUser, role: adminRole).save()
		
		// Test data
		def organizer = new Organizer(username: 'organizer', 
										password: 'organizer',
										name: 'Mr. Organizer',
										mail: 'organizer@event.com',
										address: 'Abbey Road 3',
										city: 'London',
										postalCode: '341349',
										gender: SecUser.Gender.MALE).save()
		def businessUser = new BusinessUser(username: 'buser', 
										password: 'buser',
										name: 'Mrs. Business User',
										mail: 'buser@event.com',
										address: 'Carrer Major 45',
										city: 'Lleida',
										postalCode: '25001',
										gender: SecUser.Gender.FEMALE).save()
		def event1 = new Event(name: 'First Event',
								beginDate: new Date(),
								endDate: new Date(),
								schedule: "9 AM to 10 PM",
								location: 'Borricontu',
								organizer: organizer).save()
		def event2 = new Event(name: 'Second Event',
								beginDate: new Date(),
								endDate: new Date(),
								schedule: "8 AM to 1 PM",
								location: 'London',
								organizer: organizer).save()
								
//		organizer.addToEvents(event1)
//		organizer.addToEvents(event2)
		
		def business = new Business(name: 'DreamFac',
										description: 'Fabricantes de sueños',
										standNumber: 6,
										contact: 'No hi ha contacte',
										phone: '604928493',
										address: 'Carrer Et s/n').save()
		businessUser.addToBusinesses(business)
		
		def tags = []
		[1..10].each {
			def tag = new Tag(name: 'Tag$it').save()
			tags << tag
		}
		
		
    }
    def destroy = {
    }
}
