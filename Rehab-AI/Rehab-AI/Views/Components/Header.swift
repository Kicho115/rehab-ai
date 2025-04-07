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
            profileImage
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            Text(greeting)
                .font(.title)
                .fontWeight(.bold)
            
            
            Spacer()
            
            Button(action: {
                // action
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(hex: "#A7FFCC"))
                    .background(.black)
                    .clipShape(Circle())
            }
        }
        .padding()
    }
}

#Preview {
    Header(userName: "Oscar", profileImage: Image(systemName: "person.fill"))
}
