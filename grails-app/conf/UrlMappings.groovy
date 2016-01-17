class UrlMappings {

	static mappings = {
		
		// REST 
		"/api/events"(resources: "event", includes:['index', 'show'], namespace: "api") {
			"/stands"		(resources: "stand", includes:['index', 'show'], namespace: "api") // <- this DONE
//			"/visitors"		(resources: "visitor", includes:['index', 'show'], namespace: "api")
			"/businesses"	(resources: "business", includes:['index', 'show'], namespace: "api") // <- this DONE
			"/products"		(resources: "product", includes:['index', 'show'], namespace: "api") // <- this DONE
			"/tags"			(resources: "tag", includes:['index', 'show'], namespace: "api") // <- this DONE
			"/beacons"		(resources: "beacon", includes:['index', 'show'], namespace: "api") // <- this DONE
		}
		
		"/api/beacons"(resources: "beacon", includes:['index', 'show'], namespace: "api") {
			"/stands"		(resources: "stand", includes:['index', 'show'], namespace: "api")
			"/businesses"	(resources: "business", includes:['index', 'show'], namespace: "api")
		}
		
//		"/api/stands"(resources: "stand", includes:['index', 'show'], namespace: "api") {
//			"/businesses"	(resources: "business", includes:['index', 'show'], namespace: "api")
//			"/beacons"		(resources: "beacon", includes:['index', 'show'], namespace: "api")
//			"/events"		(resources: "event", includes:['index', 'show'], namespace: "api")
//		}
//		
//		"api/visitors"(resources: "visitor", includes:['index', 'show'], namespace: "api") {
//			"/events"		(resources: "event", includes:['index', 'show'], namespace: "api")
//			"/tags"			(resources: "tag", includes:['index', 'show'], namespace: "api")
//		}
//		
//		"api/businesses"(resources: "business", includes:['index', 'show'], namespace: "api") {
//			
//		}
//		
//		"api/products"(resources: "product", includes:['index', 'show'], namespace: "api") {
//			
//		}
//		
//		"api/tags"(resources: "tag", includes:['index', 'show'], namespace: "api") {
//			
//		}
		
		
		// DEFAULT
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

//        "/"(view:"/index")
		"/" {
			controller = "secUser"
			action = "home"
		 }
        "500"(view:'/error')
	}
}
