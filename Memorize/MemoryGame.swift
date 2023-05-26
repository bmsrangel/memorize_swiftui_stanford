//
//  MemoryGame.swift
//  Memorize
//
//  Created by Bruno Rangel on 25/05/23.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]

    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        // this won't work because structs assignment create a copy of it
        // to make it work, the toggle must be done directly to the array element
//        var chosenCard = cards[chosenIndex]
        cards[chosenIndex].isFaceUp.toggle()
        print(cards)
    }

    func index(of card: Card) -> Int {
        for index in 0 ..< cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }

    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // add numberOfPairOfCards x2
        for pairIndex in 0 ..< numberOfPairOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }

    // Nesting here is intentional, to cause an semantic effect to namespacing
    // MemoryGame.Card
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
