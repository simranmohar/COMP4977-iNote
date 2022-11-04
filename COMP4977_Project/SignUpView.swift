//
//  SignUpView.swift
//  COMP4977_Project
//
//  Created by Simran Mohar on 2022-10-25.
//

import SwiftUI
import Firebase
import UIKit

struct SignUpView: View {
    
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var signUpProcessing = false
    @State var signUpErrorMessage = ""
    
    var body: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                Color("BGColor")
                    .ignoresSafeArea()
            } else {
                // Fallback on earlier versions
            }
            if #available(iOS 15.0, *) {
                VStack {
                    Text("Registration")
                        .font(.system(size:45))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .padding(.trailing, 4)
                        TextField("Email", text: $email)
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
                        SecureField("Password", text: $password)
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
                        SecureField("Confirm Password", text: $confirmPassword)
                            .autocapitalization(.none)
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                    }
                    .frame(width: 300, height: 50)
                    
                    Rectangle()
                        .frame(width: 300, height: 1)
                        .foregroundColor(.accentColor)
                    
                    HStack {
                        Button(action: { registerAccount() }) {
                            Text("Sign up")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        .frame(width: 100, height: 50)
                        .background(Color.accentColor)
                        
                    }
                }.alert("Error", isPresented: $signUpProcessing) {
                } message: {
                    Text(signUpErrorMessage)
                }
            } else {
                // Fallback on earlier versions
            }
        }
        
    }
    func registerAccount() {
        Auth.auth().createUser(withEmail: email, password: password, completion: { result, err in
            if let err = err {
                signUpErrorMessage = err.localizedDescription
                signUpProcessing = true
                //print("Failed due to error:", err)
                return
            }
            switch result {
            case .none:
                print("Could not create account.")
                signUpProcessing = true
            case .some(_):
                print("user created!")
                signUpProcessing = false
            }
            print("Successfully created account with ID: \(result?.user.uid ?? "")")
            
        })
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
