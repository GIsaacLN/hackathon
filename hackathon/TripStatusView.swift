//
//  TripStatusView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//
import SwiftUI

struct TripStatusView: View {
    @State private var tripStatus = "Activo"
    @State private var comments = ""
    
    var body: some View {
        VStack {
            Text("Estatus del viaje")
                .font(.largeTitle)
                .bold()
            
            Text(tripStatus)
                .font(.title2)
                .padding(.bottom)
            
            Text("Encuesta")
                .font(.title2)
                .padding(.bottom)
            
            VStack {
                // Aquí puedes agregar las preguntas de la encuesta
            }
            .padding(.top)
            
            Text("Comentarios")
                .font(.title3)
                .padding(.bottom)
            
            TextEditor(text: $comments)
                .padding()
                .frame(height: 150)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
            Spacer()
        }
        .padding(.top)
    }
}

struct TripStatusView_Previews: PreviewProvider {
    static var previews: some View {
        TripStatusView()
    }
}
