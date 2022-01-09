//
//  ContentView.swift
//  Memory Game
//  Created by Uroš Katanić on 28.11.21..
//  OVO JE VIEW
// Lecture 5 1:10:37

import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [Color.yellow, Color.green, Color.blue],
    startPoint: .top, endPoint: .bottom)

struct EmojiMemortyGameView: View {

   @ObservedObject var game: EmojiMemoryGame
   
    @State var emojiCount = 14
    var body: some View {
        VStack{
            HStack(alignment: .bottom){Text("PICK THE CARD").font(.title2)
                    .multilineTextAlignment(.center).padding(.top, 25.0)}
            .frame(width: nil, height: 80.0)
            
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum:114))]){
                    ForEach(game.cards){card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fill)
                            .onTapGesture {
                                game.chose(card)
                            }
                    }
                }
            }
             .foregroundColor(.red)

          }
        .padding(.horizontal)
//        Ovo je da ignosise safe arije
//        .background(backgroundGradient).edgesIgnoringSafeArea([.bottom])
        .background(backgroundGradient).ignoresSafeArea()
    }
       
}
    


//This is view and designe for card's


struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    @State var isFaceUp: Bool = false
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 17)
            if card.isFaceUP{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.system(size: 50, weight: .bold, design: .default))
            }else if card.isMatched{
                shape.opacity(0)
            }
            else{
                shape.fill()
                shape.stroke(lineWidth: 3)
                Image(systemName: "suit.club.fill")
                    .foregroundStyle(Color.white)
                    .font(.largeTitle)
                    
            }
        }
        .padding()
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            EmojiMemortyGameView(game: game)
.previewInterfaceOrientation(.portrait)
        }
        
    }
}
    
}
