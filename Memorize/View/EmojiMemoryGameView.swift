//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Oleksandr Polishchuk on 17.11.2020.
//

import SwiftUI

// View
struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            gameInfo
            
            Grid(viewModel.cards) { card in
                    CardView(card: card).onTapGesture {
                        viewModel.choose(card: card)
                    }
                    .padding(5)
            }
                .padding()
                .foregroundColor(Color.orange)
            
            Button(action: {
                viewModel.startNewGame()
            }, label: {
                Text("New Game")
            })
        }
    }
    
    var gameInfo: some View {
        HStack {
            Text("Theme: \(viewModel.themeName)")
            Text("Score: \(viewModel.score)")
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: cornerRadius).fill()
                    }
                }
            }
            .aspectRatio(cardAspectRatio, contentMode: .fit)
            .font(Font.system(size: fontSize(for: geometry.size)))
        }
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    let cardAspectRatio: CGFloat = 2/3
    
    // MARK: - Supporting funcs
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
