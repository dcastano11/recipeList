//
//  MapView.swift
//  recipeList
//
//  Created by david on 21/06/23.
//

import SwiftUI
import MapKit
import CoreLocation

struct Marker: Identifiable {
    let id = UUID()
    var location: MapMarker
}

struct MapView: View {
 
    var lat:Double
    var lng:Double
    @State var marker:Marker = Marker(location: MapMarker(coordinate: CoreLocation.CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)))
    @State var region:MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D   (latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    
    init(lat:Double, lng:Double) {
        self.lat = lat
        self.lng = lng
    }
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [marker]) { item in
            
            item.location
            
        }.onAppear{
        
            region = MKCoordinateRegion(center: CLLocationCoordinate2D   (latitude: lat, longitude: lng), span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30))
            marker = Marker(location: MapMarker(coordinate: CoreLocation.CLLocationCoordinate2D(latitude: lat, longitude: lng)))
            
        }
    }
}

class MapViewModel:ObservableObject{
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(lat:51, lng:-0.1275)
    }
}
