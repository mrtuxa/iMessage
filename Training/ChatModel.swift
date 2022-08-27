//
//  ChatModel.swift
//  Training
//
//  Created by mrtuxa on 27.08.22.
//

import Foundation

struct Chat: Identifiable {
    var id: UUID {
        person.id
    }
    let person: Person
    var messages: [Message]
    var hasUnreadMessage = false
}

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let imgString: String
}


struct Message: Identifiable {
    enum MessageType {
        case Sent, Received
    }

    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType

    init(_ text: String, type: MessageType, date: Date) {
        self.date = date
        self.type = type
        self.text = text
    }

    init(_ text: String, type: MessageType) {
        self.init(text, type: type, date: Date())

    }
}

extension Chat {

    static let sampleChat = [
        Chat(person: Person(name: "Josh", imgString: "Unbenannt-1"), messages: [
            Message("Hey Josh", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Ich entwickle gerade einen Whatsapp Clone, aber es ist schon schwer Konversation zu faken. Kannst du mir helfen", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
        ], hasUnreadMessage: true),
        Chat(person: Person(name: "Tobi", imgString: "Unbenannt-1"), messages: [
            Message("Heute Fortnite", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("Nein Valo", type: .Received, date: Date()),
        ], hasUnreadMessage: false)
    ]

}
