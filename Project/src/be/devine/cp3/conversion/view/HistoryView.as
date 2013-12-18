package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.elements.ChoiceButton;
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
    private var _backButton:Quad;
    private var _testButton:Quad;
    private var _historyVOs:Array;
    private var _choiceButtonArray:Array = [];

    public function HistoryView() {
        _appModel = Appmodel.getInstance();
        _historyVOs = _appModel.historyVOs;
        _appModel.addEventListener(Appmodel.HISTORYVOS_CHANGED_EVENT, historyItemAddedHandler);

        //TODO ELEMENTEN MAKEN

        _backButton = new Quad(100, 100, 0xff0000);
        _backButton.addEventListener(TouchEvent.TOUCH, backHandler);

        _testButton = new Quad(100, 100, 0x00ff00);
        _testButton.addEventListener(TouchEvent.TOUCH, testHandler);

        createHistoryItems();
    }

    private function testHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
        if (touch)
        {
            var testVO:HistoryVO = new HistoryVO();
            testVO.id = 0;
            testVO.nameFormula = "TestFormule";
            testVO.input = 420;
            testVO.leftFromInput = "";
            testVO.rightFromInput = "BLAZEIT";
            testVO.output = 69.69;
            testVO.rightFromOutput = "?";
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
        for each(var historyItem:ChoiceButton in _choiceButtonArray){
            removeChild(historyItem);
        }
    }

    private function createHistoryItems():void {
        for each(var HistoryItem:HistoryVO in _historyVOs){
            var _choiceButton:ChoiceButton = new ChoiceButton(HistoryItem.nameFormula);
            _choiceButtonArray.push(_choiceButton);
        }

        if(_choiceButtonArray.length != 0){
            for(var i:uint = 0; i < _choiceButtonArray.length; i++){
                _choiceButtonArray[i].y = i * (_choiceButtonArray[i].height + 20*Utils.divideFactor);
                addChild(_choiceButtonArray[i]);
            }
        }
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
        _testButton.y = 0;
        _testButton.x = 200;
        addChild(_backButton);
        addChild(_testButton);
    }
}
}
