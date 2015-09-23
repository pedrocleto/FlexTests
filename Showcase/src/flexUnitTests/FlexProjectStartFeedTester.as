package flexUnitTests
{
	import com.flexproject.events.FlexProjectPMEvents;
	import com.flexproject.interfaces.IFlexProjectPM;
	import com.flexproject.model.FlexProjectPM;

	
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
	public class FlexProjectStartFeedTester
	{
		public var projectPM:FlexProjectPM;
		
		[Before]
		public function setup() : void
		{
			projectPM = new FlexProjectPM();
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
		
		[Test]
		public function testMethod() : void
		{  
			projectPM.addEventListener(FlexProjectPMEvents.UPDATE_LIST_EVENT, handleListLoaded, false, 0, true );
			projectPM.startFeed();
		}
		
		private function handleListLoaded(event:Event,passThroughData:Object):void {
			Assert.failNull("Name List is Null",projectPM.filteredList);
			Assert.assertTrue(projectPM.filteredList.length>0);
		}
	}
}