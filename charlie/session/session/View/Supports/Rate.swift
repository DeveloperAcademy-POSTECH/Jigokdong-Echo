//
//  Rate.swift
//  session
//
//  Created by 김승창 on 2022/04/11.
//

import SwiftUI

struct Rate: View {
    var reply: Reply
    var rate: Int? {
        reply.rate
    }
    
    private func starType(index: Int) -> String {
        if let unwrappedRate = rate {
            if case unwrappedRate = self.rate {
                return index <= unwrappedRate ? "star.fill" : "star"
            } else {
                return "star"
            }
        } else {
            return "star"
        }
    }
    
    var body: some View {
        HStack {
            ForEach(1..<6, id: \.self) {index in
                Image(systemName: self.starType(index: index))
                    .foregroundColor(Color.orange)
            }
        }
        
    }
}

struct Rate_Previews: PreviewProvider {
    static var previews: some View {
        Rate(reply: myData[0].reply!)
    }
}

