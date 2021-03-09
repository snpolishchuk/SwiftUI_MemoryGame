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
    private static var currentTheme: GameTheme!

    static let gameThemes = [
        GameTheme(name: .faces, numberOfPairsOfCards: 2),
        GameTheme(name: .trees, numberOfPairsOfCards: 3),
        GameTheme(name: .space, numberOfPairsOfCards: 4),
        GameTheme(name: .buildings),
        GameTheme(name: .temples),
        GameTheme(name: .flags)
    ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        // Use randomly selected gameTheme
        let gameTheme = gameThemes[Int.random(in: 0..<gameThemes.count)]
        currentTheme = gameTheme
        
        return MemoryGame<String>(numberOfPairsOfCards: gameTheme.numberOfPairsOfCards) { pairIndex in
            return gameTheme.emojiSet[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    var themeName: String {
        EmojiMemoryGame.currentTheme.name.rawValue
    }
        
    // MARK: - Intent(s) 
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func startNewGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
