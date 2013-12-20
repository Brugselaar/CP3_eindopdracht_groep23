/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 20/12/13
 * Time: 09:01
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.elements {
import feathers.controls.Label;
import feathers.controls.renderers.LayoutGroupListItemRenderer;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;

public class FeathersMenuButton extends LayoutGroupListItemRenderer{
    private var _title:Label;
    private var _padding:Number = 0;
    private var _isArrow:Boolean;
    private var _textColor:uint;
//    private var _textField:TextField;
//    private var _background:Quad;
//    private var _arrowRight:Image;
//    private var _arrowBitMapData:BitmapData;
//    private var _arrow:ArrowRight;
//    private var _button:ButtonRight;

    public function FeathersMenuButton() {
    }

    override protected function initialize():void {
        this.layout = new AnchorLayout();

        var labelLayoutData:AnchorLayoutData = new AnchorLayoutData();
        labelLayoutData.top = 0;
        labelLayoutData.right = 0;
        labelLayoutData.bottom = 0;
        labelLayoutData.left = 0;

        this._title = new Label();
        this._title.layoutData = labelLayoutData;
        this.addChild(this._title);
    }

    override protected function commitData():void {
        if(this._data && this._owner){
            this._title.text = "Menu";
        }
        else
        {
            this._title.text = null;
        }
    }

    override protected function preLayout():void {
        var labelLayoutData:AnchorLayoutData = AnchorLayoutData(this._title.layoutData);
        labelLayoutData.top = this._padding;
        labelLayoutData.right = this._padding;
        labelLayoutData.bottom = this._padding;
        labelLayoutData.left = this._padding;
    }

    public function get title():Label {
        return _title;
    }

    public function set title(value:Label):void {
        _title = value;
    }

    public function get isArrow():Boolean {
        return _isArrow;
    }

    public function set isArrow(value:Boolean):void {
        _isArrow = value;
    }
    public function get textColor():uint {
        return _textColor;
    }

    public function set textColor(value:uint):void {
        _textColor = value;
    }

    public function get padding():Number {
        return _padding;
    }

    public function set padding(value:Number):void {
        _padding = value;
    }
}
}
