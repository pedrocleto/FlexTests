package com.flexproject.services.vo
{
	public class Person
	{
		public var id:Object;
		public var name:String;
		public var surname:String;
		public var gender:String;
		
		public function Person(id:Object,name:String,surname:String,gender:String)
		{
			this.id=id;
			this.name=name;
			this.surname=surname;
			this.gender=gender;
		}
	}
}