/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 1/12/13
 * Time: 21:09
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.view.data.FormuleData;

import starling.display.Sprite;

public class Conversion extends Sprite{
    private var _formuleData:FormuleData = new FormuleData();
    public function Conversion() {
        trace("[Conversion] App started.");
    }
}
}
