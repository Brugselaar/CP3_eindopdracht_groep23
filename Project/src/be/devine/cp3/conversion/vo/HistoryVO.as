/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 12/12/13
 * Time: 12:43
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.vo {
public class HistoryVO {
    private var _id:uint;
    private var _formulaId:uint;
    private var _nameFormula:String;
    private var _input:Number;
    private var _output:Number;
    private var _leftFromInput:String;
    private var _rightFromInput:String;
    private var _leftFromOutput:String;
    private var _rightFromOutput:String;
    private var _custom:Boolean;

    public function HistoryVO() {
    }

    public function get id():uint {
        return _id;
    }

    public function set id(value:uint):void {
        _id = value;
    }

    public function get input():int {
        return _input;
    }

    public function get output():int {
        return _output;
    }

    public function get leftFromInput():String {
        return _leftFromInput;
    }

    public function set leftFromInput(value:String):void {
        _leftFromInput = value;
    }

    public function get rightFromInput():String {
        return _rightFromInput;
    }

    public function set rightFromInput(value:String):void {
        _rightFromInput = value;
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

    public function get nameFormula():String {
        return _nameFormula;
    }

    public function set nameFormula(value:String):void {
        _nameFormula = value;
    }

    public function set input(value:int):void {
        _input = value;
    }

    public function set output(value:int):void {
        _output = value;
    }

    public function get formulaId():uint {
        return _formulaId;
    }

    public function set formulaId(value:uint):void {
        _formulaId = value;
    }

    public function get custom():Boolean {
        return _custom;
    }

    public function set custom(value:Boolean):void {
        _custom = value;
    }
}
}
