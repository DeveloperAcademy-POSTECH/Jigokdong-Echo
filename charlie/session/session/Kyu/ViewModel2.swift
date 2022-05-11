//
//  ViewModel.swift
//  kyukyu
//
//  Created by 이한규 on 2022/04/12.
//

import Foundation

class ViewModel2: ObservableObject {
    var letter : Diary
    @Published var singo : Bool
    
    init(letter: Diary,singo:Bool){
        self.letter = letter
        self.singo = singo
        print("init")
    }
    var content: String {
        letter.content
    }
    var title : String {
        "\(letter.title)"
    }
    var date : String {
        "\(DateFormatter.yyyyMMdd.string(from: letter.date))"
    }
    var singoMent : String {
        if singo {
            return "신고 취소"
        }
        else {
            if !isItreplied {
                return ""
            }
            else {
                return "👉 부적절한 내용신고"
            }
        }
    }
    var emoticonName : String {
        switch(letter.emoticonName) {
        case "smile" : return "😄"
        default : return "😌"
        }
    }
    var isItreplied : Bool {
        if let reply = letter.reply {
            return true
        }
        return false
    }
    var repliedDate : String {
        if isItreplied {
            return DateFormatter.yyyyMMdd.string(from: letter.reply!.date)
        }
        else {
            return ""
        }
    }
    var repliedContent : String {
        if isItreplied {
            return letter.reply!.content
        }
        else {
            return "답장이 아직 안왔어요 "
        }
    }
    
    var repliedEmoticonName : String {
        if isItreplied {
            switch(letter.reply!.emoticonName) {
            case "smile" : return "😄"
            default : return "😌"
            }
        }
        else {
            return ""
        }
        
        
    }
    var singoQuestionMent : String {
        if !singo {
            return "신고하시겠습니까?"
        } else {
            return "신고 취소하시겠습니까?"
        }
    }
}

