/**
 * Created with IntelliJ IDEA.
 * User: Arnoke
 * Date: 05/12/13
 * Time: 23:22
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.model {
import be.devine.cp3.conversion.view.MenuView;

public class Appmodel{
    public var formuleItems:Array = [];
    public var historyItems:Array = [];

    public function Appmodel() {
        trace("[AppModel] started.");
    }

    // close app
    public function destroy():void{

    }
}
}