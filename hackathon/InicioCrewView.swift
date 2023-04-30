//
//  InicioCrewView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI
import FirebaseAuth //Para Cerrar Sesión


struct InicioCrewView: View {
    @EnvironmentObject var userAuth: UserAuth //Para Cerrar Sesión
    @State private var inicio = false
    @State private var perfil = false
    @State private var vehiculo = false
    @State private var mapa = false
    @State private var ajustes = false
    @State private var progress = 0.8
    
    var body: some View {
            VStack {
                
                //        Button(action: signOut) { //Para Cerrar Sesión
                //            Text("Cerrar sesión")
                //                .foregroundColor(.white)
                //                .padding()
                //                .background(Color.red)
                //                .cornerRadius(8)
                //                  }
                //        .padding(.top)
                
                
                Section(){
                    Text("Empresa")
                }
                
                Spacer()
                
                Section(){
                    HStack{
                        Text("¡Bienvenidos!")
                            .font(.title)
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    NavigationView {
                        NavigationLink(destination: RouteDetailView(routeName: "ruta")){
                            Text("Resumen del viaje")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                                .padding(.all)
                        }
                }
                HStack{
                    Spacer()
                    Image(systemName: "box.truck")
                        .resizable()
                        .frame(width:30,height:30)
                    ProgressView(value:progress)
                    Image(systemName: "airplane")
                }
                
                    Spacer(minLength: 30)
                    
                }
        }
        
    }
}

    //  func signOut() {
    //      do {
    //          try Auth.auth().signOut()
    //          userAuth.isSignedIn = false
    //      } catch let signOutError as NSError {
    //          print("Error al cerrar sesión: %@", signOutError)
    //      }
    //  }


struct InicioCrewView_Previews: PreviewProvider {
    static var previews: some View {
        InicioCrewView()
    }
}
