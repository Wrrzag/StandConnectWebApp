package com.standconnect.domain.relationships

import com.standconnect.domain.Business
import com.standconnect.domain.Product
import com.standconnect.domain.Tag

class BusinessTagProduct {

	Business business
	Tag tag
	Product product
	
    static constraints = {
    }
}
