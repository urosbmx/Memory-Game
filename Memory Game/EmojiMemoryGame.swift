//
//  EmojiMemoryGame.swift
//  Memory Game
//
 //  Created by Uroลก Kataniฤ on 8.12.21..
//

import SwiftUI


class EmojiMemoryGame: ObservableObject{
    typealias Card = MemoryGame<String>.Card
    
   private static let emojis = ["โ๏ธ","๐ฑ","๐ป","๐ฅ","๐ฑ","๐บ","๐ท","๐ฆ","๐ช","๐","๐","๐ฟ","๐ฃ","๐ฆ ","โ๏ธ","๐ฎ","๐","โฐ๏ธ"].shuffled()
    
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
