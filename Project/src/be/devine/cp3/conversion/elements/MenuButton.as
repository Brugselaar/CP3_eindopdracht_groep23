/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 19/12/13
 * Time: 10:54
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.elements {
import be.devine.cp3.conversion.utils.Utils;
import be.devine.cp3.conversion.vo.MenuVO;

import flash.display.Bitmap;
import flash.display.BitmapData;

import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class MenuButton extends Sprite{
    private var _title:String;
    private var _textField:TextField;
    private var _background:Quad;
    private var _big:Boolean;
    private var _backgroundColor:uint;
    private var _textColor:uint;
    private var _menuVO:MenuVO;
    private var _arrowRight:Image;
    private var _arrowBitMapData:BitmapData;
    private var _menu:Menu;

    public function MenuButton(backgroundColor:uint = 0x000000, textColor:uint = 0xf9cb14) {
        _title = "Menu";
        _backgroundColor = backgroundColor;
        _textColor = textColor;
        _background = new Quad(Utils.screenWidth-360*Utils.divideFactor, 100*Utils.divideFactor, _backgroundColor);
        _background.x = Utils.screenWidth/2 - _background.width/2;
        _textField = new TextField(Utils.screenWidth-40*Utils.divideFactor, 110*Utils.divideFactor, _title, "Liberator", 44*Utils.divideFactor, _textColor);
        _textField.autoScale = true;
        _textField.vAlign = VAlign.CENTER;
        _textField.hAlign = HAlign.CENTER;
        _textField.x = 40*Utils.divideFactor;

        // Make menu Sprite
        _menu = new Menu();
        _menu.gotoAndStop(2);

        // Make Bitmapdata
        _arrowBitMapData = new BitmapData(_menu.width, _menu.height, true, 0xFF0000);
        _arrowBitMapData.draw(_menu);

        _arrowRight = Image.fromBitmap(new Bitmap(_arrowBitMapData));
        _arrowBitMapData.dispose();
        _arrowRight.scaleX = Utils.divideFactor;
        _arrowRight.scaleY = Utils.divideFactor;
        _arrowRight.x = Utils.screenWidth/2 - _arrowRight.width/2;
        _arrowRight.y = 60*Utils.divideFactor;

        _background.y = Utils.screenHeight - _background.height;
        addChild(_background);
        _textField.y = _background.y;
        addChild(_textField);
        _arrowRight.x = _background.width - _arrowRight.width - 20*Utils.divideFactor;
        _arrowRight.y = _background.y + _background.height/2 - _arrowRight.height/2;
        addChild(_arrowRight);

        trace("[MenuButton] added.");
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
