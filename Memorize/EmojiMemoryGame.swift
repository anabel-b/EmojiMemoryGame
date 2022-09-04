//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sameh Fakhouri on 9/13/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚕", "✈️", "🚜", "🚒", "🚢", "🏍", "🚀", "⛵️", "🛥", "🏎", "🚙", "🚉", "🚅", "🚠", "🚲", "🚤", "🚛", "🛺", "🚑", "🚘", "🚗", "🚃", "🚟", "🚝"]

    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    
    var cards: [Card] {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
}
