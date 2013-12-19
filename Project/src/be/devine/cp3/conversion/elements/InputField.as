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
    private var _inputfield:TextInput;
    private var _maxChars:uint;
    private var _inputBoxBorder:MovieClip;
    private var _inputBox:MovieClip;

    public function InputField(maxChars:uint = 3, isText:Boolean = false) {
        _maxChars = maxChars;

        _inputBoxBorder = new MovieClip();

        _inputBoxBorder.graphics.beginFill(0x000000)
        _inputBoxBorder.graphics.drawRect(0, 0, Utils.screenWidth-40*Utils.divideFactor, 100*Utils.divideFactor);
        _inputBoxBorder.graphics.endFill();

        _inputBox = new MovieClip();

        _inputBox.graphics.beginFill(0xf9cb14)
        _inputBox.graphics.drawRect(0, 0, Utils.screenWidth-48*Utils.divideFactor, 92*Utils.divideFactor);
        _inputBox.graphics.endFill();

        _inputBox.x = 4*Utils.divideFactor;
        _inputBox.y = 4*Utils.divideFactor;

        _inputBoxBorder.addChild(_inputBox);

        var bmpData:BitmapData = new BitmapData(_inputBoxBorder.width, _inputBoxBorder.height, true, 0);
        bmpData.draw(_inputBoxBorder);

        var nativeTextfieldImage:Image = new Image(starling.textures.Texture.fromBitmapData(bmpData));
        nativeTextfieldImage.y = 100;
        nativeTextfieldImage.x = 20*Utils.divideFactor;

        _inputfield = new TextInput();
        _inputfield.text = "Digits only";
        _inputfield.addEventListener( FeathersEventType.FOCUS_IN, focusInHandler);
        _inputfield.addEventListener( FeathersEventType.FOCUS_OUT, focusOutHandler);
        _inputfield.maxChars = _maxChars;
        if(!isText){
            _inputfield.restrict = "0-9.";
        }
        _inputfield.textEditorProperties.textAlign = "center";
        _inputfield.width = _inputBox.width - 40*Utils.divideFactor;
        _inputfield.height = 100*Utils.divideFactor;

        _inputfield.textEditorFactory = function():ITextEditor {
            var editor:StageTextTextEditor = new StageTextTextEditor();
            editor.fontFamily = "Liberator";
            editor.fontSize = 40*Utils.divideFactor;
            editor.color = 0x333333;
            return editor;
        }
        _inputfield.x = nativeTextfieldImage.x + 20*Utils.divideFactor;
        _inputfield.y = nativeTextfieldImage.y + 30*Utils.divideFactor;
        addChild(nativeTextfieldImage);
        addChild(_inputfield);
    }

    private function focusInHandler(event:starling.events.Event):void {
        _inputfield.text = "";
    }

    private function focusOutHandler(event:starling.events.Event):void {

    }

    public function get inputfield():TextInput {
        return _inputfield;
    }
}
}