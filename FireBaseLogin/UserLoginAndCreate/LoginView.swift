//
//  LoginView.swift
//  FireBaseLogin
//
//  Created by Biron Su on 12/23/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import SwiftUI

// Types of Alerts for Logging in
enum AlertType {
    case invalidUser, invalidPassword, emptyFields, successLogin
}

struct LoginView: View {

    @State var username: String = ""
    @State var password: String = ""
    @State var login: Bool = false
    @State var activeAlert: AlertType = .emptyFields
    @State var signUp : Bool = false
    @State var forgotPass: Bool = false
    @Binding var loggedIn: Bool
    var body: some View {
        ZStack{
// Background Color
            LinearGradient(gradient: .init(colors: [Color(.blue),Color(.blue)]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
// Login Logo
                Image("Login Logo").resizable().frame(width: 80, height: 80).padding(.bottom, 15)

// Username
                HStack{
                    Image(systemName: "person.fill").resizable().frame(width: 20, height: 20)
                    
                    TextField("Username", text: $username)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                }.padding(20)
                    .background(Color(.white))
                    .cornerRadius(20)
// Password
                HStack{
                    Image(systemName: "lock.fill").resizable().frame(width: 20, height: 20)
                    
                    SecureField("Password", text: $password)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                }.padding(20)
                    .background(Color(.white))
                    .cornerRadius(20)
// Login Button
                HStack {
                    Button(action: {
// Setting type of alert based on condition
                        self.login.toggle()
                        if self.username.isEmpty && self.password.isEmpty {
                            self.activeAlert = .emptyFields
                        } else if self.username.isEmpty && !self.password.isEmpty {
                            self.activeAlert = .invalidUser
                        } else if !self.username.isEmpty && self.password.isEmpty {
                            self.activeAlert = .invalidPassword
                        } else {
                            self.activeAlert = .successLogin
                        }
                    }) {
                        Text("Login").foregroundColor(.black).padding()
                        
                    }.frame(width: 100)
                        .background(Color(.white))
                        .cornerRadius(20)
                        .offset(y: 20)
// SignUp Button
                    Button(action: {
                        self.signUp.toggle()
                    }) {
                        
                        Text("Create Account").foregroundColor(.black).padding()
                        
                    }.frame(width: 170)
                        .background(Color(.white))
                        .cornerRadius(20)
                        .offset(y: 20)
                        // Present CreateView Modally
                        .sheet(isPresented: $signUp) {
                            CreateView(create: self.$signUp)
                        }
                }
                
// Forgot password button - OUTSIDE OF HSTACK
                Button(action: {
                    self.forgotPass.toggle()
                }) {
                    Text("Forgot password?").foregroundColor(.white)
                }.offset(y: 40)
                    // Present ForgotPassword View Modally
                    .sheet(isPresented: self.$forgotPass){
                        ForgotPassword(forgotPass: self.$forgotPass)
                }
            }
            .padding(.horizontal, 18)
// Alert Switchs for Login Alert Types
        }.alert(isPresented: $login) {
            switch self.activeAlert {
            case .emptyFields:
                return Alert(title: Text("Empty User"), message: Text("Empty Password"), dismissButton: .none)
            case .invalidUser:
                return Alert(title: Text("Failed Login"), message: Text("Invalid Username"), dismissButton: .none)
            case .invalidPassword:
                return Alert(title: Text("Failed Login"), message: Text("Invalid Password"), dismissButton: .none)
            case .successLogin:
                self.loggedIn.toggle()
                return Alert(title: Text("Success"), message: Text("Successfully Logged in"), dismissButton: .none )
            }
        }
    }
}
