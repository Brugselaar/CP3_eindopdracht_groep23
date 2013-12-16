package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.model.Appmodel;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class HistoryView extends Sprite implements ICanBeViewed{
    private var _appModel:Appmodel;
    private var _backButton:Quad;

    public function HistoryView() {
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
