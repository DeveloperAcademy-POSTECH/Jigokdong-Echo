//
//  HomeView.swift
//  Team2_DiaryApp
//
//  Created by Somin Park on 2022/04/02.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        var stars = ["star.fill", "star.fill", "star.fill", "star", "star"]
        var replyForMe = 3
        var otherDiary = 2
        NavigationView {
            VStack {
                VStack {
                    Text("나의 마음등급은").padding()
                    HStack {
                        ForEach(stars, id: \.self) { star in
                                            Image(systemName: "\(star)")
                                            .resizable()
                                            .frame(width: 32.0, height: 32.0)
                                        }
                        }.padding()
                    }.padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 4)
                            .frame(width: 240, height: 120))
            NavigationLink(destination: DiaryView()){
                   Text("일기쓰기")
                    .foregroundColor(.black)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 4)
                    )
            }
            VStack {
                Text("오늘의 글")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("오늘하루 많이 힘들었지. 우리 모두 화이팅화이팅오늘하루 많이 힘들었지. 우리 모두 화이팅화이팅. 우리 모두 화이팅화이팅")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 4)
                    )
            }.frame(width: 280, height: 250)
            HStack {
                NavigationLink(destination: TestView1()){
                   VStack {
                       Text("내게 온 답장")
                       Text("\(replyForMe)통")
                    }
                       .frame(width: 100, height: 100)
                       .font(.system(size: 18))
                       .padding()
                       .foregroundColor(.black)
                       .overlay(
                           RoundedRectangle(cornerRadius: 25)
                               .stroke(Color.black, lineWidth: 2)
                       )
                }
                NavigationLink(destination: TestView2()){
                    VStack {
                        Text("내게 온 일기")
                        Text("\(otherDiary)통")
                     }
                         .frame(width: 100, height: 100)
                        .font(.system(size: 18))
                        .padding()
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    }
                }
                .navigationBarTitle("Home", displayMode: .inline)
                .navigationBarItems(trailing: Image(systemName: "seal.fill"))
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

