//
//  MemoryGame.swift
//  Memorize
//
//  Created by Sameh Fakhouri on 9/13/21.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnlyElementIndex
        }
        
        set {
            cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) }
         }
    }
    
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int)->CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards * 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let myContent = createCardContent(pairIndex)
            cards.append(Card(content: myContent, id: pairIndex*2))
            cards.append(Card(content: myContent, id: pairIndex*2+1))
        }
    }
  
    
    
    
    
    
    struct Card: Identifiable {
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}


extension Array {
    var oneAndOnlyElementIndex: Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}


