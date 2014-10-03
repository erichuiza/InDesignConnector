package com.tridion.cs {
	import mx.rpc.events.*;
	import mx.rpc.soap.*;
	import mx.rpc.wsdl.*;
	import mx.rpc.xml.*;
	import mx.utils.ObjectProxy;
	
	public class StreamDownloadClient extends CoreServicesClientBase {
		public function StreamDownloadClient(loadListener:Function) {
			port = "streamDownload_base64_basicHttp";
			super(loadListener);
		}
		
		public function DownloadBinaryContent(id:String, success:Function, error:Function):void {
			var op:Operation = Operation(channel.getOperation("DownloadBinaryContent"));
			op.addEventListener(ResultEvent.RESULT, success);
			op.addEventListener(FaultEvent.FAULT, error);
			
			var param:XML = 
				<DownloadBinaryContent xmlns={CORESERVICE_NS}>
					<itemId>{id}</itemId>
				</DownloadBinaryContent>
			
			op.resultFormat = "object";
			op.send(param);
		}
	}
}