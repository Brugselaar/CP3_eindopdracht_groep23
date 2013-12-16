/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 12/12/13
 * Time: 13:37
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.elements.ChoiceButton;
import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.utils.Utils;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Point;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class MenuView extends starling.display.Sprite implements ICanBeViewed{
    private var _logoBitMapData:BitmapData;
    private var _logo:Image;
    private var _appModel:Appmodel;
    private var _conversions:ChoiceButton;
    private var _history:ChoiceButton;
    private var _profiles:ChoiceButton;
    private var _terminate:ChoiceButton;



    public function MenuView() {
        trace("[MenuView] started.");
        _appModel = Appmodel.getInstance();
        _conversions = new ChoiceButton("Conversions");
        _conversions.addEventListener(TouchEvent.TOUCH, conversionsHandler);

        _history = new ChoiceButton("History");

        _profiles = new ChoiceButton("Profiles");

        _terminate = new ChoiceButton("Close");

    }

    private function drawMenu():void{
        _conversions.y = 320*Utils.divideFactor;
        addChild(_conversions);


        _history.y = _conversions.y + _history.height + 20*Utils.divideFactor;
        addChild(_history);

        _profiles.y = _history.y + _history.height + 20*Utils.divideFactor;
        addChild(_profiles);

        _terminate.y = _profiles.y + _history.height + 20*Utils.divideFactor;
        addChild(_terminate);
    }

    private function conversionsHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
        if (touch)
        {
            _appModel.currentScreen = "ConversionsView";
        }
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

    public function resize(w:Number, h:Number):void{
        trace (w + " x " + h);
        drawLogo();
        drawMenu();
    }
}
}