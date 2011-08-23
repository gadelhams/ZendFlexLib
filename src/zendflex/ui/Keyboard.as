package zendflex.ui
{
	
	public class Keyboard
	{
		
		//--------------------------------------------------------------------------
		//
		//  Const
		//
		//--------------------------------------------------------------------------
		
		public static const A:uint = 65;
		public static const B:uint = 66;
		public static const C:uint = 67;
		public static const D:uint = 68;
		public static const E:uint = 69;
		public static const F:uint = 70;
		public static const G:uint = 71;
		public static const H:uint = 72;
		public static const I:uint = 73;
		public static const J:uint = 74;
		public static const K:uint = 75;
		public static const L:uint = 76;
		public static const M:uint = 77;
		public static const N:uint = 78;
		public static const O:uint = 79;
		public static const P:uint = 80;
		public static const Q:uint = 81;
		public static const R:uint = 82;
		public static const S:uint = 83;
		public static const T:uint = 84;
		public static const U:uint = 85;
		public static const V:uint = 86;
		public static const W:uint = 87;
		public static const X:uint = 88;
		public static const Y:uint = 89;
		public static const Z:uint = 90;
		
		public static const NUMBER_0:uint = 48;
		public static const NUMBER_1:uint = 49;
		public static const NUMBER_2:uint = 50;
		public static const NUMBER_3:uint = 51;
		public static const NUMBER_4:uint = 52;
		public static const NUMBER_5:uint = 53;
		public static const NUMBER_6:uint = 54;
		public static const NUMBER_7:uint = 55;
		public static const NUMBER_8:uint = 56;
		public static const NUMBER_9:uint = 57;
		
		public static const NUMPAD_0:uint = 96;
		public static const NUMPAD_1:uint = 97;
		public static const NUMPAD_2:uint = 98;
		public static const NUMPAD_3:uint = 99;
		public static const NUMPAD_4:uint = 100;
		public static const NUMPAD_5:uint = 101;
		public static const NUMPAD_6:uint = 102;
		public static const NUMPAD_7:uint = 103;
		public static const NUMPAD_8:uint = 104;
		public static const NUMPAD_9:uint = 105;
		
		public static const PAGE_DOWN:uint = 34;
		public static const PAGE_UP:uint = 33;
		
		public static const UP:uint = 38;
		public static const DOWN:uint = 40;
		public static const LEFT:uint = 37;
		public static const RIGHT:uint = 39;
		
		public static const ENTER:uint = 13;
		public static const BACKSPACE:uint = 8;
		
		// numeros 48 ~ 57
		// letras 65 ~ 90
		// pad_numeros 96 ~ 105
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * [Static]
		 * This method check if the keyCode correspond to a letter character.
		 */
		public static function isLetter(keyCode:uint):Boolean
		{
			return (keyCode >= 65 && keyCode <= 90);
		}
		
		/**
		 * [Static]
		 * This method check if the keyCode correspond to a number character.
		 */
		public static function isNumeric(keyCode:uint):Boolean
		{
			return ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105));
		}
		
		/**
		 * [Static]
		 * This method check if the keyCode correspond to a letter or number character.
		 */
		public static function isAlphaNumeric(keyCode:uint):Boolean
		{
			return (isLetter(keyCode) || isNumeric(keyCode));
		}
		
		public function Keyboard()
		{
		}
	}
}