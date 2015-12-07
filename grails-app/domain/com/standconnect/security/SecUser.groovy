package com.standconnect.security


class SecUser implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	enum Gender { MALE, FEMALE, UNSPECIFIED }

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	String name
	String mail
	String address
	String city
	String postalCode
	Gender gender

	SecUser(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof SecUser && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<SecRole> getAuthorities() {
		SecUserSecRole.findAllBySecUser(this)*.secRole
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false, nullable: false
		name blank: false, nullable: false
		mail blank: false, nullable: false
		address blank: true, nullable: true
		city blank: true, nullable: true
		postalCode blank: true, nullable: true
		gender nullable: true
	}

	static mapping = {
		password column: '`password`'
	}
	
	
	def getBasicInfo() {
		return [
			"id" : this.id, "name" : this.name, "mail" : this.mail, 
			"address" : this.address, "city" : this.city, 
			"postalCode" : this.postalCode, "gender" : this.gender
		]
	}
}
