package com.flexproject.mock
{
	import mx.messaging.messages.IMessage;

	public class MockMessage implements IMessage
	{
		public function MockMessage()
		{
		}
		
		private var _body:Object;
		private var _clientId:String;
		private var _destination:String;
		private var _headers:Object;
		private var _messageId:String;
		private var _timestamp:Number;
		private var _timeToLive:Number;
		
		public function get body():Object
		{
			return _body;
		}

		public function set body(value:Object):void
		{
			_body = value;
		}
		

		public function get clientId():String
		{
			return _clientId;
		}

		public function set clientId(value:String):void
		{
			_clientId = value
		}
		

		public function get destination():String
		{
			return _destination;
		}
		

		public function set destination(value:String):void
		{
			_destination = value;
		}
		
		public function get headers():Object
		{
			return _headers;
		}

		public function set headers(value:Object):void
		{
			_headers=value;
		}
		
		
		public function get messageId():String
		{
			return _messageId;
		}
		

		public function set messageId(value:String):void
		{
			_messageId = value;
		}
		
	
		public function get timestamp():Number
		{
			return timestamp;
		}
		

		public function set timestamp(value:Number):void
		{
			_timestamp = value;
		}
		

		public function get timeToLive():Number
		{
			return _timeToLive;
		}
		
		public function set timeToLive(value:Number):void
		{
			_timeToLive = value;
		}

		public function toString():String
		{
			return this.toString();
		}
			
	}
}