package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.services.JSONService;

import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.services.JSONService;

import feathers.controls.ScreenNavigator;
import feathers.controls.ScreenNavigatorItem;

import flash.events.Event;

import flash.filesystem.File;

import starling.display.DisplayObject;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.ResizeEvent;

public class Conversion extends Sprite{
    private var _service:JSONService;
    private var _menuView:MenuView;
    private var _idSelected:uint = 1;

    private var _appModel:Appmodel;
    private var _screenNavigator:ScreenNavigator;

    private var w:Number = 0;
    private var h:Number = 0;

    public function Conversion() {
        trace("[Conversion] started.");

        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, init);
    }

    private function startJSON():void {
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

        //_menuView = new MenuView();
        //addChild(_menuView);
    }

    private function currentScreenChangedHandler(event:flash.events.Event = null):void {
        _screenNavigator.showScreen(_appModel.currentScreen);
        var activeScreen:ICanBeViewed = _screenNavigator.activeScreen as ICanBeViewed;
        if(!w || !h){
            activeScreen.resize(w,h);
        }
    }

    private function init(event:starling.events.Event):void {


        _appModel = Appmodel.getInstance();
        _screenNavigator = new ScreenNavigator();

        _screenNavigator.addScreen("AddProfileView", new ScreenNavigatorItem(AddProfileView));
        _screenNavigator.addScreen("Conversion", new ScreenNavigatorItem(Conversion));
        _screenNavigator.addScreen("ConversionResultView", new ScreenNavigatorItem(ConversionResultView));
        _screenNavigator.addScreen("ConversionsView", new ScreenNavigatorItem(ConversionsView));
        _screenNavigator.addScreen("DoConversionsView", new ScreenNavigatorItem(DoConversionView));
        _screenNavigator.addScreen("HistoryDetailView", new ScreenNavigatorItem(HistoryDetailView));
        _screenNavigator.addScreen("HistoryView", new ScreenNavigatorItem(HistoryView));
        _screenNavigator.addScreen("MenuView", new ScreenNavigatorItem(MenuView));
        _screenNavigator.addScreen("ProfileView", new ScreenNavigatorItem(ProfileView));
        _screenNavigator.addScreen("Transition", new ScreenNavigatorItem(Transition));

        addChild(_screenNavigator);

        //JSONHANDLER
        startJSON();

        this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, init);
        stage.addEventListener(ResizeEvent.RESIZE, resizeHandler);

        _appModel.addEventListener(Appmodel.CURRENTSCREEN_CHANGED_EVENT, currentScreenChangedHandler);


        _appModel.currentScreen = "MenuView";

    }

    private function resizeHandler(event:ResizeEvent):void {
        this.h = stage.stageHeight;
        this.w = stage.stageWidth;
        trace("WATMAAAAN!");
        var huidigScreen:ICanBeViewed = _screenNavigator.activeScreen as ICanBeViewed;
        huidigScreen.resize(w, h);
    }
}
}