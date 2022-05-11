//
//  ModalView.swift
//  session
//
//  Created by 김승창 on 2022/04/06.
//

import SwiftUI

struct ModalView: View {
    var diary: Diary
    
    var body: some View {
        ScrollView {
            
            //             일기
            VStack(alignment: .leading, spacing: 15) {
                
                // 일기 제목, 날짜, 이모티콘
                HStack {
                    Text(diary.title)
                        .font(.title.bold())
                    Spacer()
                    Text(diary.dateString)
                        .font(.caption)
                        .fontWeight(.thin)
                    
                    diary.emoticon
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
                        Text(reply.title)
                            .font(.title.bold())
                        Spacer()
                        Text(reply.dateString)
                            .font(.caption)
                            .fontWeight(.thin)
                        reply.emoticon
                    }
                    .padding()
                    
                    
                    ScrollView {
                        Text(reply.content)
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
struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(diary: sampleDiaries[0].diaries[0])
    }
}
