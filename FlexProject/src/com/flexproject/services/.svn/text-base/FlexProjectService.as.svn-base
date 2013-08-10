package com.flexproject.services
{
	import com.flexproject.services.interfaces.IFlexProjectService;
	import com.flexproject.services.vo.Person;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	/**
	 * 
	 * @author Pedro Machado
	 * 
	 */
	public class FlexProjectService extends MockService implements IFlexProjectService
	{
		public function FlexProjectService()
		{
		}
		
		/**
		 * Creates list of Names 
		 * @return 
		 * 
		 */
		public function loadNames():AsyncToken
		{
			var result:ArrayCollection=new ArrayCollection();
			
			var person1:Person=new Person(0,"Anthony","Jones","Male");
			var person2:Person=new Person(1,"Josh","Zeddy","Male");
			var person3:Person=new Person(2,"Oleg","Smith","Male");
			var person4:Person=new Person(3,"Mohammed","Ali","Male");
			var person5:Person=new Person(4,"Jacky","Chan","Male");
			var person6:Person=new Person(5,"Freddy","Crouger","Male");
			var person7:Person=new Person(6,"Hannible","Lector","Male");
			var person8:Person=new Person(7,"Jonny","Brigs","Male");
			var person9:Person=new Person(8,"Patrick","Cash","Male");
			
			result.addItem(person1);
			result.addItem(person2);
			result.addItem(person3);
			result.addItem(person4);
			result.addItem(person5);
			result.addItem(person6);
			result.addItem(person7);
			result.addItem(person8);
			result.addItem(person9);
			
			var token:AsyncToken=createToken(result);
			token.addResponder(new AsyncResponder(resultHandler, faultHandler));
			
			return token;
		}
		
		private function resultHandler(event:ResultEvent, token:AsyncToken=null):void
		{
			event.token.dispatchEvent(event);
		}
		
		private function faultHandler(event:FaultEvent,token:AsyncToken=null):void
		{
			event.token.dispatchEvent(event);
		}

	}
}