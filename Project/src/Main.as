package {
import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.utils.Utils;
import be.devine.cp3.conversion.view.Conversion;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.geom.Rectangle;
import flash.system.Capabilities;

import starling.core.Starling;

[SWF(frameRate="60", backgroundColor="0xf9cb14", width="640", height="960")]
public class Main extends Sprite {

    private var _appModel:Appmodel;
    private var _starling:Starling;

    // Building the app
    public function Main() {
        trace("[Main] started.");
        trace("[Main]" + stage.stageWidth);
        trace("[Main]" + stage.stageHeight);

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
        trace("[Main] after the rest.");
        trace("[Main]" + stage.stageWidth);
        trace("[Main]" + stage.stageHeight);
    }

    public function init():void{
        // New starling instance
        _starling = new Starling(Conversion, stage);

        // Initialise starling
        _starling.start();
    }

    private function resizeHandler(event:Event = null):void {
        trace("[Main] resizeHandler.");
        // Make rectangle for starling's viewport
        var rect:Rectangle = new Rectangle(0, 0, stage.stageWidth, stage.stageHeight);
        _starling.viewPort = rect;

        // Configure starling stage
        _starling.stage.stageWidth = stage.stageWidth;
        _starling.stage.stageHeight = stage.stageHeight;

        // Resize root class
        if(Starling.current.stage.numChildren !== 0){
            var p:Conversion = Starling.current.stage.getChildAt(0) as Conversion;
            p.resize(stage.stageWidth, stage.stageHeight);
        }
        trace("[Main] resizeHandler no starling.");
        trace("[Main]" + stage.stageWidth);
        trace("[Main]" + stage.stageHeight);
        trace("[Main] resizeHandler.");
        trace("[Main]" + _starling.stage.stageWidth);
        trace("[Main]" + _starling.stage.stageHeight);
    }
}
}