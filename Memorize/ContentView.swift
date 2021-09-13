//
//  ContentView.swift
//  Memorize
//
//  Created by Abdug'affor on 10/09/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {

            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) {card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choos(card)
                            }
                    }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
                Spacer()
            }
            
//            HStack {
////                add
//                Spacer()
//                remove
//            }
//            .padding(.horizontal)
        
    }
    
//    var remove: some View {
//        Button {
//            if emojiCount > 1 {
//            emojiCount -= 1
//            }
//        } label: {
//            Image(systemName: "minus.circle")
//                .font(.largeTitle)
//        }
//    }
//    var add : some View {
//        Button {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//                .font(.largeTitle)
//        }
//    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
       
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)

            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()

        ContentView(viewModel: game)
    }
}
