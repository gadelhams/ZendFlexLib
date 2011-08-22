package zendflex.components
{
	import flash.events.KeyboardEvent;
	
	import flashx.textLayout.edit.EditManager;
	import flashx.textLayout.edit.EditingMode;
	import flashx.textLayout.edit.IEditManager;
	
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	
	import spark.components.RichEditableText;
	import spark.events.TextOperationEvent;
	
	import zendflex.ui.Keyboard;
	
	use namespace mx_internal;
	
	public class RichEditableText extends spark.components.RichEditableText
	{
		public function RichEditableText()
		{
			super();
		
		}
		
		override mx_internal function keyDownHandler(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.BACKSPACE) {
				var keyboardEvent:KeyboardEvent = new KeyboardEvent(KeyboardEvent.KEY_DOWN, true, false, Keyboard.BACKSPACE);
				dispatchEvent(keyboardEvent);
				
				event.preventDefault();
			} else {
				if (textContainerManager.editingMode != EditingMode.READ_WRITE)
					return;
				
				// We always handle the 'enter' key since we would have to recreate
				// the container manager to change the configuration if multiline 
				// changes.            
				if (event.keyCode == Keyboard.ENTER) {
					if (!multiline) {
						dispatchEvent(new FlexEvent(FlexEvent.ENTER));
						event.preventDefault();
						return;
					}
					
					// Multiline.  Make sure there is room before acting on it.
					if (maxChars != 0 && text.length >= maxChars) {
						event.preventDefault();
						return;
					}
					
					var editManager:IEditManager =
						EditManager(textContainerManager.beginInteraction());
					
					if (editManager.hasSelection())
						editManager.splitParagraph();
					
					textContainerManager.endInteraction();
					
					event.preventDefault();
				}
			}
		
		}
	}
}