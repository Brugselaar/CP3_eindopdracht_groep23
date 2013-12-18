/**
 * Created with IntelliJ IDEA.
 * User: Arnoke
 * Date: 18/12/13
 * Time: 00:08
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.services {
import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.vo.HistoryVO;

import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

import starling.events.Event;

import starling.events.EventDispatcher;

public class HistoryService extends EventDispatcher
{
    private var _appModel:Appmodel;
    private var _json:File;
    public var historyArray:Array;

    public function HistoryService(){
        _appModel = Appmodel.getInstance();
        trace("[service] construct");
        _json = File.applicationStorageDirectory.resolvePath("ftc_history.json");
    }

    public function load():void{
        if(!_json.exists) {
            save([]);
        }

        var readStream:FileStream = new FileStream();
        readStream.open(_json, FileMode.READ);
        var str:String = readStream.readUTFBytes(readStream.bytesAvailable);
        var parsedJSON:Array = JSON.parse(str) as Array;
        readStream.close();

        var historyArray:Array = [];
        for each(var history:Object in parsedJSON) {
            var historyVO:HistoryVO = new HistoryVO();
            historyVO.id = history.id;
            historyVO.nameFormula = history.nameFormula;
            historyVO.leftFromInput = history.leftFromInput;
            historyVO.rightFromInput = history.rightFromInput;
            historyVO.input = history.input;
            historyVO.output = history.output;
            historyVO.rightFromOutput = history.rightFromOutput;
            historyVO.leftFromOutput = history.leftFromOutput;
            historyArray.push(historyVO);
        }
        this.historyArray = historyArray;
        _appModel.historyVOs = historyArray;
        trace(_appModel.historyVOs[1]);
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