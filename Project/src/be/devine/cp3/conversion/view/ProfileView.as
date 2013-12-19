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

import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class ProfileView extends Sprite implements ICanBeViewed{
    private var _appModel:Appmodel;
    private var _backButton:MenuButton;
    private var _choiceButtons:Array = [];
    private var _addProfileButton:ChoiceButton;

    public function ProfileView() {
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

    private function drawMenu():void {
        _backButton = new MenuButton();
        _backButton.addEventListener(TouchEvent.TOUCH, backHandler);
        addChild(_backButton);

        _addProfileButton = new ChoiceButton("Add Profile", false);
        _addProfileButton.addEventListener(TouchEvent.TOUCH, addProfileHandler);
        _addProfileButton.y = 40*Utils.divideFactor;
        addChild(_addProfileButton);

        for(var i:uint = 0; i < _appModel.profileVOs.length; i++){
                var choiceButton:ChoiceButton = new ChoiceButton(_appModel.profileVOs[i].car, false);
                choiceButton.addEventListener(TouchEvent.TOUCH, touchHandler);
                choiceButton.y = 40*Utils.divideFactor + (i+1) * (choiceButton.height + 10*Utils.divideFactor);
                addChild(choiceButton);
                _choiceButtons.push(choiceButton);
        }
    }

    private function addProfileHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch)
        {
            _appModel.currentScreen = "AddProfileView";
        }

    }

    private function touchHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch)
        {
            for(var i:uint = 0; i < _choiceButtons.length; i++){
                if(_choiceButtons[i] == event.currentTarget){
                    _appModel.currentProfile = _appModel.profileVOs[i];
                    trace("[Profileview] Profile changed to index: " + i);
                }
            }
        }
    }
}
}
