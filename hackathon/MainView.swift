//
//  MainView.swift
//  hackathon
//
//  Created by Raymundo Mondragón Lara on 29/04/23.
//

import SwiftUI
import MapKit
import CoreLocation

struct MainView: View {
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        MapView(locationManager: locationManager)
            .onAppear {
                locationManager.startUpdatingLocation()
            }
            .onDisappear {
                locationManager.stopUpdatingLocation()
            }
    }
}

struct MapView: UIViewRepresentable {
    @ObservedObject var locationManager: LocationManager
    @State private var route: MKRoute?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        guard let location = locationManager.location else { return }
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
        uiView.setRegion(region, animated: true)

        if route == nil {
            let destinationCoordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude + 0.02, longitude: location.coordinate.longitude + 0.02)
            calculateRoute(to: destinationCoordinate, mapView: uiView)
        }
    }

    func calculateRoute(to destination: CLLocationCoordinate2D, mapView: MKMapView) {
        guard let origin = locationManager.location?.coordinate else { return }
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: origin))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        request.transportType = .automobile

        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            if let error = error {
                print("Error calculating route: \(error.localizedDescription)")
                return
            }

            if let route = response?.routes.first {
                self.route = route
                mapView.addOverlay(route.polyline)
                mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .blue
                renderer.lineWidth = 3
                return renderer
            }
                return MKOverlayRenderer()
            }
        }
    }



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
