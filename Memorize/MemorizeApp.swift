//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sameh Fakhouri on 8/25/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
