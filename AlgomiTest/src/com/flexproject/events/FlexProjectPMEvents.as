package com.flexproject.events
{
	import flash.events.Event;

	/**
	 * 
	 * @author Pedro Machado
	 * 
	 */
	public class FlexProjectPMEvents extends Event
	{
		public static const UPDATE_LIST_EVENT:String = 'UpdateListEvent';
		public static const ERROR_LIST_EVENT:String = 'ErrorListEvent';
		
		public var data:Object;
		
		public function FlexProjectPMEvents(type:String, bubbles:Boolean=true, cancelable:Boolean=false,data:Object=null,id:Object=null)
		{
			super(type, bubbles, cancelable);
			this.data=data;
		}
	}
}