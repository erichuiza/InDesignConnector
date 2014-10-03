package com.tridion.cs {
	import mx.rpc.events.*;
	import mx.rpc.soap.*;
	import mx.rpc.xml.SchemaTypeRegistry;
	import mx.utils.ObjectProxy;
	
	public class CoreServicesClientBase {
		public const WSDL_URL:String = "http://localhost/webservices/CoreService2013.svc?wsdl";
		public const CORESERVICE_NS:String = "http://www.sdltridion.com/ContentManager/CoreService/2013";
		public const TRIDION_NS:String = "http://www.sdltridion.com/ContentManager/R6";
		public const XSDI_NS:String = "http://www.w3.org/2001/XMLSchema-instance";
		public const TRIDION_5_NS:String = "http://www.tridion.com/ContentManager/5.0";
		public const XLINK_NS:String = "http://www.w3.org/1999/xlink";
		
		protected var port:String;
		protected var channel:WebService;
		
		public function CoreServicesClientBase(loadListener:Function) {
			channel = new WebService();
			channel.useProxy = false;
			channel.port = port;
			channel.addEventListener(LoadEvent.LOAD, loadListener);
			channel.loadWSDL(WSDL_URL);
		}
	}
}