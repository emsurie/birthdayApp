//
//  ContentView.swift
//  Birthdays
//
//  Created by Indiana Suriel on 7/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var newName = ""
    @State private var newBirthday = Date.now
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
            .safeAreaInset(edge: .bottom){
                VStack(alignment: .center, spacing: 20){
                    Text("New Birthday")
                        .font(.headline)
                    //the $ is used as a 2 way binding like how in Java we use reader.nextLine() (or .nextInt() or .nextDouble())
                    
                    //in: Date.distantPast...Date.now, displayedComponents: .date: is used for the user to not pick a date that is in the future
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date){
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    } //closing DatePicker
                    
                    Button("Save"){
                        let newFriend = Friend(friendName: newName, friendBirthday: newBirthday)
                        friends.append(newFriend)
                        newName = ""
                        newBirthday = .now
                    } //closing Button
                    .bold()
                } //closing VStack
            }
            
            //closing nav stack
        }
        //closing body
    }
    //closing struct
}

#Preview {
    ContentView()
}
