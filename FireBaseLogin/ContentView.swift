//
//  ContentView.swift
//  FireBaseLogin
//
//  Created by Biron Su on 12/23/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: .init(colors: [Color(.blue),Color(.blue)]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
                LoginView()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
