//
// Created by mrtuxa on 27.08.22.
//

import SwiftUI
import Foundation


struct ChatRow: View {

    let chat: Chat

    var body: some View {
        HStack(spacing: 20) {
            Image(chat.person.imgString)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())

            ZStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(chat.person.name)
                                .bold()
                    }

                    VStack(alignment: .leading) {
                        Text(chat.messages.last?.date.descriptiveString() ?? "").multilineTextAlignment(.center)
                    }

                    HStack {
                        Text(chat.messages.last?.text ?? "")
                                .lineLimit(1)
                                .frame(height: 50, alignment: .top)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.trailing, 25)
                    }
                }
                Circle()
                        .foregroundColor(chat.hasUnreadMessage ? .blue : .clear)
                        .frame(width: 18, height: 18)
                        .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
                .frame(height: 80)
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chat: Chat.sampleChat[0])
    }
}

func CurrentDate() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yyyy"
    return dateFormatter.string(from: date)
}
