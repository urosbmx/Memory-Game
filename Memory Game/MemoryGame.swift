//
//  MemoryGame.swift
//  Memory Game
//
//  Created by Uroš Katanić on 6.12.21..
//  OVO JE MODEL

import Foundation
import SwiftUI

struct MemoryGame <CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard:Int?{
        get{cards.indices.filter({cards[$0].isFaceUP}).oneAndOnly }
        set{cards.indices.forEach({cards[$0].isFaceUP = ($0 == newValue)})}
    }
    
   mutating func chose(_ card: Card){
       if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
          !cards[chosenIndex].isFaceUP,
          !cards[chosenIndex].isMatched {
           if let potencialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
               if cards[chosenIndex].content == cards[potencialMatchIndex].content{
                   cards[chosenIndex].isMatched=true
                   cards[potencialMatchIndex].isMatched=true
               }
               cards[chosenIndex].isFaceUP = true
           }else{
              
               indexOfTheOneAndOnlyFaceUpCard = chosenIndex
           }
 
       }
       
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent:(Int) -> CardContent){
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards{
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content ,id: pairIndex*2+1))
        }

    }
    
     
  struct Card: Identifiable{
        
        var isFaceUP = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array{
    var oneAndOnly: Element?{
        if count == 1{
            return first
        }else{
            return nil
        }
    }
}
 
