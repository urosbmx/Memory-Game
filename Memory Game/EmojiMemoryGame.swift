//
//  EmojiMemoryGame.swift
//  Memory Game
//
 //  Created by Uroš Katanić on 8.12.21..
//

import SwiftUI


class EmojiMemoryGame: ObservableObject{
    static let emojis = ["⌚️","📱","💻","🖥","🖱","📺","📷","🔦","🪙","💎","🎙","💿"].shuffled()
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 5) {pairIndex in
            emojis[pairIndex]
        }
    }
   
    
   @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    // MARK: - Intent
    
    func chose(_ card: MemoryGame<String>.Card){
        model.chose(card)
    }
    
    }
