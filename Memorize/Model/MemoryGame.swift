//
//  MemoryGame.swift
//  Memorize
//
//  Created by Abdug'affor on 11/09/21.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>

    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
    }

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
//        Add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }

    struct Card: Identifiable {
        var id: Int

        var isFaceUp: Bool = false
        var isMatch: Bool = false
        var content: CardContent
    }
}
