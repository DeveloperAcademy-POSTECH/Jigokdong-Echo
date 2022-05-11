//
//  TestView1.swift
//  MC1_Team2_Diary (iOS)
//
//  Created by Somin Park on 2022/04/09.
//
import SwiftUI

struct TestView1: View {
    @Environment(\.presentationMode) var presentationMode  //<-- Here

        var body: some View {
            Button("Test1") {
                presentationMode.wrappedValue.dismiss() //<-- Here
            }
        }
}
