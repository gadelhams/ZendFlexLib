package zendflex.components
{
	import flash.display.InteractiveObject;
	
	import spark.components.Panel;
	
	public class Panel extends spark.components.Panel
	{
		
		/**
		 *
		 * @default
		 */
		public var resizeArea:InteractiveObject;
		
		
		protected function configureResizeArea():void
		{
		
		}
		
		public function Panel()
		{
			super();
		}
	}
}