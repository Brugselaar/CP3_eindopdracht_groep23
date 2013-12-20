package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.elements.HistoryButton;
import be.devine.cp3.conversion.elements.MenuButton;
import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.utils.Utils;
import be.devine.cp3.conversion.vo.HistoryVO;

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
        for each(var HistoryItem:HistoryVO in _historyVOs){
            var _historyButton:HistoryButton = new HistoryButton(HistoryItem);
            _historyButtonArray.push(_historyButton);
        }

        if(_historyButtonArray.length != 0){
            for(var i:uint = 0; i < _historyButtonArray.length; i++){
                _historyButtonArray[i].y = i * (_historyButtonArray[i].height + 20*Utils.divideFactor);
                trace(_historyButtonArray[i].y);
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
        _backButton = new MenuButton();
        _backButton.addEventListener(TouchEvent.TOUCH, backHandler);
        addChild(_backButton);
    }
}
}