package com.flexproject.components
{
	
	import com.flexproject.skins.GroupButtonSkin;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import spark.components.Button;
	import spark.components.Label;
	import spark.components.supportClasses.SkinnableComponent;
	
	public class MainButtonGroup extends SkinnableComponent
	{
		[SkinPart(required="true")]
		public var startbtn:Button;
		
		[SkinPart(required="true")]
		public var stopbtn:Button;
		
		[SkinPart(required="true")]
		public var startStop:Label;
		
		[SkinPart(required="true")]
		public var timerLbl:Label;
		
		[SkinPart(required="true")]
		public var startTime:Label;
		
		[SkinPart(required="true")]
		public var stopTime:Label;
		
		public function MainButtonGroup()
		{
			super();
			setStyle("skinClass",GroupButtonSkin);
		}
		
		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		} 
		
		override protected function partAdded(partName:String, instance:Object) : void
		{
			super.partAdded(partName, instance);
			
			if(partName == "startbtn")
				instance.addEventListener(MouseEvent.CLICK, startBtnClicked);
			
			if(partName == "stopbtn")
				instance.addEventListener(MouseEvent.CLICK, stopBtnClicked);
			
			if(partName == "startTime")
				instance.text = 'First Time: ';
			
			if(partName == "stopTime")
				instance.text = 'Last Time: ';
			
			if(partName == "timerLbl")
				instance.text = '';

		}
		
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			super.partRemoved(partName, instance);
		}
		
		public function updateDate(date:Date):void
		{
			var sec:int = 0;
			var min:int = 0;
			var hour:int = 0;
			
			min = date.minutes;
			sec = date.seconds;
			hour = date.hours;
			timerLbl.text = hour+':'+min+':'+sec;

		}
		
		public function updateTimes(startTimeStr:String,stopTimeStr:String):void
		{
			startTime.text = 'First Time: '+ startTimeStr;
			stopTime.text = 'Last Time: '+ stopTimeStr;
			
		}
		protected function startBtnClicked(event:MouseEvent):void
		{
			dispatchEvent(new Event("START",true));
		}
		
		protected function stopBtnClicked(event:MouseEvent):void
		{
			dispatchEvent(new Event("STOP",true));
		}
	}
}