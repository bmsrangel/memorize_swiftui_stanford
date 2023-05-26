//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Bruno Rangel on 25/05/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍️", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairOfCards: 6) { pairIndex in
            emojis[pairIndex]
        }
    }

    @Published private var model: MemoryGame<String> = createMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
