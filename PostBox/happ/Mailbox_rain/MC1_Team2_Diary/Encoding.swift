//
//  Encoding.swift
//  MC1
//
//  Created by Kelly Chui on 2022/04/10.
//
import Foundation

//******** 합치면 지워질것들 ********
/*
struct Letter: Hashable, Codable, Identifiable {
    var id: UUID
    var title: String
    var date: Date
    var content: String
    var emoticonName: String
    var reply: MyReply? = nil

    init(id: UUID = UUID(), title: String, date: Date , content: String, emoticonName: String) {
        self.id = id
        self.title = title
        self.date = date
        self.content = content
        self.emoticonName = emoticonName
    }
}

struct MyReply: Hashable, Codable, Identifiable {
    var id: UUID
    var date: Date
    var content: String
    var emoticonName: String
    var rate: Int? = nil
    
    init(id: UUID = UUID(),date: Date, content: String, emoticonName: String) {
        self.id = id
        self.date = date
        self.content = content
        self.emoticonName = emoticonName
    }
}
*/
//******** 합치면 지워질것들 ********


func encodeJSON(repst:Letter) {
    
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    if let encodedJSON = try? encoder.encode(repst){
        fileOutput(data: encodedJSON)
    }
}

//rain한태서 인덱스 받아오고...
//

func fileOutput(data:Data) {
    let fileManager = FileManager.default
    let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    let directoryURL = documentsURL.appendingPathComponent("Test_Folder")
    do {
        try fileManager.createDirectory(atPath: directoryURL.path, withIntermediateDirectories: false, attributes: nil)
    } catch let e{
        print(e.localizedDescription)
    }
    let Path = directoryURL.appendingPathComponent("reply.json")
    print(Path)
    do {
        print(Path)
        try data.write(to: Path)
    } catch let error as NSError {
        print("Error creating File : \(error.localizedDescription)")
    }
}
