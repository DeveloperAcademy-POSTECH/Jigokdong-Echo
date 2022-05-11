//
//  Tempmain.swift
//  MC1
//
//  Created by Kelly Chui on 2022/04/06.
//

import SwiftUI

struct Tempmain: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: ContentView()) {
                Text("임시 Tap Me")
            }
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("Main_temp", displayMode: .inline)
                .navigationBarItems(trailing: NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/){
                    Image(systemName: "paperplane.fill").resizable()
                        .foregroundColor(Color.black)
                        .frame(width: 24, height: 24, alignment: .trailing)
                })
        }.accentColor(.black)
    }
}

struct Tempmain_Previews: PreviewProvider {
    static var previews: some View {
        Tempmain()
    }
}
