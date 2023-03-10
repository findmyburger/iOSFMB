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
        viewModel.restaurants.forEach { restaurant in
            addAnnotation(location: CLLocationCoordinate2D(latitude: CLLocationDegrees(CGFloat(restaurant.latitude)), longitude: CLLocationDegrees(CGFloat(restaurant.longitude))), title: restaurant.name)
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

/*import SwiftUI
 import MapKit

 struct MapView: UIViewRepresentable {
     @State var annotations = [MKPointAnnotation]()
     @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
     let locationManager = CLLocationManager()

     func makeUIView(context: Context) -> MKMapView {
         let mapView = MKMapView()
         mapView.delegate = context.coordinator
         mapView.showsUserLocation = true
         locationManager.requestWhenInUseAuthorization()
         return mapView
     }

     func updateUIView(_ mapView: MKMapView, context: Context) {
         mapView.setRegion(region, animated: true)
         mapView.addAnnotations(annotations)
     }

     func makeCoordinator() -> Coordinator {
         Coordinator(self)
     }

     class Coordinator: NSObject, MKMapViewDelegate {
         var parent: MapView

         init(_ parent: MapView) {
             self.parent = parent
         }

         func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
             let identifier = "Placemark"
             var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
             if annotationView == nil {
                 annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                 annotationView?.canShowCallout = true
                 annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
             } else {
                 annotationView?.annotation = annotation
             }
             return annotationView
         }

         func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
             guard let placemark = view.annotation as? MKPointAnnotation else { return }
             let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: placemark.coordinate))
             mapItem.name = placemark.title
             mapItem.openInMaps(launchOptions: nil)
         }
     }

     func addAnnotation(location: CLLocationCoordinate2D, title: String) {
         let annotation = MKPointAnnotation()
         annotation.coordinate = location
         annotation.title = title
         annotations.append(annotation)
     }
 }

 struct ContentView: View {
     var body: some View {
         MapView()
             .addAnnotation(location: CLLocationCoordinate2D(latitude: 37.7793, longitude: -122.4193), title: "San Francisco")
             .addAnnotation(location: CLLocationCoordinate2D(latitude: 37.3318, longitude: -122.0312), title: "Apple Campus")
             .addAnnotation(location: CLLocationCoordinate2D(latitude: 47.6062, longitude: -122.3321), title: "Seattle"))
     }
 }
 En este ejemplo, la clase MapView es una vista de SwiftUI que envuelve una instancia de MKMapView y proporciona métodos para agregar marcadores a ese mapa. El método addAnnotation agrega una nueva instancia de MKPointAnnotation al mapa y el método updateUIView agrega todas las anotaciones al mapa.

 Además, la clase Coordinator se utiliza para configurar la apariencia de las anotaciones y para proporcionar indic
*/
