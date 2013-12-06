package be.devine.cp3.utils.text {
	import flash.text.Font;
	
	
	public class FontUtil {

		public function FontUtil() {
			
		}

		public static function showEmbeddedFonts():void {
			trace("[FontUtil] Start with looping through embedded fonts");
			trace("[FontUtil] Found " + Font.enumerateFonts().length + " embedded fonts...");
			for each( var f:Font in Font.enumerateFonts() ){
				trace("[FontUtil] Naam = " + f.fontName + " - Stijl = " + f.fontStyle + " - Type = " + f.fontType); 
			}
			
			trace("[FontUtil] End!");
		}
		
	}
}