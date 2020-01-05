//
//  HomePageView.swift
//  FireBaseLogin
//
//  Created by Biron Su on 1/5/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import SwiftUI

struct HomePageView: View {
    
    @State var user: String = ""
    
    var body: some View {
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
                
                // Cancel Button
                Button(action: {
                    
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
