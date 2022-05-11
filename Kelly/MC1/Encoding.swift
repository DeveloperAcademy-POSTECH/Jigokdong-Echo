//
//  Encoding.swift
//  MC1
//
//  Created by Kelly Chui on 2022/04/10.
//
import Foundation

struct Reply : Codable {
    var id : UUID
    var content :String
    var emoticonName : String
    var date: Date
    var rate : Int
}

struct Diary : Codable {
    var id :UUID
    var title :String
    var content :String
    var date: Date
    var emoticonName : String
    var Reply : Reply
}

func encodeJSON(repst : Reply) {
    
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    if let encodedJSON = try? encoder.encode(repst){
        fileOutput(data: encodedJSON)
    }
}

func fileOutput(data:Data) {
    //let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("myFile.JSON")
    //경로를 어디에다가 해야할까.....
    let fileManager = FileManager.default
    let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    let directoryURL = documentsURL.appendingPathComponent("Test_Folder")
    do {
        try fileManager.createDirectory(atPath: directoryURL.path, withIntermediateDirectories: false, attributes: nil)
    } catch let e{
        print(e.localizedDescription)
    }
    let helloPath = directoryURL.appendingPathComponent("reply.json")
    
    do {
        try data.write(to: helloPath)
    } catch let error as NSError {
        print("Error creating File : \(error.localizedDescription)")
    }
}
