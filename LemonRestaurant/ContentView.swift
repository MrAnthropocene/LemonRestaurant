//
//  ContentView.swift
//  LemonRestaurant
//
//  Created by Saul Herrera on 11/29/25.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "iphone")
                .font(.system(size: 50))
                .foregroundColor(.green)

            Text("Hello, world!")
                .font(.title2)
                .padding()

            AboutView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
