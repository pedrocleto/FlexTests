package com.flexproject.components
{
	
	import com.flexproject.model.CountriesDB;
	import com.flexproject.skins.ChartPanelSkin;
	import com.flexproject.vo.CountryVO;
	
	import mx.binding.utils.BindingUtils;
	import mx.charts.AreaChart;
	import mx.charts.BarChart;
	import mx.charts.BubbleChart;
	import mx.charts.CategoryAxis;
	import mx.charts.ColumnChart;
	import mx.charts.DateTimeAxis;
	import mx.charts.Legend;
	import mx.charts.LineChart;
	import mx.charts.PieChart;
	import mx.charts.PlotChart;
	import mx.charts.series.BarSeries;
	import mx.charts.series.ColumnSeries;
	import mx.charts.series.LineSeries;
	import mx.charts.series.PieSeries;
	import mx.charts.series.PlotSeries;
	import mx.collections.ArrayCollection;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	public class MainChartPanel extends SkinnableComponent
	{
		private var _provider:ArrayCollection;
	
		[SkinPart(required="true")]	
		public var barChart:BarChart;
		
		[SkinPart(required="true")]	
		public var columnChart:ColumnChart;
		
		[SkinPart(required="true")]	
		public var lineChart:LineChart;
		
		[SkinPart(required="true")]	
		public var pieChart:PieChart;
		
		public function MainChartPanel()
		{
			super();
			setStyle("skinClass",ChartPanelSkin);
		}
		
		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		} 
		
		override protected function partAdded(partName:String, instance:Object) : void
		{
			super.partAdded(partName, instance);
		
			if (partName == "barChart")
			{
				BindingUtils.bindProperty(instance, "dataProvider", this, "provider");
				updateBarCharts(instance as BarChart);
			}  
			if (partName == "columnChart")
			{
				BindingUtils.bindProperty(instance, "dataProvider", this, "provider");
				updateColumnCharts(instance as ColumnChart);
			}  
			if (partName == "lineChart")
			{
				BindingUtils.bindProperty(instance, "dataProvider", this, "provider");
				updateLineCharts(instance as LineChart);
			}   
			if (partName == "pieChart")
			{
				BindingUtils.bindProperty(instance, "dataProvider", this, "provider");
				updatePieChart(instance as PieChart);
			}   
			
		}
		
		private function updateBarCharts(chart:BarChart):void
		{
			var currentSeries:Array =[];
			var localSeries:BarSeries = new BarSeries();

			localSeries.yField = "name";
			localSeries.xField = "hits";
		
			localSeries.displayName = "Hits By Country";
		
			currentSeries.push(localSeries);
			
			var catAxis:CategoryAxis = new CategoryAxis();
			catAxis.categoryField ="name";
			
			chart.verticalAxis = catAxis;
			chart.series = currentSeries;		
		}
		
		private function updateColumnCharts(chart:ColumnChart):void
		{
			var currentSeries:Array =[];
			var localSeries:ColumnSeries = new ColumnSeries();
			localSeries.yField = "hits";
			localSeries.xField = "name";
			
			localSeries.displayName = "Hits By Country";
			currentSeries.push(localSeries);
			
			var catAxis:CategoryAxis = new CategoryAxis();
			catAxis.categoryField ="name";
			
			chart.horizontalAxis = catAxis;
			chart.series = currentSeries;			
		}
		
		private function updateLineCharts(chart:LineChart):void
		{
			var currentSeries:Array =[];
			var localSeries:LineSeries = new LineSeries();
			localSeries.yField = "hits";
			localSeries.xField = "name";
			
			localSeries.displayName = "Hits By Country";
			currentSeries.push(localSeries);
						
			var catAxis:CategoryAxis = new CategoryAxis();
			catAxis.categoryField ="name";
			
			chart.horizontalAxis = catAxis;			
			chart.series = currentSeries;
		}
		
		private function updatePieChart(chart:PieChart):void
		{
			var currentSeries:Array =[];
			var localSeries:PieSeries = new PieSeries();
			localSeries.field = "hits";
			localSeries.nameField = "name";
			localSeries.explodeRadius = .12;
			
			localSeries.displayName = "Hits By Country";
			currentSeries.push(localSeries);
			
			chart.series = currentSeries;
		}
		
		private function getCountryNames():Array
		{
			var countryName:Array=[];
			for each (var obj:Object in CountriesDB.Country.country)
			{
				countryName.push(obj.@label);
			}
			return countryName;
		}
		
		[Bindable]
		public function get provider ():ArrayCollection
		{
			return _provider;	
		}
		
		public function set provider (value:ArrayCollection):void
		{
			this._provider = value;		
		}
		
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			super.partRemoved(partName, instance);
		}
	}
}