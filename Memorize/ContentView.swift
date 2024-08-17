//
//  ContentView.swift
//  Memorize
//
//  Created by Adam Sayer on 17/8/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            ForEach(1...4, id: \.self) { i in
                HStack {
                    ForEach(1...4, id: \.self) { i in
                    CardView()
                        .foregroundColor(Color.orange)
                    }
                }
            }
        }
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        if isFaceUp {
            ZStack {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            }
        } else {
            RoundedRectangle(cornerRadius: 12).foregroundColor(.orange)
        }
    }
}

#Preview {
    ContentView()
}
