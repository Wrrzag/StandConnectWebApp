package com.standconnect.taglibs

import com.standconnect.domain.Tag

class SelectorTagLib {
	static namespace = "sel"
	
    static defaultEncodeAs = [taglib:'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	
	def springSecurityService
	def relationshipService
	
	def businesses = { attrs ->
		def currentUser = springSecurityService.getCurrentUser()
		
		out << g.select(id: "business", name: "business.id", from: currentUser?.businesses, optionKey: "id", required: "", value: attrs?.business?.id)
	}
	
	def multiSelectTag = { attrs ->
		def product = attrs?.product
		
		def selected = product ? relationshipService.getTags(product) : []
		def remaining = Tag.list()
		
		if(selected) remaining.removeAll(selected) 
		
		out << "<div class='selectBoxes'>"
		
		out << g.select(id: attrs?.id, name: attrs?.name, from: selected, multiple: 'multiple', optionKey: 'id')
		out << "<div class='selectControls'>"
		out << """ 
			<script type="text/javascript">
				function moveTo(from, to) {
				    \$(from).find(':selected').appendTo(to);
				}
				function moveAllTo(from, to) {
				    \$(from).children().appendTo(to);
				}

				\$("body").on("click", ".save", function(){ \$("#${attrs?.id} option").prop("selected", "selected"); });
			</script>

			<input type="button" id="allLeft" value="<<" onclick='moveAllTo("#${attrs?.id}Origin", "#${attrs?.id}")' />
			<input type="button" id="left" value="<"  onclick='moveTo("#${attrs?.id}Origin", "#${attrs?.id}")' />
			<input type="button" id="right" value=">"  onclick='moveTo("#${attrs?.id}", "#${attrs?.id}Origin")' />
			<input type="button" id="allRight" value=">>" onclick='moveAllTo("#${attrs?.id}", "#${attrs?.id}Origin")' />
		"""
		out << "</div>"
		out << g.select(id: "${attrs?.id}Origin", name: "${attrs?.name}Origin", from: remaining, multiple: 'multiple', optionKey: 'id')
		
		out << "</div>"
	}
	
	def multiSelectProduct = { attrs ->
		def business = attrs?.business
		def event = attrs?.event
		
		def selected = product ? relationshipService.getProducts(business, event) : []
		def remaining = relationshipService.getProducts(business).list()
		
		if(selected) remaining.removeAll(selected)
		
		out << "<div class='selectBoxes'>"
		
		out << g.select(id: attrs?.id, name: attrs?.name, from: selected, multiple: 'multiple', optionKey: 'id')
		out << "<div class='selectControls'>"
		out << """
			<script type="text/javascript">
				function moveTo(from, to) {
				    \$(from).find(':selected').appendTo(to);
				}
				function moveAllTo(from, to) {
				    \$(from).children().appendTo(to);
				}

				\$("body").on("click", ".save", function(){ \$("#${attrs?.id} option").prop("selected", "selected"); });
			</script>

			<input type="button" id="allLeft" value="<<" onclick='moveAllTo("#${attrs?.id}Origin", "#${attrs?.id}")' />
			<input type="button" id="left" value="<"  onclick='moveTo("#${attrs?.id}Origin", "#${attrs?.id}")' />
			<input type="button" id="right" value=">"  onclick='moveTo("#${attrs?.id}", "#${attrs?.id}Origin")' />
			<input type="button" id="allRight" value=">>" onclick='moveAllTo("#${attrs?.id}", "#${attrs?.id}Origin")' />
		"""
		out << "</div>"
		out << g.select(id: "${attrs?.id}Origin", name: "${attrs?.name}Origin", from: remaining, multiple: 'multiple', optionKey: 'id')
		
		out << "</div>"
	}
}
