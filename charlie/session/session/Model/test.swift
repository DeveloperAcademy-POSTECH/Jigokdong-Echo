import UIKit
import Foundation

extension DateFormatter {
  static let yyyyMMdd: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "ko")
    return formatter
  }()
}
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

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
        print(data)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(.yyyyMMdd)
    
    do {
        
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

var letters: [Diary] = load("MailboxData.json")
let date = letters[0].date
print(letters)
print(DateFormatter.yyyyMMdd.string(from: date))
