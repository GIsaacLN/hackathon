//
//  Prueba.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI
import Foundation

struct vista: Identifiable{
    var id: Int
    var logo: Image
}

struct error: Identifiable{
    var id = UUID()
    var er : String
    var des : String
}

private let errores = error(er : "error1", des : "descripcion")

private let vistas = [vista(id: 1, logo: Image(systemName: "person.circle.fill")),
                      vista(id: 2, logo: Image(systemName: "person.circle.fill")),
                      vista(id: 3, logo: Image(systemName: "car.fill")),
                      vista(id: 4, logo: Image(systemName: "shield.righthalf.filled")),
                      vista(id: 5, logo: Image(systemName: "gear"))]

struct Prueba: View {
    @State private var progress: Double = 0.46

    var body: some View {
        VStack {
            Text("Empresa")
                .font(.largeTitle)
                .bold()

            Text("Bienvenido")
                .font(.title2)
                .padding(.bottom)
            
            HStack{
            
                Image(systemName: "box.truck")
                    .resizable()
                    .frame(width:60,height:50)
                    .padding()
                
                ProgressBar(value: $progress)
                    .frame(height: 20)
                    .padding()
                
                Image(systemName: "mappin.and.ellipse")
                    .resizable()
                    .frame(width:60,height:60)
                    .padding()
                
            }
            .padding(.bottom)
            
            Spacer(minLength: 40)
            

                // Aquí puedes agregar los elementos para mostrar los hazards y warnings
                ForEach([errores]) { error in
                        HStack{
                            Text(error.er)
                    }
                }
            .padding(.top)
            
            
            

            Spacer()
            
                
            }
            
          /*  HStack {
                ForEach(vistas) { vista in
                    Button(action: {
                        // Acción para cada botón
                    }) {
                        // Contenido visual para cada botón
                        vista.logo
                    }
                    .padding()
                }
            }*/
        .padding(.top)
    }
}


struct Prueba_Previews: PreviewProvider {
    static var previews: some View {
        Prueba()
    }
}
