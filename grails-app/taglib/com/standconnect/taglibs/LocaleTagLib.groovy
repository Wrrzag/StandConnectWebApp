package com.standconnect.taglibs

import org.springframework.web.servlet.support.RequestContextUtils;
import groovy.xml.MarkupBuilder;
 
class LocaleTagLib {
	static namespace = 'locale'
	 
	def locales = [new Locale("ca", "ES"), new Locale("es"), new Locale("en")]

	def list = {
		Locale requestLocale = RequestContextUtils.getLocale(request)
		 
		MarkupBuilder mb = new MarkupBuilder(out)
		mb.ul('id': 'locales') {
			locales.each { Locale locale ->
				li(requestLocale.language == locale.language ? ['class': 'current-language'] : [:]) {
					mb.yield(
						link( controller: controllerName, action: actionName, params: params + [lang: locale.language + (locale.country ? '_' + locale.country : '')],
							 { locale.getDisplayLanguage(locale) } ).toString(),
						false
						)
				}
			}
		}
	}
	
	def currentLocale = {
		out << RequestContextUtils.getLocale(request)
	}
}