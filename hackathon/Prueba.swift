//
//  Prueba.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI

struct Prueba: View {
    @State private var progress: Double = 0.0

    var body: some View {
        VStack {
            Text("Empresa")
                .font(.largeTitle)
                .bold()

            Text("Bienvenido")
                .font(.title2)
                .padding(.bottom)

            ProgressBar(value: $progress)
                .frame(height: 20)
                .padding()

            VStack {
                // Aquí puedes agregar los elementos para mostrar los hazards y warnings
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

struct ProgressBar: View {
    @Binding var value: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .opacity(0.3)
                    .foregroundColor(.blue)

                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: geometry.size.width * CGFloat(value))
            }
            .cornerRadius(10)
        }
    }
}

struct Prueba_Previews: PreviewProvider {
    static var previews: some View {
        Prueba()
    }
}
