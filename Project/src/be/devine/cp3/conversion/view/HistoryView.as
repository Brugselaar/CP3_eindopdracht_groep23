package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.elements.HistoryButton;
import be.devine.cp3.conversion.elements.MenuButton;
import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.utils.Utils;
import be.devine.cp3.conversion.vo.HistoryVO;

import flash.events.Event;

import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class HistoryView extends Sprite implements ICanBeViewed{
    private var _appModel:Appmodel;
    private var _backButton:MenuButton;
    private var _testButton:Quad;
    private var _historyVOs:Array;
    private var _historyButtonArray:Array = [];

    public function HistoryView() {
        trace("[HistoryView] started.");
        _appModel = Appmodel.getInstance();
        _historyVOs = _appModel.historyVOs;
        _appModel.addEventListener(Appmodel.HISTORYVOS_CHANGED_EVENT, historyItemAddedHandler);
    }

    private function testHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch){
            var testVO:HistoryVO = new HistoryVO();
            testVO.id = 0;
            testVO.nameFormula = "TestFormule";
            testVO.input = 40;
            testVO.leftFromInput = "€";
            testVO.rightFromInput = "";
            testVO.output = 30.38;
            testVO.rightFromOutput = "L";
            testVO.leftFromOutput = "";
            //To make sure that the JSON files gets changed you best do this
            var historyVOs:Array = _appModel.historyVOs.concat();
            historyVOs.push(testVO);
            _appModel.historyVOs = historyVOs;
        }
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

        _testButton = new Quad(100, 100, 0x00ff00);
        _testButton.addEventListener(TouchEvent.TOUCH, testHandler);
        addChild(_testButton);
    }
}
}