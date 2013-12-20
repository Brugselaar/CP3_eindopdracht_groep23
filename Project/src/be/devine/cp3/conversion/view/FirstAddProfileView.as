/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 20/12/13
 * Time: 01:24
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.elements.ChoiceButton;
import be.devine.cp3.conversion.elements.InputField;
import be.devine.cp3.conversion.elements.MenuButton;
import be.devine.cp3.conversion.elements.TitleField;
import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.utils.Utils;
import be.devine.cp3.conversion.vo.ProfileVO;

import flash.display.Bitmap;
import flash.display.BitmapData;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class FirstAddProfileView extends Sprite implements ICanBeViewed{
    private var _appModel:Appmodel;
    private var _backButton:MenuButton;
    private var _choiceButtons:Array = [];
    private var _addProfileButton:ChoiceButton;
    private var _logoBitMapData:BitmapData;
    private var _logo:Image;
    private var _name:InputField;
    private var _consumption:InputField;
    private var _submit:ChoiceButton;

    public function FirstAddProfileView() {
        _appModel = Appmodel.getInstance();
    }

    private function backHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch) {
            _appModel.currentScreen = "MenuView";
        }
    }

    public function resize(w:Number, h:Number):void{
        drawMenu();
    }

    public function addProfile(name:String, consumption:Number = 6.5):void{
        var profileVO:ProfileVO = new ProfileVO();
        profileVO.id = _appModel.profileVOs.length;
        profileVO.car = name;
        profileVO.consumption = consumption;
        trace(profileVO.toString());
        var profileVOs:Array = _appModel.profileVOs.concat();
        profileVOs.push(profileVO);
        _appModel.profileVOs = profileVOs;
        if(_appModel.currentProfile == null){
            _appModel.currentProfile = profileVO;
            _appModel.currentProfileId = profileVO.id;
        }
    }

    private function drawMenu():void {
        // Make Flash asset in SWC
        var logo:Logo = new Logo();

        // Make Bitmapdata
        _logoBitMapData = new BitmapData(logo.width, logo.height, true, 0xFF0000);
        _logoBitMapData.draw(logo);

        _logo = Image.fromBitmap(new Bitmap(_logoBitMapData));
        _logoBitMapData.dispose();
        _logo.scaleX = Utils.divideFactor;
        _logo.scaleY = Utils.divideFactor;
        _logo.x = Utils.screenWidth/2 - _logo.width/2;
        _logo.y = 60*Utils.divideFactor;
        addChild(_logo);


        var title:TitleField = new TitleField("Welcome. Please add a car.", 30);
        title.y = 480*Utils.divideFactor - 10*Utils.divideFactor;
        addChild(title);

        _name = new InputField(20, true, "Car name");
        _name.y = title.y + title.height - 10*Utils.divideFactor;
        addChild(_name);

        _consumption = new InputField(10, false, "Car consumption in Liters");
        _consumption.y = _name.y + _name.height - 10*Utils.divideFactor;
        addChild(_consumption);

        _submit = new ChoiceButton("Submit");
        _submit.y = _consumption.y + _consumption.height - 10*Utils.divideFactor;
        _submit.addEventListener(TouchEvent.TOUCH, addProfileHandler);
        addChild(_submit);
    }

    private function addProfileHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch){
            _appModel.currentScreen = "AddProfileView";
            addProfile(_name.inputfield.text, Number(_consumption.inputfield.text));
        }

    }
}
}
