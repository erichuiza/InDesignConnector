package com.tridion.cs {
	import mx.rpc.events.*;
	import mx.rpc.soap.*;
	import mx.rpc.wsdl.*;
	import mx.rpc.xml.*;
	import mx.utils.ObjectProxy;
	
	public class BasicHttpClient extends CoreServicesClientBase {
		public function BasicHttpClient(loadListener:Function) {
			port = "basicHttp";
			super(loadListener);
		}
		
		public function ReadItem(id:String, success:Function, error:Function):void {
			var op:Operation = Operation(channel.getOperation("Read"));
			op.addEventListener(ResultEvent.RESULT, success);
			op.addEventListener(FaultEvent.FAULT, error);
			op.resultFormat = "object";
			op.send(id);
		}
		
		public function ReadItemXml(id:String, success:Function, error:Function):void {
			var op:Operation = Operation(channel.getOperation("Read"));
			op.addEventListener(ResultEvent.RESULT, success);
			op.addEventListener(FaultEvent.FAULT, error);
			op.resultFormat = "e4x";
			op.send(id);
		}
		
		public function GetListPublicationsXml(success:Function, error:Function):void {
			var op:Operation = Operation(channel.getOperation("GetSystemWideListXml"));
			op.addEventListener(ResultEvent.RESULT, success);
			op.addEventListener(FaultEvent.FAULT, error);
			
			var param:XML = 
				<GetSystemWideListXml xmlns={CORESERVICE_NS}>
					<filter xmlns:d4p1={TRIDION_NS} xmlns:i={XSDI_NS} i:type='d4p1:PublicationsFilterData' />
				</GetSystemWideListXml>
			
			op.resultFormat = "e4x";
			op.send(param);
		}
		
		public function GetListOrgItemItemsXml(id:String, itemTypes:Array, recursive:Boolean, success:Function, error:Function):void {
			var op:Operation = Operation(channel.getOperation("GetListXml"));
			op.addEventListener(ResultEvent.RESULT, success);
			op.addEventListener(FaultEvent.FAULT, error);
			
			var param:XML = 
				<GetListXml xmlns={CORESERVICE_NS}>
					<id>{id}</id>
					<filter xmlns:d4p1={TRIDION_NS} xmlns:i={XSDI_NS} i:type='d4p1:OrganizationalItemItemsFilterData'>
						<d4p1:BaseColumns>Extended</d4p1:BaseColumns>
						<d4p1:ItemTypes />
						<d4p1:Recursive>{recursive}</d4p1:Recursive>
					</filter>
				</GetListXml>
			
			var itemTypesXML:XMLList = param.descendants(new QName(TRIDION_NS, "ItemTypes"));
			for (var index:String in itemTypes) {
				var type:String = itemTypes[index];
				itemTypesXML.appendChild(<ItemType xmlns={TRIDION_NS}>{type}</ItemType>);
			}
			
			op.resultFormat = "e4x";
			op.send(param);
		}
		
		public function ReadSchemaFields(schemaId:String, expandEmbeddedFields:Boolean, success:Function, error:Function):void {
			var op:Operation = Operation(channel.getOperation("ReadSchemaFields"));
			op.addEventListener(ResultEvent.RESULT, success);
			op.addEventListener(FaultEvent.FAULT, error);
			
			var param:XML = 
				<ReadSchemaFields xmlns={CORESERVICE_NS}>
					<schemaId>{schemaId}</schemaId>
					<expandEmbeddedFields>{expandEmbeddedFields}</expandEmbeddedFields>
				</ReadSchemaFields>
			
			op.resultFormat = "e4x";
			op.send(param);
		}
		
		public function CheckOut(id:String, permanentLock:Boolean, success:Function, error:Function):void {
			var op:Operation = Operation(channel.getOperation("CheckOut"));
			op.addEventListener(ResultEvent.RESULT, success);
			op.addEventListener(FaultEvent.FAULT, error);
			
			var param:XML = 
				<CheckOut xmlns={CORESERVICE_NS}>
				  <id>{id}</id>
				  <permanentLock>{permanentLock}</permanentLock>
				</CheckOut>
			
			op.resultFormat = "object";
			op.send(param);
		}
		
		public function Save(deltaData:XMLList, success:Function, error:Function):void {
			var op:Operation = Operation(channel.getOperation("Save"));
			op.addEventListener(ResultEvent.RESULT, success);
			op.addEventListener(FaultEvent.FAULT, error);
			
			var param:XML = 
				<Save xmlns={CORESERVICE_NS}>
					<deltaData xmlns:a={TRIDION_NS} xmlns:i={XSDI_NS} i:type='a:ComponentData'>
					{deltaData}
					</deltaData>
				</Save>
					
			op.resultFormat = "object";
			op.send(param);
		}
		
		public function CheckIn(id:String, success:Function, error:Function):void {
			var op:Operation = Operation(channel.getOperation("CheckIn"));
			op.addEventListener(ResultEvent.RESULT, success);
			op.addEventListener(FaultEvent.FAULT, error);
			op.resultFormat = "object";
			op.send(id);
		}
		
		public function GetListUsingItems(id:String, itemTypes:Array, success:Function, error:Function):void {
			var op:Operation = Operation(channel.getOperation("GetListXml"));
			op.addEventListener(ResultEvent.RESULT, success);
			op.addEventListener(FaultEvent.FAULT, error);
			
			var param:XML = 
				<GetListXml xmlns={CORESERVICE_NS}>
					<id>{id}</id>
					<filter xmlns:d4p1={TRIDION_NS} xmlns:i={XSDI_NS} i:type='d4p1:UsingItemsFilterData'>
						<d4p1:ItemTypes />
					</filter>
				</GetListXml>
			
			var itemTypesXML:XMLList = param.descendants(new QName(TRIDION_NS, "ItemTypes"));
			for (var index:String in itemTypes) {
				var type:String = itemTypes[index];
				itemTypesXML.appendChild(<ItemType xmlns={TRIDION_NS}>{type}</ItemType>);
			}
			
			op.resultFormat = "e4x";
			op.send(param);
		}
	}
}