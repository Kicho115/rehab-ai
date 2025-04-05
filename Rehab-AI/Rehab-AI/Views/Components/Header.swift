//
//  Header.swift
//  Rehab-AI
//
//  Created by Oscar Angulo on 4/4/25.
//

import SwiftUI

struct Header: View {
    var userName: String
    var profileImage: Image

    @State private var showMenu = false
    
    var greeting: String {
            let hour = Calendar.current.component(.hour, from: Date())
            switch hour {
            case 5..<12:
                return "Good morning, \(userName)!"
            case 12..<20:
                return "Good afternoon, \(userName)!"
            default:
                return "Good night, \(userName)!"
            }
        }

    var body: some View {
        HStack {
            Button(action: {
                showMenu.toggle()
            }) {
                profileImage
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            .contextMenu {
                Button(action: {
                }) {
                    Text("Perfil")
                    Image(systemName: "person.circle")
                }
                Button(action: {
                }) {
                    Text("Configuración")
                    Image(systemName: "gear")
                }
                Button(action: {
                }) {
                    Text("Cerrar sesión")
                    Image(systemName: "power")
                }
            }


            Text(greeting)
                .font(.headline)

            Spacer()

            Button(action: {
                // Acción para agregar ejercicios
            }) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
        }
        .padding()
    }
}

#Preview {
    Header(userName: "Oscar", profileImage: Image(systemName: "person.fill"))
}
