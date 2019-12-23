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
    
    var body: some View {
        VStack{
            
            HStack{
                Image(systemName: "person.fill").resizable().frame(width: 20, height: 20)
                
                TextField("Username", text: $username)
                    .padding(.leading, 12)
                    .font(.system(size: 20))
            }.padding(.leading, 20)
                .padding(.bottom, 20)
                .background(Color("Color"))
                .cornerRadius(20)
            
            HStack{
                Image(systemName: "lock.fill").resizable().frame(width: 20, height: 20)
                
                SecureField("Password", text: $password)
                    .padding(.leading, 12)
                    .font(.system(size: 20))
            }.padding(.leading, 20)
            .background(Color("Color"))
            .cornerRadius(20)
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
