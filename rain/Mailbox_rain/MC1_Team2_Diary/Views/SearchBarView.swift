//
//  SearchBarView.swift
//  MC1_Team2_Diary
//
//  Created by Eunbee Kang on 2022/04/12.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isEditing: Bool
    @Binding var showSearchBar: Bool
    
    @State private var opacity = 1.0
    
    
    var body: some View {
        HStack {
            TextField("Search Mailbox", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.searchText = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    withAnimation(.default) {
                        self.isEditing = true
                        opacity = 0.0
                        opacity += 1.0
                    }
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.showSearchBar = false
                    self.searchText = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                        .opacity(opacity)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                //.animation(.default)
            }
            
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""), isEditing: .constant(false), showSearchBar: .constant(false))
    }
}
