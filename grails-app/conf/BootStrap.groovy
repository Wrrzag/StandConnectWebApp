import com.standconnect.security.SecRole
import com.standconnect.security.SecUser
import com.standconnect.security.SecUserSecRole
import com.standconnect.security.SecUser.Gender;

class BootStrap {

    def init = { servletContext ->
		def adminRole = new SecRole('ROLE_ADMIN').save()
		def adminUser = new SecUser(username: 'admin', 
								password: 'admin',
								name: 'Admin',
								mail: 'admin@nimda.com').save()
		
		new SecUserSecRole(user: adminUser, role: adminRole).save()
    }
    def destroy = {
    }
}
