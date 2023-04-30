//
//  Screen12View.swift
//  hackathon
//      CHOFERES
//  Created by iOS Lab on 29/04/23.
//
import SwiftUI

struct Screen12: View {
    @State private var showDriverDetails = false
    @State private var selectedDriver: Driver?

    var body: some View {
        NavigationView {
            VStack {
                List(driverData) { driver in
                    Button(action: {
                        self.selectedDriver = driver
                        self.showDriverDetails.toggle()
                    }) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(driver.name)
                                Text("Número de empleado: \(driver.employeeNumber)")
                                Text("Licencia: \(driver.license)")
                                Text("RFC: \(driver.rfc)")
                                Text("Estatus: \(driver.status)")
                            }
                            Spacer()
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .sheet(isPresented: $showDriverDetails) {
                    if let selectedDriver = selectedDriver {
                        DriverDetailsView(driver: selectedDriver)
                    }
                }
                .navigationBarTitle("Choferes", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Implementar la funcionalidad para agregar chofer aquí
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
}

struct Driver: Identifiable {
    var id = UUID()
    var name: String
    var employeeNumber: String
    var license: String
    var rfc: String
    var status: String
}

let driverData: [Driver] = [
    Driver(name: "Juan Pérez", employeeNumber: "12345", license: "ABC123", rfc: "JUPE920101", status: "En ruta"),
    Driver(name: "Pedro García", employeeNumber: "67890", license: "DEF456", rfc: "PEGA930202", status: "Disponible")
]

struct DriverDetailsView: View {
    var driver: Driver

    var body: some View {
        VStack {
            Text(driver.name)
                .font(.title)
                .padding(.top)
            
            Text("Número de empleado: \(driver.employeeNumber)")
            Text("Licencia: \(driver.license)")
            Text("RFC: \(driver.rfc)")
            Text("Estatus: \(driver.status)")
            
            if driver.status == "En ruta" {
                ProgressBar3(value: 0.5) // Cambiar el valor según el progreso real
                    .frame(height: 20)
                    .padding()
                
                Button(action: {
                    // Implementar la funcionalidad de suspender el viaje aquí
                }) {
                    Text("Suspender viaje")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(8)
                }
                .padding(.bottom)
            }
        }
        .padding()
    }
}

struct ProgressBar3: View {
    var value: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color.gray.opacity(0.3))
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: CGFloat(value) * geometry.size.width, height: geometry.size.height)
                    .foregroundColor(.blue)
             }
        }
    }
}

struct Screen12_Previews: PreviewProvider {
    static var previews: some View {
        Screen12()
    }
}
