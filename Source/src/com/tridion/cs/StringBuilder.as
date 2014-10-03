package com.tridion.cs {
	public class StringBuilder {
		public var buffer:Array = new Array();
		
		public function add(str:String):void {
			for (var i:Number = 0; i < str.length; i++) {
				buffer.push(str.charCodeAt(i));
			}
		}
		
		public function toString():String {
			return String.fromCharCode.apply(this, buffer);
		}
	}
}