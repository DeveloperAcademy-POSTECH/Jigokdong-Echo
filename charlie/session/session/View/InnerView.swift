//
//  ModalView.swift
//  session
//
//  Created by 김승창 on 2022/04/06.
//

import SwiftUI

struct InnerView: View {
    var diary: Diary
    var rate: Int? {
        diary.reply?.rate
    }
    
//    init(){
//        print("init")
//    }
    var body: some View {
        ScrollView {
            
            //             일기
            VStack(alignment: .leading, spacing: 15) {
                
                // 일기 제목, 날짜, 이모티콘
                HStack {
                    Text(diary.title)
                        .font(.title.bold())
                    Spacer()
                    Text(convertDateToString(date: diary.date))
                        .font(.caption)
                        .fontWeight(.thin)
                    
                    getEmoticonImage(emoticonName: diary.emoticonName)
                    //                    diary.emoticon
                }
                .padding()
                
                
                // 일기 내용
                ScrollView {
                    Text(diary.content)
                        .padding()
                    
                    
                    
                    
                    
                    
                }
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .background {
                    Color("MyGreen")
                        .opacity(0.75)
                }
                .clipShape(RoundedRectangle(cornerRadius: 14))
                
            }
            .padding()
            
            
            
            
            
            //            답변
            VStack {
                
                if let reply = diary.reply {
                    HStack {
                        
                        Image(systemName: "arrowshape.turn.up.left.fill")
                            .rotationEffect(.degrees(180))
                            .font(.title)
                        
                        Text(" 답장")
                            .font(.title.bold())
                        
                        
                        
                        
                        Spacer()
                        
                        
                        
                        Text(convertDateToString(date: reply.date))
                            .font(.caption)
                            .fontWeight(.thin)
                        //                        reply.emoticon
                        
                        getEmoticonImage(emoticonName: reply.emoticonName)
                    }
                    .padding()
                    
                    
                    ScrollView {
                        Text(reply.content)
                            .padding()
                        
                        
                        Rate(reply: reply)
                    }
                    .frame(height: 300)
                    .frame(maxWidth: .infinity)
                    .background {
                        Color("MyGreen")
                            .opacity(0.75)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    
                }
                else {
                    Text("답변이 없습니다.")
                        .font(.title.bold())
                        .padding()
                }
            }
            .padding()
            
            
        }
    }
}
struct InnerView_Previews: PreviewProvider {
    static var previews: some View {
        InnerView(diary: myData[3])
    }
}
