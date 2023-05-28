//
//  ContentView.swift
//  Memorize
//
//  Created by Bruno Rangel on 24/05/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame

    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2 / 3, content: { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }

        })
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape
                        .fill()
                        .foregroundColor(.white)
                    shape
                        .strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(
                        startAngle: Angle(degrees: 0 - DrawingConstants.pieTurnAngle),
                        endAngle: Angle(degrees: 360 - DrawingConstants.pieTurnAngle)
                    )
                    .padding(DrawingConstants.circlePadding)
                    .opacity(DrawingConstants.circleOpacity)
                    Text(card.content)
                        .font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }

    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }

    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10.0
        static let lineWidth: CGFloat = 3.0
        static let fontScale: CGFloat = 0.65
        static let circlePadding: CGFloat = 5
        static let circleOpacity: Double = 0.5
        static let pieTurnAngle: Double = 90
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
    }
}
