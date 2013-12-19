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

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.events.MouseEvent;
import flash.ui.Mouse;

import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class ChoiceButton extends Sprite{

    private var _title:String;
    private var _textField:TextField;
    private var _background:Quad;
    private var _big:Boolean;
    private var _backgroundColor:uint;
    private var _textColor:uint;
    private var _menuVO:MenuVO;
    private var _arrowRight:Image;
    private var _arrowBitMapData:BitmapData;
    private var _arrow:ArrowRight;

    public function ChoiceButton(title:String, backgroundColor:uint = 0x000000, textColor:uint = 0xf9cb14) {
        _title = title;
        _backgroundColor = backgroundColor;
        _textColor = textColor;
        _background = new Quad(Utils.screenWidth-40*Utils.divideFactor, 100*Utils.divideFactor, _backgroundColor);
        _background.x = Utils.screenWidth/2 - _background.width/2;
        _textField = new TextField(Utils.screenWidth-40*Utils.divideFactor, 110*Utils.divideFactor, _title, "Liberator", 44*Utils.divideFactor, _textColor);
        _textField.autoScale = true;
        _textField.vAlign = VAlign.CENTER;
        _textField.hAlign = HAlign.LEFT;
        _textField.x = 40*Utils.divideFactor;

        // Make arrow
        _arrow = new ArrowRight();
        _arrow.gotoAndStop(2);

        // Make Bitmapdata
        _arrowBitMapData = new BitmapData(_arrow.width, _arrow.height, true, 0xFF0000);
        _arrowBitMapData.draw(_arrow);

        _arrowRight = Image.fromBitmap(new Bitmap(_arrowBitMapData));
        _arrowBitMapData.dispose();
        _arrowRight.scaleX = Utils.divideFactor;
        _arrowRight.scaleY = Utils.divideFactor;
        _arrowRight.x = Utils.screenWidth/2 - _arrowRight.width/2;
        _arrowRight.y = 60*Utils.divideFactor;

        _arrowRight.addEventListener(TouchEvent.TOUCH, onTap);
        _textField.addEventListener(TouchEvent.TOUCH, onTap);
        _background.addEventListener(TouchEvent.TOUCH, onTap);

        addChild(_background);
        _textField.y = _background.y;
        addChild(_textField);
        _arrowRight.x = _background.width - _arrowRight.width - 10*Utils.divideFactor;
        _arrowRight.y = 186*Utils.divideFactor;
        addChild(_arrowRight);

        if(_title == "Close"){
            _background.width = 320*Utils.divideFactor;
            _background.x = Utils.screenWidth/2 - _background.width/2;
            _textField.hAlign = HAlign.CENTER;
            _textField.x = 20*Utils.divideFactor;
            removeChild(_arrowRight);
        }

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

    private function onTap(event:TouchEvent):void {
        var t:Touch = event.getTouch(stage);
        if(event.getTouch(_arrowRight, TouchPhase.BEGAN) || event.getTouch(_arrowRight, TouchPhase.ENDED)){
            if(t.phase == TouchPhase.ENDED){
                // Touch released
                trace('[ChoiceButton] released');
                _arrow.gotoAndStop(1);
            }
            else{
                // Touching
                trace('[ChoiceButton] Touching');
                _arrow.gotoAndStop(2);
            }
        }
    }
}
}