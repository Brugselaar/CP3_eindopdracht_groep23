/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 13/12/13
 * Time: 11:07
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.elements.MenuButton;
import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.vo.ConversionVO;

import starling.events.Touch;

import starling.events.TouchEvent;

import starling.display.Sprite;
import starling.events.TouchPhase;

public class DoConversionView extends Sprite implements ICanBeViewed{
    private var _appModel:Appmodel = Appmodel.getInstance();
    private var _conversion:ConversionVO;

    private var _title:String;
    private var _formula:Number;
    private var _reverseFormula:Number;
    private var _reverseTitle:String;
    private var _custom:Boolean;
    private var _rightFromInput:String;
    private var _rightFromOutput:String;
    private var _leftFromInput:String;
    private var _leftFromOutput:String;

    private var _backButton:MenuButton;



    public function DoConversionView() {
        for each(var conversion:ConversionVO in _appModel.conversionVOs){
            if(conversion.title == _appModel.selectedFormula){
                _conversion = conversion;
                _title = _conversion.title;
                _formula = _conversion.formula;
                _reverseTitle = _conversion.reverseTitle;
                _reverseFormula = _conversion.reverseFormula;
                _custom = _conversion.custom;
                _rightFromOutput = conversion.rightFromOutput;
                _rightFromInput = conversion.rightFromInput;
                _leftFromInput = conversion.leftFromInput;
                _leftFromOutput = conversion.leftFromOutput;
                trace ("Got: " + _title);
                doConversion(2);
            }
        }
    }

    public function doConversion(input:Number):void{
        var output:Number = input * _formula;
        trace (_leftFromInput + input + _rightFromInput + " = " + _leftFromOutput + output + _rightFromOutput);
    }

    public function resize(w:Number, h:Number):void{
        _backButton = new MenuButton();
        _backButton.addEventListener(TouchEvent.TOUCH, backHandler);
        addChild(_backButton);
    }

    private function backHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch) {
            _appModel.currentScreen = "MenuView";
        }
    }
}
}
