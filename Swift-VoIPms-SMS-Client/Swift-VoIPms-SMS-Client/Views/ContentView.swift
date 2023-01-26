//
//  ContentView.swift
//  Swift-VoIPms-SMS-Client
//
//  Created by Gabriel Marmen on 2023-01-18.
//

import SwiftUI





struct ContentView: View {
    var body: some View {
        NavigationView{
            List {
                NavigationLink("hello", destination: ConversationView())
            }
            .navigationTitle("Messages")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
