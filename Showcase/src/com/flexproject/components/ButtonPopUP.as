package com.flexproject.components
{
	
	import com.flexproject.vo.Constants;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.core.IFlexDisplayObject;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import spark.components.Application;
	import spark.components.Button;
	import spark.components.supportClasses.SkinnableComponent;
	
	
	
	public class ButtonPopUP extends ButtonBar
	{
		private var _providerValue:ArrayCollection;
		
		private var _chartsProvider:ArrayCollection;
		
		public function ButtonPopUP()
		{
			super();
		}
		
		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		} 
		
		override protected function partAdded(partName:String, instance:Object) : void
		{
			super.partAdded(partName, instance);
		}
		
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			super.partRemoved(partName, instance);
		}
		
		override protected function buttonClicked(mouseEvt:MouseEvent):void
		{
			if(mouseEvt && mouseEvt.currentTarget is Button)
				createPopUp(mouseEvt.currentTarget.id);
			
		}
		
		[Bindable]
		public function get providerValue ():ArrayCollection
		{
			return _providerValue;	
		}
		
		public function set providerValue (provider:ArrayCollection):void
		{
			this._providerValue = provider;		
		}
		
		[Bindable]
		public function get chartsProvider ():ArrayCollection
		{
			return _chartsProvider;	
		}
		
		public function set chartsProvider (provider:ArrayCollection):void
		{
			this._chartsProvider = provider;		
		}
		private function createPopUp(type:String):void
		{
			var rtw:ResizableTitleWindow = new ResizableTitleWindow();
			rtw.title = type;
			rtw.minHeight = 300;
			rtw.minWidth = 450;
			
			switch(type)
			{
				case Constants.CHARTS:
					var ch:MainChartPanel = new MainChartPanel();
					ch.provider = chartsProvider;
					ch.percentHeight = 100;
					ch.percentWidth = 100;
					rtw.addElement(ch);
					break;
				case Constants.DATAGRID:
					var mp:MainDatagridPanel=new MainDatagridPanel();
					mp.provider = providerValue;
					mp.percentHeight = 100;
					mp.percentWidth = 100;
					rtw.addElement(mp);
				default:
					break;
			}
			
			rtw.addEventListener(CloseEvent.CLOSE, closeHandler,false,0,true);
			
			PopUpManager.addPopUp(rtw, this, false);
			PopUpManager.centerPopUp(rtw);
		}
		
		private function closeHandler(event:Event):void
		{
			event.target.removeEventListener(CloseEvent.CLOSE, closeHandler);
			PopUpManager.removePopUp(event.target as IFlexDisplayObject);
		}
		
	}
}