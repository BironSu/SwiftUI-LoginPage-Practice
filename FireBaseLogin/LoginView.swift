//
//  LoginView.swift
//  FireBaseLogin
//
//  Created by Biron Su on 12/23/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var username: String
    @Binding var password: String
    @Binding var login: Bool
    @Binding var activeAlert: AlertType
    @Binding var signUp : Bool
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [Color(.blue),Color(.blue)]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Image("Login Logo").resizable().frame(width: 80, height: 80).padding(.bottom, 15)
                
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
                
                HStack {
                    Button(action: {
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
                    
                    Button(action: {
                        self.signUp.toggle()
                    }) {
                        
                        Text("Create Account").foregroundColor(.black).padding()
                        
                    }.frame(width: 170)
                    .background(Color(.white))
                    .cornerRadius(20)
                    .offset(y: 20)
                }
                Button(action: {
                    
                }) {
                    Text("Forgot password?").foregroundColor(.white)
                }.offset(y: 40)
            }
            .padding(.horizontal, 18)
        }.alert(isPresented: $login) {
            switch self.activeAlert {
            case .emptyFields:
                return Alert(title: Text("Empty User"), message: Text("Empty Password"), dismissButton: .none)
            case .invalidUser:
                return Alert(title: Text("Failed Login"), message: Text("Invalid Username"), dismissButton: .none)
            case .invalidPassword:
                return Alert(title: Text("Failed Login"), message: Text("Invalid Password"), dismissButton: .none)
            case .successLogin:
                return Alert(title: Text("Success"), message: Text("Successfully Logged in"), dismissButton: .none)
            }
        }
    }
}
// ==CREATE PAGE=======================================================================
struct CreatePage: View {
    
    @Binding var create: Bool
    @State var user: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var email: String = ""
    
    var body : some View {
        
        ZStack{
//Background Color
            LinearGradient(gradient: .init(colors: [Color(.blue),Color(.blue)]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
// Logo
                Image("Login Logo")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.bottom, 15)
                
// Username
                HStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    TextField("Username", text: $user)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                    
                }.padding(12)
                    .background(Color(.white))
                    .cornerRadius(20)
                
// Password
                HStack {
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    SecureField("Password", text: $password)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                    
                }.padding(12)
                    .background(Color(.white))
                    .cornerRadius(20)
                
// Confirm Password
                HStack {
                    Image(systemName: "lock.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                    
                }.padding(12)
                    .background(Color(.white))
                    .cornerRadius(20)
// Email
                HStack {
                    Image(systemName: "envelope.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    TextField("Email Address", text: $email)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                    
                }.padding(12)
                    .background(Color(.white))
                    .cornerRadius(20)
// SignUp Button
                VStack {
                    Button(action: {
                        self.create.toggle()
                    }) {
                        Text("Create Account")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 250)
                        
                    }.background(Color(.white))
                        .cornerRadius(20)
                        .shadow(radius: 20)
                        .offset(y: 20)
                    
                    Button(action: {
                        self.create.toggle()
                    }) {
                        Text("Cancel")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 100)
                        
                    }.background(Color(.white))
                        .cornerRadius(20)
                        .shadow(radius: 20)
                        .offset(y: 30)
                    
                }
            }.padding(.horizontal, 18)
        }
    }
}
