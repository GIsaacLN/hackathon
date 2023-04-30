//
//  ManagerMainView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//


import SwiftUI

struct ManagerMainView: View {
    @State private var searchText: String = "Buscar..."
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack {
            Text("Empresa")
                .font(.largeTitle)
                .padding()
            SearchBar(text: $searchText, placeholder: "")
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    SectionSummaryView(title: "Choferes")
                    SectionSummaryView(title: "Vehículos")
                    SectionSummaryView(title: "Rutas")
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
    }
}

struct SectionSummaryView: View {
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
                .bold()
            
            // Aquí puedes agregar la vista previa o resumen de la sección correspondiente.
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 150, height: 150)
                .foregroundColor(.gray)
        }
        .padding()
    }
}


struct ManagerMainView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerMainView()
    }
}
