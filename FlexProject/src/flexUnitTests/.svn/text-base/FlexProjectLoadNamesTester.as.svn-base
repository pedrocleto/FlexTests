package flexUnitTests
{
	import com.flexproject.events.FlexProjectPMEvents;
	import com.flexproject.interfaces.IFlexProjectPM;
	import com.flexproject.model.FlexProjectPM;
	import com.flexproject.services.FlexProjectService;
	import com.flexproject.services.interfaces.IFlexProjectService;
	
	import flash.events.Event;
	
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.asserts.fail;
	import org.flexunit.async.Async;
	import org.spicefactory.parsley.core.context.Context;
	import org.spicefactory.parsley.core.events.ContextEvent;
	import org.spicefactory.parsley.dsl.context.ContextBuilder;
	import org.spicefactory.parsley.xml.XmlConfig;

	/**
	 * 
	 * @author Pedro Machado
	 * 
	 */
	public class FlexProjectLoadNamesTester
	{
		public var projectPM:FlexProjectPM;
		
		[Before]
		public function setup() : void
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
		public function testLoadNamesMethod() : void
		{  
			var asyncHandler:Function = Async.asyncHandler( this, handleListLoaded, 500, null, handleTimeout );
			projectPM.addEventListener(FlexProjectPMEvents.LOADED_NAMES_LIST_EVENT, asyncHandler, false, 0, true );
			projectPM.loadNames();
		}
		
		private function handleListLoaded(event:Event,passThroughData:Object):void {
			Assert.failNull("Name List is Null",projectPM.nameList);
			Assert.assertTrue(projectPM.nameList.length>0);
		}
		
		private function handleTimeout(event:Event,passThroughData:Object):void {
			Assert.fail("Could not load names");
		}

	}
}