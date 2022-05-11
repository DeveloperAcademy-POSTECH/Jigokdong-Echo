//
//  MyPageView.swift
//  session
//
//  Created by 김승창 on 2022/04/08.
//

import SwiftUI

struct MyPageView: View {
    @State var ViewSwitch = true
    
    
    @State private var showSearchBar = false
    @State private var isEditing = false
    
    
    var body: some View {
        NavigationView {
            if ViewSwitch {
                // 달력뷰 출력
                CalendarView()
                
                
                // nav-bar 설정
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarItems(
                        leading:
                            Text("일기장")
                            .font(.title.bold()),
                        trailing:
                            HStack {
                                Button {
                                    // search
                                    
                                    ViewSwitch.toggle()
                                    showSearchBar = true
                                    isEditing = true
                                    
                                    
                                    
                                    
                                    
                                } label: {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(Color("MyGreen"))
                                    
                                }
                                Button {
                                    showSearchBar = false
                                    isEditing = false
                                    ViewSwitch.toggle()
                                    // list-view
                                    
                                } label: {
                                    Image(systemName: "list.bullet")
                                        .foregroundColor(Color("MyGreen"))
                                    
                                }
                                NavigationLink(destination: DiaryView()){
                                       Image(systemName: "plus")
                                        .foregroundColor(Color("MyGreen"))
                                }
//                                Button {
//                                    // write new diary
//
//                                } label: {
//                                    Image(systemName: "plus")
//                                        .foregroundColor(Color("MyGreen"))
//
//                                }
                            })
                
                
                
                
            } else {
                // 목록뷰 출력
                
                ListVIew(isEditing: $isEditing, showSearchBar: $showSearchBar, onlyShowYetReplied: false)
                
                // nav-bar 설정
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarItems(
                        leading:
                            Text("일기장")
                            .font(.title.bold()),
                        trailing:
                            HStack {
                                Button {
                                    // search
                                    withAnimation(.default) {
                                        showSearchBar = true
                                        isEditing = true
                                    }
                                    
                                    
                                } label: {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(Color("MyGreen"))
                                    
                                }
                                Button {
                                    ViewSwitch.toggle()
                                    
                                    // list-view
                                    
                                } label: {
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color("MyGreen"))
                                    
                                }
                                Button {
                                    // write new diary
                                    
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color("MyGreen"))
                                }
                            })
                
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
