//
//  LoginView.swift
//  MyCarLife
//
//  Created by 松田拓海 on 2023/01/24.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @FocusState  var focusText: Bool
    @FocusState  var focusSecure: Bool
    @State  var show: Bool = false
    
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Group {
                    Image(systemName: "car")
                        .resizable()
                        .frame(width: 50,height: 50)
                    
                    Text("Car My Life")
                        .font(.title)
                    
                    Divider()
                } //Group
                
                Group {
                    HStack {
                        Text("Sign in")
                            .padding()
                            .font(.title)
                        
                        Spacer()
                    } // HStack
                    
                    HStack {
                        Text("I Wish your good car life")
                            .foregroundColor(Color.primary.opacity(0.5))
                        
                        Spacer()
                    } //HSTACk
                    
                } //Group
                
                Group {
                    TextField("Email",text: $email)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                    
                    ZStack(alignment: .trailing) {
                        
                        TextField("Password", text: $password)
                            .focused($focusText)
                            .opacity(show ? 1 : 0)
                        
                        SecureField("Password", text: $password)
                            .focused($focusSecure)
                            .opacity(show ? 0 : 1)
                        
                        Button(action: {
                            show.toggle()
                            if show {
                                focusText = true
                            } else {
                                focusSecure = true
                            }
                        }, label: {
                            Image(systemName: self.show ? "eye.slash.fill" : "eye.fill")
                                .padding()
                                .font(.system(size: 15))
                            
                        })
                    }.padding().textFieldStyle(.roundedBorder)
                    
                    Button("ログイン"){
                        Auth.auth().signIn(withEmail: email, password: password) { result, error in
                            if (result?.user) != nil {
                                // ログイン時に閲覧できる画面として画面遷移させる
                                print("ログインしました。")
                            } else {
                                print("ログイン失敗")
                            }
                        }
                    }
                    .padding()
                    
                    Text("or use one of your social profiles")
                        .foregroundColor(Color.primary.opacity(0.5))
                } //Group
                
                
                Group {
                    HStack {
                        
                        Image("twitter")
                            .resizable()
                            .frame(width: 50,height: 50)
                        
                        Image("facebook")
                            .resizable()
                            .frame(width: 50,height: 50)
                        
                    }
                    
                } //Group
                
                Group {
                    Spacer()
                    
                    HStack {
                        
                        NavigationLink("Forgot Password?", destination: PasswordResetView())
                            .padding()
                        
                        NavigationLink("Sign Up", destination: SignUpView())
                        
                    }
                } //Group
                
                Spacer()
                
            } // VStack
        } //NavigationStack
        .toolbar(.hidden)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
