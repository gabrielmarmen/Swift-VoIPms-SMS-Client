//
//  ConversationView.swift
//  Swift-VoIPms-SMS-Client
//
//  Created by Gabriel Marmen on 2023-01-18.
//

import SwiftUI

class Message: Identifiable {
    let id: Int
    let text: String
    let isOutgoing: Bool
    
    init(id: Int, text: String, isOutgoing: Bool) {
        self.id = id
        self.text = text
        self.isOutgoing = isOutgoing
    }
}


struct ConversationView: View {
    
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State private var messages: [Message] = [Message]()
    @State private var messageToSend = ""
    
    
    var body: some View {
        VStack{
            ScrollView {
                VStack() {
                    ForEach(messages) { message in
                        HStack {
                            if message.isOutgoing {
                               Spacer()
                            }
                            Text(message.text)
                                .padding(8)
                                .background(message.isOutgoing ? Color.red : colorScheme == .dark ? .darkModeGray : .lightModeGray)
                                .foregroundColor(colorScheme == .light && !message.isOutgoing ? .black : .white)
                                .cornerRadius(10)
                            if !message.isOutgoing {
                                Spacer()
                            }
                        }
                        
                    }
                }
            }
            .padding(.horizontal)
            .onAppear(perform: loadExempleMessages)
            HStack{
                TextField("Message...", text: $messageToSend)
                    .padding(8)
                    .background( colorScheme == .dark ? Color.darkModeGray : Color.lightModeGray)
                    .clipShape(RoundedRectangle(cornerRadius:15))
                Button{
                    sendMessage()
                }label: {
                    Image(systemName: "paperplane.fill")
                }
                .disabled(messageToSend == "" ? true : false)
            }
            .padding()
            
        }
        
    }
    func loadExempleMessages() {
        messages.append(Message(id: 1, text: "Hello how are you ?", isOutgoing: true))
        messages.append(Message(id: 2, text: "Good and you ?", isOutgoing: false))
    }
    func sendMessage() {
        print("Message sent")
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ConversationView()
        }
        
    }
}
