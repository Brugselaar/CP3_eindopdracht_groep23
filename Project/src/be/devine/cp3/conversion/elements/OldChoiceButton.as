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

public class OldChoiceButton extends Sprite{

    private var _title:String;
    private var _textField:starling.text.TextField;
    private var _background:Quad;
    private var _big:Boolean;
    private var _backgroundColor:uint;
    private var _textColor:uint;
    private var _menuVO:MenuVO;

    public function OldChoiceButton(menuVO:MenuVO) {
        trace("[ChoiceButton] instance.");

        this._menuVO = menuVO;

        _title = this._menuVO.title;
        _backgroundColor = this._menuVO.backgroundColor;
        _textColor = this._menuVO.textColor;
        _background = new Quad(1, 120*Utils.multiplicationFactor, _backgroundColor);
        _textField = new starling.text.TextField(300*Utils.multiplicationFactor, 120*Utils.multiplicationFactor, _title, "Liberator", 60*Utils.multiplicationFactor, _textColor);
        _textField.autoScale = true;
        _textField.vAlign = VAlign.CENTER;
        _textField.hAlign = HAlign.CENTER;

        addChild(_background);
        addChild(_textField);
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

