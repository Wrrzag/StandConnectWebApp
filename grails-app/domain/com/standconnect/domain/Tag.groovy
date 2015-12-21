package com.standconnect.domain

import com.standconnect.domain.relationships.BusinessTagProduct
import com.standconnect.domain.relationships.VisitorEventTag


class Tag {
	String name
	
	static hasMany = [businessTagProduct: BusinessTagProduct, visitorEventTag: VisitorEventTag]
	
    static constraints = {
    }
	
	def getBasicInfo() {
		return [
			"id" : this.id, "name" : this.name	
		]
	}
	
	String toString() {
		return name
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (getClass() != obj.getClass())
			return false;
		Tag other = (Tag) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}
	
	
}
