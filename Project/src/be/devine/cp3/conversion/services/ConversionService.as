/**
 * Created with IntelliJ IDEA.
 * User: Arnoke
 * Date: 18/12/13
 * Time: 00:08
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.services {
import be.devine.cp3.conversion.model.AppModel;
import be.devine.cp3.conversion.vo.ConversionVO;

import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

import starling.events.Event;

import starling.events.EventDispatcher;

public class ConversionService extends EventDispatcher
{
    private var _appModel:AppModel;
    private var _json:File;
    public var conversionArray:Array;

    public function ConversionService(){
        _appModel = AppModel.getInstance();
        trace("[service] construct");
        _json = File.applicationStorageDirectory.resolvePath("ftc_conversion.json");
    }

    public function load():void{
        if(!_json.exists) {
            trace("?");
            save(
            [{
                id: 1,
                title: "Price / Diesel",
                rightFromInput: "",
                leftFromInput: "€",
                rightFromOutput: "L",
                leftFromOutput: "",
                formula: 1/1.465,
                reverseTitle: "Diesel / Price",
                reverseFormula: 1.465,
                custom: false
                },
                {
                    id: 2,
                    title: "Price / Super 95",
                    rightFromInput: "",
                    leftFromInput: "€",
                    rightFromOutput: "L",
                    leftFromOutput: "",
                    formula: 1/1.610,
                    reverseTitle: "Super 95 / Price",
                    reverseFormula: 1.610,
                    custom: false
                },
                {
                    id: 3,
                    title: "Price / Super 98",
                    rightFromInput: "",
                    leftFromInput: "€",
                    rightFromOutput: "L",
                    leftFromOutput: "",
                    formula: 1/1.668,
                    reverseTitle: "Super 98 / Price",
                    reverseFormula: 1.668,
                    custom: false
                },
                {
                    id: 4,
                    title: "Price / LPG",
                    rightFromInput: "",
                    leftFromInput: "€",
                    rightFromOutput: "L",
                    leftFromOutput: "",
                    formula: 1/0.726,
                    reverseTitle: "LPG / Price",
                    reverseFormula: 0.726,
                    custom: false
                },
                {
                    //GAAT NIET OMDAT HET VAN GEBRUIK AFHANGT
                    id: 5,
                    title: "Distance / Fuel",
                    rightFromInput: "km",
                    leftFromInput: "",
                    rightFromOutput: "L",
                    leftFromOutput: "",
                    formula: 1/2,
                    reverseTitle: "Fuel / Distance",
                    reverseFormula: 2/1,
                    custom: false
                },
                {
                    id: 6,
                    title: "Oil / Two-stroke fuel",
                    rightFromInput: "L",
                    leftFromInput: "",
                    rightFromOutput: "L",
                    leftFromOutput: "",
                    formula: 2/100,
                    reverseTitle: "Two-stroke fuel / Oil",
                    reverseFormula: 100/2,
                    custom: false
                },
                {
                    id: 7,
                    title: "Kilometers / Miles",
                    rightFromInput: "km",
                    leftFromInput: "",
                    rightFromOutput: "Mi",
                    leftFromOutput: "",
                    formula: 1/1.60934,
                    reverseTitle: "Miles / Kilometers",
                    reverseFormula: 1.60934,
                    custom: false
                },
                {
                    id: 8,
                    title: "Liters / Gallons",
                    rightFromInput: "L",
                    leftFromInput: "",
                    rightFromOutput: "gal",
                    leftFromOutput: "",
                    formula: 1/3.78541,
                    reverseTitle: "Gallons / Liters",
                    reverseFormula: 3.78541,
                    custom: false
                }]
            );
        }

        var readStream:FileStream = new FileStream();
        readStream.open(_json, FileMode.READ);
        var str:String = readStream.readUTFBytes(readStream.bytesAvailable);
        var parsedJSON:Array = JSON.parse(str) as Array;
        readStream.close();

        var conversionArray:Array = [];
        for each(var conversion:Object in parsedJSON) {
            var conversionVO:ConversionVO = new ConversionVO();
            conversionVO.id = conversion.id;
            conversionVO.formula = conversion.formula;
            conversionVO.reverseFormula = conversion.reverseFormula;
            conversionVO.title = conversion.title;
            conversionVO.custom = conversion.custom;
            conversionVO.reverseTitle = conversion.reverseTitle;
            conversionVO.rightFromInput = conversion.rightFromInput;
            conversionVO.rightFromOutput = conversion.rightFromOutput;
            conversionVO.leftFromInput = conversion.leftFromInput;
            conversionVO.leftFromOutput = conversion.leftFromOutput;
            conversionArray.push(conversionVO);
        }
        this.conversionArray = conversionArray;
        _appModel.conversionVOs = conversionArray;
        trace(_appModel.conversionVOs[1]);
        dispatchEvent(new Event(Event.COMPLETE));
    }

    public function save(array:Array):void{
        var writeStream:FileStream = new FileStream();
        writeStream.open(_json, FileMode.WRITE);
        writeStream.writeUTFBytes(JSON.stringify(array));
        writeStream.close();

        trace("saved");
    }
}
}