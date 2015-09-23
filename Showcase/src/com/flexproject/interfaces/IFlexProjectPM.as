package com.flexproject.interfaces
{
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	
	[Bindable]
	/**
	 * 
	 * @author Pedro Machado
	 * 
	 */
	public interface IFlexProjectPM
	{
		function startFeed():void;
		
		function init():void;
			
		function stopFeed():void;
		
		function clearFeed():void;
		
		function get filteredList():ArrayCollection;
		function set filteredList(value:ArrayCollection):void;
	}
}