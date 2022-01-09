//
//  ContentView.swift
//  Memory Game
//  Created by Uroš Katanić on 28.11.21..
//  OVO JE VIEW
// Lecture 6

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
                LazyVGrid(columns: [GridItem(.adaptive(minimum:100))]){
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
        GeometryReader(content: { geometry in
            ZStack{
                let shape = RoundedRectangle(cornerRadius: DrawinConstants.cornderRadius)
                if card.isFaceUP{
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawinConstants.lineWidth)
                    Text(card.content).font(fontBack(in: geometry.size))
                }else if card.isMatched{
                    shape.opacity(DrawinConstants.opacity)
                }
                else{
                    shape.fill()
                    shape.stroke(lineWidth: DrawinConstants.lineWidth)
                    Image(systemName: "suit.club.fill")
                        .foregroundStyle(Color.white)
                        .font(fontFront(in: geometry.size))
                        
                }
            }
            
        })
        
}
    //Funkcije za dimenziju simobla
    private func fontBack(in size: CGSize) -> Font{
        Font.system(size: min(size.width, size.height) * DrawinConstants.sizeBackIcon)
    }
    
    private func fontFront(in size: CGSize) -> Font{
        Font.system(size: min(size.width, size.height) * DrawinConstants.sizeFrontIcon)
    }


    private struct DrawinConstants{
        static let cornderRadius: CGFloat = 17
        static let lineWidth: CGFloat = 3
        static let sizeFrontIcon: CGFloat = 0.5
        static let sizeBackIcon: CGFloat = 0.7
        static let opacity: CGFloat = 0
        
    }





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            EmojiMemortyGameView(game: game)
.previewInterfaceOrientation(.portraitUpsideDown)
        }
        
    }
}
    
}
