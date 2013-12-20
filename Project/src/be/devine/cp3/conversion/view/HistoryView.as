package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.elements.FeathersMenuButton;
import be.devine.cp3.conversion.elements.HistoryButton;
import be.devine.cp3.conversion.elements.MenuButton;
import be.devine.cp3.conversion.elements.TitleField;
import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.utils.Utils;

import flash.events.Event;

import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class HistoryView extends Sprite implements ICanBeViewed{
    private var _appModel:Appmodel;
    private var _backButton:MenuButton;
    private var _historyVOs:Array;
    private var _historyButtonArray:Array = [];

    public function HistoryView() {
        trace("[HistoryView] started.");
        _appModel = Appmodel.getInstance();
        _historyVOs = _appModel.historyVOs;
        _appModel.addEventListener(Appmodel.HISTORYVOS_CHANGED_EVENT, historyItemAddedHandler);
    }

    private function historyItemAddedHandler(event:Event):void {
        removeHistoryItems();
        createHistoryItems();
    }

    private function removeHistoryItems():void {
        for each(var historyItem:HistoryButton in _historyButtonArray){
            removeChild(historyItem);
        }
    }

    private function createHistoryItems():void {
        if(_appModel.historyVOs.length >= 6){
            trace("Larger!");
            for(var j:uint = 0; j < 6; j++ ){
                var _historyButton:HistoryButton = new HistoryButton(_appModel.historyVOs[_appModel.historyVOs.length-1-j]);
                _historyButtonArray.push(_historyButton);
            }
        } else {
            for(var k:uint = 0; k < _appModel.historyVOs.length; k++ ){
                var _historyButton:HistoryButton = new HistoryButton(_appModel.historyVOs[_appModel.historyVOs.length-1-k]);
                _historyButtonArray.push(_historyButton);
            }
        }

        if(_historyButtonArray.length != 0){

            for(var i:uint = 0; i < _historyButtonArray.length; i++){
                _historyButtonArray[i].y = i * (_historyButtonArray[i].height + 20*Utils.divideFactor) + 100*Utils.divideFactor;
                addChild(_historyButtonArray[i]);
            }
        }
    }

    private function backHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch){
            _appModel.currentScreen = "MenuView";
        }
    }

    public function resize(w:Number, h:Number):void{
        drawMenu();
        createHistoryItems();
    }

    private function drawMenu():void {
        var title:TitleField = new TitleField("History");
        title.y = 40*Utils.divideFactor;
        addChild(title);

//        _backButton = new MenuButton();
//        _backButton.addEventListener(TouchEvent.TOUCH, backHandler);
//        addChild(_backButton);


        var backButton:FeathersMenuButton = new FeathersMenuButton();
        addChild(backButton);
    }
}
}