import Foundation
import SwiftUI

struct model: Identifiable {
    var id: UUID
    var name: String
    
    init(id: UUID = UUID(), name: String) {
        self.name = name
    }
}

extension model {
    static var samples: [model] {
        
    }
}
