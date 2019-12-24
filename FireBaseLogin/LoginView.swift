//
//  LoginView.swift
//  FireBaseLogin
//
//  Created by Biron Su on 12/23/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var show: Bool = false
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [Color(.blue),Color(.blue)]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
            
            VStack{
                
                HStack{
                    Image(systemName: "person.fill").resizable().frame(width: 20, height: 20)
                    
                    TextField("Username", text: $username)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                }.padding(20)
                    .background(Color(.white))
                    .cornerRadius(20)
                
                HStack{
                    Image(systemName: "lock.fill").resizable().frame(width: 20, height: 20)
                    
                    SecureField("Password", text: $password)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                }.padding(20)
                    .background(Color(.white))
                    .cornerRadius(20)
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    Text("Login").foregroundColor(.black).padding()
                    
                }.frame(width: 150)
                .background(Color(.white))
                .cornerRadius(20)
                .offset(y: 25)
                .shadow(radius: 25)
            }
            .padding(.horizontal, 18)
        }.alert(isPresented: $show) {
            Alert(title: Text(self.username), message: Text(self.password), dismissButton: .none)
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
