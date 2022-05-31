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
            Text("StarCamp")
                .font(.title)
            Text("Astro photography support tool")
                .font(.subheadline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
