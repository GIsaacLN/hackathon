//
//  RouteDetailView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI

struct RouteDetailView: View {
    var routeName: String
    
    var body: some View {
        VStack {
            Text(routeName)
                .font(.largeTitle)
                .bold()
            
            VStack {
                // Aquí puedes agregar información detallada de la ruta seleccionada
            }
            .padding(.top)
            
            Spacer()
            
            HStack {
                ForEach(0..<5) { index in
                    Button(action: {
                        // Acción para cada botón
                    }) {
                        // Contenido visual para cada botón
                        Image(systemName: "circle.fill")
                    }
                    .padding()
                }
            }
        }
        .padding(.top)
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct RouteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RouteDetailView(routeName: "ruta")
    }
}
