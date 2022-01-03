//
//  Memory_GameApp.swift
//  Memory Game
//
//  Created by Uroš Katanić on 28.11.21..
//

import SwiftUI

@main
struct Memory_GameApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemortyGameView(game: game)
        }
    }
}
