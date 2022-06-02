//
//  ContentView.swift
//  StarCamp
//
//  Created by Junichi Kakisako on 2022/05/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            MapView()
                .ignoresSafeArea()
                .frame(height: 300)
            Text("StarCamp")
                .font(.title)
            Text("Astro photography support tool")
                .font(.subheadline)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
