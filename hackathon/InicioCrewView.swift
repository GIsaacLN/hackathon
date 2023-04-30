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
    let costumFont = Font.custom("against_regular", size: 30)
    
    var body: some View {
        VStack{
            
            Section(){
                    Text("Empresa")
                    .font(costumFont)
            }
            
            Spacer()
            
            Section(){
                HStack{
                    Text("¡Bienvenidos!")
                        .font(.title)
                }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Text("Resumen del viaje")
                HStack{
                    Spacer()
                    Image(systemName: "box.truck")
                        .resizable()
                        .frame(width:30,height:30)
                    ProgressView(value:progress)
                    Image(systemName: "airplane")
                    
                }
                
            }
            
            
            NavigationStack{
                Text("")
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
