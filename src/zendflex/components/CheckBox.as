//------------------------------------------------------------------------------
//
//   Copyright 2011 
//   All rights reserved. 
//
//------------------------------------------------------------------------------
package zendflex.components
{
	import flash.events.MouseEvent;
	
	import spark.components.CheckBox;
	
	import zendflex.skins.CheckBoxIndeterminate;
	
	/**
	 * Insira um comentário para essa classe.
	 *
	 * @author feliperodrigues
	 *
	 * @langversion 3.0
	 * @playerversion Flash 10
	 * @playerversion AIR 1.5
	 * @productversion Flex 4
	 */
	public class CheckBox extends spark.components.CheckBox
	{
		/**
		 *
		 * @default
		 */
		private var _value:*;
		
		/**
		 * Insira um comentário para essa função.
		 *
		 * @return
		 */
		public function get value():*
		{
			
			return _value;
		
		}
		
		/**
		 * Insira um comentário para essa função.
		 *
		 * @param value
		 */
		public function set value(value:*):void
		{
			
			_value = value;
		
		}
		
		private var _indeterminate:Boolean;
		
		/**
		 * Insira um comentário para essa função.
		 *
		 * @return
		 */
		public function get indeterminate():Boolean
		{
			
			return _indeterminate;
		
		}
		
		/**
		 * Insira um comentário para essa função.
		 *
		 * @param value
		 */
		public function set indeterminate(value:Boolean):void
		{
			
			_indeterminate = value;
			
			if (_indeterminate == true && selected == false) {
				skin.currentState = "upAndIndeterminate";
				return;
			}
			
			if (_indeterminate == true && selected == true) {
				_indeterminate = false;
				skin.currentState = "upAndSelected";
				return;
			}
			
			if (_indeterminate == false && selected == true) {
				skin.currentState = "upAndSelected";
				return;
			}
			
			if (_indeterminate == false && selected == false) {
				skin.currentState = "up";
				return;
			}
		
		}
		
		/**
		 * Insira um comentário para essa função.
		 *
		 */
		public function CheckBox()
		{
			
			super();
			setStyle("skinClass", CheckBoxIndeterminate);
			removeEventListener(MouseEvent.ROLL_OVER, mouseEventHandler);
			removeEventListener(MouseEvent.ROLL_OUT, mouseEventHandler);
			addEventListener(MouseEvent.ROLL_OVER, rollOverEventHandler);
			addEventListener(MouseEvent.ROLL_OUT, rollOutEventHandler);
		
		}
		
		/**
		 * Insira um comentário para essa função.
		 *
		 * @param event
		 */
		protected function rollOverEventHandler(event:MouseEvent):void
		{
			
			if (event.target.skin.currentState == "up") {
				event.target.skin.currentState = "over";
				return;
			}
			
			if (event.target.skin.currentState == "upAndSelected") {
				event.target.skin.currentState = "overAndSelected";
				return;
			}
			
			if (event.target.skin.currentState == "upAndIndeterminate") {
				event.target.skin.currentState = "overAndIndeterminate";
				return;
			}
		
		}
		
		/**
		 * Insira um comentário para essa função.
		 *
		 * @param event
		 */
		protected function rollOutEventHandler(event:MouseEvent):void
		{
			
			if (event.target.skin.currentState == "over") {
				event.target.skin.currentState = "up";
				return;
			}
			
			if (event.target.skin.currentState == "overAndSelected") {
				event.target.skin.currentState = "upAndSelected";
				return;
			}
			
			if (event.target.skin.currentState == "overAndIndeterminate") {
				event.target.skin.currentState = "upAndIndeterminate";
				event.target.indeterminate = true;
				return;
			}
		
		}
	}
}
