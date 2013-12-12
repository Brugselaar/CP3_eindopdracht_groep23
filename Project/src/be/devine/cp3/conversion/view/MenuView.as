/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 12/12/13
 * Time: 13:37
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {
import flash.display.Shape;

import starling.display.Sprite;

public class MenuView extends starling.display.Sprite{
    private var _logo:starling.display.Sprite;

    public function MenuView() {
        trace("[MenuView] started.");

        _logo = new Sprite();
        _logo.graphics.beginFill(0x000000);
        _logo.graphics.drawCircle(0,0,175);
        _logo.graphics.endFill();
        addChild(_logo);

    }
}
}