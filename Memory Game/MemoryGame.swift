//
//  MemoryGame.swift
//  Memory Game
//
//  Created by Uroš Katanić on 8.12.21..
//  Ovo je model

import Foundation

struct MemoryGame <CardContent>{
    var cards: Array<Card>
    
    func chose(_ card: Card){
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent:(Int) -> CardContent){
        cards =  Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards{
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(isFaceUP: false, isMatched: false, content: content))
            cards.append(Card(isFaceUP: false, isMatched: false, content: content))
        }

    }
    
    
    struct Card{
        var isFaceUP: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
 
