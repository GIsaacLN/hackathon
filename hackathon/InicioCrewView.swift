//
//  InicioCrewView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI
import FirebaseAuth //Para Cerrar Sesión


private let errores = error(er : "error1", des : "descripcion")


struct InicioCrewView: View {
    @EnvironmentObject var userAuth: UserAuth //Para Cerrar Sesión
    @State private var progress = 0.8

    var body: some View {
        
        NavigationView{
            VStack {
                
                //        Button(action: signOut) { //Para Cerrar Sesión
                //            Text("Cerrar sesión")
                //                .foregroundColor(.white)
                //                .padding()
                //                .background(Color.red)
                //                .cornerRadius(8)
                //                  }
                //        .padding(.top)
                
                
                Text("Empresa")
                    .font(.title)
                
                
                Text("¡Bienvenidos!")
                    .font(.title)
                
                
                
                NavigationLink(destination: RouteDetailView(routeName: "sadasdasd")){
                    Text("Resumen")
                        .foregroundColor(.black)
                }
                
                HStack{
                    
                    Image(systemName: "box.truck")
                        .resizable()
                        .frame(width:60,height:50)
                        .padding()
                    
                    ProgressBar(value: $progress)
                        .frame(height: 20)
                        .padding()
                    
                    Image(systemName: "mappin.and.ellipse")
                        .resizable()
                        .frame(width:60,height:60)
                        .padding()
                    
                }
                .padding(.bottom)
                
                
                // Aquí puedes agregar los elementos para mostrar los hazards y warnings
                ForEach([errores]) { error in
                    HStack{
                        Text(error.er)
                    }
                }
            }
            .padding(.top)
        }
    }
            
}




struct ProgressBar: View {
    @Binding var value: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .opacity(0.3)
                    .foregroundColor(.blue)

                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: geometry.size.width * CGFloat(value))
            }
            .cornerRadius(10)
        }
    }
}

struct InicioCrewView_Previews: PreviewProvider {
    static var previews: some View {
        InicioCrewView()
    }
}
