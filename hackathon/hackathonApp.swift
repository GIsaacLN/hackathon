//
//  hackathonApp.swift
//  hackathon
//
//  Created by Raymundo Mondragón Lara on 29/04/23.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct hackathonApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var userAuth = UserAuth()
    @State private var isTransportista: Bool? = nil

    var body: some Scene {
        WindowGroup {
            Group {
                if Auth.auth().currentUser != nil {
                    if let isTransportista = isTransportista {
                        if isTransportista {
                            ManagerMainView()
                                .environmentObject(userAuth)
                        } else {
                            InicioCrewView()
                                .environmentObject(userAuth)
                        }
                    } else {
                        ProgressView()
                            .onAppear {
                                getUserIsTransportista { result in
                                    isTransportista = result
                                }
                            }
                    }
                } else {
                    SignInView().environmentObject(userAuth)
                }
            }
        }
    }
}

func getUserIsTransportista(completion: @escaping (Bool?) -> Void) {
    guard let userId = Auth.auth().currentUser?.uid else {
        completion(nil)
        return
    }

    let db = Firestore.firestore()
    db.collection("usuarios").document(userId).getDocument { (document, error) in
        if let document = document, document.exists {
            let esTransportista = document.data()?["esTransportista"] as? Bool
            completion(esTransportista)
        } else {
            completion(nil)
        }
    }
}
