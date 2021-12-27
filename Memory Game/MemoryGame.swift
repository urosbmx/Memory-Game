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
    
private var indexOfTheOneAndOnlyFaceUpCard:Int?
    
   mutating func chose(_ card: Card){
       if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
          !cards[chosenIndex].isFaceUP,
          !cards[chosenIndex].isMatched {
           if let potencialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
               if cards[chosenIndex].content == cards[potencialMatchIndex].content{
                   cards[chosenIndex].isMatched=true
                   cards[potencialMatchIndex].isMatched=true
               }
               indexOfTheOneAndOnlyFaceUpCard = nil
           }else{
               for index in cards.indices{
                   cards[index].isFaceUP=false
               }
               indexOfTheOneAndOnlyFaceUpCard = chosenIndex
           }
        cards[chosenIndex].isFaceUP.toggle()
       }
//        print("chosenCard = \(cards)")
       
        
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
 
