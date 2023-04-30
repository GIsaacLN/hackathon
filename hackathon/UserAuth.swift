//
//  UserAuth.swift
//  hackathon
//
//  Created by Raymundo Mondragón Lara on 30/04/23.
//

import SwiftUI
import Combine
import FirebaseFirestore
import FirebaseAuth

class UserAuth: ObservableObject {
    @Published var isSignedIn = false
    @Published var isTransportista: Bool = false
    
    func checkIfTransportista(userId: String, completion: @escaping (Bool) -> Void) {
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { (document, error) in
            if let document = document, document.exists {
                let esTransportista = document.get("esTransportista") as? Bool ?? false
                completion(esTransportista)
            } else {
                print("Error al obtener el documento: \(error!)")
                completion(false)
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            isSignedIn = false
        } catch let signOutError as NSError {
            print("Error al cerrar sesión: %@", signOutError)
        }
    }

}
