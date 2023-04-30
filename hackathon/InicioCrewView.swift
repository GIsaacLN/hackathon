//
//  InicioCrewView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI

struct InicioCrewView: View {
    
    @State private var inicio = false
    @State private var perfil = false
    @State private var vehiculo = false
    @State private var mapa = false
    @State private var ajustes = false
    @State private var progress = 0.8

    
    var body: some View {
        VStack{
            
            Section(){
                    Text("Empresa")
                    .font(Font.custom("against regular", size: 30))
            }
            
            Spacer()
            
            Section(){
                HStack{
                    Text("¡Bienvenidos!")
                        .font(.system(size: 36))
                }
            }
            
            
            NavigationStack{
                Text("Resumen del viaje")
                ProgressView(placemenr: .top, value:progress)
                
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button(action:  {
                            print("Pressed")
                        }) {
                            Image(systemName: "person.circle.fill")
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Button(action:  {
                            print("Pressed")
                        }) {
                            Image(systemName: "car.fill")
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Button(action:  {
                            print("Pressed")
                        }) {
                            Image(systemName: "house")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 50, height: 40)
                        }
                        Spacer()
                        
                        Button(action:  {
                            print("Pressed")
                        }) {
                            Image(systemName: "map.fill")
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            print("Pressed")
                        }) {
                            Image(systemName: "gear")
                                .foregroundColor(.black)
                        }
                    }
                }
        }
        }
    }
}


struct InicioCrewView_Previews: PreviewProvider {
    static var previews: some View {
        InicioCrewView()
    }
}
