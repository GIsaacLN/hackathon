//
//  SignUpView.swift
//  hackathon
//
//  Created by Raymundo Mondragón Lara on 29/04/23.
//
import Foundation
import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore

struct NewUser: Codable {
    let nombre: String
    let apellidos: String
    let correo: String
    let numeroDeTelefono: String
    let numeroDeEmpleado: String
    let rfc: String
    let esTransportista: Bool
}

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    @State private var lastname: String = ""
    @State private var number: String = ""
    @State private var employeeNumber: String = ""
    @State private var rfc: String = ""
    @State private var errorMessage: String = ""
    @State private var isSignedUp = false
    let db = Firestore.firestore()
    let isTransportista: Bool
    
    var body: some View {
        NavigationLink(destination: SignInView(), isActive: $isSignedUp) {
            EmptyView()
        }
        
        VStack {
            TextField("Nombre(s)", text: $name)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            TextField("Apellido(s)", text: $lastname)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            TextField("Numero de Telefono", text: $number)
                .keyboardType(.numberPad)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            TextField("Numero de Empleado", text: $employeeNumber)
                .keyboardType(.numberPad)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            TextField("RFC", text: $rfc)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            Button(action: signUp) {
                Text("Registrarse")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.top)

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.top)
            }
        }
        .padding()
    }

    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                createNewUser()
            }
        }
    }

    func createNewUser() {
        let newUser = NewUser(nombre: name, apellidos: lastname, correo: email, numeroDeTelefono: number,numeroDeEmpleado: employeeNumber,rfc: rfc, esTransportista: isTransportista)
        guard let userId = Auth.auth().currentUser?.uid else {
            print("No se pudo obtener el ID del usuario")
            return
        }

        db.collection("usuarios").document(userId).setData([
            "nombre": newUser.nombre,
            "apellidos": newUser.apellidos,
            "correo": newUser.correo,
            "numeroDeTelefono": newUser.numeroDeTelefono,
            "esTransportista": newUser.esTransportista,
            "numeroDeEmpleado": newUser.numeroDeEmpleado,
            "rfc": newUser.rfc
        ]) { error in
            if let error = error {
                print("Error al guardar el usuario: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    isSignedUp = true
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(isTransportista: false)
    }
}
