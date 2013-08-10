package com.flexproject.services
{
	
	import flash.utils.setTimeout;
	
	import mx.core.mx_internal;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	
	use namespace mx_internal;
	
	/**
	 * 
	 * @author Pedro Machado
	 * 
	 */
	public class MockService
	{
		protected function createToken(result:Object):AsyncToken
		{
			var token:AsyncToken = new AsyncToken(null);
			setTimeout(applyResult, Math.random()*500, token, result);
			return token;
		}
		
		private function applyResult(token:AsyncToken, result:Object):void
		{
			token.setResult(result);
			var event:ResultEvent = new ResultEvent(ResultEvent.RESULT, false, true, result, token);
			token.applyResult(event);
		}
		
	}
}