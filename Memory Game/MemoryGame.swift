//
//  MemoryGame.swift
//  Memory Game
//
//  Created by Uroš Katanić on 6.12.21..
//  OVO JE MODEL

import Foundation

struct MemoryGame<CardContent>{
    var card: Array<Card>
    
    func chose(_ card: Card){
        
    }
    
    init(numberOfPairsOfCard: Int, creatCardContent:(Int)-> CardContent)
    {
        card = Array<Card>()
//        Broj karata se mnozi sa dva
        for pairIndex in 0..<numberOfPairsOfCard{
            let content: CardContent = creatCardContent(pairIndex)
            card.append(Card(content: content))
            card.append(Card(content: content))
        }
    }
    
    struct Card{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
    
}
