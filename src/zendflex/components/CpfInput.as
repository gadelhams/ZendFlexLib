package zendflex.components
{
	import mx.events.FlexEvent;
	
	public class CpfInput extends MaskTextInput
	{
		public function CpfInput()
		{
			addEventListener(FlexEvent.CREATION_COMPLETE, creationCompleteHandler);
			super();
		}
		
		protected function creationCompleteHandler(event:FlexEvent):void
		{
			inputMask = "###.###.###-##";
			restrict = "0-9";
		}
	
	}
}