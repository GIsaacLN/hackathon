//
//  hackathonApp.swift
//  hackathon
//
//  Created by Raymundo Mondragón Lara on 29/04/23.
//

import SwiftUI
import Firebase
import FirebaseCore

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

    var body: some Scene {
        WindowGroup {
            Group {
                if Auth.auth().currentUser != nil {
                    InicioCrewView()
                } else {
                    SignInView().environmentObject(userAuth)
                }
            }
        }
    }
}
