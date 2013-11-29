package {

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

[SWF(frameRate="60")]
public class Main extends Sprite {

    // Building the app
    public function Main() {

        // scaling and alignment of app
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        // Initialisation of the app
        init();

        // Resizehandler, case the user rotates his iPhone
        stage.addEventListener(Event.RESIZE, resizeHandler);
    }

    public function init():void{

    }

    public function resizeHandler(event:Event):void{

    }
}
}