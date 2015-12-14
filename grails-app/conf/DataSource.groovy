dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
			dialect = "com.fixes.ImprovedH2Dialect"
			
			
			url = "jdbc:postgresql://localhost:5432/standconnectdev"
			driverClassName = "org.postgresql.Driver"
			dialect = "org.hibernate.dialect.PostgreSQLDialect"
			username = "root"
			password = "root"
//			url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
    production {
        dataSource {
            dbCreate = "create"
			username = "adminahj3tfc"
			password = "pJNJtFLvw2pH"
			url = "postgresql://$OPENSHIFT_POSTGRESQL_DB_HOST:$OPENSHIFT_POSTGRESQL_DB_PORT"
			dialect = "org.hibernate.dialect.PostgreSQLDialect"
			driverClassName = "org.postgresql.Driver"
			
//			driverClassName = "org.postgresql.Driver"
//			uri = new URI(System.getenv('OPENSHIFT_POSTGRESQL_DB_URL'))
//			url = "jdbc:postgresql://" + uri.host + uri.path + "/" + System.getenv('OPENSHIFT_APP_NAME')
//			username = System.getenv('OPENSHIFT_POSTGRESQL_DB_USERNAME')
//			password = System.getenv('OPENSHIFT_POSTGRESQL_DB_PASSWORD')
        }
    }
}
