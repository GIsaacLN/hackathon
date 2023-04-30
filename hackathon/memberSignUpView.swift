//
//  memberSignUpView.swift
//  hackathon
//
//  Created by Raymundo Mondragón Lara on 30/04/23.
//

import SwiftUI

struct memberSignUpView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SignUpView(isTransportista: true)) {
                    Text("Registrate como Transportista")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                NavigationLink(destination: SignUpView(isTransportista: false)) {
                    Text("Registrate como Capitan")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
    }
}

struct memberSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        memberSignUpView()
    }
}
