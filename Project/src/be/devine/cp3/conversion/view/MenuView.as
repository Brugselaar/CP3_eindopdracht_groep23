/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 12/12/13
 * Time: 13:37
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.elements.ChoiceButton;
import be.devine.cp3.conversion.utils.Utils;

import flash.display.Bitmap;
import flash.display.BitmapData;

import starling.display.Image;
import starling.display.Sprite;

public class MenuView extends starling.display.Sprite{
    private var _logoBitMapData:BitmapData;
    private var _logo:Image;

    public function MenuView() {
        trace("[MenuView] started.");

        drawLogo();

        drawMenu();
    }

    private function drawMenu():void{
        var conversions:ChoiceButton = new ChoiceButton("Conversions");
        conversions.y = 320*Utils.divideFactor;
        addChild(conversions);

        var yPos:uint = conversions.height + 5;

        var history:ChoiceButton = new ChoiceButton("History");
        history.y = conversions.y + yPos;
        addChild(history);

        var profiles:ChoiceButton = new ChoiceButton("Profiles");
        profiles.y = history.y + yPos;
        addChild(profiles);

        var terminate:ChoiceButton = new ChoiceButton("Close");
        terminate.y = profiles.y + yPos;
        addChild(terminate);
    }

    private function drawLogo():void{
        // Make Flash asset in SWC
        var logo:Logo = new Logo();

        // Make Bitmapdata
        _logoBitMapData = new BitmapData(logo.width, logo.height, true, 0xFF0000);
        _logoBitMapData.draw(logo);

        _logo = Image.fromBitmap(new Bitmap(_logoBitMapData));
        _logoBitMapData.dispose();
        trace(Utils.divideFactor);
        _logo.scaleX = Utils.divideFactor;
        _logo.scaleY = Utils.divideFactor;
        _logo.x = Utils.screenWidth/2 - _logo.width/2;
        _logo.y = 60*Utils.divideFactor;
        addChild(_logo);
    }
}
}