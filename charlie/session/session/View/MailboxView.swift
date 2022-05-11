//
//  MailboxView.swift
//  MC1_Team2_Diary
//
//  Created by Eunbee Kang on 2022/04/03.
//

import SwiftUI

struct MailboxView: View {
    
    var body: some View {
        NavigationView {
            MailboxListView(onlyShow: false)
        }
    }
}

struct MailboxView_Previews: PreviewProvider {
    static var previews: some View {
        
        MailboxView()
        
    }
}
