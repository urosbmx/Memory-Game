//
//  ContentView.swift
//  Memory Game
//
//  Created by Uroš Katanić on 28.11.21..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(valueCard: "💻")
            
        }
        .padding(.horizontal)
            }
}


//This is view and designe for card's


struct CardView: View {
    var valueCard: String
    var closeCard = false
    var body: some View{
        if closeCard {
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(lineWidth: 3)
                    Text(valueCard)
                        .font(.largeTitle)
                }
                .padding()
            }else{
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .fill()
                        .foregroundColor(.red)
                }
                .padding()
            }
    }
    
}

//onTapGesture(count: <#T##Int#>, perform: )



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
        
    }
}
