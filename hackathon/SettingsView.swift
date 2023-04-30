//
//  SettingsView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI

struct SettingsView: View {
    @State private var toggleValue = true
    
    @State private var selectedTheme = "Claro"
    private let themes = ["Claro", "Oscuro", "Automático"]

    var body: some View {
        VStack {
            Text("Configuración")
                .font(.largeTitle)
                .bold()
                .padding(.top)

            Form {
                Section(header: Text("Opciones Generales")) {
                    Toggle("Activar Notificaciones", isOn: $toggleValue)
                    Picker("Tema", selection: $selectedTheme) {
                        ForEach(themes, id: \.self) { theme in
                            Text(theme)
                        }
                    }
                }
                .padding(.top)
            }
            
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


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
