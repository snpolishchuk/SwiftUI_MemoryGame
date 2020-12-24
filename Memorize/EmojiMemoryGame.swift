//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Oleksandr Polishchuk on 30.11.2020.
//

import Foundation

// ViewModel
class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojiSets = [
            ["👩‍🎤", "👨‍🎤", "🦁", "🌚", "🌝"].shuffled(),
            ["🌲", "🌳", "🌴", "🌵", "🎍"].shuffled(),
            ["🌎", "🌙", "🪐", "☀️", "☄️"].shuffled(),
        ]
        // Use randomly selected emoji set
        let emojis = emojiSets[Int.random(in: 0..<emojiSets.count)]
        return  MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intent(s) 
    func choose(card: MemoryGame<String>.Card) {
        model.choose( card)
    }
}
