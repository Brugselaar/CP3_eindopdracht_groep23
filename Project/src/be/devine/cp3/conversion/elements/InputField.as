/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 12/12/13
 * Time: 12:31
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.elements {
import be.devine.cp3.conversion.utils.Utils;

import feathers.controls.TextInput;
import feathers.controls.text.StageTextTextEditor;
import feathers.core.ITextEditor;
import feathers.display.Scale9Image;
import feathers.events.FeathersEventType;

import flash.display.Bitmap;

import flash.display.BitmapData;

import flash.display.MovieClip;
import flash.display3D.textures.Texture;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import starling.display.Image;

import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

public class InputField extends Sprite{
    private var inputfield:TextInput;
    private var _maxChars:uint;
    private var _inputBoxBorder:MovieClip;
    private var _inputBox:MovieClip;
    private var _inputBitMapData:BitmapData;
    private var _input:Image;

    public function InputField(maxChars:uint = 3) {
        _maxChars = maxChars;

//        _inputBoxBorder.graphics.beginFill(0x000000)
//        _inputBoxBorder.graphics.drawRect(0, 0, Utils.screenWidth-40*Utils.divideFactor, 100*Utils.divideFactor);
//        _inputBoxBorder.graphics.endFill();
//
//        _inputBox.graphics.beginFill(0xf9cb14)
//        _inputBox.graphics.drawRect(0, 0, Utils.screenWidth-34*Utils.divideFactor, 94*Utils.divideFactor);
//        _inputBox.graphics.endFill();

//        _inputBoxBorder.addChild(_inputBox);

//        _inputBitMapData = new BitmapData(_inputBoxBorder.width, _inputBoxBorder.height, true, 0xFF0000);
//        _inputBitMapData.draw(_inputBoxBorder);
//        _input = Image.fromBitmap(new Bitmap(_inputBitMapData));
//        _inputBitMapData.dispose();

        //flash textfield
        var nativeTextField:flash.text.TextField = new flash.text.TextField();
        nativeTextField.defaultTextFormat = new TextFormat("Ubuntu", 20, 0x0000ff);
        nativeTextField.embedFonts = true;
        nativeTextField.multiline = nativeTextField.wordWrap = false;
        nativeTextField.autoSize = TextFieldAutoSize.LEFT;
        nativeTextField.text = "Flash Textfield";

//        inputfield = new TextInput();
//        inputfield.text = "test";
//        inputfield.addEventListener( FeathersEventType.FOCUS_IN, focusInHandler);
//        inputfield.addEventListener( FeathersEventType.FOCUS_OUT, focusOutHandler);
//        inputfield.maxChars = _maxChars;
//        inputfield.restrict = "0-9";
//        inputfield.width = 400*Utils.divideFactor;
//        inputfield.height = 100*Utils.divideFactor;
//        inputfield.textEditorFactory = function():ITextEditor {
//            var editor:StageTextTextEditor = new StageTextTextEditor();
//            editor.fontFamily = "Liberator";
//            editor.fontSize = 40*Utils.divideFactor;
//            editor.color = 0x333333;
//            return editor;
//        }
//        addChild(inputfield);
    }

    private function focusInHandler(event:starling.events.Event):void {

    }

    private function focusOutHandler(event:starling.events.Event):void {

    }
}
}
