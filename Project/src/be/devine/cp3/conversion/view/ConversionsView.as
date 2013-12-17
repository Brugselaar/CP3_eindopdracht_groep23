/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 13/12/13
 * Time: 11:07
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.utils.Utils;

import starling.display.DisplayObject;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class ConversionsView extends starling.display.Sprite implements ICanBeViewed{
    private var _backButton:Quad;
    private var _appModel:Appmodel;

    public function ConversionsView() {
        _appModel = Appmodel.getInstance();

        //TODO ELEMENTEN MAKEN

        _backButton = new Quad(100, 100, 0xff0000);
        _backButton.addEventListener(TouchEvent.TOUCH, backHandler);
    }

    private function backHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
        if (touch)
        {
            _appModel.currentScreen = "MenuView";
        }
    }

    public function resize(w:Number, h:Number):void{
        drawMenu();
    }

    private function drawMenu():void {
        _backButton.y = 0;
        _backButton.x = 0;
        addChild(_backButton);
    }
}
}
