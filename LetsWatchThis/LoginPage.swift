//
//  LoginPage.swift
//  LetsWatchThis
//
//  Created by Austin Christensen on 5/18/21.
//

import SwiftUI

struct LoginPage: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    let updater = MediaUpdater()
    
    var body: some View {
        Form {
            TextField("Username", text: $username)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            TextField("Password", text: $password)
                .padding()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            Button("Login", action: {
                let params = [
                    "userName": "\(1)",
                    "password": "\(password.lowercased())"
                ]
                DataManager.getUserId(params: params, updater: updater)
                //Make a request to see if the user exists
                //If Successful then show HomePageView
                //If failed then show error
            })
            Button("Create Account", action: {
                // Create user
                //if succesful then show homepage
            })
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
