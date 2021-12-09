//
//  Memory_GameApp.swift
//  Memory Game
//
//  Created by Uroš Katanić on 28.11.21..
//

import SwiftUI

@main
struct Memory_GameApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
