//
//  ContentView.swift
//  StarCamp
//
//  Created by Junichi Kakisako on 2022/05/31.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var manager = LocationManager()
    
    @State var dateText = ""
    @State var nowDate = Date()
    private let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "YYYY/MM/dd(E) \nHH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ja_jp")
    }
    
    var body: some View {
        let latetude = $manager.location.wrappedValue.coordinate.latitude
        let longitude = $manager.location.wrappedValue.coordinate.longitude
        
        VStack(alignment: .leading) {
            MapView()
                .environmentObject(manager)
                .ignoresSafeArea()
                .frame(height: 200)
            
            Text(dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        self.nowDate = Date()
                        dateText = "\(dateFormatter.string(from: nowDate))"
                    }
                }
            
            HStack {
                Text("Longitude:")
                Text("\(longitude)")
            }
            HStack {
                Text("Latetude:")
                Text("\(latetude)")
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
