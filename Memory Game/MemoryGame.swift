//
//  MemoryGame.swift
//  Memory Game
//
//  Created by Uroš Katanić on 6.12.21..
//  OVO JE MODEL

import Foundation
import SwiftUI

struct MemoryGame <CardContent>{
    var cards: Array<Card>
    
   mutating func chose(_ card: Card){
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUP.toggle()
        print("chosenCard = \(cards)")
       
        
    }
    func index(of card: Card)-> Int{
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                
                return index
            }
        }
        return 0
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
        
        var isFaceUP: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
 
