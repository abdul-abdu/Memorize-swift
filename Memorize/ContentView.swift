//
//  ContentView.swift
//  Memorize
//
//  Created by Abdug'affor on 10/09/21.
//

import SwiftUI

struct ContentView: View {
    var emojis  = [
        "🥏", "🪀", "🥊", "🎿", "🏓",
        "🏈", "⚾️", "🥎", "🏉", "🎱",
        "🍓", "🏸", "🏒", "🏑", "🪁",
        "🚗", "🚕", "🫖", "☕️", "🍪",
        "🎂", "🍦", "🍧", "🍫", "🥢"
    ]
    
    @State var emojiCount = 20
    
    var body: some View {
        
        VStack {
            ScrollView {
            
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(emojis[0..<emojiCount], id: \.self ,content: { emoji in
                    CardView(content: emoji, isFaceUp: true).aspectRatio(2/3, contentMode: .fit)
                })
            }
            .padding(.horizontal)
            .foregroundColor(.red)
                Spacer()
            }
            
            HStack {
                add
                Spacer()
                remove
            }
            .padding(.horizontal)
        }
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
            emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
                .font(.largeTitle)
        }
    }
    var add : some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
                .font(.largeTitle)
        }
    }
}


struct CardView: View {
    
    var content: String = "🏀"
    @State var isFaceUp: Bool = true
       
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)

            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
