/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 13/12/13
 * Time: 11:08
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.elements.InputField;
import be.devine.cp3.conversion.elements.MenuButton;
import be.devine.cp3.conversion.elements.TitleField;
import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.utils.Utils;

import flash.display.Bitmap;

import flash.display.BitmapData;

import starling.display.Image;

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
    private var _convert:Convert;
    private var _convertImage:Image;
    private var _convertBitMapData:BitmapData;

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

        var title:TitleField = new TitleField(_nameFormula);
        title.y = 40*Utils.divideFactor;
        addChild(title);

        var input:InputField = new InputField(10, true, String(_input));
        input.y = title.y + title.height;
        addChild(input);

        _convert = new Convert();
        _convert.gotoAndStop(1);
        _convertBitMapData = new BitmapData(_convert.width, _convert.height, true, 0xFF0000);
        _convertBitMapData.draw(_convert);

        _convertImage = Image.fromBitmap(new Bitmap(_convertBitMapData));
        _convertBitMapData.dispose();
        _convertImage.scaleX = Utils.divideFactor;
        _convertImage.scaleY = Utils.divideFactor;
        _convertImage.x = Utils.screenWidth/2 - _convertImage.width/2;

        _convertImage.y = input.y + input.height;
        addChild(_convertImage);

        var output:InputField = new InputField(10, true, String(_output));
        output.y = _convertImage.y + _convertImage.height + 30*Utils.divideFactor;
        addChild(output);
    }
}
}
