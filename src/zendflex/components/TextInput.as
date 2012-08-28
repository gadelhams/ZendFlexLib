package zendflex.components
{
	
	import spark.components.TextInput;
	import spark.events.TextOperationEvent;
	
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
		
		protected function handleChangeEvent(event:TextOperationEvent):void {
			if(this.text.length == maxChars) {
				focusManager.setFocus(focusManager.getNextFocusManagerComponent());
			}
		}
		
		public function set maxCharToNextComponent(value:int):void {
			maxChars = value;
			if(!isNaN(value)) {
				this.addEventListener(TextOperationEvent.CHANGE, handleChangeEvent);
			} else {
				this.removeEventListener(TextOperationEvent.CHANGE, handleChangeEvent);
			}
		}
		
		public function get maxCharToNextComponent():int {
			return maxCharToNextComponent;
		}
		
		public function TextInput()
		{
			super();
		}
	
	}

}