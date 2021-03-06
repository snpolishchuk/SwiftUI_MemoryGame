//
//  MemoryGame.swift
//  Memorize
//
//  Created by Oleksandr Polishchuk on 30.11.2020.
//

import Foundation

// Model
struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: [Card]
    var score = 0
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        // Choose only existing, not faced up and not matched cards
        guard let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched else {
            return
        }
        
        // If there is already faced up card then try to match it
        if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
            // If content matches then match cards
            if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
                score += 2
            } else {
                checkAndPenalizeCard(at: chosenIndex)
                checkAndPenalizeCard(at: potentialMatchIndex)
            }
            
            // Mark cards as already seen
            cards[chosenIndex].isFirstOpening = false
            cards[potentialMatchIndex].isFirstOpening = false
        } else {
            indexOfTheOneAndOnlyFaceUpCard = chosenIndex
        }
        
        cards[chosenIndex].isFaceUp = true
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isFirstOpening: Bool = true
        var content: CardContent
        var id: Int
    }
}

private extension MemoryGame {
    // If card has been already opened then penalize 1 point
    mutating func checkAndPenalizeCard(at index: Int) {
        if !cards[index].isFirstOpening {
            score -= 1
        }
    }
}
