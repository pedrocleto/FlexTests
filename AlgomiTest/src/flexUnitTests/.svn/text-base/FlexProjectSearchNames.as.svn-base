package flexUnitTests
{
	import com.flexproject.events.FlexProjectPMEvents;
	import com.flexproject.model.FlexProjectPM;
	import com.flexproject.services.FlexProjectService;
	
	import flash.events.Event;
	
	import org.flexunit.Assert;
	
	import org.flexunit.async.Async;

	/**
	 * 
	 * @author Pedro Machado
	 * 
	 */
	public class FlexProjectSearchNames
	{		
		public var projectPM:FlexProjectPM;
		
		[Before]
		public function setUp():void
		{
			projectPM = new FlexProjectPM();
			projectPM.projectService = new FlexProjectService();
			projectPM.init();
		}
		
		[After]
		public function tearDown():void
		{
			projectPM=null;
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test( async )]
		public function testSearchNamesMethod() : void
		{  
			var asyncHandler:Function = Async.asyncHandler( this, handleListLoaded, 500, null, handleTimeout );
			projectPM.addEventListener(FlexProjectPMEvents.LOADED_NAMES_LIST_EVENT, asyncHandler, false, 0, true );
			projectPM.loadNames();
			
		}
		
		private function handleListLoaded(event:Event,passThroughData:Object):void {
			Assert.failNull("Name List is Null",projectPM.nameList);
			Assert.assertTrue(projectPM.nameList.length>0);
			
			//Validate Search
			var searchText:String="c";
			projectPM.filterByLastName(searchText);
			Assert.assertTrue(projectPM.filteredList.length>0);
		}
		
		private function handleTimeout(event:Event,passThroughData:Object):void {
			Assert.fail("Could not search names");
		}
		
	}
}