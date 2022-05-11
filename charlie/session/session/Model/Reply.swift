import Foundation
import SwiftUI

struct Reply: Identifiable, Hashable, Codable {
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
