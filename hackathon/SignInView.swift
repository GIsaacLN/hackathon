//
//  SignInView.swift
//  hackathon
//
//  Created by Raymundo Mondragón Lara on 29/04/23.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    @State private var isSignedIn = false

    var body: some View {
        VStack {
            NavigationLink(destination: MainView(), isActive: $isSignedIn) {
                EmptyView()
            }
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

            Button(action: signIn) {
                Text("Sign In")
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

    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                isSignedIn = true
            }
        }
    }
}

                              
                              
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
