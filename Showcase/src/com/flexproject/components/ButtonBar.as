package com.flexproject.components
{
	
	import com.flexproject.skins.ButtonSkin;
	import com.flexproject.vo.Constants;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.IFactory;
	import mx.core.IFlexDisplayObject;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;
	
	import spark.components.Button;
	import spark.components.HGroup;
	import spark.components.VGroup;
	import spark.components.supportClasses.SkinnableComponent;
	
	
	
	public class ButtonBar extends SkinnableComponent
	{
		/**
		 * A dynamic skin part that defines a button
		 */
		[SkinPart(required="true",type="spark.components.Button")]
		public var buttonElem:IFactory;
		
		[SkinPart(required="true")]	
		public var mainGroup:HGroup;
		
		private var _values:Array;
		
		public function ButtonBar()
		{
			super();
			setStyle("skinClass",ButtonSkin);

		}
		
		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		} 
		
		override protected function partAdded(partName:String, instance:Object) : void
		{
			super.partAdded(partName, instance);
			
			if (partName == "buttonElem")
			{
				instance.addEventListener(MouseEvent.CLICK, buttonClicked,false,0,true);
			}  
			
			if (partName == "mainGroup")
			{
				instance.addEventListener(FlexEvent.CREATION_COMPLETE, creationCompleteGrp ,false,0,true);
			}      
		}
		
		
		protected function creationCompleteGrp(evt:FlexEvent):void
		{
			destroyButtons();
			displayButtonBar();	
		}
		
		protected function buttonClicked(mouseEvt:MouseEvent):void
		{
			
		}
		
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			super.partRemoved(partName, instance);
			
			if (partName == "buttonElem")
			{
				instance.removeEventListener(MouseEvent.CLICK, buttonClicked);
			}         
		}
		
		
		public function set buttonValues (values:Array):void
		{
			destroyButtons();
			this._values = values;
			displayButtonBar();			
		}

		private function displayButtonBar():void
		{
			if (mainGroup)
				createButtons();
			
		}
		private function createButtons():void
		{
			if (_values && _values.length > 0)
			{
				mainGroup.removeAllElements();
				
				var btn:Button;
				for each(var obj:String in _values)
				{
					btn = createDynamicPartInstance("buttonElem") as Button;
					btn.label = obj;
					btn.id = obj;
					mainGroup.addElement(btn);
				}
			}   
		}
		
		/**
		 * @private  
		 * Destroy action buttons
		 */		
		protected function destroyButtons():void
		{
			var buttonInstance:Button;
			var count:int = numDynamicParts("buttonElem");
			while (count > 0)
			{
				buttonInstance = getDynamicPartAt("buttonElem", 0) as Button;
				removeDynamicPartInstance("buttonElem", buttonInstance);
				buttonInstance = null;
				count--;	
			}
		}
		
	}
}