//
//  MapView.swift
//  StarCamp
//
//  Created by Junichi Kakisako on 2022/06/02.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    var body: some View {
        Map(
            coordinateRegion: $locationManager.region,
            showsUserLocation: true,
            userTrackingMode: $userTrackingMode
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
