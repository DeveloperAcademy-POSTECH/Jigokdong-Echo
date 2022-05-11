//
//  ImageMod.swift
//  MC1
//
//  Created by Kelly Chui on 2022/04/08.
//

import SwiftUI

extension Image {
    
    func ImageMod() -> some View {
        self
            .resizable()
            .frame(width: 120, height: 80)
    }
    
}

extension Color {
    public static var customGreen: Color {
        return Color(UIColor(red: 139/255, green: 167/255, blue: 132/255, alpha: 1.0))
    }
}

extension Color {
    public static var customBase: Color {
        return Color(UIColor(red: 244/255, green: 233/255, blue: 200/255, alpha: 1.0))
    }
}
