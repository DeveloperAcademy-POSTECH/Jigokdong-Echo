import Foundation
import SwiftUI
//
//var diaries: [Diary] = load("Diary.json")
//
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    else {
//        fatalError("\(filename) 파일을 찾지 못했습니다.")
//    }
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("\(filename)을 불러오지 못했습니다.")
//    }
//
//    do {
//        let decoder = JSONDecoder()
//
//
//        // 날짜 디코딩을 위해
//        decoder.dateDecodingStrategy = .iso8601
//
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("\(filename)을 불러오지 못했습니다.")
//    }
//}


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






//
//
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
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
//
//
//
//    let decoder = JSONDecoder()
//    decoder.dateDecodingStrategy = .formatted(.yyyyMMdd)
//
//    do {
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}
//

//
//func convertDateToString(date: Date) -> String {
//    var formatter: DateFormatter {
//        let format = DateFormatter()
//        format.dateFormat = "yyyy.MM.dd"
//        return format
//    }
//    return formatter.string(from: date)
//}

func getEmoticonImage(emoticonName: String) -> Image {
    return Image(emoticonName)
}




let modelUrl = Bundle.main.url(forResource: "SampleDiary", withExtension: "json")!
let modelsData = try! Data(contentsOf: modelUrl)
//var decoder: JSONDecoder {
//    let decoder = JSONDecoder()
//    decoder.dateDecodingStrategy = .formatted(.yyyyMMdd)
//    return decoder
//}

let myData = try! decoder.decode([Diary].self, from: modelsData)
//var myData: [Diary] = load("tempData.json")
