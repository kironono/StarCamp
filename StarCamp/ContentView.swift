//
//  ContentView.swift
//  StarCamp
//
//  Created by Junichi Kakisako on 2022/05/31.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var manager = LocationManager()
    
    var body: some View {
        let latetude = $manager.location.wrappedValue.coordinate.latitude
        let longitude = $manager.location.wrappedValue.coordinate.longitude
        
        VStack(alignment: .leading) {
            MapView()
                .environmentObject(manager)
                .ignoresSafeArea()
                .frame(height: 300)
            Text("StarCamp")
                .font(.title)
            Text("\(latetude), \(longitude)")
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
