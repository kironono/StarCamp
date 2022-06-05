//
//  ContentView.swift
//  StarCamp
//
//  Created by Junichi Kakisako on 2022/05/31.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    
    @State var dateText = ""
    @State var nowDate = Date()
    private let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "YYYY/MM/dd(E) \nHH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ja_jp")
    }
    
    var body: some View {
        let latetude = locationManager.lastSeenLocation?.coordinate.latitude ?? 0
        let longitude = locationManager.lastSeenLocation?.coordinate.longitude ?? 0
        let altitude = locationManager.lastSeenLocation?.altitude ?? 0
        let city = locationManager.currentPlacemark?.administrativeArea ?? ""
        let locality = locationManager.currentPlacemark?.locality ?? ""
        let heading = locationManager.heading ?? 0
        
        VStack(alignment: .leading) {
            MapView()
                .environmentObject(locationManager)
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
            HStack {
                Text("Altitude:")
                Text("\(altitude)")
            }
            HStack {
                Text("City:")
                Text("\(locality), \(city)")
            }
            HStack {
                Text("Heading:")
                Text("\(heading)")
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
