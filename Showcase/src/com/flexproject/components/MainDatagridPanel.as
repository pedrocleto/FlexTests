package com.flexproject.components
{
	
	import com.flexproject.skins.DataGridSkin;
	
	import mx.binding.utils.BindingUtils;
	import mx.collections.ArrayCollection;
	
	import spark.components.DataGrid;
	import spark.components.supportClasses.SkinnableComponent;
	
	
	
	public class MainDatagridPanel extends SkinnableComponent
	{
		[SkinPart (required="true")]
		public var mainGridDash:DataGrid;
		
		[Bindable]
		public var provider:ArrayCollection;
		
		public function MainDatagridPanel()
		{
			super();
			setStyle("skinClass",DataGridSkin);
		}
		
		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		} 
		
		override protected function partAdded(partName:String, instance:Object) : void
		{
			super.partAdded(partName, instance);
			
			if(partName == "mainGridDash")
				BindingUtils.bindProperty(instance, "dataProvider", this, "provider");
		}
		
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			super.partRemoved(partName, instance);
		}
		
	}
}