//
//  SwiftUIView.swift
//  session
//
//  Created by 김승창 on 2022/04/08.
//

import SwiftUI

struct SwiftUIView: View {
    var currentDate = Date()
    var dateFormatter = DateFormatter()
    
    
    var body: some View {
        
        VStack {
            Text(dateFormatter.string(from: currentDate))
            Text("hi")
            
            
        }
    }
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
