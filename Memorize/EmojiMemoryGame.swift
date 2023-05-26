//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Bruno Rangel on 25/05/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static private let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍️", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairOfCards: 6) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // private(set): allows the attribute to be visible, but not mutable
//    private var model: MemoryGame<String> = createMemoryGame()
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
//        objectWillChange.send()
        model.choose(card)
    }
}
