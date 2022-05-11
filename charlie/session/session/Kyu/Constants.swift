//
//  Constants.swift
//  kyukyu
//
//  Created by 이한규 on 2022/04/11.
//

import Foundation

//: Playground - noun: a place where people can play

import UIKit
import Foundation

//extension DateFormatter {
//  static let yyyyMMdd: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "yyyy-MM-dd"
//    formatter.calendar = Calendar(identifier: .iso8601)
//    formatter.timeZone = TimeZone(secondsFromGMT: 0)
//    formatter.locale = Locale(identifier: "ko")
//    return formatter
//  }()
//}
//struct Letter: Hashable, Codable, Identifiable {
//    var id: UUID
//    var title: String
//    var date: Date
//    var content: String
//    var emoticonName: String
//    var reply: MyReply? = nil
//
//    init(id: UUID = UUID(), title: String, date: Date , content: String, emoticonName: String) {
//        self.id = id
//        self.title = title
//        self.date = date
//        self.content = content
//        self.emoticonName = emoticonName
//    }
//}
//
//struct MyReply: Hashable, Codable, Identifiable {
//    var id: UUID
//    var date: Date
//    var content: String
//    var emoticonName: String
//    var rate: Int? = nil
//    
//    init(id: UUID = UUID(),date: Date, content: String, emoticonName: String) {
//        self.id = id
//        self.date = date
//        self.content = content
//        self.emoticonName = emoticonName
//    }
//}
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//
//    if let fileURL = Bundle.main.url(forResource: "MailboxData", withExtension: "json") {
//        print("find")
//        // we found the file in our bundle!
//    } else {
//        print("cannot")
//    }
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//    }
//
//    do {
//        data = try Data(contentsOf: file)
//        print(data)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//    let decoder = JSONDecoder()
//    decoder.dateDecodingStrategy = .formatted(.yyyyMMdd)
//
//    do {
//
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}
//
//var letters: [Diary] = load("MailboxData.json")

//let date = letters[0].date
//print(letters)
//print(DateFormatter.yyyyMMdd.string(from: date))



import Foundation

/* from SwiftUI Tutorial*/
//var letters: [Letter] = load("MailboxData.json")
//
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//    }
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}


//extension DateFormatter {
//  static let yyyyMMdd: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "yyyy.MM.dd"
//    formatter.calendar = Calendar(identifier: .iso8601)
//    formatter.timeZone = TimeZone(secondsFromGMT: 0)
//    formatter.locale = Locale(identifier: "ko")
//    return formatter
//  }()
//}

//func convertDateToString(date: Date) -> String {
//    var formatter: DateFormatter {
//        let format = DateFormatter()
//        format.dateFormat = "yyyy.MM.dd"
//        return format
//    }
//    return formatter.string(from: date)
//}
//
//let modelUrlMailbox = Bundle.main.url(forResource: "MailboxData", withExtension: "json")!
//let modelsDataMailbox = try! Data(contentsOf: modelUrlMailbox)
//var decoder: JSONDecoder {
//    let decoder = JSONDecoder()
//    decoder.dateDecodingStrategy = .formatted(.yyyyMMdd)
//    return decoder
//}

//let myLetterData = try! decoder.decode([Letter].self, from: modelsDataMailbox)


//var letter = Diary(id: UUID(), title: " ", date: Date(), content: " ", emoticonName: " ")

