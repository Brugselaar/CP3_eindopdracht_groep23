/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 12/12/13
 * Time: 12:44
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.vo {
public class ProfileVO {
    private var _id:uint;
    private var _name:String;
    private var _consumption:int;

    public function ProfileVO() {
    }

    public function get name():String {
        return _name;
    }

    public function set name(value:String):void {
        _name = value;
    }

    public function get id():uint {
        return _id;
    }

    public function get consumption():int {
        return _consumption;
    }

    public function set consumption(value:int):void {
        _consumption = value;
    }

    public function set id(value:uint):void {
        _id = value;
    }
}
}
