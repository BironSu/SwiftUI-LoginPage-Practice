//
//  ContentView.swift
//  FireBaseLogin
//
//  Created by Biron Su on 12/23/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import SwiftUI

enum AlertType {
    case invalidUser, invalidPassword, emptyFields, successLogin
}
struct ContentView: View {
    
    @State var user = ""
    @State var pass = ""
    @State var login = false
    @State var signUp = false
    @State var alertType: AlertType = .emptyFields
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [Color(.blue),Color(.blue)]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
            LoginView(username: self.$user, password: self.$pass, login: self.$login, activeAlert: self.$alertType, signUp: self.$signUp)
        
        }
        .sheet(isPresented: $signUp) {
            CreatePage(create: self.$signUp)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
