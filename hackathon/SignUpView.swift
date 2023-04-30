//
//  SignUpView.swift
//  hackathon
//
//  Created by Raymundo Mondragón Lara on 29/04/23.
//
import Foundation
import SwiftUI
import FirebaseAuth

struct NewUser: Codable {
    let nombre: String
    let apellidos: String
    let correo: String
    let numeroDeTelefono: String
    let esTransportista: Bool
}

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    @State private var lastname: String = ""
    @State private var number: String = ""
    @State private var rfc: String = ""
    @State private var id: String = ""

    @State private var errorMessage: String = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
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

            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)

            Button(action: signUp) {
                Text("Sign Up")
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
        guard let url = URL(string: "http://localhost:5000/usuarios") else {
            print("Invalid URL")
            return
        }

        let newUser = NewUser(nombre: name, apellidos: lastname, correo: email, numeroDeTelefono: number, esTransportista: false)
        guard let encodedUser = try? JSONEncoder().encode(newUser) else {
            print("Failed to encode user")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodedUser
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let _ = data, error == nil else {
                print("Error al crear el usuario: \(error?.localizedDescription ?? "Error desconocido")")
                return
            }
            DispatchQueue.main.async {
                SignInView()
            }
        }.resume()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
