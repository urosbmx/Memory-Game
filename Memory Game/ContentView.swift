//
//  ContentView.swift
//  Memory Game
//
//  Created by Uroš Katanić on 28.11.21..
//

import SwiftUI
//import XCTest

struct ContentView: View {
    var emojis = ["⌚️","📱","💻","🖥","🖱","📺","📷"]
    @State var emojiCount = 6
    var body: some View {
        HStack{
            ForEach(emojis[0..<emojiCount], id: \.self) {emoji in CardView(values: emoji)
            }
            
        }
        HStack {
            Button(action: {
                if emojiCount > 1{
                    emojiCount -= 1
                }

                
            }, label: {
                VStack(alignment: .leading){
                    Image(systemName: "minus.circle")
                        .padding()
                        .font(.largeTitle)

                        
                }
                
            })
            Spacer()
            Button(action: {
                if emojiCount < 6{
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


//This is view and designe for card's


struct CardView: View {
    var values: String
   @State var closeCard: Bool = false
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 30)
            if closeCard{
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(values).font(.largeTitle)
            }else{
                shape.fill()
            }
        }
        .padding()
        .foregroundColor(.red)
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
