/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 13/12/13
 * Time: 10:24
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.elements.ChoiceButton;
import be.devine.cp3.conversion.elements.MenuButton;
import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.utils.Utils;
import be.devine.cp3.conversion.vo.ProfileVO;

import flash.profiler.profile;

import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class AddProfileView extends Sprite implements ICanBeViewed{
    private var _appModel:Appmodel;
    private var _backButton:MenuButton;
    private var _choiceButtons:Array = [];
    private var _addProfileButton:ChoiceButton;

    public function AddProfileView() {
        _appModel = Appmodel.getInstance();
    }

    private function backHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch)
        {
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
        _appModel.currentProfile = profileVO;
        _appModel.currentProfileId = profileVO.id;
    }

    private function drawMenu():void {
        addProfile("Arno");
        if(_appModel.currentProfile != null){
            _backButton = new MenuButton();
            _backButton.addEventListener(TouchEvent.TOUCH, backHandler);
            addChild(_backButton);
        }
    }

    private function addProfileHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch)
        {
            _appModel.currentScreen = "AddProfileView";
        }

    }

}
}
