//
//  MyPageView.swift
//  session
//
//  Created by 김승창 on 2022/04/08.
//

import SwiftUI

struct DiaryListView: View {
    @State private var showSearchBar = false
    @State private var isEditing = false
    
    var body: some View {
        ListVIew(isEditing: $isEditing,showSearchBar: $showSearchBar, onlyShowYetReplied: true)
            
            // nav-bar 설정
            .navigationBarTitle("일기목록", displayMode: .inline)
            
    }
}

struct DiaryListView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView()
    }
}
