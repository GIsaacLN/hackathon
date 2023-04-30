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
        NavigationView{
            
            VStack {
                Text("Perfil")
                    .font(.largeTitle)
                    .bold()
                
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 100,height: 100)
                        .shadow(color: Color.gray, radius: 5, x: 5,y: 5)
                    
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
        }
        .navigationBarTitle("Perfil", displayMode: .inline)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
