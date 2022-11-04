//
//  IndexView.swift
//  COMP4977_Project
//
//  Created by Simran Mohar on 2022-10-25.
//

import SwiftUI

struct IndexView: View {
    let userEmail: String
    var body: some View {
        
        VStack {
            Color("BGColor")
//                .ignoresSafeArea()
            Text("Welcome \(userEmail)!")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.largeTitle)
        }
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView(userEmail: "Placeholder@gmail.com")
    }
}
