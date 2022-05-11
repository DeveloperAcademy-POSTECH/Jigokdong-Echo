//
//  TestView2.swift
//  MC1_Team2_Diary (iOS)
//
//  Created by Somin Park on 2022/04/09.
//

import SwiftUI

struct TestView2: View {
    @Environment(\.presentationMode) var presentationMode  //<-- Here

        var body: some View {
            Button("Test2") {
                presentationMode.wrappedValue.dismiss() //<-- Here
            }
        }
}
