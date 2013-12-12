/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 1/12/13
 * Time: 21:09
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {


import be.devine.cp3.conversion.services.FormuleService;

import starling.display.Sprite;

public class Conversion extends Sprite{

    public function Conversion() {

        var service:FormuleService = new FormuleService();
        trace("[Conversion] App started.");
    }
}
}
