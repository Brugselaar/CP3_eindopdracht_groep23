/**
 * Created with IntelliJ IDEA.
 * User: Arnoke
 * Date: 05/12/13
 * Time: 23:22
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.model {
import be.devine.cp3.conversion.view.*;
import be.devine.cp3.conversion.view.MenuView;

import flash.events.Event;

import flash.events.EventDispatcher;

public class Appmodel extends EventDispatcher{
    private var _currentScreen:String;
    private var _conversionVOs:Array = [];
    private var _historyVOs:Array = [];
    private var _profileVOs:Array = [];
    private var _currentProfile:Object;
    private var _selectedFormulaId:uint;

    public static const CURRENTSCREEN_CHANGED_EVENT:String = "currentScreenChanged";
    public static const CONVERSIONVOS_CHANGED_EVENT:String = "conversionVOsChanged";
    public static const HISTORYVOS_CHANGED_EVENT:String = "historyVOsChanged";
    public static const PROFILEVOS_CHANGED_EVENT:String = "profileVOsChanged";

    static private var instance:Appmodel;
    public static const SELECTEDFORMULAID_CHANGED_EVENT:String = "selectedFormulaIdChanged";
    static public function getInstance():Appmodel{
        if(instance == null){
            instance = new Appmodel(new Enforcer());
        }
        return instance;
    }


    [Bindable(event="selectedFormulaIdChanged")]
    public function get selectedFormulaId():uint {
        return _selectedFormulaId;
    }

    public function set selectedFormulaId(value:uint):void {
        if (_selectedFormulaId == value) return;
        _selectedFormulaId = value;
        dispatchEvent(new Event(SELECTEDFORMULAID_CHANGED_EVENT));
    }

    [Bindable(event="profileVOsChanged")]
    public function get profileVOs():Array {
        return _profileVOs;
    }

    public function set profileVOs(value:Array):void {
        if (_profileVOs == value) return;
        _profileVOs = value;
        dispatchEvent(new Event(PROFILEVOS_CHANGED_EVENT));
    }

    [Bindable(event="historyVOsChanged")]
    public function get historyVOs():Array {
        return _historyVOs;
    }

    public function set historyVOs(value:Array):void {
        if (_historyVOs == value) return;
        _historyVOs = value;
        dispatchEvent(new Event(HISTORYVOS_CHANGED_EVENT));
    }

    [Bindable(event="conversionVOsChanged")]
    public function get conversionVOs():Array {
        return _conversionVOs;
    }

    public function set conversionVOs(value:Array):void {
        if (_conversionVOs == value) return;
        _conversionVOs = value;
        dispatchEvent(new Event(CONVERSIONVOS_CHANGED_EVENT));
    }

    public function Appmodel(e:Enforcer) {
        trace("[AppModel] started.");
        if(e == null){
            throw new Error("Appmodel is a singleton!");
        }
    }


    [Bindable(event="currentScreenChanged")]
    public function get currentScreen():String {
        return _currentScreen;
    }

    public function set currentScreen(value:String):void {
        if (_currentScreen == value) return;
        _currentScreen = value;
        dispatchEvent(new Event(CURRENTSCREEN_CHANGED_EVENT));
    }

// close app
    public function destroy():void{
         //Ik weet niet hoe ik deze moet schrijven, kan jij die doen? :)
    }

    public function get currentProfile():Object {
        return _currentProfile;
    }

    public function set currentProfile(value:Object):void {
        _currentProfile = value;
    }
}
}

internal class Enforcer{}