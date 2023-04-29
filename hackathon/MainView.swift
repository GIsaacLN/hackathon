//
//  MainView.swift
//  hackathon
//
//  Created by Raymundo Mondragón Lara on 29/04/23.
//

import SwiftUI
import MapKit

struct MainView: View {
    @State private var startPoint: MKPointAnnotation?
    @State private var endPoint: MKPointAnnotation?
    @State private var route: MKPolyline?
    @State private var searchStart: String = ""
    @State private var searchEnd: String = ""
    @State private var startSearchResults: [MKMapItem] = []
    @State private var endSearchResults: [MKMapItem] = []
    @State private var showStartSuggestions = false
    @State private var showEndSuggestions = false

    var body: some View {
        VStack {
            SearchBar(text: $searchStart, placeholder: "Lugar de partida")
                .padding(.horizontal)
                .onChange(of: searchStart) { newValue in
                    searchLocation(searchText: newValue, completions: $startSearchResults)
                    showStartSuggestions = !newValue.isEmpty
                }
            
            if showStartSuggestions {
                List(startSearchResults, id: \.self) { mapItem in
                    Button(action: {
                        searchStart = mapItem.name ?? ""
                        showStartSuggestions = false
                        startPoint = mapItemToAnnotation(mapItem: mapItem)
                    }) {
                        Text(mapItem.name ?? "")
                    }
                }
            }

            SearchBar(text: $searchEnd, placeholder: "Lugar de destino")
                .padding(.horizontal)
                .onChange(of: searchEnd) { newValue in
                    searchLocation(searchText: newValue, completions: $endSearchResults)
                    showEndSuggestions = !newValue.isEmpty
                }
            
            if showEndSuggestions {
                List(endSearchResults, id: \.self) { mapItem in
                    Button(action: {
                        searchEnd = mapItem.name ?? ""
                        showEndSuggestions = false
                        endPoint = mapItemToAnnotation(mapItem: mapItem)
                    }) {
                        Text(mapItem.name ?? "")
                    }
                }
            }

            MapView(startPoint: $startPoint, endPoint: $endPoint, route: $route)
                .edgesIgnoringSafeArea(.all)

            Button(action: {
                findRoute()
            }) {
                Text("Iniciar Ruta")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }

    func searchLocation(searchText: String, completions: Binding<[MKMapItem]>) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchText

        let search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            if let error = error {
                print("Error fetching search completions: \(error)")
            } else {
                DispatchQueue.main.async {
                    completions.wrappedValue = response?.mapItems ?? []
                }
            }
        }
    }

    func mapItemToAnnotation(mapItem: MKMapItem) -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = mapItem.placemark.coordinate
        annotation.title = mapItem.name
        return annotation
    }

    func findRoute() {
        guard let startPoint = startPoint, let endPoint = endPoint else { return }

        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: startPoint.coordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: endPoint.coordinate))
        request.transportType = .automobile
        request.requestsAlternateRoutes = false

        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
            self.route = route.polyline
        }
    }
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
}

struct MapView: UIViewRepresentable {
    @Binding var startPoint: MKPointAnnotation?
    @Binding var endPoint: MKPointAnnotation?
    @Binding var route: MKPolyline?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateAnnotations(from: uiView)
        updateRoute(from: uiView)
    }

    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        if let startPoint = startPoint {
            mapView.addAnnotation(startPoint)
        }
        if let endPoint = endPoint {
            mapView.addAnnotation(endPoint)
        }
    }

    private func updateRoute(from mapView: MKMapView) {
        if let route = route {
            mapView.addOverlay(route)
            mapView.setVisibleMapRect(route.boundingMapRect, edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50), animated: true)
        }
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var control: MapView

        init(_ control: MapView) {
            self.control = control
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let routePolyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: routePolyline)
                renderer.strokeColor = UIColor.blue
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
