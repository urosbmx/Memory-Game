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
            CardView(valueCard: "Uros")
        }
    }
}


//This is view and designe for card's

struct CardView: View {
    var valueCard: String
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
            Text(valueCard)
                .font(.largeTitle)
        }
        .padding()
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
