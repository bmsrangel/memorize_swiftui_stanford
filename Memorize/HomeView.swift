//
//  ContentView.swift
//  Memorize
//
//  Created by Bruno Rangel on 24/05/23.
//

import SwiftUI

struct HomeView: View {
    var emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍️", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    @State var emojiCount = 20

    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojis[0 ..< emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2 / 3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                CustomButton(systemName: "minus.circle") {
                    if emojiCount > 1 {
                        emojiCount -= 1
                    }
                }
                Spacer()
                CustomButton(systemName: "plus.circle") {
                    if emojiCount < emojis.count {
                        emojiCount += 1
                    }
                }
            }
            .padding(.horizontal)
            .font(.title)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true

    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20.0)
        ZStack {
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                // .stroke vs. .strokeBorder
                // Stroke makes the border to outside the component, instead of to inside, such as Stroke Border
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct CustomButton: View {
    let systemName: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
        }
    }
}
