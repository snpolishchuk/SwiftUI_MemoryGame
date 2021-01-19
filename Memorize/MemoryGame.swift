//
//  MemoryGame.swift
//  Memorize
//
//  Created by Oleksandr Polishchuk on 30.11.2020.
//

import Foundation

// Model
struct MemoryGame<CardContent> {
    var cards: [Card]
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        return cards.firstIndex(matching: card)
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, isFaceUp: true, isMatched: false, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, isFaceUp: true, isMatched: false, content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
