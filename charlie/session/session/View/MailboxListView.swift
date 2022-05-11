//
//  MailboxListView.swift
//  session
//
//  Created by 김승창 on 2022/04/13.
//

import SwiftUI

struct MailboxListView: View {
    
    @State private var searchText = ""
    
    //    @Binding var isEditing: Bool
    //    @Binding var showSearchBar: Bool
    
    @State private var showSearchBar = false
    @State private var isEditing = false
    
    
    
    
    
    var onlyShow: Bool
    
    @State var showingLetters1 = myLetterData.sorted(by: {
        $0.date > $1.date
    })
    
    @State var showingLetters2 = myLetterData.sorted(by: {
        $0.date > $1.date
    }).filter {
        $0.reply == nil
    }
    
    
    
    
    
    var body: some View {
        VStack {
            
            
            if showSearchBar {
                MailSearchBar(searchText: $searchText, isEditing: $isEditing, showSearchBar: $showSearchBar)
            }
            
            //LetterListView()
            
            
            if onlyShow {
                
                
                List {
                    ForEach(showingLetters2) { letters in
                        NavigationLink(destination: LettersDetailView(letters: letters)) {
                            LetterTitleView(letters: letters)
                        }
                        
                    }
                    .listRowSeparatorTint(Color("MyGreen"))
                    .listRowBackground(Color("MyYellow"))
                }
                .listStyle(.automatic)
                .navigationBarTitle(Text("Mailbox"), displayMode: .inline)
                .navigationBarItems(trailing:
                                        HStack {
                    Button {
                        withAnimation(.default) {
                            showSearchBar = true
                            isEditing = true
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("MyGreen"))
                    }
                }
                )
                .onChange(of: searchText) { _ in
                    if !searchText.isEmpty {
                        showingLetters2 = myLetterData.filter {
                            $0.title.contains(searchText) || $0.content.contains(searchText)
                        }
                    } else {
                        showingLetters2 = myLetterData
                        showingLetters2.sort(by: {
                            $0.date > $1.date
                        })
                    }
                }
            } else {
                
                List {
                    ForEach(showingLetters1) { letters in
                        NavigationLink(destination: LettersDetailView(letters: letters)) {
                            LetterTitleView(letters: letters)
                        }
                        
                    }
                    .listRowSeparatorTint(Color("MyGreen"))
                    .listRowBackground(Color("MyYellow"))
                }
                .listStyle(.automatic)
                .navigationBarTitle(Text("Mailbox"), displayMode: .inline)
                .navigationBarItems(trailing:
                                        HStack {
                    Button {
                        withAnimation(.default) {
                            showSearchBar = true
                            isEditing = true
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("MyGreen"))
                    }
                }
                )
                .onChange(of: searchText) { _ in
                    if !searchText.isEmpty {
                        showingLetters1 = myLetterData.filter {
                            $0.title.contains(searchText) || $0.content.contains(searchText)
                        }
                    } else {
                        showingLetters1 = myLetterData
                        showingLetters1.sort(by: {
                            $0.date > $1.date
                        })
                    }
                }
            }
            //                .onSubmit(of: .search) {
            //                    if !searchText.isEmpty {
            //                        showingLetters = myLetterData.filter {
            //                            $0.title.contains(searchText) || $0.content.contains(searchText)
            //                        }
            //                    } else {
            //                        showingLetters = myLetterData
            //                        showingLetters.sort(by: {
            //                            $0.date > $1.date
            //                        })
            //                    }
            //                }
        }
    }
}

struct MailboxListView_Previews: PreviewProvider {
    static var previews: some View {
        MailboxListView(onlyShow: false)
    }
}
