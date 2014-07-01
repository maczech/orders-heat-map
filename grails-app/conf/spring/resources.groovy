// Place your Spring DSL code here
beans = {
	bulkRMIProxyFactoryBean(com.hcomemea.common.remoting.rmi.BulkRMIProxyFactoryBean){
		proxyInterface="com.hotels.hermes.searchapp.hotelsearch.service.HotelSearchService"
		lookupStubOnStartup="false"
		refreshStubOnConnectFailure="true"
		serviceUrls="rmi://chelsrchm01.karmalab.net:1091/HotelSearchService"
	}
	hotelSearchService(com.hcomemea.common.hotel.service.impl.HotelSearchServiceRouter) {
		services = bulkRMIProxyFactoryBean
	}
}


//<bean class="com.hcomemea.common.hotel.service.impl.HotelSearchServiceRouter">
//<property name="services">
//	<bean class="com.hcomemea.common.remoting.rmi.BulkRMIProxyFactoryBean">
//		<property name="proxyInterface" value="com.hotels.hermes.searchapp.hotelsearch.service.HotelSearchService" />
//		<property name="lookupStubOnStartup" value="false" />
//		<property name="refreshStubOnConnectFailure" value="true" />
//		<property name="serviceUrls" value="${SEARCHAPP_HOSTS}" />
//	</bean>
//</property>
//</bean>