package zendflex.components
{
	
	import mx.containers.FormItem;
	
	[Style(name="verticalAlign", enumeration="top,bottom,middle", defaultValue="top", type="String", inherit="no")]
	
	public class FormItem extends mx.containers.FormItem
	{
		
		private var _property:String;
		
		public function get property():String
		{
			return _property;
		}
		
		public function set property(value:String):void
		{
			_property = value;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		public function FormItem()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		public function getLastValue():Object
		{
			
			var retorno:Object = new Object();
			
			var obj:* = getElementAt(0);
			var string:String = getValueName(obj.className);
			
			retorno.name = this.name;
			retorno.value = obj[getValueName(obj.className)];
			retorno.property = _property; //id_situacao
			retorno.component = obj;
			
			return retorno;
		
		}
		
		protected function getValueName(className:String):String
		{
			
			switch (className) {
				
				case "DropDownList":
					return 'selectedItem';
					break;
				
				case "TextInput":
					return "text";
					break;
				
				case "TextArea":
					return "text";
					break;
				
				case "CheckBox":
					return "selected";
					break;
				
				case "DateField":
					return "date";
					break;
				
				case "DateChooser":
					return "date";
					break;
				
				case "NumericStepper":
					return "value";
					break;
				
				case "HSlider":
					return "value";
					break;
				
				case "VSlider":
					return "value";
					break;
				
				default:
					return "";
					break;
				
			}
		
		}
		
		/**
		 *  @protected
		 *  Alinha a Label do FormItem.
		 */
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			var verticalAlign:String = getStyle("verticalAlign");
			
			if (verticalAlign == "middle") {
				itemLabel.y = Math.max(0, (unscaledHeight - itemLabel.height) / 2);
				
			} else if (verticalAlign == "bottom") {
				
				var paddingBottom:Number = getStyle("paddingBottom");
				
				if (isNaN(paddingBottom)) {
					paddingBottom = 0;
				}
				
				itemLabel.y = Math.max(0, unscaledHeight - itemLabel.height - paddingBottom);
				
			}
		}
	
	
	}
}