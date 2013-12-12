/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 1/12/13
 * Time: 21:09
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.view {

import be.devine.cp3.conversion.services.FormuleService;
import flash.filesystem.File;

import starling.display.Sprite;

public class Conversion extends starling.display.Sprite{
    private var _service:FormuleService;
    private var _menuView:MenuView;

    public function Conversion() {
        trace("[Conversion] started.");

        _service = new FormuleService();

        var menu:File = File.applicationStorageDirectory.resolvePath("FTC_menu.json");
        _service.writeMenuJSON(menu);

        var selectedProfile:File = File.applicationStorageDirectory.resolvePath("FTC_selectedProfile.json");
        _service.changeSelectedProfile(selectedProfile, 1);

        _menuView = new MenuView();
        addChild(_menuView);
    }
}
}