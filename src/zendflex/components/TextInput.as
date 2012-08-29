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
			if(maxChars > 0 && this.text.length == maxChars) {
				focusManager.setFocus(focusManager.getNextFocusManagerComponent());
			}
		}
		
		public function set maxCharToNextComponent(value:Boolean):void {
			if(value) {
				this.addEventListener(TextOperationEvent.CHANGE, handleChangeEvent);
			} else {
				this.removeEventListener(TextOperationEvent.CHANGE, handleChangeEvent);
			}
		}
		
		/**
		 * <p> Var that controls whether or not the focus is to go to the next component 
		 * after reaching the maxChar property </p>
		 */
		public function get maxCharToNextComponent():Boolean {
			return maxCharToNextComponent;
		}
		
		public function TextInput()
		{
			super();
		}
	
	}

}