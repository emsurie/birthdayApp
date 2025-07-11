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
        NavigationStack{
            List(friends, id: \.name){ Friend in
                
                HStack{
                    Text(Friend.name)
                    Spacer()
                    Text(Friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            
            //closing nav stack
        }
        //closing body
    }
}

#Preview {
    ContentView()
}
