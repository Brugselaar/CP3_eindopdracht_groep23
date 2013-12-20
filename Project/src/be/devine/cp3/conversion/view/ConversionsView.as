/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 13/12/13
 * Time: 11:07
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.elements.ChoiceButton;
import be.devine.cp3.conversion.elements.MenuButton;
import be.devine.cp3.conversion.elements.TitleField;
import be.devine.cp3.conversion.model.AppModel;
import be.devine.cp3.conversion.utils.Utils;

import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class ConversionsView extends Sprite implements ICanBeViewed{
    private var _backButton:MenuButton;
    private var _appModel:AppModel;
    private var _choiceButtons:Array = [];
    private var _fuelButton:ChoiceButton;
    private var _addCustomFormula:ChoiceButton;

    public function ConversionsView() {
        trace("[ConversionsView] started.");
        _appModel = AppModel.getInstance();
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

    private function drawMenu():void {
        _backButton = new MenuButton();
        _backButton.addEventListener(TouchEvent.TOUCH, backHandler);
        addChild(_backButton);

        var title:TitleField = new TitleField("Select a conversion", 40);
        title.y = 40*Utils.divideFactor;
        addChild(title);

        _fuelButton = new ChoiceButton("Price / Fuel", false);
        _fuelButton.addEventListener(TouchEvent.TOUCH, fuelHandler);
        _fuelButton.y = title.y + title.height;
        addChild(_fuelButton);

        for(var i:uint = 0; i < _appModel.conversionVOs.length; i++){
            if(i > 3){
                var choiceButton:ChoiceButton = new ChoiceButton(_appModel.conversionVOs[i].title, false);
                choiceButton.addEventListener(TouchEvent.TOUCH, touchHandler);
                choiceButton.y = 140*Utils.divideFactor + (i-3) * (choiceButton.height + 10*Utils.divideFactor);
                addChild(choiceButton);
                _choiceButtons.push(choiceButton);
            }
        }

        _addCustomFormula = new ChoiceButton("Add custom formula");
        _addCustomFormula.y = 740*Utils.divideFactor;
        _addCustomFormula.addEventListener(TouchEvent.TOUCH, addCustomFormulaHandler);
        addChild(_addCustomFormula);
    }

    private function fuelHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch) {
            _appModel.currentScreen = "ConversionFuelView";
        }
    }

    private function touchHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch) {
            for each(var _choiceButton:ChoiceButton in _choiceButtons){
                if(event.currentTarget == _choiceButton){
                    _appModel.selectedFormula = _choiceButton.title;
                    _appModel.currentScreen = "DoConversionView";
                }
            }
        }
    }

    private function addCustomFormulaHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch) {
            _appModel.currentScreen = "AddCustomFormulaView";
        }
    }
}
}
