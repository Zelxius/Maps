//
//  PlacesSwiftUI.swift
//  Maps
//
//  Created by Zelxius on 22/03/22.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name : String
    let latitude : Double
    let longitude : Double
    var coordinate : CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct PlacesSwiftUI: View {
    
    let places = [
        Place(name: "Museo Britanico", latitude: 51.519581, longitude: -0.127002),
        Place(name: "Torre de Londres", latitude: 51.508052, longitude: -0.076035),
        Place(name: "Big Ben", latitude: 51.500710, longitude: -0.124617)
    ]
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29.9792, longitude: 31.1342), latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: places) { place in
            MapMarker(coordinate: place.coordinate)
        }
    }
}
