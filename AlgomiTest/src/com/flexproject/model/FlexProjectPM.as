package com.flexproject.model
{
	import com.flexproject.events.FlexProjectPMEvents;
	import com.flexproject.interfaces.IFlexProjectPM;
	import com.flexproject.vo.CountryVO;
	
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.Consumer;
	import mx.messaging.channels.AMFChannel;
	import mx.messaging.channels.RTMPChannel;
	import mx.messaging.events.MessageEvent;
	import mx.messaging.events.MessageFaultEvent;
	import mx.resources.ResourceManager;
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.StringUtil;
	
	import org.osmf.containers.MediaContainer;
	import org.spicefactory.parsley.core.messaging.Message;

	
	/**
	 * 
	 * @author Pedro Machado
	 * 
	 */
	[ManagedEvents("UpdateListEvent,ErrorListEvent")]
	[ResourceBundle("config")]
	public class FlexProjectPM implements IFlexProjectPM
	{
		[Bindable]
		public var filteredList:ArrayCollection;
		private var keys:Dictionary = new Dictionary();
		private var countryArray:Array = new Array();
		
		private var _consumer:Consumer;
		
		[Bindable]
		private var _channelSet:ChannelSet;
		
		public function init():void
		{
			filteredList=new ArrayCollection();
			
			var amfpoolingURL:String=ResourceManager.getInstance().getString('config', 'amfpoolingURL');
			var amflongpollingURL:String=ResourceManager.getInstance().getString('config', 'amflongpollingURL');
			var rtmpURL:String=ResourceManager.getInstance().getString('config', 'rtmpURL');
			
			var amfpooling:AMFChannel=new AMFChannel("amfP");
			amfpooling.url=amfpoolingURL;
			var amflongpolling:AMFChannel=new AMFChannel("amfLP");
			amflongpolling.url=amflongpollingURL;
			var rtmp:RTMPChannel=new RTMPChannel("rtmp");
			rtmp.url=rtmpURL;
			
			_channelSet=new ChannelSet();
			_channelSet.addChannel(amfpooling);
			_channelSet.addChannel(amflongpolling);
			_channelSet.addChannel(rtmp);
			
			_consumer=new Consumer();
			_consumer.channelSet=_channelSet;
			_consumer.destination="tdf.sampleviewingfeed";
			_consumer.subtopic="flex";
			_consumer.addEventListener(MessageEvent.MESSAGE, messageEventHandler);
			_consumer.addEventListener(MessageFaultEvent.FAULT, messageFaultHandler);
			
		}
		
		public function messageEventHandler(msgEvt:MessageEvent):void
		{
			if(filteredList==null)
				filteredList=new ArrayCollection();
			
			var country:String = msgEvt.message.body.country;
			var timestamp:String = msgEvt.message.body.timestamp;
			var countryVO:CountryVO=new CountryVO();
			countryVO.code=country;
			
			countryArray.push(countryVO);
			countryArray.filter(accumulateHits);
			
			dispatchEvent(new FlexProjectPMEvents(FlexProjectPMEvents.UPDATE_LIST_EVENT, true,false,timestamp));//To show the use of parsley events
		}
		
		public function messageFaultHandler(msg:MessageFaultEvent):void
		{
			dispatchEvent(new FlexProjectPMEvents(FlexProjectPMEvents.ERROR_LIST_EVENT, true,false,msg));//To show the use of parsley events
		}
		
		private function accumulateHits(item:Object, idx:uint, arr:Array):Boolean 
		{
			if (keys[item.code]!=null) {
				// Update the hits count for the item
				item.hits = item.hits+=1;
				return false;
			} else {
				item.hits=1; 
				keys[item.code] = item;
				item.name=getNameByCode(item.code); // get the country name
				filteredList.addItem(item);
				filteredList.refresh();
				return true;
			}
		}
		
		private function getNameByCode(code:String):String
		{
			var countryName:String=code;
			for each (var obj:Object in CountriesDB.Country.country)
			{
				if(code==obj.@code)
				{
					countryName=obj.@label;
					break;
				}
			}
			
			return countryName;
		
		}
		
		/**
		 * Starts Feed
		 * 
		 */
		public function startFeed():void
		{
			clearFeed();
			if(_consumer && !_consumer.subscribed)
				_consumer.subscribe();
		}
		
		/**
		 * Clears Feed data
		 * 
		 */
		public function clearFeed():void
		{
			filteredList.removeAll();
		}
		
		/**
		 * Stops Feed
		 * 
		 */
		public function stopFeed():void
		{
			if(_consumer && _consumer.subscribed)
				_consumer.unsubscribe();
		}
		
	}
}