//
//  LettersDetailView.swift
//  MC1_Team2_Diary
//
//  Created by Eunbee Kang on 2022/04/06.
//

import SwiftUI

struct StarRatingView: View {
    let maxRating: Int = 5
    var letters: Letter
    var rate: Int? {
        letters.reply?.rate
    }
    
    private func starType(index: Int) -> String {
        if let unwrappedRate = rate {
                return index <= unwrappedRate ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        HStack {
            ForEach(1..<(maxRating + 1), id: \.self) {index in
                Image(systemName: self.starType(index: index))
                    .foregroundColor(Color.orange)
            }
        }
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 300, height: 40, alignment: .center)
            .background(Color("MyGreen"))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct LettersDetailView: View {
    var letters: Letter
    
    var body: some View {
        ScrollView {
        
        ZStack {
            VStack {
                
                /* 남의 일기 제목, 날짜, 이모티콘 */
                ZStack(alignment: .leading) {
                    Text(letters.title)
                        .foregroundColor(.primary)
                        .font(.title.bold())
                        .frame(width: 300, height: 40, alignment: .leading)
                    HStack{
                        Text(convertDateToString(date: letters.date))
                            .foregroundColor(.secondary)
                            .font(.caption)
                            .frame(width: 280, alignment: .trailing)
                        Image(letters.emoticonName)
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .trailing)
                    }
                }
                
                /*내가 답장을 했으면 답장 내용만 보이기*/
                if let reply = letters.reply {
                    ScrollView {
                        HStack(alignment: .top) {
                            Image(systemName: "arrowshape.turn.up.left.fill")
                                .rotationEffect(Angle(degrees: 180))
                                .foregroundColor(Color("MyGreen"))
                            Text(reply.content)
                                .font(.body)
                                .frame(width: 300, alignment: .leading)
                                //.padding()
                        }
                    }
                    
                    /*내 답장에 피드백이 있으면 별점 보이기*/
                    if reply.rate != nil {
                        ZStack(alignment: .leading) {
                            Text("내 답변에 대한 만족도")
                                .font(.caption2)
                            StarRatingView(letters: letters)
                            .frame(width: 300, alignment: .trailing)
                        }
                    } else {
                        Text("✭ 아직 상대방이 내 답변에 대한 만족도를 입력하기 전이예요🥲")
                            .font(.caption2)
                            .frame(width: 300, alignment: .leading)
                            .padding()
                    }
                        
                } else {
                    /*내가 답장을 안했으면 답장쓰기 버튼 보이기*/
                    VStack {
                        HStack(alignment: .top) {
                            Text(letters.content)
                                .font(.body)
                                .frame(width: 320, alignment: .leading)
                        }
                        
                        /*답장쓰기 버튼*/
                        NavigationLink(destination: ReplyView(letters:letters)) {
                            VStack {
                                Text("답장쓰러 가기")
                                    .font(.title2)
                            }
                        }
                        .buttonStyle(GrowingButton())

                    }
                }
                
            }
        }
        .frame(width: 350, height: 700, alignment: .top)
        
        }
    }
}

struct LettersDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LettersDetailView(letters: myLetterData[3])
        }
    }
}
