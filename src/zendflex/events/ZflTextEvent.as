package zendflex.events
{
	
	/**
	 * <p>An event object with the events related to a String or text property.</p>.
	 *
	 * @see zendflex.events.ZendFlexLibEvent
	 * @see zendflex.events.MasterEvent
	 *
	 * @author feliperodrigues
	 *
	 * @langversion 3.0
	 * @playerversion Flash 10
	 * @playerversion AIR 1.5
	 * @productversion Flex 4
	 */
	public class ZflTextEvent extends MasterEvent
	{
		//--------------------------------------------------------------------------
		//
		//  Const
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Text property changed.
		 */
		public static const TEXT_CHANGED:String = "textChangedEvent"; // When the property text change.
		
		/**
		 * inputMask property chaged.
		 */
		public static const INPUT_MASK_CHANGE:String = "inputMaskChangeEvent"; // When the inputMask had changed
		
		/**
		 * inputMask property begin to change.
		 */
		public static const INPUT_MASK_CHANGING:String = "inputMaskChangingEvent"; // When the inputMask beging to change
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * <p>This is the character that will be send to the text property
		 * to be insert in the TextInput.<p/>
		 */
		public var insertChar:String;
		
		/**
		 * <p>This is the character that will be erase to the text property
		 * from the TextInput.</p>
		 */
		public var deleteChar:String;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function ZflTextEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}