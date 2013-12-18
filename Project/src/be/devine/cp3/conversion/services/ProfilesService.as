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
import be.devine.cp3.conversion.vo.ProfileVO;

import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

import starling.events.Event;

import starling.events.EventDispatcher;

public class ProfilesService extends EventDispatcher
{
    private var _appModel:Appmodel;
    private var _json:File;
    public var profilesArray:Array = [];

    public function ProfilesService(){
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

        var profilesArray:Array = [];
        for each(var profile:Object in parsedJSON) {
            var profileVO:ProfileVO = new ProfileVO();
            profileVO.id = profile.id;
            profileVO.name = profile.name;
            profileVO.consumption = profile.consumption;
            profilesArray.push(profileVO);
        }

        this.profilesArray = profilesArray;
        _appModel.profileVOs = profilesArray;
        dispatchEvent(new Event(Event.COMPLETE));
    }

    public function save(array:Array):void{
        var writeStream:FileStream = new FileStream();
        writeStream.open(_json, FileMode.WRITE);
        writeStream.writeUTFBytes(JSON.stringify(array));
        writeStream.close();
        trace(profilesArray);
    }

    public function saveNew(name:String, consumption:Number):void{
        var writeStream:FileStream = new FileStream();
        writeStream.open(_json, FileMode.WRITE);
        load();
        var newSave:Object = {id: (profilesArray.length+1), name: name, consumption: consumption};
        profilesArray.push(newSave);
        writeStream.writeUTFBytes(JSON.stringify(profilesArray));
        writeStream.close();
    }
}
}