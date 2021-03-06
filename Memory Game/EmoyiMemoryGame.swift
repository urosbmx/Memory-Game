//
//  EmoyiMemoryGame.swift
//  Memory Game
//
//  Created by UroΕ‘ KataniΔ on 6.12.21..
// OVO je VIEW MODEL

import SwiftUI


class EmojiMemoryGame{
    static let emojis = ["βοΈ","π±","π»","π₯","π±","πΊ","π·","π¦","πͺ","π","π","πΏ"]
    
    private var model: MemoryGame<String> =
    MemoryGame<String>(numberOfPairsOfCard: 4) { pairIndex in
        EmojiMemoryGame.emojis[pairIndex]
        
    }
    
    var card: Array<MemoryGame<String>.Card>{
        return model.card
    }
}

