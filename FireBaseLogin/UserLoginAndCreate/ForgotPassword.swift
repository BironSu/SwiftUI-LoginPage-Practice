//
//  ForgotPassword.swift
//  FireBaseLogin
//
//  Created by Biron Su on 12/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import SwiftUI

struct ForgotPassword: View {
    
    @Binding var forgotPass: Bool
    @State var email: String = ""
    
    var body: some View {
        
        ZStack {
// Background
            LinearGradient(gradient: .init(colors: [Color(.blue),Color(.blue)]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
// Logo
                Image("Login Logo")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.bottom, 15)
//
                Text("Please enter the email address of your account below.")
                    .font(.system(size: 15)).foregroundColor(.white)
// Email TextField
                HStack{
                    Image(systemName: "envelope.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        
                    TextField("Enter Email Address", text: $email)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                }.padding(20)
                    .background(Color(.white))
                    .cornerRadius(20)
// Okay/Confirm Button
                HStack {
                    Button(action: {
                        self.forgotPass.toggle()
                    }) {
                        Text("OK")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 100)
                            
                    }.background(Color(.white))
                        .cornerRadius(20)
                        .shadow(radius: 20)
                        .offset(y: 20)
// Cancel Button
                    Button(action: {
                        self.forgotPass.toggle()
                    }) {
                        Text("Cancel")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 100)
                                
                    }.background(Color(.white))
                        .cornerRadius(20)
                        .shadow(radius: 20)
                        .offset(y: 20)
                }
            }
            .padding(.horizontal, 18)
        }
    }
}
