//
//  MapViewRepresentable.swift
//  FindMyBurger
//
//  Created by Apps2T on 3/3/23.
//

import SwiftUI
import MapKit

struct MapViewRepresentable: UIViewRepresentable{
                          
    let mapView = MKMapView()
    let locationManager = LocationManager()
    @State var annotations = [MKPointAnnotation]()
    @EnvironmentObject var viewModel: LocationViewModel
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.userTrackingMode = .follow
        mapView.showsUserLocation = true
        viewModel.getAllRestaurants {
            viewModel.restaurants.forEach { restaurant in
                addAnnotation(location: CLLocationCoordinate2D(latitude: CLLocationDegrees(CGFloat(restaurant.latitude)), longitude: CLLocationDegrees(CGFloat(restaurant.longitude))), title: restaurant.name)
            }
        }
        
        return mapView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let selectedLocation = viewModel.selectedLocation{
            print("DEBUG: Selected location in map view \(selectedLocation)")
        }
    }
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
    func addAnnotation(location: CLLocationCoordinate2D, title: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = title
        mapView.addAnnotation(annotation)
    }
    
}
extension MapViewRepresentable{
     
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: MapViewRepresentable
        
        init(parent: MapViewRepresentable){
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude,
                                               longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05,
                                       longitudeDelta: 0.05))
            parent.mapView.setRegion(region, animated: true)
        }
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D){
            
           // ForEach(viewModel.restaurants )
            
            let anno = MKPointAnnotation()
            anno.coordinate =  coordinate
            self.parent.mapView.addAnnotation(anno)
            self.parent.mapView.selectAnnotation(anno, animated: true)
        }

    }
}

