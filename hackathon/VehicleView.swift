//
//  VehicleView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//
import SwiftUI

struct VehicleView: View {
    @State private var vehicleData: [String: Double] = [
        "Combustible": 0.75,
        "Temperatura de la caja": 0.6,
        "Presion de las llantas": 0.9,
        "Velocidad del vehículo": 0.5,
        "Distancia recorrida": 0.3
    ]
    
    var body: some View {
        VStack {
            Text("Vehículo")
                .font(.largeTitle)
                .bold()
            
            VStack {
                ForEach(vehicleData.sorted(by: <), id: \.key) { key, value in
                    HStack {
                        Text(key)
                        Spacer()
                        // Aquí puedes agregar una barra de progreso circular personalizada que muestre el porcentaje
                        Text("\(Int(value * 100))%")
                    }
                    .padding(.bottom)
                }
            }
            .padding(.top)
            
            Text("Carga/Mercancía")
                .font(.title2)
                .padding(.bottom)
            
            VStack {
                // Aquí puedes agregar información sobre la carga y mercancía del vehículo
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
    }
}
struct VehicleView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleView()
    }
}
