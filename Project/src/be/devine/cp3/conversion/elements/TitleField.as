/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 19/12/13
 * Time: 21:49
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.elements {
import be.devine.cp3.conversion.utils.Utils;

import feathers.controls.TextInput;
import feathers.controls.text.StageTextTextEditor;
import feathers.core.ITextEditor;
import feathers.events.FeathersEventType;

import flash.display.MovieClip;
import flash.text.Font;

import starling.display.Sprite;

import starling.events.Event;

public class TitleField extends Sprite{
    private var _inputfield:TextInput;
    private var _title:String;
    private var _textSize:uint;

    public function TitleField(title:String, textSize:uint = 44) {

        _title = title;
        _textSize = textSize;

        _inputfield = new TextInput();
        _inputfield.text = _title;
        _inputfield.textEditorProperties.textAlign = "center";
        _inputfield.width = 540*Utils.divideFactor;
        _inputfield.height = 100*Utils.divideFactor;
        _inputfield.isEditable = false;

        _inputfield.textEditorFactory = function():ITextEditor {
            var editor:StageTextTextEditor = new StageTextTextEditor();
            editor.fontFamily = "Font";
            editor.fontSize = _textSize*Utils.divideFactor;
            editor.color = 0x000000;
            return editor;
        }
        _inputfield.x = Utils.screenWidth/2 - _inputfield.width/2;
//        _inputfield.y = nativeTextfieldImage.y + 30*Utils.divideFactor;
        addChild(_inputfield);
    }
}
}
