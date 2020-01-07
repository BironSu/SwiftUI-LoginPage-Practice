//
//  ContentView.swift
//  FireBaseLogin
//
//  Created by Biron Su on 12/23/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import SwiftUI
class UserStatus: ObservableObject {
    @Published var loggedIn: Bool = false
}
struct ContentView: View {
    
    @ObservedObject var userLoginStatus = UserStatus()
    
    var body: some View {
        NavigationView {
            ZStack {
// Show Login View - will add conditions once firebase is set up
                if self.userLoginStatus.loggedIn == false {
                    LoginView(loggedIn: self.$userLoginStatus.loggedIn)
                } else {
                    HomePageView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
