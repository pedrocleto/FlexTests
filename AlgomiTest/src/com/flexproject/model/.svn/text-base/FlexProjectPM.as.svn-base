package com.flexproject.model
{
	import com.flexproject.events.FlexProjectPMEvents;
	import com.flexproject.interfaces.IFlexProjectPM;
	import com.flexproject.services.interfaces.IFlexProjectService;
	import com.flexproject.services.vo.Person;
	
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.StringUtil;

	
	/**
	 * 
	 * @author Pedro Machado
	 * 
	 */
	[ManagedEvents("LoadedNamesListEvent")]
	public class FlexProjectPM implements IFlexProjectPM
	{
		[Inject (id="projectService")]
		[Bindable]
		public var projectService:IFlexProjectService;
		
		[Bindable]
		public var nameList:ArrayCollection;
		
		[Bindable]
		public var filteredList:ArrayCollection;
		
		public function init():void
		{
			nameList=new ArrayCollection();
			filteredList=new ArrayCollection();
		}
		
		/**
		 * Loads Names from the service
		 * 
		 */
		public function loadNames():void
		{
			//load from service
			var token:AsyncToken=projectService.loadNames();
			token.addResponder(new AsyncResponder(resultHandler,faultHandler));
		}
		
		
		/**
		 * Filters Names from list
		 * @param searchText
		 * 
		 */
		public function filterByLastName(searchText:String):void
		{
			if(nameList && (searchText && searchText !=""))
			{
				clearSearch();//clear previous searches
				
				for each (var item:Person in nameList)
				{
					var surname:String=item.surname;
					
					// finds out if the search text is contained in the surname
					var valueUpper:Number=surname.toUpperCase().indexOf(searchText.toUpperCase());
					
					// gets the index in the search text
					var indexValue:Number=searchText.indexOf(searchText);
					
					// adds the person object if the the surname has the searchText contain in the same index 
					if(valueUpper>=0 && indexValue==valueUpper) 
					{
						filteredList.addItem(item);
					}
					
					//Applies sorting by surname
					var sort:Sort=new Sort();
					sort.fields = [new SortField("surname", true)];
					filteredList.sort=sort;
					filteredList.refresh();
				}
			}
		}
		
		/**
		 * Clears the previous search
		 * 
		 */
		public function clearSearch():void
		{
			filteredList.removeAll();
		}
		
		private function resultHandler(event:ResultEvent, token:AsyncToken=null):void
		{
			nameList=event.result as ArrayCollection; //store result
			
			dispatchEvent(new FlexProjectPMEvents(FlexProjectPMEvents.LOADED_NAMES_LIST_EVENT, true));
		}
		
		private function faultHandler(event:FaultEvent,token:AsyncToken=null):void
		{
			
		}
	}
}