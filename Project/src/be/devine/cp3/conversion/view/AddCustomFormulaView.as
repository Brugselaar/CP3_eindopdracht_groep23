/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 20/12/13
 * Time: 09:38
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.elements.ChoiceButton;
import be.devine.cp3.conversion.elements.InputField;
import be.devine.cp3.conversion.elements.MenuButton;
import be.devine.cp3.conversion.elements.TitleField;
import be.devine.cp3.conversion.model.AppModel;
import be.devine.cp3.conversion.utils.Utils;
import be.devine.cp3.conversion.vo.ConversionVO;

import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class AddCustomFormulaView extends Sprite implements ICanBeViewed{
    private var _appModel:AppModel;
    private var _backButton:MenuButton;
    private var _name:InputField;
    private var _formula:InputField;
    private var _submit:ChoiceButton;

    public function AddCustomFormulaView() {
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

    public function addFormula(title:String, formula:Number):void{
        var conversionVO:ConversionVO = new ConversionVO();
        conversionVO.id = _appModel.conversionVOs.length;
        conversionVO.title = title;
        conversionVO.formula = formula;
        conversionVO.custom = true;
        trace("[AddCustomFormulaView]" + conversionVO.toString());
        var conversionVOs:Array = _appModel.conversionVOs.concat();
        conversionVOs.push(conversionVO);
        _appModel.conversionVOs = conversionVOs;
        _appModel.currentScreen = "ConversionsView";
    }

    private function drawMenu():void {
        _backButton = new MenuButton();
        _backButton.addEventListener(TouchEvent.TOUCH, backHandler);
        addChild(_backButton);

        var title:TitleField = new TitleField("Add a formula");
        title.y = 40*Utils.divideFactor;
        addChild(title);

        _name = new InputField(20, true, "Name");
        _name.y = title.y + title.height;
        addChild(_name);

        _formula = new InputField(10, false, "Formula");
        _formula.y = _name.y + _name.height - 10*Utils.divideFactor;
        addChild(_formula);

        _submit = new ChoiceButton("Submit");
        _submit.y = _formula.y + _formula.height - 10*Utils.divideFactor;
        _submit.addEventListener(TouchEvent.TOUCH, addFormulaHandler);
        addChild(_submit);
    }

    private function addFormulaHandler(event:TouchEvent):void {
        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch) {
            addFormula(_name.inputfield.text, Number(_formula.inputfield.text));
        }

    }
}
}
