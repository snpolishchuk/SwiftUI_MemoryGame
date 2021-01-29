//
//  Theme.swift
//  Memorize
//
//  Created by Oleksandr Polishchuk on 29.01.2021.
//

import SwiftUI

enum Theme: String {
    case faces
    case trees
    case space
    case buildings
    case temples
    case flags
}

struct GameTheme {
    let name: Theme
    let emojiSet: [String]
    let numberOfPairsOfCards: Int
    let color: UIColor
    
    init(name: Theme, numberOfPairsOfCards: Int? = nil) {
        self.name = name
        
        switch name {
        case .faces:
            color = .systemYellow
            emojiSet = ["👩‍🎤", "👨‍🎤", "🦁", "🌚", "🌝"]
        case .trees:
            color = .systemGreen
            emojiSet = ["🌲", "🌳", "🌴", "🌵", "🎍"]
        case .space:
            color = .systemBlue
            emojiSet = ["🌎", "🌙", "🪐", "☀️", "☄️"]
        case .buildings:
            color = .systemGray6
            emojiSet = ["🏥", "💒", "🏭", "🏤", "🏦"]
        case .temples:
            color = .systemRed
            emojiSet = ["⛪️", "🕌", "🕍", "🛕", "⛩"]
        case .flags:
            color = .systemPink
            emojiSet = ["🇧🇾", "🇦🇹", "🇦🇴", "🇨🇳", "🇧🇷"]
        }
        
        let isValidNumber = numberOfPairsOfCards != nil && numberOfPairsOfCards! >= 0 && numberOfPairsOfCards! <= 5
        
        // If numberOfPairsOfCards is invalid then create a randon number
        self.numberOfPairsOfCards = isValidNumber ? numberOfPairsOfCards! : Int.random(in: 2...5)
    }
}
