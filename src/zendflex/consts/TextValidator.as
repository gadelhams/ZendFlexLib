package zendflex.consts
{
	
	/**
	 * Class that has the validator const of the <code>zendflex.components.TextInput</code>.
	 *
	 * @see zendflex.components.TextInput
	 *
	 * @author feliperodrigues
	 *
	 * @langversion 3.0
	 * @playerversion Flash 10
	 * @playerversion AIR 1.5
	 * @productversion Flex 4
	 */
	public class TextValidator
	{
		public static const NONE:String = 'none'; // No validation [DEFAULT]	     
		public static const EMAIL:String = 'email'; // E-mail validation
		public static const PHONE:String = 'phone'; // Phone Number validation
		public static const STRING:String = 'string'; // String validation
		public static const NUMBER:String = 'number'; // Number validation
		public static const DATE:String = 'date'; // Date validation
		
		public function TextValidator()
		{
		}
	}
}