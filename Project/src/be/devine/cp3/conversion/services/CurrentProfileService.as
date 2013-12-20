/**
 * Created with IntelliJ IDEA.
 * User: Arnoke
 * Date: 18/12/13
 * Time: 00:08
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.services {
import be.devine.cp3.conversion.model.AppModel;
import be.devine.cp3.conversion.vo.CurrentProfileVO;
import be.devine.cp3.conversion.vo.HistoryVO;
import be.devine.cp3.conversion.vo.ProfileVO;

import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

import starling.events.Event;

import starling.events.EventDispatcher;

public class CurrentProfileService extends EventDispatcher
{
    private var _appModel:AppModel;
    private var _json:File;
    public var _currentProfile:ProfileVO;

    public function CurrentProfileService(){
        _appModel = AppModel.getInstance();
        trace("[service] construct");
        _json = File.applicationStorageDirectory.resolvePath("ftc_currentProfile.json");
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

        for each(var currentProfile:Object in parsedJSON) {
            _appModel.currentProfile = currentProfile;
            _appModel.currentProfileId = currentProfile.id;
            trace(_appModel.currentProfileId);
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
}
}