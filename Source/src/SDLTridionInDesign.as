package 
{
	import air.net.ServiceMonitor;
	
	import com.adobe.csawlib.indesign.InDesign;
	import com.adobe.indesign.*;
	import com.adobe.photoshop.Channel;
	import com.tridion.cs.*;
	
	public class SDLTridionInDesign
	{
		public static function run():void 
		{
			var app:Application = InDesign.app;
			/*ws.useProxy = false;
			ws.addEventListener("load", OnWSDLLoaded);
			ws.port = "basicHttp";
			ws.loadWSDL("http://localhost/webservices/CoreService2011.svc?singleWsdl");*/
			
			/*var channel:CoreServicesClient = new CoreServicesClient();
			channel.Read("tcm:5-291", OnSuccess, OnError);*/
		}
		
		/*private static function OnWSDLLoaded(event:LoadEvent) : void {
			var op:Operation = Operation(ws.getOperation("Read"));
			op.addEventListener(ResultEvent.RESULT, OnSuccess);
			op.addEventListener(FaultEvent.FAULT, OnError);
			op.send("tcm:5-291", new ReadOptions());
		}
		
		/*private static function OnSuccess(result:Object) : void {
			var o:Object = result;
		}
		
		private static function OnError(error:flash.events.Event) : void {
			var o:Object = null;
		}*/
		
		/*public static function OnSuccess(event:ResultEvent) : void {
			var o:Object = event.result;
		}
		
		public static function OnError(event:FaultEvent) : void {
			var error:String = event.fault.message;
		}*/
	}
}