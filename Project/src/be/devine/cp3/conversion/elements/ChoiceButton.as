/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 12/12/13
 * Time: 12:27
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.elements {
import be.devine.cp3.conversion.utils.Utils;
import be.devine.cp3.conversion.vo.MenuVO;

import starling.display.Quad;
import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class ChoiceButton extends Sprite{

    private var _title:String;
    private var _textField:starling.text.TextField;
    private var _background:Quad;
    private var _big:Boolean;
    private var _backgroundColor:uint;
    private var _textColor:uint;
    private var _menuVO:MenuVO;

    public function ChoiceButton(title:String, backgroundColor:uint = 0x000000, textColor:uint = 0xf9cb14) {
        trace("[ChoiceButton] instance.");

        _title = title;
        _backgroundColor = backgroundColor;
        _textColor = textColor;
        _background = new Quad(Utils.screenWidth-40*Utils.divideFactor, 100*Utils.divideFactor, _backgroundColor);
        _background.x = Utils.screenWidth/2 - _background.width/2;
        _textField = new starling.text.TextField(Utils.screenWidth-40*Utils.divideFactor, 100*Utils.divideFactor, _title, "Liberator", 40*Utils.divideFactor, _textColor);
        _textField.autoScale = true;
        _textField.vAlign = VAlign.CENTER;
        _textField.hAlign = HAlign.LEFT;
        _textField.x = 40*Utils.divideFactor;

        addChild(_background);
        _background.y = 80;
        addChild(_textField);
        _textField.y = _background.y;
        trace("[ChoiceButton] added.");
    }

    public function destruct():void{
        removeChild(_background);
        _background.dispose();
        _background = null;

        removeChild(_textField);
        _textField.dispose();
        _textField = null;

        this._menuVO = null;
    }

    // Resize function
    public function resize(w:Number, h:Number):void{
        if(_big){
            _background.y = (h>>1) - (_textField.height>>1);
            _textField.y = (h>>1) - (_textField.height>>1);
        }
        _textField.width = w;
        _textField.x = (w>>1) - (_textField.width>>1);
        _background.width = w;
    }
}
}

