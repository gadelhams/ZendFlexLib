package zendflex.consts
{
	
	/**
	 * Class that has the restriction of the <code>zendflex.controls.TextInput</code>.
	 *
	 * @see zendflex.controls.TextInput
	 *
	 * @author feliperodrigues
	 *
	 * @langversion 3.0
	 * @playerversion Flash 10
	 * @playerversion AIR 1.5
	 * @productversion Flex 4
	 */
	public class TextRestrict
	{
		
		public static const NONE:String = '';
		public static const NUMBER:String = '0-9';
		public static const TEXT:String = '^0-9';
		public static const NUMBER_TEXT:String = 'a-z A-Z 0-9';
		public static const TEXT_NO_SPECIAL:String = '^`~!@#$%&*()-_+=[]{}\\|;:/?>.<,\^';
		
		public function TextRestrict()
		{
		}
	}
}