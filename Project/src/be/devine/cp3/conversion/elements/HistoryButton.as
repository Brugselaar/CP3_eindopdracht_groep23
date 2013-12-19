/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 19/12/13
 * Time: 10:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.elements {
import be.devine.cp3.conversion.utils.Utils;
import be.devine.cp3.conversion.vo.HistoryVO;
import be.devine.cp3.conversion.vo.MenuVO;

import flash.display.Bitmap;

import flash.display.BitmapData;

import starling.display.Image;

import starling.display.Quad;
import starling.display.Sprite;
import starling.text.TextField;
import starling.text.TextFieldAutoSize;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class HistoryButton extends Sprite{
    private var _nameFormula:String;
    private var _input:String;
    private var _output:String;
    private var _leftFromInput:String;
    private var _rightFromInput:String;
    private var _leftFromOutput:String;
    private var _rightFromOutput:String;
    private var _nameTextField:TextField;
    private var _outputTextField:TextField;
    private var _inputTextField:TextField;
    private var _leftFromInputTextField:TextField;
    private var _rightFromInputTextField:TextField;
    private var _leftFromOutputTextField:TextField;
    private var _rightFromOutputTextField:TextField
    private var _background:Quad;
    private var _big:Boolean;
    private var _backgroundColor:uint;
    private var _textColor:uint;
    private var _menuVO:MenuVO;
    private var _convertRight:Image;
    private var _convertBitMapData:BitmapData;
    private var _convert:Convert;

    public function HistoryButton(history:HistoryVO, backgroundColor:uint = 0x000000, textColor:uint = 0xf9cb14) {
        // Variables
        _nameFormula = history.nameFormula;
        _input = String(history.input);
        _output = String(history.output);
        _leftFromInput = history.leftFromInput;
        _rightFromInput = history.rightFromInput;
        _leftFromOutput = history.leftFromOutput;
        _rightFromOutput = history.rightFromOutput;
        _backgroundColor = backgroundColor;
        _textColor = textColor;

        _background = new Quad(Utils.screenWidth-40*Utils.divideFactor, 100*Utils.divideFactor, _backgroundColor);
        _background.x = Utils.screenWidth/2 - _background.width/2;

        // Build Text LOTSA CODE
        _nameTextField = new TextField(Utils.screenWidth-40*Utils.divideFactor, 110*Utils.divideFactor, _nameFormula, "Liberator", 36*Utils.divideFactor, _textColor);
        _nameTextField.autoSize = TextFieldAutoSize.BOTH_DIRECTIONS;
        _nameTextField.vAlign = VAlign.CENTER;
        _nameTextField.hAlign = HAlign.LEFT;
        _nameTextField.x = 40*Utils.divideFactor;

        // INPUT
        _inputTextField = new TextField(60*Utils.divideFactor, 110*Utils.divideFactor, _input, "Liberator", 36*Utils.divideFactor, _textColor);
        _inputTextField.autoSize = TextFieldAutoSize.BOTH_DIRECTIONS;
        _inputTextField.vAlign = VAlign.CENTER;
        _inputTextField.hAlign = HAlign.LEFT;
        _inputTextField.x = 40*Utils.divideFactor;

        _leftFromInputTextField = new TextField(40*Utils.divideFactor, 110*Utils.divideFactor, _leftFromInput, "Liberator", 36*Utils.divideFactor, _textColor);
        _leftFromInputTextField.autoSize = TextFieldAutoSize.BOTH_DIRECTIONS;
        _leftFromInputTextField.vAlign = VAlign.CENTER;
        _leftFromInputTextField.hAlign = HAlign.LEFT;
        _leftFromInputTextField.x = 40*Utils.divideFactor;

        _rightFromInputTextField = new TextField(40*Utils.divideFactor, 110*Utils.divideFactor, _rightFromInput, "Liberator", 36*Utils.divideFactor, _textColor);
        _rightFromInputTextField.autoSize = TextFieldAutoSize.BOTH_DIRECTIONS;
        _rightFromInputTextField.vAlign = VAlign.CENTER;
        _rightFromInputTextField.hAlign = HAlign.LEFT;
        _rightFromInputTextField.x = 40*Utils.divideFactor;

        // OUTPUT
        _outputTextField = new TextField(60*Utils.divideFactor, 110*Utils.divideFactor, _output, "Liberator", 36*Utils.divideFactor, _textColor);
        _outputTextField.autoSize = TextFieldAutoSize.BOTH_DIRECTIONS;
        _outputTextField.vAlign = VAlign.CENTER;
        _outputTextField.hAlign = HAlign.LEFT;
        _outputTextField.x = 40*Utils.divideFactor;

        _leftFromOutputTextField = new TextField(40*Utils.divideFactor, 110*Utils.divideFactor, _leftFromOutput, "Liberator", 36*Utils.divideFactor, _textColor);
        _leftFromOutputTextField.autoSize = TextFieldAutoSize.BOTH_DIRECTIONS;
        _leftFromOutputTextField.vAlign = VAlign.CENTER;
        _leftFromOutputTextField.hAlign = HAlign.LEFT;
        _leftFromOutputTextField.x = 40*Utils.divideFactor;

        _rightFromOutputTextField = new TextField(40*Utils.divideFactor, 110*Utils.divideFactor, _rightFromOutput, "Liberator", 36*Utils.divideFactor, _textColor);
        _rightFromOutputTextField.autoSize = TextFieldAutoSize.BOTH_DIRECTIONS;
        _rightFromOutputTextField.vAlign = VAlign.CENTER;
        _rightFromOutputTextField.hAlign = HAlign.LEFT;
        _rightFromOutputTextField.x = 40*Utils.divideFactor;

        // Make convertIcon
        _convert = new Convert();
        _convert.gotoAndStop(2);
        _convertBitMapData = new BitmapData(48, 48, true, 0xFF0000);
        _convertBitMapData.draw(_convert);
        _convertRight = Image.fromBitmap(new Bitmap(_convertBitMapData));
        _convertBitMapData.dispose();
        _convertRight.scaleX = Utils.divideFactor;
        _convertRight.scaleY = Utils.divideFactor;
        _convertRight.x = Utils.screenWidth/2 - _convertRight.width/2;
        _convertRight.y = 60*Utils.divideFactor;

        // Adding all the shizzle
        _background.y = 80;
        addChild(_background);

        var yPos:int = _background.y + _background.height/2 + 4*Utils.divideFactor;

        _rightFromOutputTextField.y = yPos - _rightFromOutputTextField.height/2;
        _rightFromOutputTextField.x = _background.width - _rightFromOutputTextField.width;
        addChild(_rightFromOutputTextField);

        _outputTextField.y = yPos - _outputTextField.height/2;
        _outputTextField.x = _rightFromOutputTextField.x - _rightFromOutputTextField.width - 14*Utils.divideFactor;
        addChild(_outputTextField);

        _leftFromOutputTextField.y = yPos - _leftFromOutputTextField.height/2;
        _leftFromOutputTextField.x = _background.width - 10*Utils.divideFactor;
        addChild(_leftFromOutputTextField);

        _convertRight.y = yPos - _convertRight.height/2 + 4*Utils.divideFactor;
        _convertRight.x = _outputTextField.x - _convertRight.width + 6*Utils.divideFactor;
        addChild(_convertRight);

        _rightFromInputTextField.y = yPos - _rightFromInputTextField.height/2;
        _rightFromInputTextField.x = _inputTextField.x - _rightFromInputTextField.width;
        addChild(_rightFromInputTextField);

        _inputTextField.y = yPos - _inputTextField.height/2;
        _inputTextField.x = _convertRight.x - _inputTextField.width;
        addChild(_inputTextField);

        _leftFromInputTextField.y = yPos - _leftFromInputTextField.height/2;
        _leftFromInputTextField.x = _inputTextField.x - _leftFromInputTextField.width + 6*Utils.divideFactor;
        addChild(_leftFromInputTextField);

        _nameTextField.y = yPos - _nameTextField.height/2;
        addChild(_nameTextField);

        trace("[ChoiceButton] added.");
    }

    public function destruct():void{
        var destructItems:Array = new Array(
                _background,
                _nameTextField,
                _convertRight,
                _outputTextField,
                _inputTextField,
                _leftFromInputTextField,
                _rightFromInputTextField,
                _leftFromOutputTextField,
                _rightFromOutputTextField
        );

        for each(var i:Sprite in destructItems){
            removeChild(i);
            i.dispose();
            i = null;
        }
        this._menuVO = null;
    }

    // Resize function
    public function resize(w:Number, h:Number):void{
        if(_big){
            _background.y = (h>>1) - (_nameTextField.height>>1);
            _nameTextField.y = (h>>1) - (_nameTextField.height>>1);
        }
        _nameTextField.width = w;
        _nameTextField.x = (w>>1) - (_nameTextField.width>>1);
        _background.width = w;
    }

}
}
