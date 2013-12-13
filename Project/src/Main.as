package {
import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.utils.Utils;
import be.devine.cp3.conversion.view.Conversion;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.system.Capabilities;

import starling.core.Starling;

[SWF(frameRate="60", backgroundColor="0xf9cb14")]
// height is 960 for iphone 4
// older iphones are 320x480
public class Main extends Sprite {

    private var _appModel:Appmodel;
    private var _starling:Starling;

    // Building the app
    public function Main() {
        trace("[Main] started.");

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
                trace("[Main] retina.");
                Utils.device = Utils.RETINA;
                Utils.multiplicationFactor = 2;
            }

            // iPhone without retina
            if(Capabilities.screenResolutionY == 1024){
                trace("[Main] non-retina.");
                Utils.device = Utils.NONRETINA;
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