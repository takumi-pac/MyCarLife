//
//  SignUpView.swift
//  MyCarLife
//
//  Created by 松田拓海 on 2023/01/24.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var isShowAlert = false
    
    @FocusState  var focusText: Bool
    @FocusState  var focusSecure: Bool
    @State  var show: Bool = false
    
    var body: some View {
        NavigationStack {
            
            VStack {
                HStack {
                    Text("Sign Up")
                        .font(.title)
                        .padding()
                    
                    Spacer()
                } // HStack
                
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
                    }
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    
                    Button("Sign UP") {
                        Auth.auth().createUser(withEmail: email, password: password) { result, error in
                            if error == nil {
                                // 作成完了後の処理
                                isShowAlert.toggle()
                            } else {
                                AuthManager().setErrorMessage(error)
                            }
                        }
                    }
                    .alert(isPresented: $isShowAlert) {
                        return Alert(title: Text(""), message: Text("登録されました"), dismissButton: .default(Text("OK")))
                    }
                    
                    HStack {
                        Text("Have an Account?")
                            .foregroundColor(Color.primary.opacity(0.5))
                        
                        NavigationLink("Sign In", destination: LoginView())
                    }
                    
                } //Group
                
                Spacer()
            } //VStack
        } //NavigationStack
        .toolbar(.hidden)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
