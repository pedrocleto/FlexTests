package
{
	import flash.events.MouseEvent;
	import mx.core.IFactory;
	import spark.components.Button;
	import spark.components.Panel;

	[Exclude(kind="property", name="controlBarContent")]
	public class EnhancedPanel extends Panel
	{
		
		private var _customData:Array;
		public function set customData(value:Array):void
		{
			destroyActionButtons();
			_customData	= value;
			createActionButtons();
		}
		
		/**
		 * An optional dymanic skin part that defines the actionButton for
		 */
		[SkinPart(required="false", type="spark.components.Button")]
		public var actionButton:IFactory;
		
		public function EnhancedPanel()
		{
			super();
			setStyle("skinClass", EnhancedPanelSkin);
		}

		//--------------------------------------------------------------------------
		// partAdded()
		//--------------------------------------------------------------------------
		/**
		 * @private
		 * @override
		 */
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
			if (partName == "actionButton")
			{
				Button(instance).addEventListener(MouseEvent.CLICK, actionButton_clickHandler);
			}
		}

		//--------------------------------------------------------------------------
		// partRemoved()
		//--------------------------------------------------------------------------
		/**
		 * @private
		 * @override
		 */
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
			
			if (partName == "actionButton")
			{
				Button(instance).removeEventListener(MouseEvent.CLICK, actionButton_clickHandler);
			}
		}
	
		//--------------------------------------------------------------------------
		// actionButton_clickHandler
		//--------------------------------------------------------------------------
		/**
		 * @private
		 * @param event
		 */       
		protected function actionButton_clickHandler(event:MouseEvent):void
		{
			trace("You clicked ", event.target.label, " button");
		}   

		//--------------------------------------------------------------------------
		// createActionsButtons()
		//--------------------------------------------------------------------------		
		/**
		 * @private
		 * Create the action buttons 
		 *
		 */       
		protected function createActionButtons():void
		{
			var actionButtons:Array = [];
			if (_customData)
			{
				var buttonInstance:Button;
				var count:int = _customData.length;
				var i:uint;
				for (i = 0; i < count; ++i)
				{
					if (_customData[i])
					{
						buttonInstance = createDynamicPartInstance("actionButton") as Button;
						buttonInstance.label = _customData[i];
						actionButtons.push(buttonInstance);                       
					}
				}
			}
			super.controlBarContent = actionButtons;
		}

		//--------------------------------------------------------------------------
		// createActionsButtons()
		//--------------------------------------------------------------------------
		/**
		 * @private  
		 * Destroy action buttons
		 */		
		protected function destroyActionButtons():void
		{
			var buttonInstance:Button;
			var count:int = numDynamicParts("actionButton");
			while (count > 0)
			{
				buttonInstance = getDynamicPartAt("actionButton", 0) as Button;
				removeDynamicPartInstance("actionButton", buttonInstance);
				buttonInstance = null;
				count--;	
			}
		}
		
		override public function set controlBarContent(value:Array):void {}
		override public function get controlBarContent():Array {return null;}
		
	}
}