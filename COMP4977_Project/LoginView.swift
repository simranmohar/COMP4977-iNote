//
//  LoginView.swift
//  COMP4977_Project
//
//  Created by Simran Mohar on 2022-10-25.
//

import SwiftUI
import Firebase
import UIKit

struct LoginView: View {
    

    @ObservedObject var loginModel = LoginModel()
    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack {
                Text("iNote")
                    .font(.system(size:45))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .padding(.trailing, 4)
                    
                    TextField("Email", text: $loginModel.email)
                        .autocapitalization(.none)
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }
                .frame(width: 300, height: 50)
                
                Rectangle()
                    .frame(width: 300, height: 1)
                    .foregroundColor(.accentColor)
                
                HStack {
                    Image(systemName: "key.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .padding(.trailing, 11)
                    
                    SecureField("Password", text: $loginModel.password)
                        .autocapitalization(.none)
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }
                .frame(width: 300, height: 50)
                
                Rectangle()
                    .frame(width: 300, height: 1)
                    .foregroundColor(.accentColor)
                
                HStack {
                    NavigationLink(destination:SignUpView()) {
                        Text("Sign up")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.accentColor)
                    
                    Button(action: {
                        Task {
                            await loginModel.signIn()
                            print("Successfully logged in!")
                        }
                    }) {
                        Text("Log in")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.accentColor)
                    
                }
                
            }.alert("Error", isPresented: $loginModel.hasError) {
            } message: {
                Text(loginModel.errorMessage)
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
