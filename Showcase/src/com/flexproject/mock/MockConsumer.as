package com.flexproject.mock
{
	import com.flexproject.model.CountriesDB;
	import com.flexproject.vo.CountryVO;
	
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.messaging.events.MessageEvent;
	import mx.messaging.messages.IMessage;
	
	import org.spicefactory.parsley.core.messaging.Message;

	[Event(name="message", type="mx.messaging.events.MessageEvent")]
	public class MockConsumer extends EventDispatcher
	{
		private var _subscribed:Boolean = false;
		
		private var _timer:Timer =  null;
		
		public function MockConsumer()
		{
			_timer = new Timer(1000);
		}
		
		public function subscribe(clientId:String = null):void
		{
			if(!subscribed)
			{
				setSubscribed(true);
				_timer.addEventListener(TimerEvent.TIMER,timerChanged,false,0,true);
				_timer.start();
				
			}
		}
		
		public function unsubscribe(preserveDurable:Boolean = false):void
		{
			if (subscribed)
			{
				setSubscribed(false);
				_timer.stop();
				_timer.removeEventListener(TimerEvent.TIMER,timerChanged);
			}
		}
		
		public function get subscribed():Boolean
		{
			return _subscribed;
		}
		
		protected function setSubscribed(value:Boolean):void
		{
			if (_subscribed != value)
			{
				_subscribed = value;
			}
		}
		
		protected function timerChanged(ev:TimerEvent):void
		{
			var msg:IMessage = new MockMessage();
			msg.body = new Object();
			msg.body.country = getRandomCountryCode();
			msg.body.timestamp = new Date().toLocaleString();
			dispatchEvent(new MessageEvent(MessageEvent.MESSAGE,true,false,msg));
		}
		
		private function getRandomCountryCode():String
		{
			var array:Array=CountriesDB.getCountryArray();
			var idx:int=Math.floor(Math.random() * array.length);
			var obj:Object = array[idx];
			return obj.@code;
		}

	}
}