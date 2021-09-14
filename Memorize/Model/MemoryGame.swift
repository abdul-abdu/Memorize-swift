//
//  MemoryGame.swift
//  Memorize
//
//  Created by Abdug'affor on 11/09/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>

    private var indexOfOneAndOnlyFaceUpCard: Int?

    mutating func choose(_ card: Card) {
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatch
        {
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatch = true
                    cards[potentialMatchIndex].isMatch = true
                }
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
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
