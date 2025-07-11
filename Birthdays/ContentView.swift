//
//  ContentView.swift
//  Birthdays
//
//  Created by Indiana Suriel on 7/11/25.
//

import SwiftUI

struct ContentView: View {
    
    //@State quickly updates data for the app
    @State private var friends: [Friend] = [
        Friend(friendName: "Nicole", friendBirthday: .now),
        Friend(friendName: "Geetika", friendBirthday: .now)
    ]
    var body: some View {
        List(friends, id: \.name){ Friend in }
    }
}

#Preview {
    ContentView()
}
