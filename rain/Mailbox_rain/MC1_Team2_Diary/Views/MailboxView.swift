//
//  MailboxView.swift
//  MC1_Team2_Diary
//
//  Created by Eunbee Kang on 2022/04/03.
//

import SwiftUI

struct MailboxView: View {

    @State private var searchText = ""

//    @Binding var isEditing: Bool
//    @Binding var showSearchBar: Bool
    
    @State private var showSearchBar = false
    @State private var isEditing = false
    
    @State var showingLetters = myLetterData.sorted {
        $0.date > $1.date
    }

    var body: some View {
        NavigationView {
            VStack {
                
                
                if showSearchBar {
                    SearchBar(searchText: $searchText, isEditing: $isEditing, showSearchBar: $showSearchBar)
                }
                
                //LetterListView()
                List {
                    ForEach(showingLetters) { letters in
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
                        showingLetters = myLetterData.filter {
                            $0.title.contains(searchText) || $0.content.contains(searchText)
                        }
                    } else {
                        showingLetters = myLetterData
                        showingLetters.sort(by: {
                            $0.date > $1.date
                        })
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

//        .searchable(text: $searchText, prompt: "Search Mailbox")
        }
    }
}

struct MailboxView_Previews: PreviewProvider {
    static var previews: some View {

        MailboxView()

    }
}
