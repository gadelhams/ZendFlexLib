package zendflex.components
{
	import mx.controls.DateField;
	
	public class DateField extends mx.controls.DateField
	{
		public function DateField()
		{
			super();
			
			width = 120;
			editable = true;
			formatString = "DD/MM/YYYY";
			yearNavigationEnabled = true;
		}
	}
}
