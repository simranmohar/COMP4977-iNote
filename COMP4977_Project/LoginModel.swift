//
//  LoginModel.swift
//  COMP4977_Project
//
//  Created by Simran Mohar on 2022-10-25.
//

import Foundation
import Firebase

struct User {
    let uid: String
    let email: String
}

class LoginModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published private var _currentUser: User? = nil
    @Published var hasError = false
    @Published var errorMessage = ""
    @Published var isLoggedIn = false
    
    private var handler = Auth.auth().addStateDidChangeListener{_,_ in}
    
    var currentUser: User {
        return _currentUser ?? User(uid: "", email: "")
    }
    
    init() {
        handler = Auth.auth().addStateDidChangeListener{ auth, user in
            if let user = user {
                self._currentUser = User(uid: user.uid, email: user.email!)
                self.isLoggedIn = true
            } else {
                self._currentUser = nil
                self.isLoggedIn = false
            }
        }
    }
    
    func signIn() async {
        
        hasError = false
        
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
        } catch {
            hasError = true
            errorMessage = error.localizedDescription
        }
    }
    
    func signOut() async {
        hasError = false
        do{
            try Auth.auth().signOut()
            
        } catch {
            hasError = true
            errorMessage = error.localizedDescription
        }
        
    }
    
    deinit {
        
        Auth.auth().removeStateDidChangeListener(handler)
    }
    
}
