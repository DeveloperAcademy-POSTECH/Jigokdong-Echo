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
