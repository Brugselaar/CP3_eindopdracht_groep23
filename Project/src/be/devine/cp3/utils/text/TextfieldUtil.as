package be.devine.cp3.utils.text {
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	public class TextfieldUtil {

		public function TextfieldUtil() {

		}

		public static function createTextField( tf:TextFormat, text:String ):TextField {
			var textField:TextField = new TextField();
			textField.autoSize = TextFieldAutoSize.LEFT;
			textField.defaultTextFormat = tf;
			textField.embedFonts = true;
			textField.text = text;
			textField.multiline = true;
			textField.wordWrap = true;
			
			
			return textField;
		}
		
	}
}