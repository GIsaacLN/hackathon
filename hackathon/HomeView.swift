//
//  HomeView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//
import SwiftUI

struct HomeView: View {
    @State private var lastRoutes: [String] = ["Ruta 1", "Ruta 2", "Ruta 3"]
    @State private var vehicleSummary: String = "Resumen del vehículo"
    
    var body: some View {
        VStack {
            Text("Empresa")
                .font(.largeTitle)
                .bold()
            
            Text("Bienvenido")
                .font(.title)
                .padding(.bottom)
            
            VStack {
                Text("Últimas rutas")
                    .font(.title2)
                
                List(lastRoutes, id: \.self) { route in
                    NavigationLink(destination: RouteDetailView(routeName: route)) {
                        Text(route)
                    }
                }
            }
            .padding(.top)
            
            VStack {
                Text("Vehículo")
                    .font(.title2)
                
                Text(vehicleSummary)
            }
            .padding(.top)
            
            Spacer()
        }
        .padding(.top)
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
