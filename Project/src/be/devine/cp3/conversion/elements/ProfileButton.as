/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 19/12/13
 * Time: 23:44
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.elements {
import be.devine.cp3.conversion.utils.Utils;

import flash.display.Bitmap;
import flash.display.BitmapData;

import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class ProfileButton extends Sprite{
    private var _title:String;
    private var _id:uint;
    private var _textField:starling.text.TextField;
    private var _background:Quad;
    private var _backgroundColor:uint;
    private var _textColor:uint;
    private var _checkedButton:Image;
    private var _checkedBitMapData:BitmapData;
    private var _checked:Checked;
    private var _isChecked:Boolean = false;

    public function ProfileButton(title:String, id:uint, backgroundColor:uint = 0x000000, textColor:uint = 0xf9cb14) {
        _title = title;
        _id = id;
        _backgroundColor = backgroundColor;
        _textColor = textColor;
        _background = new Quad(Utils.screenWidth-40*Utils.divideFactor, 100*Utils.divideFactor, _backgroundColor);
        _background.x = Utils.screenWidth/2 - _background.width/2;
        _textField = new TextField(Utils.screenWidth-40*Utils.divideFactor, 110*Utils.divideFactor, _title, "Liberator", 44*Utils.divideFactor, _textColor);
        _textField.autoScale = true;
        _textField.vAlign = VAlign.CENTER;
        _textField.hAlign = HAlign.LEFT;
        _textField.x = 40*Utils.divideFactor;

        _textField.addEventListener(TouchEvent.TOUCH, onTap);
        _background.addEventListener(TouchEvent.TOUCH, onTap);

        addChild(_background);
        _textField.y = _background.y;
        addChild(_textField);

        trace("[ProfileButton] added.");
    }

    public function destruct():void{
        removeChild(_background);
        _background.dispose();
        _background = null;

        removeChild(_textField);
        _textField.dispose();
        _textField = null;
    }

    // Resize function
    public function resize(w:Number, h:Number):void{
        _textField.width = w;
        _textField.x = (w>>1) - (_textField.width>>1);
        _background.width = w;
    }

    private function onTap(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if(touch){
            trace('[ChoiceButton] released');
            isChecked = "checked";
        }
    }

    public function get isChecked():Boolean {
        return _isChecked;
    }

    public function set isChecked(value:Boolean):void {
        _isChecked = !_isChecked;
        if(_isChecked){
            // Make checker
            _checked = new Checked();
            _checked.gotoAndStop(2);
            _checkedBitMapData = new BitmapData(_checked.width, _checked.height, true, 0xFF0000);
            _checkedBitMapData.draw(_checked);

            _checkedButton = Image.fromBitmap(new Bitmap(_checkedBitMapData));
            _checkedBitMapData.dispose();
            _checkedButton.scaleX = Utils.divideFactor;
            _checkedButton.scaleY = Utils.divideFactor;

            _checkedButton.addEventListener(TouchEvent.TOUCH, onTap);

            _checkedButton.x = _background.width - _checkedButton.width - 10*Utils.divideFactor;
            _checkedButton.y = _background.height/2 - _checkedButton.height/2;
            addChild(_checkedButton);
        }else{
            removeChild(_checkedButton);
        }
    }

    public function get id():uint {
        return _id;
    }

    public function set id(value:uint):void {
        _id = value;
    }
}
}
