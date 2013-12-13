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

    public function writeHistoryJSON(file:File, conversion:String, input: Number, result:Number):void{
        var dataToWrite:Array = [{id: 1, conversion: conversion, input: input, result: result}];


        trace("[FormuleService] JSON File Path: " + file.nativePath);
        if(!file.exists) {
            var writeStream:FileStream = new FileStream();

            writeStream.open(file, FileMode.WRITE);

            writeStream.writeUTFBytes(JSON.stringify(dataToWrite));
            writeStream.close();
        } else {
            var writeStream:FileStream = new FileStream();
            writeStream.open(file, FileMode.UPDATE);
            var oldData:Array = readJSON(file);
            dataToWrite[0].id = oldData.length+1;
            oldData.push(dataToWrite[0]);
            writeStream.writeUTFBytes(JSON.stringify(oldData));
            writeStream.close();
        }
        trace(readJSON(file));
    }

    // Function has to be altered to ADD a profileArray instead of just replacing the whole file
    public function writeProfileJSON(file:File, name:String, consumption:uint=1/15):void{
        var dataToWrite:Array = [{id: 1, name: name, consumption: consumption}];


        trace("[FormuleService] JSON File Path: " + file.nativePath);
        if(!file.exists) {
            var writeStream:FileStream = new FileStream();

            writeStream.open(file, FileMode.WRITE);

            writeStream.writeUTFBytes(JSON.stringify(dataToWrite));
            writeStream.close();
        } else {
            var writeStream:FileStream = new FileStream();
            writeStream.open(file, FileMode.UPDATE);
            var oldData:Array = readJSON(file);
            dataToWrite[0].id = oldData.length+1;
            oldData.push(dataToWrite[0]);
            writeStream.writeUTFBytes(JSON.stringify(oldData));
            writeStream.close();
        }
        trace(readJSON(file));
    }

    public function readJSON(file:File):Array{
        var readStream:FileStream = new FileStream();
        readStream.open(file, FileMode.READ);
        var dataString:String = readStream.readUTFBytes(readStream.bytesAvailable);
        readStream.close();
        var parsedData:Array = JSON.parse(dataString) as Array;
        return parsedData;
    }

    public function writeCustomConversion(file:File, name:String, formula:Number):void{
        var dataToWrite:Array = [{id: 1, name: name, formula: formula, reverseTitle: "?", reverseFormula: 0, custom: true}];


        trace("[FormuleService] JSON File Path: " + file.nativePath);
        if(!file.exists) {
            var writeStream:FileStream = new FileStream();

            writeStream.open(file, FileMode.WRITE);

            writeStream.writeUTFBytes(JSON.stringify(dataToWrite));
            writeStream.close();
        } else {
            var writeStream:FileStream = new FileStream();
            writeStream.open(file, FileMode.UPDATE);
            var oldData:Array = readJSON(file);
            dataToWrite[0].id = oldData.length+1;
            oldData.push(dataToWrite[0]);
            writeStream.writeUTFBytes(JSON.stringify(oldData));
            writeStream.close();
        }
        trace(readJSON(file));
    }

    public function writeConversionJSON(file:File):void{
        trace("[FormuleService] JSON File Path: " + file.nativePath);

        if(!file.exists) {
            var writeStream:FileStream = new FileStream();

            writeStream.open(file, FileMode.WRITE);
            var dataToWrite:Array = [
                {
                    id: 1,
                    title: "Price to Diesel",
                    formula: 1/1.465,
                    reverseTitle: "Fuel to price",
                    reverseFormula: 1.465,
                    custom: false
                },
                {
                    id: 2,
                    title: "Price to Super 95",
                    formula: 1/1.610,
                    reverseTitle: "Fuel to price",
                    reverseFormula: 1.610,
                    custom: false
                },
                {
                    id: 3,
                    title: "Price to Super 98",
                    formula: 1/1.668,
                    reverseTitle: "Fuel to price",
                    reverseFormula: 1.668,
                    custom: false
                },
                {
                    id: 4,
                    title: "Price to LPG",
                    formula: 1/0.726,
                    reverseTitle: "Fuel to price",
                    reverseFormula: 0.726,
                    custom: false
                },
                {
                    //GAAT NIET OMDAT HET VAN GEBRUIK AFHANGT
                    id: 5,
                    title: "Distance to fuel",
                    formula: 1/2,
                    reverseTitle: "Fuel to distance",
                    reverseFormula: 2/1,
                    custom: false
                },
                {
                    id: 6,
                    title: "Oil for Two-stroke fuel",
                    formula: 2/100,
                    reverseTitle: "Oil in Two-stroke fuel",
                    reverseFormula: 100/2,
                    custom: false
                },
                {
                    id: 7,
                    title: "Kilometers to miles",
                    formula: 1/1.60934,
                    reverseTitle: "Miles to kilometers",
                    reverseFormula: 1.60934,
                    custom: false
                },
                {
                    id: 8,
                    title: "Liters to gallons",
                    formula: 1/3.78541,
                    reverseTitle: "Gallons to liters",
                    reverseFormula: 3.78541,
                    custom: false
                }
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