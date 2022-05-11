//
//  TapView.swift
//  MC1_Team2_Diary (iOS)
//
//  Created by Somin Park on 2022/04/08.
//

import SwiftUI

struct TapView: View {
    @State var selection = 2
    
    var body: some View {
        
    TabView(selection: $selection) {
        
        //일기장
        DiaryTestView()
            .tabItem {
                Image(systemName: "text.book.closed")
            }.tag(1)
        //홈화면
        HomeView()
            .tabItem {
                Image(systemName: "house")
            }.tag(2)
        //우체통
        PostView()
            .tabItem {
                Image(systemName: "envelope")
            }
        }.tag(3)
        
    }
}
