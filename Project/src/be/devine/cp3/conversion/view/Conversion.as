package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.services.JSONService;

import flash.filesystem.File;

import starling.display.Sprite;

public class Conversion extends starling.display.Sprite{
    private var _service:JSONService;
    private var _menuView:MenuView;
    private var _idSelected:uint = 1;

    public function Conversion() {
        trace("[Conversion] started.");

        _service = new JSONService();

        // write preset JSON to files
        var menu:File = File.applicationStorageDirectory.resolvePath("FTC_menu.json");
        _service.writeMenuJSON(menu);

        var conversions:File = File.applicationStorageDirectory.resolvePath("FTC_conversions.json");
        _service.changeSelectedProfile(conversions, 1);

        var profiles:File = File.applicationStorageDirectory.resolvePath("FTC_profiles.json");
        _service.changeSelectedProfile(conversions, 1);
        var profiles:File = File.applicationStorageDirectory.resolvePath("FTC_profiles.json");
        _service.writeProfileJSON(profiles, "Arno", 0.1);
        _service.changeSelectedProfile(conversions, 1);

        // Change current profile in JSON --- used in AppModel
        var selectedProfile:File = File.applicationStorageDirectory.resolvePath("FTC_selectedProfile.json");
        _service.changeSelectedProfile(selectedProfile, _idSelected);

        _menuView = new MenuView();
        addChild(_menuView);
    }

    public function resize(w:Number, h:Number):void {
//        _menuView.resize(w, h);
    }
}
}