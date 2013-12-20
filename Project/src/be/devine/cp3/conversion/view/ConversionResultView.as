/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 13/12/13
 * Time: 11:08
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.elements.MenuButton;
import be.devine.cp3.conversion.model.Appmodel;

import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class ConversionResultView extends starling.display.Sprite implements ICanBeViewed{
    private var _appModel:Appmodel;
    private var _backButton:MenuButton;
    private var _output:Number;
    private var _input:Number;
    private var _rightFromOutput:String;
    private var _leftFromOutput:String;
    private var _leftFromInput:String;
    private var _rightFromInput:String;
    private var _nameFormula:String;

    public function ConversionResultView() {
        _appModel = Appmodel.getInstance();
        trace("[ConversionResultView] started.");

        getLatestResult();
    }

    private function getLatestResult():void{
        _output = _appModel.historyVOs[_appModel.historyVOs.length-1].output;
        _input = _appModel.historyVOs[_appModel.historyVOs.length-1].input;
        _rightFromInput = _appModel.historyVOs[_appModel.historyVOs.length-1].rightFromInput;
        _rightFromOutput = _appModel.historyVOs[_appModel.historyVOs.length-1].rightFromOutput;
        _leftFromInput = _appModel.historyVOs[_appModel.historyVOs.length-1].leftFromInput;
        _leftFromOutput = _appModel.historyVOs[_appModel.historyVOs.length-1].leftFromOutput;
        _nameFormula = _appModel.historyVOs[_appModel.historyVOs.length-1].nameFormula;

        trace(_nameFormula);
    }

    private function backHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch) {
            _appModel.currentScreen = "MenuView";
        }
    }

    public function resize(w:Number, h:Number):void{
            _backButton = new MenuButton();
            _backButton.addEventListener(TouchEvent.TOUCH, backHandler);
            addChild(_backButton);
    }
}
}
