//
//  RutaActivaView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI

struct RutaActivaView: View {
    @State private var showAlert = false
    @State private var showFinalizeConfirmation = false
    
    var body: some View {
        VStack {
            Text("TRIP")
                .font(.largeTitle)
                .bold()
            
            // Aquí puedes agregar el mapa con el tracker del vehículo
            
            Text("Información del viaje")
                .font(.title2)
                .padding(.bottom)
            
            VStack {
                // Aquí puedes agregar la información del viaje
            }
            .padding(.top)
            
            Spacer()
            
            Button(action: {
                showAlert.toggle()
            }) {
                Text("Finalizar viaje")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(8)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Confirmar"),
                      message: Text("¿Estás seguro de que deseas finalizar el viaje?"),
                      primaryButton: .default(Text("Finalizar"), action: {
                        showFinalizeConfirmation.toggle()
                      }),
                      secondaryButton: .cancel(Text("Cancelar")))
            }
            .actionSheet(isPresented: $showFinalizeConfirmation) {
                ActionSheet(title: Text("Finalizar viaje"),
                            message: Text("¿Deseas cancelar o finalizar el viaje?"),
                            buttons: [
                                .default(Text("Finalizar")),
                                .destructive(Text("Cancelar")),
                                .cancel()
                            ])
            }
            
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
struct RutaActivaView_Previews: PreviewProvider {
    static var previews: some View {
        RutaActivaView()
    }
}
