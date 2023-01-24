//
//  ContentView.swift
//  MyCarLife
//
//  Created by 松田拓海 on 2023/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to Car Life")
                    .font(.title)
                
                Image(systemName: "car")
                    .resizable()
                    .frame(width: 60,height: 60)
                
                Spacer()
                
                HStack {
                    NavigationLink("Sign In", destination: LoginView())
                        .padding()
                    
                    NavigationLink("Sign Up", destination: SignUpView())
                        .padding()
                }
                
                Spacer()
            } //VSTACK
            .padding()
            
        } // NavigationStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
