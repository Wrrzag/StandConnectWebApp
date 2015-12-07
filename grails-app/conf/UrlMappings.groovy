class UrlMappings {

	static mappings = {
//		"/api/$controller" (controller: "${controller}Rest", action: 'list')
//		
//		"/api/event/$id?" (controller: "eventRest", action: 'show') {
//			"/stand"(controller: "standRest")
//		}
		
		// REST 
		"/api/events"(resources: "event", includes:['index', 'show'], namespace: "api") {
			"/stands"		(resources: "stand", includes:['index', 'show'], namespace: "api")
			"/visitors"		(resources: "visitor", includes:['index', 'show'], namespace: "api")
			"/businesses"	(resources: "business", includes:['index', 'show'], namespace: "api")
			"/products"		(resources: "product", includes:['index', 'show'], namespace: "api")
			"/tags"			(resources: "tag", includes:['index', 'show'], namespace: "api")
			"/beacons"		(resources: "beacon", includes:['index', 'show'], namespace: "api")
		}
		
		"/api/beacons"(resources: "beacon", includes:['index', 'show'], namespace: "api") {
			
		}
		
		
		// DEFAULT
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
	}
}
