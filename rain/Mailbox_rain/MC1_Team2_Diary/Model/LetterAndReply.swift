//
//  MailboxData.swift
//  MC1_Team2_Diary
//
//  Created by Eunbee Kang on 2022/04/07.
//

import Foundation

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

struct DateValue: Identifiable {
    var id: UUID = UUID()
    var day: Int
    var date: Date
}
