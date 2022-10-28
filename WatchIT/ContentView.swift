//
//  ContentView.swift
//  WatchIT
//
//  Created by Alison Gorman on 10/26/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Watch It")
            LottieView(lottieFile: "eyes2")
                .frame(width: 300, height: 300)

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
