//
//  ContentView.swift
//  Memory Game
//
//  Created by Uroš Katanić on 28.11.21..
//  OVO JE VIEW

import SwiftUI
//import XCTest

struct ContentView: View {
//    var emojis = ["⌚️","📱","💻","🖥","🖱","📺","📷","🔦","🪙","💎","🎙","💿"]
   
    @State var emojiCount = 3
    var body: some View {
        VStack{
            HStack{Text("PICK THE CARD").font(.body)}
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum:100))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) {emoji in CardView(values: emoji).aspectRatio(2/3, contentMode: .fit)}
                }
            }

                .foregroundColor(.red)

          }
    
    }
       
}
    


//This is view and designe for card's


struct CardView: View {
    var values: String
   @State var closeCard: Bool = false
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if closeCard{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(values).font(.largeTitle)
            }else{
                shape.fill()
                shape.stroke(lineWidth: 3)
                    

            }
        }
        .padding()
       
        .onTapGesture {
            closeCard = !closeCard
        }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
        
    }
}
    
}
