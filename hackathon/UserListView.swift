//
//  UserListView.swift
//  hackathon
//
//  Created by Raymundo Mondragón Lara on 29/04/23.
//
import Firebase
import FirebaseFirestore
import SwiftUI

struct User: Codable, Identifiable {
    let idUsuario: String
    let nombre: String
    let apellidos: String
    let correo: String
    let numeroDeTelefono: String
    let esTransportista: Bool
    let numeroDeEmpleado: Int
    let rfc: String

    var id: String {
        return idUsuario
    }
}


struct UserListView: View {
    @State private var users: [User] = []
    let db = Firestore.firestore()

    var body: some View {
        List {
            ForEach(users) { user in
                VStack(alignment: .leading) {
                    Text(user.nombre + " " + user.apellidos)
                        .font(.headline)
                    Text(user.correo)
                        .font(.subheadline)
                    Text(user.numeroDeTelefono)
                        .font(.subheadline)
                }
            }
        }
        .onAppear(perform: loadUsers)
    }

    func loadUsers() {
        db.collection("usuarios").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error al cargar usuarios: \(error?.localizedDescription ?? "Error desconocido")")
                return
            }

            users = documents.compactMap { document -> User? in
                let data = document.data()
                let idUsuario = document.documentID
                let nombre = data["nombre"] as? String ?? ""
                let apellidos = data["apellidos"] as? String ?? ""
                let correo = data["correo"] as? String ?? ""
                let numeroDeTelefono = data["numeroDeTelefono"] as? String ?? ""
                let esTransportista = data["esTransportista"] as? Bool ?? false
                let numeroDeEmpleado = data["numeroDeEmpleado"] as? Int ?? 0
                let rfc = data["rfc"] as? String ?? ""

                return User(idUsuario: idUsuario, nombre: nombre, apellidos: apellidos, correo: correo, numeroDeTelefono: numeroDeTelefono, esTransportista: esTransportista, numeroDeEmpleado: numeroDeEmpleado, rfc: rfc)
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
