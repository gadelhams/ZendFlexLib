package zendflex.events
{
	import flash.events.Event;
	
	/**
	 * <p>Base class for creating custom events in this lib.</p>
	 *
	 * @see zendflex.events.ZendFlexLibEvent
	 *
	 * @author feliperodrigues
	 *
	 * @langversion 3.0
	 * @playerversion Flash 10
	 * @playerversion AIR 1.5
	 * @productversion Flex 4
	 */
	public class MasterEvent extends Event
	{
		public function MasterEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}