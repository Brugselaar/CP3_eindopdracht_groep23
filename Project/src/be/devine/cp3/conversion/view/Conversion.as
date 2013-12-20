package be.devine.cp3.conversion.view {
import be.devine.cp3.conversion.services.ConversionService;
import be.devine.cp3.conversion.services.CurrentProfileService;
import be.devine.cp3.conversion.services.HistoryService;

import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.services.ProfilesService;
import be.devine.cp3.conversion.vo.HistoryVO;

import feathers.controls.ScreenNavigator;
import feathers.controls.ScreenNavigatorItem;

import flash.events.Event;

import flash.filesystem.File;

import starling.display.DisplayObject;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.ResizeEvent;

public class Conversion extends Sprite{
    private var _historyService:HistoryService;
    private var _profilesService:ProfilesService;
    private var _conversionService:ConversionService;
    private var _currentProfileService:CurrentProfileService;


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
        _conversionService = new ConversionService();
        _conversionService.load();

        _historyService = new HistoryService();
        _historyService.load();

        _profilesService = new ProfilesService();
        _profilesService.load();

        _currentProfileService = new CurrentProfileService();
        _currentProfileService.load();
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

        startJSON();

        _appModel.addEventListener(Appmodel.HISTORYVOS_CHANGED_EVENT, historyChangedHandler);
        _appModel.addEventListener(Appmodel.PROFILEVOS_CHANGED_EVENT, profileChangeHandler);
        _appModel.addEventListener(Appmodel.CURRENTPROFILE_CHANGED_EVENT, currentProfileChangeHandler);


        _screenNavigator = new ScreenNavigator();

        _screenNavigator.addScreen("AddProfileView", new ScreenNavigatorItem(AddProfileView));
        _screenNavigator.addScreen("ConversionFuelView", new ScreenNavigatorItem(ConversionFuelView));
        _screenNavigator.addScreen("ConversionResultView", new ScreenNavigatorItem(ConversionResultView));
        _screenNavigator.addScreen("ConversionsView", new ScreenNavigatorItem(ConversionsView));
        _screenNavigator.addScreen("DoConversionView", new ScreenNavigatorItem(DoConversionView));
        _screenNavigator.addScreen("HistoryDetailView", new ScreenNavigatorItem(HistoryDetailView));
        _screenNavigator.addScreen("HistoryView", new ScreenNavigatorItem(HistoryView));
        _screenNavigator.addScreen("MenuView", new ScreenNavigatorItem(MenuView));
        _screenNavigator.addScreen("ProfileView", new ScreenNavigatorItem(ProfileView));
        _screenNavigator.addScreen("Transition", new ScreenNavigatorItem(Transition));

        addChild(_screenNavigator);

        this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, init);
        stage.addEventListener(ResizeEvent.RESIZE, resizeHandler);

        _appModel.addEventListener(Appmodel.CURRENTSCREEN_CHANGED_EVENT, currentScreenChangedHandler);

        _appModel.currentScreen = "MenuView";


    }

    private function currentProfileChangeHandler(event:flash.events.Event):void {
        var array:Array = [];
        array.push(_appModel.currentProfile);
        _currentProfileService.save(array);
    }

    private function profileChangeHandler(event:flash.events.Event):void {
        trace('ProfileChangedHandler!');
        _profilesService.save(_appModel.profileVOs);
    }

    private function historyChangedHandler(event:flash.events.Event):void {
        _historyService.save(_appModel.historyVOs);
    }

    private function resizeHandler(event:ResizeEvent):void {
        this.h = stage.stageHeight;
        this.w = stage.stageWidth;
        var huidigScreen:ICanBeViewed = _screenNavigator.activeScreen as ICanBeViewed;
        huidigScreen.resize(w, h);
    }
}
}