package com.flexproject.vo
{
	public class CountryVO
	{
		public var name:String;
		public var code:String;
		public var hits:int;
		
		public function CountryVO(name:String="",code:String="", hits:int=0)
		{
			this.name=name;
			this.code=code;
			this.hits=hits;
		}
	}
}