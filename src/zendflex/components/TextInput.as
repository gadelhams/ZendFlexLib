package zendflex.components
{
	
	import spark.components.TextInput;
	
	public class TextInput extends spark.components.TextInput
	{
		
		private var _value:*;
		
		public function get value():*
		{
			return _value;
		}
		
		public function set value(value:*):void
		{
			_value = value;
		}
		
		public function TextInput()
		{
			super();
		}
	
	}

}