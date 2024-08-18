//
//  ContentView.swift
//  Memorize
//
//  Created by Adam Sayer on 17/8/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var themeColor: Color = .green
    @State private var cardSize = 90
    let animalEmojis = ["🐶", "🐶", "🐭", "🐭", "🐵", "🐵", "🐍", "🐍"]
    let vehicleEmojis = ["🚗", "🚗", "🚌", "🚌", "🚀", "🚀", "🚜", "🚜", "✈️", "✈️", "🚛", "🚛"]
    let halloweenEmojis = ["👻", "👻", "🎃", "🎃","🕷️", "🕷️", "💀", "💀", "🕸️", "🕸️", "🧙‍♀️", "🧙‍♀️", "😱", "😱", "🧙‍♀️", "🧙‍♀️"]
    @State var playerEmojis: [String]
        
    init() {
        playerEmojis = animalEmojis.shuffled()
    }
    var body: some View {
        NavigationStack{
            VStack {
                ScrollView {
                cards
                }
                Spacer()
                themes
            }
            .padding()
            .navigationTitle("Memorize")
        }
        
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: CGFloat(cardSize)))]) {
            ForEach(0..<playerEmojis.count, id: \.self) { index in
                CardView(content: playerEmojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
        .foregroundColor(themeColor)
    }
    
    var themes: some View {
            HStack {
                animalTheme
                Spacer()
                vehicleTheme
                Spacer()
                halloweenTheme
            }
            .foregroundColor(themeColor)
            .padding(.horizontal)
            .imageScale(.large)
            .font(.footnote)
    }
    
    func cardTheme(icon: String, name: String, emojiSet: [String], color: Color, size: Int) -> some View {
        VStack {
            Button(action: {
                playerEmojis = emojiSet.shuffled()
                themeColor = color
                cardSize = size
            }, label : {
                Image(systemName: icon)
            })
            Text(name)
        }
    }
    
    var themeOptions: some View {
            HStack {
                animalTheme
                vehicleTheme
                halloweenTheme
            }
    }
    
    var animalTheme: some View {
        return cardTheme(icon: "dog.fill", name: "Animal", emojiSet: animalEmojis, color: .green, size: 90)
    }
    var vehicleTheme: some View {
        return cardTheme(icon: "car.fill", name: "Vehicles", emojiSet: vehicleEmojis, color: .orange, size:82)
    }
    var halloweenTheme: some View {
        return cardTheme(icon: "moon.fill", name: "Halloween", emojiSet: halloweenEmojis, color: .purple, size: 80)
    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture {
            print("tapped")
            isFaceUp.toggle()
        }
    }
    
}

#Preview {
    ContentView()
}
