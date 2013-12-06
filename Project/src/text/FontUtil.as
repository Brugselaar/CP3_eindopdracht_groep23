package be.devine.stars.text {
	import flash.text.Font;
	
	
	public class FontUtil {
		// Properties - Variabelen
		
		// Constructor - Uitvoeren
		public function FontUtil() {
			
		}
		
		//Methods - Functies
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