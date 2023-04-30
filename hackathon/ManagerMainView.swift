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
            
            ManagerToolbar(selectedTab: $selectedTab)
                .padding(.bottom)
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

struct ManagerToolbar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            Button(action: {
                selectedTab = 0
            }) {
                Image(systemName: selectedTab == 0 ? "person.fill" : "person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            
            Spacer()
            
            Button(action: {
                selectedTab = 1
            }) {
                Image(systemName: selectedTab == 1 ? "gearshape.fill" : "gearshape")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
        }
        .padding(.horizontal)
    }
}

struct ManagerMainView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerMainView()
    }
}
