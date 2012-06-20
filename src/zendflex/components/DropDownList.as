package zendflex.components
{
	import mx.collections.IList;
	
	import spark.components.DropDownList;
	import spark.events.IndexChangeEvent;
	
	public class DropDownList extends spark.components.DropDownList
	{
		
		[Bindable]
		public var bindValue:*;
		
		[Bindable]
		public var bindField:String;
		
		/*override public function set dataProvider(value:IList):void
		{
			for (var i:uint = 0; i < this.dataProvider.length; i++) {
		
				if (bindValue != null) {
					if (this.dataProvider[i][this.bindField] == bindValue) {
						this.selectedIndex = i;
						break;
					} else {
						this.selectedIndex = -1;
					}
				}
		
				this.selectedItem = value;
			}
		}*/
		
		public function selectItemByProp(prop:String, value:*, disparaEventoChange:Boolean = true):void
		{
			// prop = id_pessoa
			// value = 20;
			var count:int = 0;
			
			for each (var item:* in dataProvider) {
				
				if (!item.hasOwnProperty(prop)) {
					throw new Error("O item do DataProvider não contém esta propriedade: '" + prop + "'.");
					return;
				}
				
				if (item[prop] == value) {
					selectedIndex = count;
				} else {
					count++;
				}
			}
			
			if (disparaEventoChange) {
				dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGE));
			}
		
		}
		
		public function DropDownList()
		{
			super();
		}
	}
}
