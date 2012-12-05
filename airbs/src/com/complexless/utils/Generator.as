package com.complexless.utils
{
	import flash.events.Event;
	
	import mx.containers.Canvas;
	
	[Event(name="generate")]
	public class Generator extends Canvas
	{
		
		public static const GENERATE_EVENT:String = "generate";
		
		public var stToEncode:String;
		
		public function Generator()
		{
			super();
		}
		
		public function generate():void{
			dispatchEvent(new Event(GENERATE_EVENT));
		}
	}
}