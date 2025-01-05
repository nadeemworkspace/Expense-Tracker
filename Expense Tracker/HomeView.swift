//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Muhammed Nadeem M A on 04/01/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("This is a text label")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
