package com.flexproject.components
{
	
	import com.flexproject.skins.ResizableTitleWindowSkin;
	
	import spark.components.TitleWindow;
	
	
	
	public class ResizableTitleWindow extends TitleWindow
	{
		
		public function ResizableTitleWindow()
		{
			super();
			setStyle("skinClass",ResizableTitleWindowSkin);
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
		
	}
}