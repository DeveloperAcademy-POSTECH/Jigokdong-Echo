//
//  MailboxData.swift
//  MC1_Team2_Diary
//
//  Created by Eunbee Kang on 2022/04/07.
//

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


extension DateFormatter {
  static let yyyyMMdd: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "ko")
    return formatter
  }()
}

func convertDateToString(date: Date) -> String {
    var formatter: DateFormatter {
        let format = DateFormatter()
        format.dateFormat = "yyyy.MM.dd"
        return format
    }
    return formatter.string(from: date)
}

let modelUrlMailbox = Bundle.main.url(forResource: "MailboxData", withExtension: "json")!
let modelsDataMailbox = try! Data(contentsOf: modelUrlMailbox)
var decoder: JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(.yyyyMMdd)
    return decoder
}

let myLetterData = try! decoder.decode([Letter].self, from: modelsDataMailbox)
