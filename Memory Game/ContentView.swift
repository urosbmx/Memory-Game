//
//  ContentView.swift
//  Memory Game
//
//  Created by Uroš Katanić on 28.11.21..
//

import SwiftUI
//import XCTest

struct ContentView: View {
    var emojis = ["⌚️","📱","💻","🖥","🖱","📺","📷","🔦","🪙"]
    @State var emojiCount = 5
    var body: some View {
        VStack{
            HStack{Text("PICK THE CARD").font(.body)}
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum:100))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) {emoji in CardView(values: emoji).aspectRatio(2/3, contentMode: .fit)}
                }
            }

                .foregroundColor(.red)
            Spacer()
            HStack {
                  Button(action: {
                      if emojiCount > 1{
                          emojiCount -= 1
                      }

                  }, label: {
                      VStack(){
                          Image(systemName: "minus.circle")
                              .padding()
                              .font(.largeTitle)
                      }
                      
                  })
                
                  Spacer()
                  Button(action: {
                      if emojiCount < 9{
                          emojiCount += 1
                      }
                  }, label: {
                      VStack{
                          Image(systemName: "plus.circle")
                              .padding()
                              .font(.largeTitle)
                      }
                      
                  })
              }

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
