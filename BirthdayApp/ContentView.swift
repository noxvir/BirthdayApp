//
//  ContentView.swift
//  BirthdayApp
//
//  Created by Scholar on 6/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends:
    [Friend] = [Friend(name: "Evie", birthday: .now)]
    @State private var newName = ""
    @State private var newBirthday = Date.now
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) {friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }//end hstack
            }//end friend in
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                HStack {
                    VStack(alignment: .center, spacing: 20) {
                        Text("New Birthday")
                            .font(.headline)
                        DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                            TextField("Name", text: $newName)
                                .textFieldStyle(.roundedBorder)
                        Button("Save") {
                                let newFriend = Friend(name: newName, birthday: newBirthday)
                                friends.append(newFriend)
                                newName = ""
                            newBirthday = .now
                            }//end button
                        }//end text field
                    }//end vstack
                    .padding()
                    .background(.bar)
                }//end hstack
            }//end safeareainsert
        }//end navstack
    }//end body view
}//end struct

    
#Preview {
    ContentView()
}

