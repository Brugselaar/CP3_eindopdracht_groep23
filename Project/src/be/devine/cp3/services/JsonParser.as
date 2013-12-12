/**
 * Created with IntelliJ IDEA.
 * User: ferdyfiers
 * Date: 12/12/13
 * Time: 10:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.services {
import flash.display.Sprite;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

public class JsonParser extends Sprite{
    public function JsonParser() {
        var f:File = File.applicationStorageDirectory.resolvePath('cards.json');
        trace ("JSON File Path:" + f.nativePath);
        if(!f.exists){
            var writeStream:FileStream = new FileStream();

            writeStream.open(f, FileMode.WRITE);
            var dataToWrite:Array = [
                {
                    id: 1,
                    name: "Item 1"
                },
                {
                    id: 2,
                    name: "Item 2"
                }
            ];

            writeStream.writeUTFBytes(JSON.stringify(dataToWrite));
            writeStream.close();
        }
        var readStream:FileStream = new FileStream();
        readStream.open(f, FileMode.READ);
        var dataString:String = readStream.readUTFBytes(readStream.bytesAvailable);
        readStream.close();
        var parsedData:Array = JSON.parse(dataString) as Array;
        trace(parsedData);
    }
}
}
