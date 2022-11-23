//
//  ContentView.swift
//  COMP4977_Project
//
//  Created by Simran Mohar on 2022-10-11.
//

import SwiftUI
import Firebase
import UIKit

struct ContentView: View {


    var body: some View {
        NavigationView {
            ZStack {
                Color("BGColor")
                    .ignoresSafeArea()
                VStack {
                    LoginView()
                    //SignUpView()
                    //IndexView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

