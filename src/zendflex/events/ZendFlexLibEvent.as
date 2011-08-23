package zendflex.events
{
	
	/**
	 * Event class that has all generic events in this lib.
	 *
	 * @see zendflex.events.MasterEvent
	 *
	 * @author feliperodrigues
	 *
	 * @langversion 3.0
	 * @playerversion Flash 10
	 * @playerversion AIR 1.5
	 * @productversion Flex 4
	 */
	public class ZendFlexLibEvent extends MasterEvent
	{
		
		public function ZendFlexLibEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}