//
//  RatingView.swift
//  kyu
//
//  Created by Hankyu Lee on 2022/04/06.
//

import Foundation
import SwiftUI

struct RatingView: View, Equatable {
    static func == (lhs: RatingView, rhs: RatingView) -> Bool {
        lhs.rating == rhs.rating
    }
    
    
    @Binding var rating: Int?
    var max: Int = 5
    
    var body: some View {
           HStack {
               ForEach(1..<(max + 1), id: \.self) { index in
                   
                   Image(systemName: self.starType(index: index))
                       .foregroundColor(Color.orange)
                       .onTapGesture {
                           
//                           self.rating = index
                           if rating == 0 && index == 1 {
                               rating = 1
                           }
                           else if rating == 1 && index == 1 {
                               rating = 0
                           }
                           else {
                               rating = index
                           }
                           
                           
                   }
               }
           }
       }
    
    private func starType(index: Int) -> String {
           
           if let rating = self.rating {
               return index <= rating ? "star.fill" : "star"
           } else {
               return "star"
           }
           
       }
    
}

struct testView: View {
    
    @State private var rating: Int?
    
    var body: some View {
        VStack {
            RatingView(rating: $rating, max: 5)
//             Text(rating != nil ? "You rating: \(rating!)" : "")
        }
    }
}


struct ContendtView_Previews: PreviewProvider {
    static var previews: some View {
//        RatingView(rating: .constant(3))
        testView()
    }
}
