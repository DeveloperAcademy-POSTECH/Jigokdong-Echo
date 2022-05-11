import Foundation
import SwiftUI

struct Diary: Identifiable, Hashable, Codable {
    var id: UUID
    var title: String
    
    
    var date: Date
    
    var content: String
    
    var emoticonName: String
    var reply: Reply? = nil
    
    init(id: UUID = UUID(), title: String, date: Date , content: String, emoticonName: String) {
        self.id = id
        self.title = title
        self.date = date
        self.content = content
        self.emoticonName = emoticonName
    }

    // 답장 평가를 했는지도 추가
    //    var isRated: Bool
    //    var rate: Double?
}
