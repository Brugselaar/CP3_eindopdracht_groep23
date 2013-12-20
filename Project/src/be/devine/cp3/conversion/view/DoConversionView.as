/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 13/12/13
 * Time: 11:07
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.elements.ChoiceButton;
import be.devine.cp3.conversion.elements.InputField;
import be.devine.cp3.conversion.elements.MenuButton;
import be.devine.cp3.conversion.elements.TitleField;
import be.devine.cp3.conversion.model.AppModel;
import be.devine.cp3.conversion.utils.Utils;
import be.devine.cp3.conversion.vo.ConversionVO;
import be.devine.cp3.conversion.vo.HistoryVO;

import starling.events.Touch;
import starling.events.TouchEvent;
import starling.display.Sprite;
import starling.events.TouchPhase;

public class DoConversionView extends Sprite implements ICanBeViewed{
    private var _appModel:AppModel = AppModel.getInstance();
    private var _conversion:ConversionVO;

    private var _id:uint;
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
    private var _titleField:TitleField;
    private var _input:InputField;
    private var _submit:ChoiceButton;
    private var _reverseButton:ChoiceButton;
    private var _isReverse:Boolean = false;

    public function DoConversionView() {
        for each(var conversion:ConversionVO in _appModel.conversionVOs){
            if(conversion.title == _appModel.selectedFormula){
                _id = conversion.id;
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
            }
        }
    }

    public function doConversion(input:Number):void{
        if(_id != 5){
            if(_isReverse){
                var output:Number = input * _reverseFormula;
            }else{
                var output:Number = input * _formula;
            }
        } else {
            if(_isReverse){
                var output:Number = input /100 * _appModel.currentProfile.consumption;
                trace(output);
            }else{
                var output:Number = input /_appModel.currentProfile.consumption * 100;
                trace(output);
            }
        }
        trace (_leftFromInput + input + _rightFromInput + " = " + _leftFromOutput + output + _rightFromOutput);
        var historyVOs:Array = _appModel.historyVOs.concat();
        var historyVO:HistoryVO = new HistoryVO();
        historyVO.id = historyVOs.length;
        if(_isReverse){
            historyVO.nameFormula = _reverseTitle;
            historyVO.rightFromInput = _rightFromOutput;
            historyVO.leftFromInput = _leftFromOutput;
            historyVO.leftFromOutput = _leftFromInput;
            historyVO.rightFromOutput = _rightFromInput;
        }else{
            historyVO.nameFormula = _title;
            historyVO.rightFromInput = _rightFromInput;
            historyVO.leftFromInput = _leftFromInput;
            historyVO.leftFromOutput = _leftFromOutput;
            historyVO.rightFromOutput = _rightFromOutput;
        }
        historyVO.output = output;
        historyVO.input = input;
        historyVO.custom = _custom;
        historyVOs.push(historyVO);
        _appModel.historyVOs = historyVOs;
        _appModel.currentScreen = "ConversionResultView";
    }

    public function resize(w:Number, h:Number):void{
        buildView();
    }

    private function buildView():void{
        if(_isReverse){
            _titleField = new TitleField(_reverseTitle);
        }else{
            _titleField = new TitleField(_title);
        }
        _titleField.y = 80*Utils.divideFactor;
        addChild(_titleField);

        _input = new InputField();
        _input.y = _titleField.y + _input.height;
        addChild(_input);

        _submit = new ChoiceButton("Submit");
        _submit.addEventListener(TouchEvent.TOUCH, submitHandler);
        _submit.y = _input.y + _submit.height + 10*Utils.divideFactor;;
        addChild(_submit);

        if(!_custom){
            _reverseButton = new ChoiceButton("Reverse");
            _reverseButton.addEventListener(TouchEvent.TOUCH, reverseHandler);
            _reverseButton.y = _submit.y + _reverseButton.height + 20*Utils.divideFactor;
            addChild(_reverseButton);
        }

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

    private function submitHandler(event:TouchEvent):void {
        if (_input.inputfield.text == "" || _input.inputfield.text == "Digits only" ||  _input.inputfield.text == "." || _input.inputfield.text == ".." || _input.inputfield.text == "..."){

        }else{
            var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
            if(touch){
                doConversion(int(_input.inputfield.text));
            }
        }
    }

    private function reverseHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch) {
            isReverse = "reverse";
        }
    }

    public function get isReverse():Boolean {
        return _isReverse;
    }

    public function set isReverse(value:Boolean):void {
        _isReverse = !_isReverse;
        trace(_isReverse);
        if(_isReverse){
            removeChild(_titleField);
            _titleField = new TitleField(_reverseTitle);
            _titleField.y = 80*Utils.divideFactor;
            addChild(_titleField);
        }else{
            removeChild(_titleField);
            _titleField = new TitleField(_title);
            _titleField.y = 80*Utils.divideFactor;
            addChild(_titleField);
        }
    }

    public function get titleField():TitleField {
        return _titleField;
    }

    public function set titleField(value:TitleField):void {
        _titleField = value;
    }
}
}