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
            ZStack{
                Color(red: 0.957, green: 0.912, blue: 0.782).edgesIgnoringSafeArea( .all)
                VStack {
                    
                    NavigationLink(destination: DiaryView()){
                        Text("")
                            .foregroundColor(.black)
                        
                    }
                    HStack{
                        
                        VStack {
                            
                            Text("Today's letter")
                                .font(.largeTitle)
                                .foregroundColor(Color(red: 0.957, green: 0.912, blue: 0.782))
                                .fontWeight(.heavy)
                                .padding(.leading, 27.0)
                                .background(Color(red: 0.543, green: 0.654, blue: 0.518)
                                    .edgesIgnoringSafeArea(.all)
                                    .frame(width: 600, height: 500))
                            
                            
                            Spacer()
                                .frame(height: 90)
                            
                            
                            Text("오늘하루 많이 힘들었지. 우리 모두 화이팅화이팅오늘하루 많이 힘들었지. 우리 모두 화이팅화이팅. 우리 모두 화이팅화이팅")
                                .background(Color(red: 0.957, green: 0.912, blue: 0.782)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .frame(width: 600, height: 250, alignment: .leading))
                            
                            
                            
                            
                                .padding()
                            
                            
                            
                            
                        }.frame(width: 280, height: 250)
                        
                        
                        Spacer()
                        
                    }
                    
                    VStack {
                        
                        
                        NavigationLink(destination: DiaryListView()){
                            HStack{
                                
                                Spacer()
                                    .frame(width: 280) //maxwidth, ignore, 정확한 좌표
                                
                                VStack {
                                    Text("Reply for me")
                                    Text("\(replyForMe)통")
                                }
                                
                                .frame(width: 120, height: 30)
                                .font(.system(size: 18))
                                .padding()
                                .background(Color(red: 0.543, green: 0.654, blue: 0.518) .cornerRadius(25))
                                .foregroundColor(Color(red: 0.957, green: 0.912, blue: 0.782))
                                
                            }
                        }
                        
                        
                        
                        
                        
                        HStack{
                            VStack {
                                HStack {
                                    ForEach(stars, id: \.self) { star in
                                        Image(systemName: "\(star)")
                                            .resizable()
                                            .frame(width: 32.0, height: 32.0)
                                    }
                                }
                                .padding()
                            }
                            .padding()
                            .foregroundColor(Color(red: 0.516, green: 0.659, blue: 0.504))
                            .background(Color(red: 0.957, green: 0.912, blue: 0.782))
                            .cornerRadius(25)
                            Spacer()
                                .padding(-1.0)
                            
                            NavigationLink(destination: MailboxListView(onlyShow: true)){
                                VStack {
                                    Text("Diary for me")
                                    Text("\(otherDiary)통")
                                }
                                .frame(width: 120, height: 30)
                                .font(.system(size: 18))
                                .padding()
                                .background(Color(red: 0.543, green: 0.654, blue: 0.518) .cornerRadius(25))
                                .foregroundColor(Color(red: 0.957, green: 0.912, blue: 0.782))
                                
                            }
                        }
                        
                    }
                    .navigationBarTitle("", displayMode: .large)
                    .navigationBarItems(trailing: Image(systemName: "seal.fill"))
                    .foregroundColor(Color(red: 0.957, green: 0.912, blue: 0.782))
                    //일기쓰기 버튼 + 모양으로 변경
                    
                    
                }
            }
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
