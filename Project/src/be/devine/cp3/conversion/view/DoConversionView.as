/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 13/12/13
 * Time: 11:07
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.elements.MenuButton;
import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.vo.ConversionVO;

import starling.events.Touch;

import starling.events.TouchEvent;

import starling.display.Sprite;
import starling.events.TouchPhase;

public class DoConversionView extends Sprite implements ICanBeViewed{
    private var _appModel:Appmodel = Appmodel.getInstance();
    private var _conversion:ConversionVO;

    private var _title:String;
    private var _formula:Number;
    private var _reverseFormula:Number;
    private var _reverseTitle:String;
    private var _custom:Boolean;

    private var _backButton:MenuButton;



    public function DoConversionView() {
        for each(var conversion:ConversionVO in _appModel.conversionVOs){
            if(conversion.title == _appModel.selectedFormula){
                _conversion = conversion;
                _title = _conversion.title;
                _formula = _conversion.formula;
                _reverseTitle = _conversion.reverseTitle;
                _reverseFormula = _conversion.reverseFormula;
                _custom = _conversion.custom;
                trace ("Got: " + _title);
            }
        }
    }

    public function doConversion(Conversion:Object, input:Number):void{

    }

    public function resize(w:Number, h:Number):void{
        _backButton = new MenuButton();
        _backButton.addEventListener(TouchEvent.TOUCH, backHandler);
        addChild(_backButton);
    }

    private function backHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch) {
            _appModel.currentScreen = "MenuView";
        }
    }
}
}
