package {

import be.devine.cp3.conversion.view.Conversion;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.system.Capabilities;

import starling.core.Starling;

[SWF(frameRate="60")]
public class Main extends Sprite {

    private var _starling:Starling;

    // Building the app
    public function Main() {
        // scaling and alignment of app
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        // Initialisation of the app
        init();

        // Resizehandler, case the user rotates his iPhone
        stage.addEventListener(Event.RESIZE, resizeHandler);

        // Retina recognition & adaption
            // iPhone with retina
            if(Capabilities.screenDPI == 264){

            }

            // iPhone without retina
            if(Capabilities.screenResolutionY == 1024){

            }
    }

    public function init():void{
        // New Starling instance
        _starling = new Starling(Conversion, stage);

        // Initialise Starling
        _starling.start();
    }

    public function resizeHandler(event:Event):void{

    }
}
}