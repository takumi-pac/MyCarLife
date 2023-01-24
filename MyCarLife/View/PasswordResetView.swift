//
//  PasswordResetView.swift
//  MyCarLife
//
//  Created by 松田拓海 on 2023/01/24.
//

import SwiftUI
import FirebaseAuth

struct PasswordResetView: View {
    @State var email:String = ""
    @State var isShowAlert = false
    
    var body: some View {
        VStack{
            TextField("mail address", text: $email).padding().textFieldStyle(.roundedBorder)
            Button(action: {
                Auth.auth().sendPasswordReset(withEmail: email) { error in
                    if error == nil {
                        isShowAlert.toggle()
                    }
                }
            }, label: {
                Text("メール送信")
            })
            .alert(isPresented: $isShowAlert) {
                return Alert(title: Text(""), message: Text("メールが送信されました"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetView()
    }
}
