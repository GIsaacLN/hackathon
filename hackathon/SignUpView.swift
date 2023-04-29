//
//  SignUpView.swift
//  hackathon
//
//  Created by Raymundo Mondragón Lara on 29/04/23.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    @State private var lastname: String = ""
    @State private var number: String = ""

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
                SignInView()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
