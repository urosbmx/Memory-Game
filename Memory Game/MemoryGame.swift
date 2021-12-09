//
//  MemoryGame.swift
//  Memory Game
//
//  Created by Uroš Katanić on 6.12.21..
//  OVO JE MODEL

import Foundation

struct MemoryGame <CardContent>{
    var cards: Array<Card>
    
    func chose(_ card: Card){
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent:(Int) -> CardContent){
        cards =  Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards{
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content ,id: pairIndex*2+1))
        }

    }
    
    
    struct Card: Identifiable{
        
        var isFaceUP: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
 
