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

public class JSONService extends Sprite{

    public function FormuleService() {
        trace("[FormuleService] started.");
    }

    // Function has to be altered to ADD a profileArray instead of just replacing the whole file
    public function writeProfileJSON(file, id:uint, name:String, consumption:uint):void{
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
        }else{

        }
    }

    public function readJSON(file:File):void{
        var readStream:FileStream = new FileStream();
        readStream.open(file, FileMode.READ);
        var dataString:String = readStream.readUTFBytes(readStream.bytesAvailable);
        readStream.close();
        var parsedData:Array = JSON.parse(dataString) as Array;
        trace(parsedData);
    }

    public function writeConversionJSON(file:File):void{
        trace("[FormuleService] JSON File Path: " + file.nativePath);

        if(!file.exists) {
            var writeStream:FileStream = new FileStream();

            writeStream.open(file, FileMode.WRITE);
            var dataToWrite:Array = [
                {
                    id: 1,
                    title: "Price to fuel",
                    formula: 1/2,
                    reverseTitle: "Fuel to price",
                    reverseFormula: 2/1
                },
                {
                    id: 2,
                    title: "Distance to fuel",
                    formula: 1/2,
                    reverseTitle: "Fuel to distance",
                    reverseFormula: 2/1
                },
                {
                    id: 3,
                    title: "Oil for Two-stroke fuel",
                    formula: 1/2,
                    reverseTitle: "Oil in Two-stroke fuel",
                    reverseFormula: 2/1
                },
                {
                    id: 4,
                    title: "Kilometers to miles",
                    formula: 1/2,
                    reverseTitle: "Miles to kilometers",
                    reverseFormula: 2/1
                },
                {
                    id: 5,
                    title: "Liters to gallons",
                    formula: 1/2,
                    reverseTitle: "Gallons to liters",
                    reverseFormula: 2/1
                },
            ];

            writeStream.writeUTFBytes(JSON.stringify(dataToWrite));
            writeStream.close();
        }
    }

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