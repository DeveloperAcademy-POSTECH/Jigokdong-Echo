//
//  LetterTitleView.swift
//  MC1_Team2_Diary
//
//  Created by Eunbee Kang on 2022/04/06.
//

import SwiftUI

struct LetterTitleView: View {
    var letters: Letter
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(letters.title)
                .foregroundColor(.primary)
                .font(.headline)
                .frame(width: 270, height: 40, alignment: .leading)
            HStack {
                Text(convertDateToString(date:(letters.date)))
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                    .frame(width: 270, height: 40, alignment: .trailing)
                if letters.reply == nil {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(Color("MyGreen"))
                    
                }
            }
        }
    }
}

struct LetterTitleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LetterTitleView(letters: myLetterData[9])
        }
    }
}
