//
//  UserProfileView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//
import SwiftUI

struct UserProfileView: View {
    @State private var userTrips: [String] = ["Viaje 1", "Viaje 2", "Viaje 3"]
    @State private var userData: String = "Datos del usuario"
    
    var body: some View {
        VStack {
            Text("Perfil")
                .font(.largeTitle)
                .bold()
            
            VStack {
                Text("Viajes")
                    .font(.title2)
                
                List(userTrips, id: \.self) { trip in
                    NavigationLink(destination: RouteDetailView(routeName: trip)) {
                        Text(trip)
                    }
                }
            }
            .padding(.top)
            
            VStack {
                Text("Datos del usuario")
                    .font(.title2)
                
                Text(userData)
            }
            .padding(.top)
            
            Spacer()
            
        }
        .padding(.top)
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
