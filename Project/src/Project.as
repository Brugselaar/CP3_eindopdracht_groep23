package {

import flash.display.Sprite;
import flash.text.TextField;

public class Project extends Sprite {
    public function Project() {
        var textField:TextField = new TextField();
        textField.text = "Hello, World";
        addChild(textField);
    }
}
}
