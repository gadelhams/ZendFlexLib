package zendflex.components
{
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	
	import flashx.textLayout.operations.DeleteTextOperation;
	import flashx.textLayout.operations.InsertTextOperation;
	
	import spark.components.TextInput;
	import spark.events.TextOperationEvent;
	
	import zendflex.events.ZflTextEvent;
	import zendflex.ui.Keyboard;
	
	public class MaskTextInput extends TextInput
	{
		
		//------------------------------------------------------------
		//
		//	Properties
		//
		//------------------------------------------------------------
		
		//------------------------------
		//	_textEvent
		//------------------------------
		
		private var _zfTextEvent:ZflTextEvent;
		
		//------------------------------
		//	_currentInputMask
		//------------------------------
		
		/**
		 * The inputMask with the _blankChar.
		 */
		private var _currentInputMask:String;
		
		//------------------------------
		//	_blankCharsPositions
		//------------------------------
		
		/**
		 * An array that contains all the positions of the
		 * _blankChar characters.
		 */
		private var _blankCharsPositions:Array;
		
		//------------------------------
		//	_maskCharsPositions
		//------------------------------
		
		/**
		 * An array that contains all the positions of the
		 * mask characters.
		 */
		private var _maskCharsPositions:Array;
		
		//------------------------------
		//	_useMask
		//------------------------------
		
		private var _useMask:Boolean = false;
		
		/**
		 * Var thats control if this input is using mask or not.
		 *
		 * @default false;
		 */
		public function get useMask():Boolean
		{
			return _useMask;
		}
		
		public function set useMask(value:Boolean):void
		{
			_useMask = value;
		}
		
		
		//------------------------------
		//	_inputMask
		//------------------------------
		
		private var _inputMask:String;
		
		/**
		 * <p>String that determinate the mask of the <code>TextInput</code>.
		 * Use the '?' character as default.</p>
		 *
		 * <p>Or others characters can be used as mask:</p>
		 * <ul>
		 * 	<li>? - Any character.</li>
		 * 	<li>& - Just alphabetic.</li>
		 *  <li># - Only numbers.</li>
		 * </ul>
		 *
		 * <p>If you don't know with use, just put the '?' character, and use
		 * the <code>restrict</code> property.</p>
		 *
		 * <p>This method will use regular expression to restrict the characters
		 * that will be used to complete the text.</p>
		 *
		 * @default null
		 */
		public function get inputMask():String
		{
			return _inputMask;
		}
		
		public function set inputMask(value:String):void
		{
			_inputMask = value;
			
			if (value.length == 0) {
				_useMask = false;
				return;
			}
			
			_useMask = true;
			
			changeInputMask(_inputMask);
		}
		
		//------------------------------
		//	_blankChar
		//------------------------------
		
		private var _blankChar:String = " ";
		
		/**
		 * The character that will be used as a default.
		 *
		 * @default " "
		 */
		public function get blankChar():String
		{
			return _blankChar;
		}
		
		public function set blankChar(value:String):void
		{
			_blankChar = value;
		}
		
		//------------------------------
		//	_unmaskedText
		//------------------------------
		
		private var _unmaskedText:String;
		
		/**
		 * The inputText.text property without the mask characters.
		 *
		 * @default null
		 */
		public function get unmaskedText():String
		{
			return getUnmaskedText();
		}
		
		public function set unmaskedText(value:String):void
		{
			_unmaskedText = value;
		}
		
		//------------------------------
		//	_cursorPosition
		//------------------------------
		
		/**
		 * The position of the cursor, will be reset every time in the
		 * keyDownHandler, if is a InsertTextOperation.
		 */
		private var _cursorPosition:int;
		
		//------------------------------
		//	_insertChar
		//------------------------------
		
		/**
		 * The character that will be insert in the TextInput.text property.
		 */
		private var _insertChar:String;
		
		//------------------------------------------------------------
		//
		//	Methods
		//
		//------------------------------------------------------------
		
		/**
		 * [Method]
		 *
		 * <p>Whenever the _inputMask change the value, this method will be called.
		 * Changing the maskChar with the _blankChar.</p>
		 *
		 * <p>Use the length of the mask to set the maxChar.</p>
		 */
		protected function changeInputMask(mask:String):void
		{
			_zfTextEvent = new ZflTextEvent(ZflTextEvent.INPUT_MASK_CHANGING);
			dispatchEvent(_zfTextEvent);
			
			if (mask.length == 0 || mask == "" || mask == null) {
				return;
			}
			
			var tempChar:String;
			_currentInputMask = "";
			_blankCharsPositions = new Array();
			_maskCharsPositions = new Array();
			
			for (var i:int = 0; i < mask.length; i++) {
				
				tempChar = mask.charAt(i);
				
				if (isMask(tempChar)) {
					_currentInputMask += _blankChar;
					_blankCharsPositions.push(i);
				} else {
					_currentInputMask += mask.charAt(i);
					_maskCharsPositions.push(i);
				}
			}
			
			text = _currentInputMask;
			maxChars = mask.length;
			
			_zfTextEvent = new ZflTextEvent(ZflTextEvent.INPUT_MASK_CHANGE);
			dispatchEvent(_zfTextEvent);
		}
		
		/**
		 * [Method]
		 *
		 * <p>Use regular expression to validate a character.
		 * Just pass the maskChar that indicate the pattern that will be used
		 * to validate the inputChar.</p>
		 *
		 * <p>Will return false if the maskChar is not ?, & or #, and if the inputChar
		 * test from RegExp result false</p>
		 *
		 * @param maskChar
		 * @param inputChar
		 * @return Boolean
		 */
		protected function validateChar(maskChar:String, inputChar:String):Boolean
		{
			var pattern:RegExp = /""/;
			switch (maskChar) {
				case "?":
					pattern = /""/;
					break;
				case "&":
					pattern = /[^0-9]/;
					break;
				case "#":
					pattern = /\d/;
					break;
				default:
					return false;
					break;
			}
			
			return pattern.test(inputChar);
		}
		
		/**
		 * [Method]
		 *
		 * <p>Function that checks if the character is a mask or not.</p>
		 *
		 * <p>Accept only the ?, & or # characters.</p>
		 *
		 * @param character
		 * @return Boolean
		 */
		protected function isMask(character:String):Boolean
		{
			switch (character) {
				case "?":
				case "&":
				case "#":
					return true;
					break;
				default:
					return false;
					break;
			}
		}
		
		/**
		 * [Method]
		 *
		 * <p>Return the unmaskedText property with no mask characters</p>
		 *
		 * @return String
		 */
		protected function getUnmaskedText():String
		{
			_unmaskedText = "";
			
			for each (var i:int in _blankCharsPositions) {
				_unmaskedText += text.charAt(i);
			}
			
			return _unmaskedText;
		}
		
		/**
		 * [Method]
		 *
		 * <p>Recursive method that checks if the current char it's a mask char.
		 * If true, make the manual selection from the current char to the next.
		 * If false, call the recursiveInsertChar again till finds a valid mask char.</p>
		 *
		 * @return void
		 */
		private function recursiveInsertChar():void
		{
			if (_cursorPosition > maxChars) {
				return;
			}
			
			if (isMask(_inputMask.charAt(_cursorPosition))) {
				
				var maskChar:String = _inputMask.charAt(_cursorPosition);
				
				if (validateChar(maskChar, _insertChar)) {
					selectRange(_cursorPosition, _cursorPosition + 1);
					return;
				} else {
					//throw new Error("The _insertChar is a invalid character, to prevent this use the TextInput.restrict property.");
					return;
				}
				
			}
			
			_cursorPosition++;
			
			recursiveInsertChar();
		}
		
		/**
		 * [Method]
		 *
		 * <p>Recursive method that checks if the current char it's a mask char.
		 * If true, make the manual selection from the current char to the next.
		 * If false, call the recusiveMaskChar again till finds a valid mask char.</p>
		 *
		 * @return void
		 */
		private function recursiveDeleteChar():void
		{
			var character:* = _inputMask.charAt(_cursorPosition);
			
			if (isMask(_inputMask.charAt(_cursorPosition))) {
				text = splice(text, _cursorPosition, _cursorPosition + 1, _blankChar);
				selectRange(_cursorPosition, _cursorPosition);
				return;
			}
			
			_cursorPosition--;
			recursiveDeleteChar();
		}
		
		/**
		 * [Method]
		 *
		 * @param str String
		 * @param start int
		 * @param end int
		 * @param strToInsert String
		 */
		private static function splice(str:String, start:int, end:int, strToInsert:String):String
		{
			return str.substring(0, start) + strToInsert + str.substring(end, str.length);
		}
		
		//------------------------------------------------------------
		//
		//	Handler
		//
		//------------------------------------------------------------
		
		protected function changingHandler(event:TextOperationEvent):void
		{
			if (event.operation is DeleteTextOperation) {
				
				if (useMask) {
					event.preventDefault();
					
					_cursorPosition = selectionAnchorPosition - 1;
					
					recursiveDeleteChar();
				}
			}
			
			if (event.operation is InsertTextOperation) {
				
				/*if (InsertTextOperation(event.operation).deleteSelectionState != null && useMask) {
					event.preventDefault();
				}*/
			}
		}
		
		override protected function keyDownHandler(event:KeyboardEvent):void
		{
			//super.keyDownHandler(event);
			
			switch (event.keyCode) {
				case Keyboard.UP:
					break;
				case Keyboard.DOWN:
					break;
				case Keyboard.LEFT:
					break;
				case Keyboard.RIGHT:
					break;
				case Keyboard.BACKSPACE:
					break;
				default:
					
					if (selectionAnchorPosition < selectionActivePosition) {
						_cursorPosition = selectionAnchorPosition;
					} else {
						_cursorPosition = selectionActivePosition;
					}
					
					_insertChar = String.fromCharCode(event.keyCode);
					
					recursiveInsertChar();
					break;
			}
		
		}
		
		override protected function focusInHandler(event:FocusEvent):void
		{
			super.focusInHandler(event);
			
			if (text == _currentInputMask) {
				selectRange(0, 0);
			}
		}
		
		//------------------------------------------------------------
		//
		//	Construtor
		//
		//------------------------------------------------------------
		
		public function MaskTextInput()
		{
			super();
			
			addEventListener(TextOperationEvent.CHANGING, changingHandler);
		}
	
	}
}
