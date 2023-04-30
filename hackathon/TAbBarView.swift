//
//  TAbBarView.swift
//  hackathon
//
//  Created by iOS Lab on 30/04/23.
//

import SwiftUI


private let vistas = [vista(id: 1, logo: Image(systemName: "person.circle.fill")),
                      vista(id: 2, logo: Image(systemName: "person.circle.fill")),
                      vista(id: 3, logo: Image(systemName: "car.fill")),
                      vista(id: 4, logo: Image(systemName: "shield.righthalf.filled")),
                      vista(id: 5, logo: Image(systemName: "gear"))]

struct TAbBarView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TabView{
            UserProfileView()
                .tabItem{
                    Label("", systemImage:"person.circle.fill")
                }
            
            VehicleView()
                .tabItem{
                    Label("", systemImage:"car.fill")
                }
            
            InicioCrewView()
                .tabItem{
                    Label("", systemImage:"shield.righthalf.filled")
                }
            
            MainView()
                .tabItem{
                    Label("", systemImage:"map.fill")
                }
            
            SettingsView()
                .tabItem{
                    Label("", systemImage:"gear")
                }
        }
        .background(Color.clear.ignoresSafeArea())
        .overlay(
            // Capa de fondo para el TabBar
            ZStack {
                if colorScheme == .light {
                    Color.white
                } else {
                    Color.black
                }
            }
            .opacity(0.9)
            .ignoresSafeArea()
            .frame(height: 49)
            .edgesIgnoringSafeArea(.bottom)
        )
    }
}



struct TAbBarView_Previews: PreviewProvider {
    static var previews: some View {
        TAbBarView()
    }
}
