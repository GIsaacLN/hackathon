//
//  InicioCrewView.swift
//  hackathon
//
//  Created by iOS Lab on 29/04/23.
//

import SwiftUI

struct InicioCrewView: View {
    var body: some View {
        NavigationStack{
            Text("HEllos")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                            Button(action:  {
                                    print("Pressed")
                                }) {
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.black)
                            }
                        
                        Spacer()
                            
                            Button(action:  {
                                    print("Pressed")
                                }) {
                                Image(systemName: "car.fill")
                                    .foregroundColor(.black)
                            }
                        
                        Spacer()
                        
                            Button(action:  {
                                    print("Pressed")
                                }) {
                                Image(systemName: "house")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 50, height: 40)
                            }
                        Spacer()
                        
                            Button(action:  {
                                    print("Pressed")
                                }) {
                                Image(systemName: "map.fill")
                                    .foregroundColor(.black)
                            }
                        
                        Spacer()
                        
                            Button(action:  {
                                    print("Pressed")
                            }) {
                                Image(systemName: "gear")
                                    .foregroundColor(.black)
                            }
                }
            }
        }
    }
}


struct InicioCrewView_Previews: PreviewProvider {
    static var previews: some View {
        InicioCrewView()
    }
}
