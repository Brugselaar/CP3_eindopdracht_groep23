/**
 * Created with IntelliJ IDEA.
 * User: Arnoke
 * Date: 05/12/13
 * Time: 23:22
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.model {
import be.devine.cp3.conversion.view.MenuView;

import flash.events.Event;

import flash.events.EventDispatcher;

public class Appmodel extends EventDispatcher{
    private var _currentScreen:String;
    static private var instance:Appmodel;
    public static const CURRENTSCREEN_CHANGED_EVENT:String = "currentScreenChanged";
    static public function getInstance():Appmodel{
        if(instance == null){
            instance = new Appmodel(new Enforcer());
        }
        return instance;
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

    }
}
}

internal class Enforcer{}