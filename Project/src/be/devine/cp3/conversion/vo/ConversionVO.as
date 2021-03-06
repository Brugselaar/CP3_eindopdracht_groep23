/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 12/12/13
 * Time: 12:44
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.vo {
public class ConversionVO {
    private var _id:uint;
    private var _title:String;
    private var _leftFromInput:String;
    private var _leftFromOutput:String;
    private var _rightFromInput:String;
    private var _rightFromOutput:String;
    private var _formula:Number;
    private var _reverseTitle:String;
    private var _reverseFormula:Number;
    private var _custom:Boolean;

    public function get rightFromInput():String {
        return _rightFromInput;
    }

    public function set rightFromInput(value:String):void {
        _rightFromInput = value;
    }

    public function ConversionVO() {

    }

    public function get custom():Boolean {
        return _custom;
    }

    public function set custom(value:Boolean):void {
        _custom = value;
    }

    public function get reverseFormula():Number {
        return _reverseFormula;
    }

    public function set reverseFormula(value:Number):void {
        _reverseFormula = value;
    }

    public function get reverseTitle():String {
        return _reverseTitle;
    }

    public function set reverseTitle(value:String):void {
        _reverseTitle = value;
    }

    public function get formula():Number {
        return _formula;
    }

    public function set formula(value:Number):void {
        _formula = value;
    }

    public function get title():String {
        return _title;
    }

    public function set title(value:String):void {
        _title = value;
    }

    public function get id():uint {
        return _id;
    }

    public function set id(value:uint):void {
        _id = value;
    }


    public function toString():String {
        return "ConversionVO{_id=" + String(_id) + ",_title=" + String(_title) + ",_formula=" + String(_formula) + ",_reverseTitle=" + String(_reverseTitle) + ",_reverseFormula=" + String(_reverseFormula) + ",_custom=" + String(_custom) + "}";
    }

    public function get leftFromInput():String {
        return _leftFromInput;
    }

    public function set leftFromInput(value:String):void {
        _leftFromInput = value;
    }

    public function get leftFromOutput():String {
        return _leftFromOutput;
    }

    public function set leftFromOutput(value:String):void {
        _leftFromOutput = value;
    }

    public function get rightFromOutput():String {
        return _rightFromOutput;
    }

    public function set rightFromOutput(value:String):void {
        _rightFromOutput = value;
    }
}
}
