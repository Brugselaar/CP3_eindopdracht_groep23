/**
 * Created with IntelliJ IDEA.
 * User: Arnoke
 * Date: 11/12/13
 * Time: 14:13
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.conversion.services {
import flash.display.Sprite;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

public class FormuleService extends Sprite{

    public function FormuleService() {
        trace("[FormuleService] started.");
    }

    public function writeProfileJSON(file, id:uint, name:String, consumption:uint, selected:Boolean):void{
        trace("[FormuleService] JSON File Path: " + file.nativePath);
        if(!file.exists) {
            var writeStream:FileStream = new FileStream();

            writeStream.open(file, FileMode.WRITE);
            var dataToWrite:Array = [
                {
                    id: id,
                    name: name,
                    consumption: consumption
                }
            ];

            writeStream.writeUTFBytes(JSON.stringify(dataToWrite));
            writeStream.close();
        }
    }

    // global function, works for all JSON
    public function readJSON(file:File):void{
        var readStream:FileStream = new FileStream();
        readStream.open(file, FileMode.READ);
        var dataString:String = readStream.readUTFBytes(readStream.bytesAvailable);
        readStream.close();
        var parsedData:Array = JSON.parse(dataString) as Array;
        trace(parsedData);
    }

    // ------------ WARNING!
    // SETTINGS & MENU - These have NOT to be flexible
    // Leave it as it is! (unless it needs fixing)

    public function writeMenuJSON(file:File):void{
        trace("[FormuleService] JSON File Path: " + file.nativePath);

        if(!file.exists) {
            var writeStream:FileStream = new FileStream();

            writeStream.open(file, FileMode.WRITE);
            var dataToWrite:Array = [
                {
                    id: 1,
                    title: "Conversions",
                    backgroundColor: 0x000000,
                    textColor: 0xf9cb14
                },
                {
                    id: 2,
                    title: "History",
                    backgroundColor: 0x000000,
                    textColor: 0xf9cb14
                },
                {
                    id: 3,
                    title: "Profiles",
                    backgroundColor: 0x000000,
                    textColor: 0xf9cb14
                }
            ];

            writeStream.writeUTFBytes(JSON.stringify(dataToWrite));
            writeStream.close();
        }
    }

    // Here we save the current profile, when we keep it in the profiles JSON file then we have to edit two arrays
    // each time the user changes profile, this way it's way easier for us and a faster alternative for the app.
    public function changeSelectedProfile(file:File, id:uint):void{
        trace("[FormuleService] JSON File Path: " + file.nativePath);
        if(!file.exists) {
            var writeStream:FileStream = new FileStream();

            writeStream.open(file, FileMode.WRITE);
            var dataToWrite:Array = [
                {
                    id: id
                }
            ];

            writeStream.writeUTFBytes(JSON.stringify(dataToWrite));
            writeStream.close();
        }
    }
}
}