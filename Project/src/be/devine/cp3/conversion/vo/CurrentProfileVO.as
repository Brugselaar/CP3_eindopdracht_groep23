/**
 * Created with IntelliJ IDEA.
 * User: Arnoke
 * Date: 18/12/13
 * Time: 20:08
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.vo {
public class CurrentProfileVO {
    private var _id:uint
    public function CurrentProfileVO() {
    }

    public function get id():uint {
        return _id;
    }

    public function set id(value:uint):void {
        _id = value;
    }
}
}
