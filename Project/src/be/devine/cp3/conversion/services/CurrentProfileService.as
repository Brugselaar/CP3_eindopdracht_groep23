/**
 * Created with IntelliJ IDEA.
 * User: Arnoke
 * Date: 18/12/13
 * Time: 00:08
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.services {
import be.devine.cp3.conversion.model.Appmodel;
import be.devine.cp3.conversion.vo.CurrentProfileVO;
import be.devine.cp3.conversion.vo.HistoryVO;

import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

import starling.events.Event;

import starling.events.EventDispatcher;

public class CurrentProfileService extends EventDispatcher
{
    private var _appModel:Appmodel;
    private var _json:File;
    public var currentProfile:Object;

    public function CurrentProfileService(){
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

        for each(var history:Object in parsedJSON) {
            var currentProfileVO:CurrentProfileVO = new CurrentProfileVO();
            currentProfileVO.id = currentProfile.id;
            currentProfile = currentProfileVO;
        }
        _appModel.currentProfile = currentProfile;
        dispatchEvent(new Event(Event.COMPLETE));
    }

    public function save(array:Array):void{
        var writeStream:FileStream = new FileStream();
        writeStream.open(_json, FileMode.WRITE);
        writeStream.writeUTFBytes(JSON.stringify(array));
        writeStream.close();
    }

    public function saveNew(id:uint):void{
        var writeStream:FileStream = new FileStream();
        writeStream.open(_json, FileMode.WRITE);
        load();
        var newSave:Array = [{id: id}];
        writeStream.writeUTFBytes(JSON.stringify(newSave));
        writeStream.close();
    }
}
}