//
//  ContentView.swift
//  Memory Game
//  Stigao sam do 37:03 Lekcija 4
//  Created by Uroš Katanić on 28.11.21..
//  OVO JE VIEW

import SwiftUI

struct ContentView: View {

   @ObservedObject var viewModel: EmojiMemoryGame
   
    @State var emojiCount = 10
    var body: some View {
        VStack{
            HStack{Text("PICK THE CARD").font(.body)}
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum:110))]){
                    ForEach(viewModel.cards){card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fill)
                            .onTapGesture {
                                viewModel.chose(card)
                            }
                    }
                }
            }
             .foregroundColor(.red)

          }
        .padding(.horizontal)
    }
       
}
    


//This is view and designe for card's


struct CardView: View {
    let card: MemoryGame<String>.Card
    @State var isFaceUp: Bool = false
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUP{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            }else{
                shape.fill()
                shape.stroke(lineWidth: 3)
                    
            }
        }
        .padding()
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            ContentView(viewModel: game)
        }
        
    }
}
    
}
