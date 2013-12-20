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
import be.devine.cp3.conversion.elements.ProfileButton;
import be.devine.cp3.conversion.model.AppModel;
import be.devine.cp3.conversion.utils.Utils;

import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class ProfileView extends Sprite implements ICanBeViewed{
    private var _appModel:AppModel;
    private var _backButton:MenuButton;
    private var _profileButtons:Array = [];
    private var _addProfileButton:ChoiceButton;
    private var _noAddProfile:Boolean = false;

    public function ProfileView() {
        _appModel = AppModel.getInstance();
    }

    private function backHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch){
            _appModel.currentScreen = "MenuView";
        }
    }

    public function resize(w:Number, h:Number):void{
        drawMenu();
    }

    private function drawMenu():void {
        _backButton = new MenuButton();
        _backButton.addEventListener(TouchEvent.TOUCH, backHandler);
        addChild(_backButton);

        for(var i:uint = 0; i < _appModel.profileVOs.length; i++){
            var profileButton:ProfileButton = new ProfileButton(_appModel.profileVOs[i].car, _appModel.profileVOs[i].id);
            profileButton.addEventListener(TouchEvent.TOUCH, touchHandler);
            profileButton.y = 40*Utils.divideFactor + (i+1) * (profileButton.height + 10*Utils.divideFactor);
            if (_appModel.currentProfileId == _appModel.profileVOs[i].id){
                profileButton.isChecked = "checked";
            }
            addChild(profileButton);
            _profileButtons.push(profileButton);
            if(i == 4){
                _noAddProfile = true;
                break;
            }
        }

        if(!_noAddProfile){
            _addProfileButton = new ChoiceButton("Add Profile", false);
            _addProfileButton.addEventListener(TouchEvent.TOUCH, addProfileHandler);
            _addProfileButton.y = 40*Utils.divideFactor;
            addChild(_addProfileButton);
        }
    }

    private function addProfileHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch){
            _appModel.currentScreen = "AddProfileView";
        }

    }

    private function touchHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch) {
            for(var i:uint = 0; i < _profileButtons.length; i++){
                if (_profileButtons[i].isChecked == true){
                    _profileButtons[i].isChecked = "not checked";
                }
                if(_profileButtons[i] == event.currentTarget){
                    _profileButtons[i].isChecked = "checked";
                    _appModel.currentProfileId = _appModel.profileVOs[i].id;
                    _appModel.currentProfile = _appModel.profileVOs[i];
                    trace("[Profileview] Profile changed to index: " + i);
                }
            }
        }
    }
}
}