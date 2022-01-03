//
//  EmojiMemoryGame.swift
//  Memory Game
//
 //  Created by Uroš Katanić on 8.12.21..
//

import SwiftUI


class EmojiMemoryGame: ObservableObject{
    typealias Card = MemoryGame<String>.Card
    
   private static let emojis = ["⌚️","📱","💻","🖥","🖱","📺","📷","🔦","🪙","💎","🎙","💿","💣","🦠","⚔️","🎮","🎁","⚰️"].shuffled()
    
    private static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 6) {pairIndex in
            emojis[pairIndex]
        }
    }
   
    
   @Published private var model = createMemoryGame()
    
    var cards: Array<Card>{
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func chose(_ card: Card){
        model.chose(card)
    }
    
    }
