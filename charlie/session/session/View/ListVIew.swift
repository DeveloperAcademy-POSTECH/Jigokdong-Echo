//
//  ListVIew.swift
//  session
//
//  Created by 김승창 on 2022/04/05.
//

import SwiftUI

struct ListVIew: View {
    
    @State private var searchText = ""
    
    @Binding var isEditing: Bool
    @Binding var showSearchBar: Bool
    
    
    
    
    
    var onlyShowYetReplied: Bool
    
    @State var showingDiaries1 = myData.sorted(by: {
        $0.date > $1.date
    })
    
    
    @State var showingDiaries2 = myData.sorted(by: {
        $0.date > $1.date
    }).filter {
        $0.reply != nil && $0.reply?.rate == nil
    }
    
    var body: some View {
        
        
        //        같은 날짜별로 섹션 구분 하기
        //        .listRowSeparator
        //        .listSectionSeparator 사용
        //        calendar 앱 찾아보기
        
        
        
        
        VStack {
            
            if showSearchBar {
                DiarySearchBar(searchText: $searchText, isEditing: $isEditing)
            }
            
            
            if onlyShowYetReplied {
                
                
                List {
                    ForEach(showingDiaries2) { diary in
                        
                        NavigationLink(destination:
                                        ContentView(viewModel2: ViewModel2(letter: diary, singo: false))
                                       //                                    InnerView(diary: diary)
                                       
                        ) {
                            HStack {
                                Text(diary.title)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                
                                
                                
                                
                                // 읽지 않은 메시지로 구현? 또는 읽었지만 평가를 안달면 메시지 이모티콘 뜨는걸로? 일단은 후자로 해놓음. 만약 읽지 않은 메시지로 한다면 읽은 순간을 체크하는 프로퍼티 하나 더 생성
                                
                                if diary.reply != nil, diary.reply?.rate == nil {
                                    Image(systemName: "envelope.fill")
                                        .foregroundColor(Color("MyGreen"))
                                }
                                
                                
                                Text(convertDateToString(date:(diary.date)))
                                    .font(.caption)
                                    .fontWeight(.thin)
                                
                                
                                getEmoticonImage(emoticonName: diary.emoticonName)
                                
                                
                            }
                            .padding()
                        }
                    }
                }
                .listStyle(.plain)
                //        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search diaries")
                .onChange(of: searchText) { searchText in
                    if !searchText.isEmpty {
                        showingDiaries2 = myData.filter { $0.title.contains(searchText) || $0.content.contains(searchText) }
                        // 답장의 내용도 추가?
                    } else {
                        showingDiaries2 = myData
                        showingDiaries2.sort(by: {
                            $0.date > $1.date
                        })
                    }
                    
                }
            } else {
                
                
                List {
                    ForEach(showingDiaries1) { diary in
                        
                        NavigationLink(destination:
                                        ContentView(viewModel2: ViewModel2(letter: diary, singo: false))
                                       //                                    InnerView(diary: diary)
                                       
                        ) {
                            HStack {
                                Text(diary.title)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                
                                
                                
                                
                                // 읽지 않은 메시지로 구현? 또는 읽었지만 평가를 안달면 메시지 이모티콘 뜨는걸로? 일단은 후자로 해놓음. 만약 읽지 않은 메시지로 한다면 읽은 순간을 체크하는 프로퍼티 하나 더 생성
                                
                                if diary.reply != nil, diary.reply?.rate == nil {
                                    Image(systemName: "envelope.fill")
                                        .foregroundColor(Color("MyGreen"))
                                }
                                
                                
                                Text(convertDateToString(date:(diary.date)))
                                    .font(.caption)
                                    .fontWeight(.thin)
                                
                                
                                getEmoticonImage(emoticonName: diary.emoticonName)
                                
                                
                            }
                            .padding()
                        }
                    }
                }
                .listStyle(.plain)
                //        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search diaries")
                .onChange(of: searchText) { searchText in
                    if !searchText.isEmpty {
                        showingDiaries1 = myData.filter { $0.title.contains(searchText) || $0.content.contains(searchText) }
                        // 답장의 내용도 추가?
                    } else {
                        showingDiaries1 = myData
                        showingDiaries1.sort(by: {
                            $0.date > $1.date
                        })
                    }
                    
                }
                
            }
        }
        //        .keyboardType(.default)
        .gesture(
            DragGesture()
                .onChanged { value in
                    showSearchBar = true
                }
        )
        
    }
}

struct ListVIew_Previews: PreviewProvider {
    static var previews: some View {
        ListVIew(isEditing: .constant(false), showSearchBar: .constant(false), onlyShowYetReplied: false)
    }
}
