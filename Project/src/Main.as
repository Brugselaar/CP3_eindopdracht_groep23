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

[SWF(frameRate="30", backgroundColor="0xf9cb14")]
public class Main extends Sprite {

    private var _starling:Starling;

    // Building the app
    public function Main() {
        trace("[Main] started.");

        // Scaling and alignment of app
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        // Initialisation of the app
        init();

        // Resizehandler, case the user rotates his iPhone
        stage.addEventListener(Event.RESIZE, resizeHandler);

        // Retina recognition & adaption
            // iPhone with retina
            //Capabilities.screenResolutionX == 640 || Capabilities.screenResolutionY == 960
            if(stage.stageWidth == 640){
                trace("[Main] retina.");
                Utils.device = Utils.RETINA;
                Utils.divideFactor = 1;
            }

            // iPhone without retina
            //Capabilities.screenResolutionY == 320 || 
            if(stage.stageWidth == 320){
                trace("[Main] non-retina.");
                Utils.device = Utils.NONRETINA;
                Utils.divideFactor = 0.5;
            }
        // iPhone with retina
        //Capabilities.screenResolutionX == 640 || Capabilities.screenResolutionY == 960
        if(stage.stageWidth == 640){
            trace("[Main] retina.");
            Utils.device = Utils.RETINA;
            Utils.divideFactor = 1;
        }

        // iPhone without retina
        //Capabilities.screenResolutionY == 320 || 
        if(stage.stageWidth == 320){
            trace("[Main] non-retina.");
            Utils.device = Utils.NONRETINA;
            Utils.divideFactor = 0.5;
        }
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

        Utils.screenHeight = stage.stageHeight;
        Utils.screenWidth = stage.stageWidth;

        // Resize root class
        if(Starling.current.stage.numChildren !== 0){
            //var p:Conversion = Starling.current.stage.getChildAt(0) as Conversion;
            //p.resize(stage.stageWidth, stage.stageHeight);
        }
    }
}
}