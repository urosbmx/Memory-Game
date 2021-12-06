//
//  EmoyiMemoryGame.swift
//  Memory Game
//
//  Created by Uroš Katanić on 6.12.21..
//

import SwiftUI


class EmojiMemoryGame{
    static let emojis = ["⌚️","📱","💻","🖥","🖱","📺","📷","🔦","🪙","💎","🎙","💿"]
    
    //Stigao sam do 1:29:54 na kursu
    
    private var model: MemoryGame<String> =
    MemoryGame<String>(numberOfPairsOfCard: 4) { pairIndex in
        EmojiMemoryGame.emojis[pairIndex]
        
    }
    
    var card: Array<MemoryGame<String>.Card>{
        return model.card
    }
}
