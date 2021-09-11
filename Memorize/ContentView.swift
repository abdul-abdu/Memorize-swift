//
//  ContentView.swift
//  Memorize
//
//  Created by Abdug'affor on 10/09/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct CardView: View {
    var body: some View {
        ZStack(content: {
            Text("🏀")
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .stroke(lineWidth: 3)
        })
    }
}
