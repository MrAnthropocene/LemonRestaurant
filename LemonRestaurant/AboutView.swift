//
//  ContentView.swift
//  LemonRestaurant
//
//  Created by Saul Herrera on 11/22/25.
//

import SwiftUI

 

struct AboutView: View {
    var body: some View {
        Text("About Little Lemon v2")
            .font(Font.largeTitle)
            .foregroundColor(.green)
            .bold()
        
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ")
            .multilineTextAlignment(.center)
            .font(.body)
            .padding()
        
        HStack(spacing: 30){
            Image(systemName: "fork.knife")
            Image(systemName: "leaf")
            Image(systemName: "map")
        }
        .font(.system(size: 32))
        .foregroundColor(.yellow)
        
    }
}

#Preview {
    AboutView()
}
